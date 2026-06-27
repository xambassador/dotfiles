return {
  -- Formatting on save.
  -- Docs: https://github.com/stevearc/conform.nvim
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- Docs: https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ensure_installed lists parsers that are auto-installed on startup.
  -- Docs: https://github.com/nvim-treesitter/nvim-treesitter
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

  -- Docs: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        -- hidden = true passes --hidden to fd so dotfiles (.prettierrc, .gitignore, etc.)
        -- appear in results. file_ignore_patterns excludes .git since it is not in
        -- .gitignore but should never appear in search results.
        -- fd docs: https://github.com/sharkdp/fd#excluding-specific-files-or-directories
        find_files = {
          hidden = true,
          file_ignore_patterns = { "^%.git/", "^%.agents/" },
        },
        -- --hidden makes ripgrep search inside dotfiles and dotdirectories.
        -- --glob !.git excludes the .git directory from grep results.
        -- ripgrep still respects .gitignore by default so gitignored files stay hidden.
        -- rg docs: https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#manual-filtering-globs
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
      },
    },
  },

  -- Docs: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
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

  -- Docs: https://github.com/folke/which-key.nvim
  {
    "folke/which-key.nvim",
    opts = {
      delay = 1000,
    },
  },

  -- Docs: https://github.com/windwp/nvim-ts-autotag
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

  -- Docs: https://github.com/github/copilot.vim
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Lazy-loaded — only required when jsonls requests it via lspconfig.
  -- Docs: https://github.com/b0o/schemastore.nvim
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Docs: https://github.com/mfussenegger/nvim-lint
  {
    "mfussenegger/nvim-lint",
    event = { "BufEnter", "BufWritePost", "InsertLeave" },
    config = function()
      require "configs.lint"
    end,
  },
}
