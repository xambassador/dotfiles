return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "go",
        "rust",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        sorting_strategy = "descending",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { "^%.git/", "^%.agents/" },
          previewer = false,
        },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
      },
    },
  },
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
        float = {
          enable = true,
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
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
--   {
--     "github/copilot.vim",
--     event = "InsertEnter",
--   },
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePost", "InsertLeave" },
    config = function()
      require "configs.lint"
    end,
  },
}
