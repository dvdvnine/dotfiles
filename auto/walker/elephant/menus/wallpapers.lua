-- Default image directory.
local IMGS_DIR = (os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share")) .. "/wallpapers/"

-- Wrapper for the utility that sets wallpapers.
local SCRIPT = "set-wallpaper"

-- Supported file extensions.
local EXTS = [[\.(jpe?g|png|gif|pnm|tga|tiff|webp|bmp|farbfeld)$]]

Name = "wallpapers"
NamePretty = "Wallpapers"
Cache = true
RefreshOnChange = { IMGS_DIR }

Actions = {
  set = "lua:SetImg",
  copy = "lua:CopyImg",
  open_dir = "lua:OpenDir",
}

-- Shell-quotes the path before passing it to the action.
local function QuotedAction(fn)
  return function(value)
    local quoted_value = "'" .. tostring(value):gsub("'", "'\\''") .. "'"
    return fn(quoted_value)
  end
end

SetImg = QuotedAction(function(img_path)
  return os.execute(SCRIPT .. " " .. img_path)
end)

CopyImg = QuotedAction(function(img_path)
  return os.execute("wl-copy < " .. img_path)
end)

function OpenDir()
  os.execute("xdg-open " .. IMGS_DIR .. " >/dev/null 2>&1 &")
end

function GetEntries()
  local entries = {}
  local handle = io.popen(([[
   fd '%s' '%s' \
     --max-depth 1 \
     --type f \
     --absolute-path \
     --ignore-case \
     --print0 \
     2>/dev/null \
  | xargs -0 -r identify -ping -format '%%w%%h %%i\n' 2>/dev/null
   ]]):format(EXTS, IMGS_DIR))

  if handle then
    for line in handle:lines() do
      -- Absolute paths always start from the root.
      local path_start = line:find("/", 1, true)

      if path_start then
        local img_path = line:sub(path_start)
        local resolution = line:sub(1, path_start - 2)
        local filename = img_path:match("([^/]+)$")

        table.insert(entries, {
          Icon = "image-x-generic",
          Text = filename,
          Subtext = resolution,
          Preview = img_path,
          Value = img_path,
        })
      end
    end

    handle:close()
  end

  return entries
end
