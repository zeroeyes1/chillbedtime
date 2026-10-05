#!/usr/bin/env bash
# Builds LanternPond.apk from the game in ../index.html.
# Needs: aapt2, dx (or d8), javac, an Android framework jar for compiling, a framework resource apk/jar for linking,
# and uber-apk-signer (https://github.com/patrickfav/uber-apk-signer). Point to them with env vars or put them in tools/.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
TOOLS="${TOOLS:-$HERE/tools}"
AAPT2="${AAPT2:-$TOOLS/aapt2}"
DX="${DX:-$TOOLS/dx.jar}"
ANDROID_JAR="${ANDROID_JAR:-$TOOLS/android-all.jar}"      # classes to compile against
FRAMEWORK_RES="${FRAMEWORK_RES:-$TOOLS/framework-res.jar}" # resources to link against (android.jar from an SDK also works for both)
SIGNER="${SIGNER:-$TOOLS/uber-apk-signer.jar}"
OUT="$HERE/build"; rm -rf "$OUT"; mkdir -p "$OUT/gen" "$OUT/classes" "$OUT/assets"

cp "$HERE/../index.html" "$OUT/assets/index.html"
"$AAPT2" compile --dir "$HERE/res" -o "$OUT/res.zip"
"$AAPT2" link -o "$OUT/unsigned.apk" -I "$FRAMEWORK_RES" --manifest "$HERE/AndroidManifest.xml" -A "$OUT/assets" --java "$OUT/gen" "$OUT/res.zip"
javac --release 8 -nowarn -cp "$ANDROID_JAR" -d "$OUT/classes" $(find "$HERE/src" "$OUT/gen" -name '*.java')
java -cp "$DX" com.android.dx.command.Main --dex --min-sdk-version=24 --output="$OUT/classes.dex" "$OUT/classes"
(cd "$OUT" && zip -q -j unsigned.apk classes.dex)
java -jar "$SIGNER" --apks "$OUT/unsigned.apk" --ks "$HERE/lanternpond.jks" --ksAlias lanternpond --ksPass lanternpond --ksKeyPass lanternpond --out "$OUT/signed" >/dev/null
cp "$OUT"/signed/*-aligned-signed.apk "$HERE/LanternPond.apk"
echo "built $HERE/LanternPond.apk"
