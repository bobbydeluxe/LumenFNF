LUMEN ENGINE - QUICK START GUIDE
--------------------------------

this file covers the basics of setting up mods for lumen engine and how it differs from psych.

first you gotta create your damn mods folder

after that let's begin

---

1. MOD STRUCTURE
----------------

lumen uses the same overall mod structure as psych engine with one key difference:
your modpack metadata file goes in:

    urMod/mod.json

instead of psych's:

    urMod/pack.json

the icon for your modpack also lives in:

    urMod/icon.png

instead of psych's:

    urMod/pack.png

everything else (assets, scripts, charts, etc.) can be dragged straight from a psych mod and will work without changes.

---

2. MOD.JSON FORMAT
-----------------------

your mod.json needs to be strict JSON. here's an example:

{
    "name": "Name",           // name shown in the mods menu
    "description": "Description", // description for the modpack
    "restart": false,         // if the game should restart when enabling/disabling/moving
    "global": true,           // if scripts/assets run globally or only in this mod's songs
    "color": [0, 170, 255]    // background color (R,G,B) for the mods menu
}

*note: remove the comments if you copy this into an actual file – json does not allow comments.*

---

3. COMPATIBILITY
----------------

- almost all psych/p-slice mods are compatible out of the box. just adjust the metadata file/icon path.
- scripts (lua/hscript) work exactly like psych.
- lumen adds extra support for scripting outside of songs (menus, states, etc.), courtesy of another psych fork [thanks emi3].

---

4. BASE GAME CONTENT
--------------------

lumen no longer bundles vanilla fnf content by default.  
to get the base game:

    https://github.com/ledonic852/FNF-LumenPort

clone or download that repo into your mods folder.

---

5. TIPS
-------

- keep your metadata.json valid JSON or the mod won't load.
- use "global": true in metadata.json if you want your scripts to run everywhere.
- if you get crashes, check the console log in the "logs" folder.

---

happy modding!
