# Handoff: the chill bedtime game

This file is for a new Claude Code session picking up this project. Read all of it before doing anything. The next job is **not** to code. It is to work through game concepts with the player until one feels right, then build that.

## Who this is for and what they want

One player, playing in bed on an Android phone in the dark, for 20 to 30 minutes before sleep. They play lots of genres. Games they named for the *feel* (not to copy): Fishing Paradiso, Loop, Pipes, Electroplankton, Orbient, Sound Voyager, Hue.

What they said, in their words or close to them:

- "Simple, calm, relaxing graphics, dark and dim so I can play in bed."
- "Engaging enough to be fun but not action oriented or stimulating."
- "Elements that make me want to keep playing and coming back."
- "The vibe is right but the game just isn't very fun. It should be fun and engaging while still being relaxing."
- "This is basically a toy." (said about the current game before the economy was added, and still true after)
- Wants "some very simple goals" and "a little bit more going on", and was open to "slightly more active gameplay, even incremental or idle gameplay".
- Everything must be "understandable, straightforward, casual, and not really complex. No confusing menus, a bunch of numbers, or arcane mechanics."
- Test "from the perspective of a casual player who maybe doesn't play games a whole lot."
- Plain language everywhere, but ordinary words like surface, gather, current, dusk, fry, seed pod are fine. Don't over-simplify into baby talk.
- Ask feel-based, multiple-choice questions before and while building. They want it "good the first time."

## Hard requirements already settled

- Runs in a browser as a single `index.html`, and ships as an Android APK (pipeline below). Both must stay.
- Dark, dim, single-theme look. The current palette, type and dimness are approved: "the style and how dim it is are great."
- Sound: warm, woolly pad with slow swells of 20 to 40 seconds, no melody, chords drifting slowly, player sounds soft and blended into the bed, distant rain hiss. Approved. (Possible crackle on phone, partly addressed.)
- No haptics, ever. Long-press haptics were a real complaint; the APK disables them and the page cancels the long-press gesture.
- Large text for a six-inch phone. Current sizes are approved.
- One small number on screen is acceptable as a currency. Lots of numbers are not.
- Notifications must come one at a time, slowly. Being "inundated" was a complaint.
- A tutorial that is short, concrete, one action per step, and lets you go back. The first version was "vague and too explanatory."
- A ten-minute candle that fades the screen to black, and a dim toggle. Keep these.
- Nightly goals should take about 10 minutes, then free play.
- Save locally, no accounts, no network.

## What was built and why it fell flat

The game is **Lantern Pond** (`index.html`, about 1100 lines, canvas plus a few HTML panels). Live versions: the private web link https://claude.ai/artifact/HACNZVM5tR9f3zzuhT1uwF and the APK at `android/LanternPond.apk` (direct link: https://github.com/zeroeyes1/chillbedtime/raw/claude/bedtime-game-design-h4uzjp/android/LanternPond.apk ).

What it has:

- Tap the water: ripple and a pentatonic note. Hold: a paper lantern lights and drifts with the current. Drag: stir. Double-tap: drop a stone that bends the current (after buying stepping stones).
- Ripples push lanterns, so you steer by tapping behind them.
- Koi swim as shadows, cruise, rest, come up to mouth the surface, and circle lanterns. Under lantern light their colours show. A ripple reaching a lit koi makes it surface and go into a journal. 22 kinds, weighted by rarity, some only after 11pm. Each has a plain description.
- Lanterns that float long enough become lotuses that grow in real time across days, even while closed. Lotus colour comes from the lantern.
- Light (✦) is the single currency. Earned from lanterns afloat, koi surfacing, open lotuses (also while away), and nightly tasks. Spent on eight shore items in order of cost: reeds, stepping stones, koi hollow, moon gate, rain charm, lotus pods, shrine, bell. Each changes what the pond does.
- Tonight panel: three small tasks a night ("Float three lanterns", "Reach a lantern with a ripple", "Help a koi surface", "Stir the water", "Send a lantern across the pond", "Light the float", "Drop two stones", "Feed one of your koi", etc.). Each is worth ✦ 10. All three light one of 14 stone lanterns on the shore for good.
- Keep a surfaced koi for light, name it, feed it once a night for light, two of the same kind may have a fry.
- A nightly dark float on the right to guide a lantern to with stones and nudges.
- Moon that crosses the sky from 8pm to 6am with a broken reflection; with the moon gate it lays a path that pulls lanterns and doubles their light. Rain on some nights with the charm. Seed pods blend lotus colours.
- Four buttons: ✦ jar (shore), Tonight, Journal, More (sound, dim, candle, replay tour, reset).

Player's verdict after playing: vibe right, "not very fun." My honest diagnosis of why, for the next session to weigh:

1. **The verbs have no tension.** Tap, hold, drag all do something pleasant, but nothing you do can go wrong or be done well versus badly. There is no small decision with a visible consequence.
2. **The goals are chores, not puzzles.** "Float three lanterns" is a checklist. The games the player named each have a tiny self-contained problem per moment: Loop and Pipes are small spatial puzzles, Hue is colour matching, Fishing Paradiso has a catch with timing and a story behind it.
3. **The economy is waiting.** Light accrues by idling. Spending it unlocks more things to idle with. Nothing you buy changes how you *play*.
4. **Discovery is thin.** Koi kinds are a list of colours. Nothing surprising ever happens.
5. **Too many systems, each shallow.** Eight shore items, pods, fry, moon, rain, float, stones: lots of surface, little depth. A casual player can't tell what matters.

