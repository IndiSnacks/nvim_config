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
  -- html auto-tag
  {
    'windwp/nvim-ts-autotag',
    -- Make sure it loads only when needed (e.g., when editing HTML/JSX/TSX)
    ft = {
      'html',
      'javascriptreact',
      'typescriptreact',
      'jsx',
      'tsx',
      'xml',
      'vue',
      'svelte',
    },
    config = function()
      require('nvim-ts-autotag').setup {
        -- Optional: configure if you want to disable for certain tags or enable for others
        -- For most users, default settings are good.
        enable_rename = true, -- Auto-rename closing tag when opening tag changes
        enable_close = true, -- Auto-close tags (e.g., typing <div> gives </div>)
        enable_jsx_close = true, -- Auto-close for JSX components
      }
    end,
  },
}
