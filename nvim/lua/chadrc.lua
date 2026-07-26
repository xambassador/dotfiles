---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {},
  header = {
    "              ('-.      .-')    ('-. .-.  ",
    "             ( OO ).-. ( OO ). ( OO )  /  ",
    "   ,--.   ,--./ . --. /(_)---\\_),--. ,--. ",
    "    \\  `.'  / | \\-.  \\ /    _ | |  | |  | ",
    "  .-')     /.-'-'  |  |\\  :` `. |   .|  | ",
    " (OO  \\   /  \\| |_.'  | '..`''.)|       | ",
    "  |   /  /\\_  |  .-.  |.-._)   \\|  .-.  | ",
    "  `-./  /.__) |  | |  |\\       /|  | |  | ",
    "    `--'      `--' `--' `-----' `--' `--' ",
  },
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