Things that *did* land and are worth keeping in any new concept: the lantern hold, the ripple-pushes-things idea, lotuses growing while you're away, the koi as mysterious shadows that reveal colour, the shore lanterns as a slow visible progress bar, the one-number currency, the nightly "three things".

## How to run the next session

1. Read this file, then skim `index.html` to see the existing rendering, audio engine, save system and input handling. Most of that is reusable regardless of concept.
2. **Do not code until a concept is agreed.** Propose three to five genuinely different concepts that fit the requirements. For each: the core thing you do every 30 seconds, the small decision in it, what makes you come back tomorrow, and why it stays calm. Use multiple-choice questions to narrow. Expect to go several rounds. Ask about feel, not features.
3. When one is chosen, write a one-page plain-language design (what you do, what you see, what you aim for tonight, what grows over weeks) and get a yes before building.
4. Build it as a single `index.html`, reusing the look, sound, dimming, candle, and save code. Keep the APK pipeline working. Test with a scripted Playwright playthrough at phone size (412 by 915, touch) and look at screenshots as a first-time casual player would.
5. Every message to the player in plain words. Lead with what changed and what to try.

## Repo layout

- `index.html`: the whole game. Sections are marked `// ---------- name ----------`: helpers, persistence, koi species, audio, canvas, world, tutorial, update, draw, loop, input, settings, panels, boot. A `window.__pond` debug object exposes save, lanterns, koi, pets, lotuses, `gainGlow`, `wish`, `startRise`, `releaseLantern`, `openPanel`, `dbg` (moon and rain overrides), `makeWishes`, `persist`, and `step(seconds)` to fast-forward the simulation in tests.
- `README.md`: player-facing description.
- `android/`: the Android wrapper. `AndroidManifest.xml` (package `com.chillbedtime.lanternpond`, versionCode 7, versionName 2.4, min SDK 24, target 34), `src/com/chillbedtime/lanternpond/MainActivity.java` (full-screen WebView loading `file:///android_asset/index.html`, immersive bars hidden, screen kept on, haptics and long-click disabled, DOM storage on, media without gesture), `res/` (icon and app name), `build.sh`, `lanternpond.jks` (signing key, store and key password both `lanternpond`, alias `lanternpond`), `LanternPond.apk` (committed, installable).
- `.gitignore` ignores `android/build/`.
- Branch: `claude/bedtime-game-design-h4uzjp` on `zeroeyes1/chillbedtime`. It is the repo's default branch. The repo is public.

## The APK pipeline (works without the Android SDK)

Google's SDK host (dl.google.com) is blocked from the cloud sandbox, so the toolchain is assembled from GitHub and a Maven mirror. `android/build.sh` expects these in `android/tools/` (they are *not* committed; re-download them each session):

| File | Where it comes from |
| --- | --- |
| `aapt2` | Extract `prebuilt/linux/aapt2_64` from `apktool_2.9.3.jar` (https://github.com/iBotPeaches/Apktool/releases/download/v2.9.3/apktool_2.9.3.jar) and `chmod +x` |
| `framework-res.jar` | Extract `brut/androlib/android-framework.jar` from the same apktool jar |
| `dx.jar` | https://maven-central.storage-download.googleapis.com/maven2/com/jakewharton/android/repackaged/dalvik-dx/14.0.0_r21/dalvik-dx-14.0.0_r21.jar |
| `android-all.jar` | https://maven-central.storage-download.googleapis.com/maven2/org/robolectric/android-all/14-robolectric-10818077/android-all-14-robolectric-10818077.jar (about 138 MB) |
| `uber-apk-signer.jar` | https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar |

Notes: `repo.maven.apache.org` rate-limits the sandbox IP (HTTP 429), so use the `maven-central.storage-download.googleapis.com` mirror. `dx.jar` has no main manifest; the script runs `java -cp dx.jar com.android.dx.command.Main --dex`. Java 21 and `zip` are present in the sandbox. The script copies `../index.html` into assets, compiles resources, links with the framework resource jar, compiles `MainActivity.java` against `android-all.jar` with `--release 8`, dexes, zips `classes.dex` in, and signs with uber-apk-signer using the committed key. Bump `versionCode` and `versionName` in the manifest before each build so Android installs over the old one. Then `git add android/LanternPond.apk` and push; the raw GitHub link above always serves the latest.

The web version is a Claude artifact. To republish it, strip the document skeleton lines (`<!doctype html>`, `<html>`, `<head>`, `</head>`, `<body>`, `</body>`, `</html>`, and `<meta ...>` lines) from `index.html` into a file and publish that file to the existing URL. Playwright with the pre-installed Chromium at `/opt/pw-browsers/chromium` works for testing; import it from the global npm root.

## Bugs already found and fixed (don't reintroduce)

- Long-press haptic buzz from the WebView and the browser.
- Tutorial leaving an invisible clickable button over the pond after it ended.
- Building something mid-night regenerating the night's tasks.
- Reset writing the save back during the page unload (saving must be disabled before clearing).
- A fixed-position button inside a `backdrop-filter` panel scrolls with the panel (keep fixed bars outside blurred containers).
- Custom `display` on an element defeats the `hidden` attribute unless `[hidden]{display:none!important}` is in the page.
- Koi colours popping in instead of fading; multiple koi surfacing at once; toasts stacking.
