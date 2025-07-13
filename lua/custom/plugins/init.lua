-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- ==================================================== Sahil's Extensions =============================================
  -- neo-tree : adds a files tree to my config
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        window = {
          position = 'right',
          width = 40,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      }
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file [E]xplorer' })
      vim.keymap.set('n', '<D-S-e>', '<cmd>Neotree toggle<CR>', { desc = 'Toggle file [E]xplorer' })
    end,
  },
  -- nvim-autopairs : automatically closes brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
        ts_config = {
          lua = { 'string', 'source' },
          javascript = { 'string', 'template_string' },
          java = false,
        },
        disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = [=[[%'%"%)%>%]%)%}%,]]=],
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey = 'Comment',
        },
      }
    end,
  },
  -- Markdown Preview
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  --Twilight : Dims parts of my code that I don't need to focus on
  {
    'folke/twilight.nvim',
    -- Add a config function to explicitly call setup
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { 'Normal', '#ffffff' },
          term_bg = '#000000', -- if guibg=NONE, this will be used to calculate text color
          inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always to expand to the top-most ancestor with these types
          'function',
          'method',
          'table',
          'if_statement',
        },
        exclude = {}, -- exclude these filetypes
      }
    end,
  },
  -- nvim-ts-autotag: Automatically closes and renames HTML/JSX tags
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'css',
      'scss',
      'vue',
      'svelte',
      'astro',
      'tsx',
      'jsx',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
