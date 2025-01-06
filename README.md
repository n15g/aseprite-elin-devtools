# Aseprite Elin DevTools

---
![Version Badge](https://img.shields.io/badge/version-1.0.0-blue)
![GitHub License](https://img.shields.io/github/license/n15g/aseprite-elin-devtools)

[Aseprite](https://www.aseprite.org/) Extensions for modding the
game [Elin](https://store.steampowered.com/app/2135150/Elin/)

# Installation

1. Download the latest bundle from the [release](https://github.com/n15g/aseprite-elin-devtools/releases) page.
2. Unzip the bundle.
3. Double-click the `elin-devtools.aseprite-extension` file and follow the prompts.

---

# Palettes

Included are a handful of palettes useful for creating Elin assets:

* Elin-Grayscale - A 13-color grayscale gradient with a bias to darker tones that works well with Elin's color tinting.
* Elin-PCC Skin - The color ramp used for the PCCs default skin tone.

---

# Reference files

The `ref` folder contains some Aseprite files that act as useful references or demonstrate the recommended layout for
things like PCC files.

# Export PCC Sprite

`File -> Export -> Export Elin PCC Sprites`

This function will export an Aseprite document set up as a PCC element into the appropriate sprite sheets for Elin.
For an example of how to set up the PCC document, see the `ref/pcc_fairy_mantle.ase` file.

The script will look for a layer/group named `base_` as the basis for export and if not found, default to the whole
sprite. For PCC files, the sprite sheet is split using tags to separate the 4 cardinal directions, 4 frames each:

```
-- [  front   ][   left   ][    right    ][     back     ]
-- [1][2][3][4][5][6][7][8][9][10][11][12][13][14][15][16]
```

## Special layer types

### Back sprites:

-- Some attachments have two sprites, one layered in front and one behind the player character.
-- During export, the script will look for a layer group named `_back` and if found use this layer group as the
-- basis for the `<type>bk` sprite.

---

# Release Notes

#### 1.0.0

* PCC Export script
* Skin and grayscale palettes
* References for base body types and example back layer

---

# Release Process

* **Don't forget!** - Update the version in the `src/package.json` file
* Push commits
* Create a tag with name `v{x.y.z}`, using [semver](https://semver.org/).
* Wait for the release action to complete in GitHub.
* Publish the draft release.

---

# Useful Links

* [elin-fairies](https://github.com/n15g/elin-fairies) - Fairy Mod created using these dev tools. Useful examples of
  many PCC elements.
* [Aseprite](https://www.aseprite.org/)
* [Elin](https://store.steampowered.com/app/2135150/Elin/)
