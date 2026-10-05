# Lantern Pond

A quiet bedtime game for a dark room. Open `index.html` in any browser, or install `android/LanternPond.apk` on an Android phone.

## How it plays

- **Tap** the water: a ripple and a soft note. Ripples push whatever they reach, so tap behind a lantern to steer it.
- **Hold** your finger down: a lantern lights and drifts with the current. After a minute or two afloat it leaves a **lotus**, which keeps growing in real time, even while the page is closed.
- **Drag** to stir the water. **Double-tap** to drop a stone once you have stepping stones. Stones bend the current.
- **Koi** cruise, rest, and come up to mouth the surface. One that lingers in lantern light shows its colours; tap the water beside it and it surfaces into your journal. Some only come after 11pm.
- **Light (✦)** is the one number in the game. It gathers from lanterns afloat, koi that surface, open lotuses (even while you sleep) and the night's wishes. Spend it on the **shore**: reeds, stepping stones, a koi hollow, a moon gate, a rain charm, lotus pods, a shrine, a bell. Each one changes what the pond does.
- **Tonight** lists three small wishes. Each is worth ✦ 10, and finishing all three lights one of the fourteen stone lanterns on the shore for good.
- With the koi hollow you can **keep** a koi that surfaces, name it, and feed it once a night. Two kept koi of the same kind sometimes have a fry.
- With stepping stones, a dark **night float** appears each night. Guide a lantern to it to light it.
- **Candle** (under More) fades everything to black over ten minutes so you can drift off.

A five-step tour runs on your first visit and waits for you to do each thing. Replay it from More.

Everything is saved in your browser's local storage, or the app's own storage. No accounts, no network, no ads.

## Android app (APK)

`android/LanternPond.apk` is a ready-to-install Android app: the game in a full-screen WebView with the system bars hidden and the screen kept awake. Minimum Android 7. Open the APK on your phone and allow the install when Android asks.

To rebuild after changing `index.html`, run `android/build.sh`. It expects `aapt2`, `dx.jar`, an Android framework jar, a framework resource jar and `uber-apk-signer.jar` in `android/tools/` (or point the env vars in the script at an Android SDK). The signing key in `android/lanternpond.jks` lets a new build update the installed app in place; keep using it.
