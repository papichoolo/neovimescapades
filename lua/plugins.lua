  local cmd = require('pckr.loader.cmd')
  local keys = require('pckr.loader.keys')

  require('pckr').add{
    -- pckr can manage itself
    'wbthomason/pckr.nvim';

    -- Simple plugins can be specified as strings
    '9mm/vim-closer';

    -- Lazy loading:
    -- Load on specific commands
    {'tpope/vim-dispatch',
      cond = { cmd('Dispatch') }
    };

    -- Load on specific keymap
    {'tpope/vim-commentary', cond = keys('n', 'gc') },

    -- Load on specific commands
    -- Also run code after load (see the "config" key)
    { 'w0rp/ale',
      cond = cmd('ALEEnable'),
      config = function()
        vim.cmd[[ALEEnable]]
      end
    };

    -- Local plugins can be included
    '~/projects/personal/hover.nvim';

    -- Plugins can have post-install/update hooks
    {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cond = cmd('MarkdownPreview')};

    -- Post-install/update hook with neovim command
    -- Install plugin as a 'start' plugin
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', start = true };

    -- Post-install/update hook with call of vimscript function with argument
    { 'glacambre/firenvim', run = function()
      vim.fn['firenvim#install'](0)
    end };

    -- Use specific branch, dependency and run lua file after load
    { 'glepnir/galaxyline.nvim',
      branch = 'main',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function()
        require'statusline'
      end
    };

    -- Run config *before* the plugin is loaded
    {'whatyouhide/vim-lengthmatters', config_pre = function()
      vim.g.lengthmatters_highlight_one_column = 1
      vim.g.lengthmatters_excluded = {'pckr'}
    end},
  }

