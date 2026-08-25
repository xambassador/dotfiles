---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },

    LspHoverNormal = { bg = "#1f2336" },
    LspHoverBorder = { bg = "#7aa2f7" },
  },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {},
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
  statusline = {
    enabled = false,
  },
}

return M
