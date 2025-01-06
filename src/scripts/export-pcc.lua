-- Elin Player Character (PCC) sprite export script.
-- The script will look for a layer/group named `base_` as the basis for export and if not found,
-- default to the whole sprite.
-- For PCC files, the sprite sheet is split using tags to separate the 4 cardinal directions, 4 frames each:
--
-- [  front   ][   left   ][    right    ][     back     ]
-- [1][2][3][4][5][6][7][8][9][10][11][12][13][14][15][16]
--
-- Special layer types:
--
-- Back sprites:
-- Some attachments have two sprites, one layered in front and one behind the player character.
-- During export, the script will look for a layer group named `_back` and if found use this layer group as the
-- basis for the `<type>bk` sprite.

local function findLayerRecursive(layers, target)
    for _, layer in ipairs(layers) do
        if layer.name == target then
            return layer
        end

        if layer.isGroup then
            found = findLayerRecursive(layer.layers, target)
            if found then
                return found
            end
        end
    end

    return nil
end

local function exportPCC(layer_name, fn)
    app.command.ExportSpriteSheet {
        ui = false,
        recent = false,
        askOverwrite = false,
        type = SpriteSheetType.ROWS,
        textureFilename = fn,
        layer = layer_name,
        splitTags = true
    }
end

function init(plugin)
    plugin:newMenuSeparator {
        group = "file_export_last"
    }
    plugin:newCommand {
        id = "elinExportPCC",
        title = "Export Elin PCC Sprites",
        group = "file_export_last",
        onclick = function()
            local spr = app.activeSprite

            local path, title = spr.filename:match("^(.+[/\\])(.-).([^.]*)$")

            local is_pcc = title:match("^pcc_") ~= nil
            if not is_pcc then
                app.alert("PCC sprites must start with 'pcc_'")
                return
            end

            local exported = { "Exported:" }

            local type, name = title:match("^pcc_([^_]*)_(.*)$")

            local base_filename = "pcc_" .. type .. "_" .. name .. ".png"
            exportPCC("_base", path .. base_filename)
            table.insert(exported, base_filename)

            if findLayerRecursive(spr.layers, "_back") then
                local back_filename = "pcc_" .. type .. "bk_" .. name .. ".png"
                exportPCC("_back", path .. back_filename)
                table.insert(exported, back_filename)
            end

            app.alert { text = exported }
        end,
        onenabled = function()
            return app.activeSprite
        end
    }
end
