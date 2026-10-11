return {
  { "folke/flash.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  {
    "nvim-mini/mini.files",
    options = {
        use_as_default_explorer = true,
      }
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "css",
            "gitignore",
            "go",
            "http",
            "java",
            "sql"
          },
      },
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup({
        log_level = vim.log.levels.ERROR,

        enabled = true,
        cwd_change_handling = true,
        -- auto_save_enabled = true,
        -- auto_restore_enabled = true,

        -- "C:\\", "C:\\Users\\james"
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/", "$HOME" },
        bypass_save_filetypes = { "alpha", "dashboard" },
        -- pre_cwd_changed_cmds = {
        --   "tabdo NERDTreeClose",
        -- },
      })
    end,
    keys = {
      {
        "<leader>fs", '<cmd>SessionSearch<CR>', desc = "Search for a session",
      },
      {
        "<leader>fsv", '<cmd>SessionSave<CR>', desc = "Save session",
      },
    },
  },

  -- trouble
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          win = { position = "bottom" },
        },
      },
    },
    },

  {
    "which-key.nvim",
    opts = {
      preset = "classic",
      spec = {
        ["<leader>dv"] = { name = "+diffview" },
      },
    },
  },
}
