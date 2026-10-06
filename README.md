# Night Stream

A quiet bedtime puzzle game for a dark room. Open `index.html` in any browser, or install `android/NightStream.apk` on an Android phone.

## How to play

- Each little pond is a board of stepping stones. **Tap a stone to turn it.** Water from the spring runs along the grooves, a note at a time.
- Around the edges are **pools**, each with a dark shape waiting in it. Get water to every pool and whoever was waiting comes up your stream and **follows you for the rest of the night**.
- After each pond the stream **forks**: toward the reeds, the lilies, the shallows or the deep water. Pick one, or wait and the stream picks.
- **Ten ponds** a night light the ten small lanterns on the shore and reach a quiet pool, where everyone who followed you gathers and a lantern on the far bank lights for good. You can keep going after that.
- There are 36 creatures. Who comes depends on the kind of water, the hour, rain, the real moon, and who is already following you. The **Journal** shows every one you haven't met as a dark shape with a clue.
- New kinds of stone turn up over the first nights: forked, cross, mossy (won't turn) and twin (two turn together).
- No timer, no move count, no way to fail. If you leave a pond alone for a few minutes, a waiting shape may drift off and someone else comes instead.
- **Candle** (under More) slowly fades everything to black over ten minutes so you can fall asleep.

Everything is saved on your device. No accounts, no internet needed, no ads.

## Android app (APK)

`android/NightStream.apk` is a ready-to-install Android app. It shows the game full screen with the phone's bars hidden and keeps the screen on. Works on Android 7 and up. Open the APK on your phone and allow the install when Android asks.

To rebuild after changing `index.html`, run `android/build.sh` (or `android/build.sh nightstream`). It needs `aapt2`, `dx.jar`, an Android framework jar, a framework resource jar and `uber-apk-signer.jar` in `android/tools/` (see `HANDOFF.md` for where to get them), or point the variables in the script at an Android SDK. The signing key in `android/lanternpond.jks` is what lets a new build install over the old one. Keep using it.

## Lantern Pond

The earlier game, Lantern Pond, is kept in `lantern-pond/index.html` and `android/LanternPond.apk`. It is a separate app and still builds with `android/build.sh lanternpond`.
