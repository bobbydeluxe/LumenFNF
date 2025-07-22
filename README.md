# fnf - lumen engine ✨

a fork of p-slice engine (specifically version 2.3.1) that aims to be more modular and easier to script outside of songs.

why did i make this? i just thought p-slice was a bit too hardcoding-oriented. i also wanted scripting capabilities similar to emi3's psych fork that let you script outside of songs, plus a more modular structure so you can add features without editing the engine itself.

basically a crossover between a bunch of psych forks. not trying to reinvent the wheel, just trying to make it easier to attach new wheels. a fork of a fork of a fork, if i say so myself.

## features (so far)

- script stuff outside of songs (titlescreen, freeplay, etc.) [see [here](https://github.com/inky03/PsychEngineMod/blob/mod/docs/CHANGELOG.md)]
- custom intro splash screen
- base game content modpack included (toggleable)
- supports modern psych charting + engine features
- built on p-slice, so uhh freeplay characters and new base game shit idk
- new "epic" rating inspired by nightmarevision [thanks duskiewhy]

(still being expanded. this project is a wip. chill.)

## how to compile

you'll need:

- **haxe 4.3.7** (or lower, but untested on older versions)
- **lime + openfl** (make sure they’re installed and working)
- required libs: see `setup/windows.bat`

once you’ve got everything:

`haxelib run lime setup` then `lime test cpp`

alternatively `haxelib run lime test windows`

that’s it. if it breaks, check your haxe setup or openfl version first.

## contributing

wanna add stuff? cool.

just follow these:

- make a new branch for your feature/fix
- keep things modular. try not to edit core systems unless you have to
- open a pull request with a description of what you changed
- if you’re adding new scripts or entry points, document it somewhere pls

alternatively contact me on discord! [*bobbydx428*]

also feel free to fork this for your own mod or use code from here or whatever, just credit me if you do use this.

## known issues

- no mobile support (and not planned)
- only works on windows (maybe just use wine on linux/mac)
- some leftovers might still be lurking, beware

## license

apache 2.0. uhh yea.

## credits

- **bobbydx** (me) - creator of this fork
- **ledonic** - contributed a lot to the base game content modpack
- **phoenixpunk** - helped with some tweaks
- **ashley / emi3 / victoria** - creator of the [psych fork](https://github.com/inky03/PsychEngineMod) that the scripting implementation is based on
- **mikolka9144** - creator of the [p-slice engine](https://github.com/Psych-Slice/P-Slice/) that this engine is based on 
- **shadowmario** - creator of the original [psych engine](https://github.com/ShadowMario/FNF-PsychEngine)
- **the funkin' crew inc.** - original creators of friday night funkin'. thank you for this masterpiece.

---

<p align="right">
  <img src="https://raw.githubusercontent.com/bobbydeluxe/bobbydeluxe/refs/heads/main/logo.png" width="175">
</p>
