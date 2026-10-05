# Lantern Pond

A quiet bedtime game for a dark room. Open `index.html` in any browser, or install `android/LanternPond.apk` on an Android phone.

## How to play

- **Tap** the water for a ripple and a soft note. Ripples push whatever they reach, so tap behind a lantern to move it.
- **Hold** your finger down and a lantern lights up. It drifts with the water. After a minute or two it turns into a **lotus**, which keeps growing even while the game is closed.
- **Drag** to stir the water. **Double-tap** to drop a stone once you have stepping stones. Water flows around stones.
- **Koi** swim around, rest, and come up for air. One that stays in lantern light shows its colours. Tap the water next to it and it comes up and goes in your journal. Some only come out after 11pm.
- **Light (✦)** is the only number in the game. You get it from lanterns on the water, koi that come up, open lotuses (even while you sleep), and the three things to try each night. Spend it on the **shore**: reeds, stepping stones, a koi hollow, a moon gate, a rain charm, lotus seeds, a shrine, and a bell. Each one changes what the pond does.
- **Tonight** lists three small things to try. Each is worth ✦ 10. Finish all three and one of the fourteen stone lanterns on the shore lights up for good.
- With the koi hollow you can **keep** a koi that comes up, give it a name, and feed it once a night. Two kept koi of the same kind sometimes have a baby.
- With stepping stones, a dark **float** appears each night. Push a lantern to it to light it.
- **Candle** (under More) slowly fades everything to black over ten minutes so you can fall asleep.

A short five-step tour runs the first time you play. You can see it again from More.

Everything is saved on your device. No accounts, no internet needed, no ads.

## Android app (APK)

`android/LanternPond.apk` is a ready-to-install Android app. It shows the game full screen with the phone's bars hidden and keeps the screen on. Works on Android 7 and up. Open the APK on your phone and allow the install when Android asks.

To rebuild after changing `index.html`, run `android/build.sh`. It needs `aapt2`, `dx.jar`, an Android framework jar, a framework resource jar and `uber-apk-signer.jar` in `android/tools/`, or point the variables in the script at an Android SDK. The signing key in `android/lanternpond.jks` is what lets a new build install over the old one. Keep using it.
