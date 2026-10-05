# Lantern Pond

A quiet bedtime game for a dark room. Open `index.html` in any browser (phone or desktop).

- **Tap** the water: a ripple and a soft note.
- **Hold** your finger down: release a floating lantern. Lanterns drift with the current.
- After a couple of minutes afloat, a lantern leaves a **lotus** behind. Lotuses keep growing in real time, even while the page is closed.
- **Koi** are drawn to lantern light. Keep a lantern over one long enough and it surfaces to show its colours, and is added to your **journal**. Some only appear after 11pm.
- **Drag** slowly to stir the water.
- **Sound** is on by default and starts on your first touch: a warm pad that swells on slow tides between four chords, a dark reverb, and distant rain that gusts. Taps play tones from the current chord.
- **Dim** cycles screen brightness. **Candle** fades everything to black over ten minutes so you can drift off.

A six-step tour runs on your first visit and waits for you to do each thing. Replay it any time from the journal.

Everything is saved in your browser's local storage. No accounts, no network, no ads.

## Play it on a phone

Host the single `index.html` anywhere (GitHub Pages works: Settings → Pages → deploy from the `main` branch root), open it in Chrome on Android, then "Add to Home screen" for a full-screen app.

## Android app (APK)

`android/LanternPond.apk` is a ready-to-install Android app: the same game in a full-screen WebView with the system bars hidden and the screen kept awake. Minimum Android 7.

Install it by opening the APK on your phone (download it from GitHub or copy it over) and allowing installs from that source when Android asks. Your lanterns, lotuses and koi live in the app's own storage, separate from the browser version.

To rebuild after changing `index.html`, run `android/build.sh`. It expects `aapt2`, `dx.jar`, an Android framework jar, a framework resource jar and `uber-apk-signer.jar` in `android/tools/` (or point the env vars in the script at an Android SDK). The signing key in `android/lanternpond.jks` is what lets a new build update the installed app in place; keep using it.
