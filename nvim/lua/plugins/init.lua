return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "dist",
          "build",
          "vendor",
          "public",
          "coverage",
          "target",
          "out",
          "logs",
          "tmp",
          "%.git",
          "%.next",
          "%.cache",
        },
        -- vimgrep_arguments = {
        --   "rg",
        --   "--color=never",
        --   "--no-heading",
        --   "--with-filename",
        --   "--line-number",
        --   "--column",
        --   "--smart-case",
        --   "--glob=!node_modules/**"
        -- }
      },
    },
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        custom = {
          "^.git$",
          "^node_modules$",
          "^dist$",
          "^build$",
          "^vendor$",
          "^public$",
          "^coverage$",
          "^target$",
          "^out$",
          "^logs$",
          "^tmp$",
          "^.next$",
        },
      },
      git = {
        ignore = true,
      },
      view = {
        -- side = "right",
        float = {
          enable = true,
          -- open_win_config = {
          --   relative = "editor",
          --   border = "rounded",
          --   width = 30,
          --   height = 30,
          --   row = 1,
          --   col = 1,
          -- },
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()

            local window_w = math.floor(screen_w * 0.4)
            local window_h = math.floor(screen_h * 0.8)

            local center_x = (screen_w - window_w) / 2
            local center_y = ((screen_h - window_h) / 2) - vim.opt.cmdheight:get()

            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w,
              height = window_h,
            }
          end,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      delay = 1000,
    },
  },
}
