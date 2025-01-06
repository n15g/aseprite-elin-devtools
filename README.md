# Aseprite Elin DevTools

----
![Version Badge](https://img.shields.io/badge/version-1.0.0-blue)
![GitHub License](https://img.shields.io/github/license/n15g/aseprite-elin-devtools)

Aseprite Extensions for modding the game [Elin](https://store.steampowered.com/app/2135150/Elin/)

# Palettes


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
```

