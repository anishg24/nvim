local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
        'nvimdev/lspsaga.nvim', -- Added to lazy load lspsaga
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {"nanotee/zoxide.vim", lazy = true},

  {"jvgrootveld/telescope-zoxide", lazy = true},

  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },

  {
    "krivahtoo/silicon.nvim",
    cmd = "Silicon",
    build = "./install.sh build",
    config = function()
      require('silicon').setup({
        font = 'JetBrainsMono=16',
        theme = "Monokai Extended"
      })
    end,
  },

  {
    "anuvyklack/pretty-fold.nvim",
    event = "VimEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
      },
    },
    config = function()
     require('pretty-fold').setup({
        keep_indentation = false,
        fill_char = " ",
        sections = {
          left = {
            function()
              return string.rep("*", vim.v.foldlevel)
            end,
            "content",
          },
          right = {},
        },
        ft_ignore = {
          "NvimTree",
          "dashboard",
          "nvcheatsheet",
          "dapui_watches",
          "dap-repl",
          "dapui_console",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
          "help",
          "vim",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "noice",
          "lazy",
          "toggleterm",
        },
      })
    end
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = {"CursorMoved", "WinScrolled"},
    config = function()
      require("scrollEOF").setup({
        pattern = "*",
        insert_mode = true,
        disabled_filetypes = { "NvimTree" }
      })
    end
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {}
  },

  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = {
          "nvdash",
          "NvimTree",
          "terminal",
          "help",
          "Trouble",
          "mason",
          "lazy",
        },
        lastplace_ignore_filetype = {
          "nvdash",
          "NvimTree",
          "terminal",
          "help",
          "Trouble",
          "mason",
          "lazy",
        },
        lastplace_open_folds = true,
      })
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    },
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require("notify")
    end
  },

  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function ()
      require("neoscroll").setup {}
    end,
  },

  {
    "m4xshen/hardtime.nvim",
    event = "BufWinEnter",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    enabled = false
  },
  {
    "mg979/vim-visual-multi",
    event = "BufWinEnter"
  },

  -- {
  --   'JoosepAlviste/nvim-ts-context-commentstring',
  -- },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  }

return plugins
