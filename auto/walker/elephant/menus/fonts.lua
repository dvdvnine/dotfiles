-- Markup template.
local MARKUP = table.concat({
  "<span font_desc='{{font}} 20' weight='bold'>{{font}}</span>",
  "<span font_desc='{{font}} 12' weight='bold'>{{text}}</span>",
  "",
  "",
  "<span font_desc='{{font}} 20' weight='bold' style='italic'>{{font}}</span>",
  "<span font_desc='{{font}} 12' weight='bold' style='italic'>{{text}}</span>",
}, "\n")

-- Text for demonstrating a font family.
local TEXT = table
  .concat({
    "Quick brown fox jumps over the lazy dog.",
    "Съешь же ещё этих мягких французских булок да выпей чаю.",
    "office affine fluff — fi fl ff ffi ffl",
    "0123456789 !@#$%^&* () [] {} <> «» — – …",
    "== != === !== <= >= -> => <- <=> ++ -- || &&",
  }, "\n")
  :gsub("&", "&amp;")
  :gsub("<", "&lt;")
  :gsub(">", "&gt;")

Name = "fonts"
NamePretty = "Fonts"
Cache = true

Action = "lua:CopyName"

function CopyName(font_name)
  os.execute(("echo '%s' | wl-copy && notify-send 'Copied' '%s'"):format(font_name, font_name))
end

function GetEntries()
  local entries = {}

  local cmd = table.concat({
    "fc-list : family",
    "| cut -d',' -f1",
    "| sed 's/^ *//;s/ *$//'", -- trim whitespace
    "| sort -fu", -- deduplicate
  }, " ")
  local handle = io.popen(cmd)

  if handle then
    for line in handle:lines() do
      local font_name = line:match("^([^,]+)")

      table.insert(entries, {
        Text = font_name,
        Value = font_name,
        Preview = MARKUP:gsub("{{font}}", font_name):gsub("{{text}}", TEXT),
        PreviewType = "pango",
      })
    end

    handle:close()
  end

  return entries
end
