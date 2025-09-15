<p align="center">
    <img src="art/lumenLogo.png">
</p>

sum goofy ass p-slice fork that i made for fun. no idea why i did this. development is not very active.

---

## features
- script menus + states outside songs (titlescreen, freeplay, etc.) (thanks emi)
- custom intro splash screen  
- modern psych chart + engine feature support  
- based on p-slice: freeplay characters, new base game systems  
- new "epic" rating (thanks duskiewhy and unholywanderer)  
- base fnf content is now a separate modpack  

(still a wip, more stuff coming)

---

## base fnf content
the vanilla fnf assets + songs are hosted as a separate modpack here:  
➡️ [fnf lumen port](https://github.com/ledonic852/FNF-LumenPort)

clone/download it into your mods folder if you want the base game.

---

## compiling
you’ll need:
- **haxe 4.3.7** (or lower, untested on older)  
- **lime + openfl** (not the LATEST versions)  
- other libs: see `setup/windows.bat`

build commands:


`haxelib run lime setup` then `lime test cpp`

or alternatively `haxelib run lime test windows`

> windows only right now. linux/mac: try wine or port it.

---

## contributing
- make a new branch for changes  
- keep things modular, avoid hardcoding  
- open a pr with a description of your changes  
- document new scripts/entry points

contact: discord `bobbydx428`  
fork it or use code as needed, just credit me somewhere.

---

## known issues
- no mobile support (not planned)  
- also no hashlink or html5 compiling
- windows only (wine works sometimes for linux and mac idk)

---

## license
apache 2.0. see [here](/LICENSE)

---

## credits
- **bobbydx** – creator and main programmer
- **ledonic** – base fnf modpack + content
- **phoenixpunk** – source tweaks + testing
- **ashley / emi3 / victoria** – original custom state scripting fork
- **mikolka9144** – p-slice engine
- **shadowmario** – psych engine
- **funkin' crew inc.** – friday night funkin'

---

<p align="right">
    <img src="https://raw.githubusercontent.com/bobbydeluxe/bobbydeluxe/refs/heads/main/logo.png" width="175">
</p>