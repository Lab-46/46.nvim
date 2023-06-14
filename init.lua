--  ____            _
-- | __ )  __ _ ___(_) ___ ___
-- |  _ \ / _` / __| |/ __/ __|
-- | |_) | (_| \__ \ | (__\__ \
-- |____/ \__,_|___/_|\___|___/

vim.g.mapleader = ' '
vim.o.colorcolumn = ''
vim.o.cursorline = true
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.numberwidth = 2
vim.o.relativenumber = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wrap = false
vim.opt.fillchars = { eob = ' ' }
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.opt.list = true
vim.opt.listchars:append 'space:⋅'

local map = vim.api.nvim_set_keymap

map('n', '<leader>c', ':CocRestart<CR><CR>', { noremap = true, silent = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true })
map('n', '<C-J>', '<C-W><C-J>', { noremap = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true })
map('n', '<C-S>', ':%s/', { noremap = true })
map('n', 'sp', ':sp<CR>', { noremap = true })
map('n', 'tj', ':tabprev<CR>', { noremap = true })
map('n', 'tk', ':tabnext<CR>', { noremap = true })
map('n', 'tn', ':tabnew<CR>', { noremap = true })
map('n', 'to', ':tabo<CR>', { noremap = true })
map('n', 'vs', ':vs<CR>', { noremap = true })

--  ____  _             _
-- |  _ \| |_   _  __ _(_)_ __  ___
-- | |_) | | | | |/ _` | | '_ \/ __|
-- |  __/| | |_| | (_| | | | | \__ \
-- |_|   |_|\__,_|\__, |_|_| |_|___/
--                |___/

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-commentary',
  { 'neoclide/coc.nvim',   branch = 'release' },
  {
    'kvrohit/rasmus.nvim',
    lazy = false,
    priority = 1000
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy'
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    event = 'VeryLazy',
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy'
  },
  'lukas-reineke/indent-blankline.nvim',
  'petertriho/nvim-scrollbar'
})

--    ____      _
--   / ___|___ | | ___  _ __ ___
--  | |   / _ \| |/ _ \| '__/ __|
--  | |__| (_) | | (_) | |  \__ \
--   \____\___/|_|\___/|_|  |___/

vim.cmd.colors('rasmus')
vim.o.background = 'dark'

--   _____                   _ _   _
--  |_   _| __ ___  ___  ___(_) |_| |_ ___ _ __
--    | || '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
--    | || | |  __/  __/\__ \ | |_| ||  __/ |
--    |_||_|  \___|\___||___/_|\__|\__\___|_|

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'typescript' },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

--    ___ ___   ___
--   / __/ _ \ / __|
--  | (_| (_) | (__
--   \___\___/ \___|

map('n', '<leader>.', '<Plug>(coc-codeaction)', {})
map('n', 'gd', '<Plug>(coc-definition)', { silent = true })
map('n', 'gr', '<Plug>(coc-references)', { silent = true })
map('n', 'K', ":call CocActionAsync('doHover')<CR>", { silent = true, noremap = true })
map('n', '<leader>rn', '<Plug>(coc-rename)', {})
map('n', '<leader>f', ':CocCommand prettier.formatFile<CR>', { noremap = true })
map('i', '<C-Space>', 'coc#refresh()', { silent = true, expr = true })
map('i', '<TAB>', "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", { noremap = true, silent = true, expr = true })
map('i', '<S-TAB>', "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", { noremap = true, expr = true })
map('i', '<CR>', "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", { silent = true, expr = true, noremap = true })

--   _____    _
--  |_   _|__| | ___  ___  ___ ___  _ __   ___
--    | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--    | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--    |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                 |_|

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.setup {
  pickers = {
    find_files = {
      theme = 'dropdown',
      previewer = false,
    },
    buffers = {
      theme = 'dropdown',
      previewer = false,
    }
  },
}

vim.keymap.set('n', '<C-P>', telescope_builtin.find_files, {})
vim.keymap.set('n', '<C-F>', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<C-B>', telescope_builtin.buffers, {})

--              _                 _
--   _ ____   _(_)_ __ ___       | |_ _ __ ___  ___
--  | '_ \ \ / / | '_ ` _ \ _____| __| '__/ _ \/ _ \
--  | | | \ V /| | | | | | |_____| |_| | |  __/  __/
--  |_| |_|\_/ |_|_| |_| |_|      \__|_|  \___|\___|

local api = require('nvim-tree.api')

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  api.node.open.edit()
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- global
map('n', '<C-n>', ':NvimTreeFindFileToggle<cr>', { silent = true, noremap = true })

-- empty setup using defaults
require('nvim-tree').setup {
  git = {
    enable = true
  },
  renderer = {
    root_folder_label = false,
    icons = {
      show = {
        git = false
      }
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = true
  }
}

--   _           _            _        _     _             _    _ _                         _           
--  (_)_ __   __| | ___ _ __ | |_     | |__ | | __ _ _ __ | | _| (_)_ __   ___   _ ____   _(_)_ __ ___  
--  | | '_ \ / _` |/ _ \ '_ \| __|____| '_ \| |/ _` | '_ \| |/ / | | '_ \ / _ \ | '_ \ \ / / | '_ ` _ \ 
--  | | | | | (_| |  __/ | | | ||_____| |_) | | (_| | | | |   <| | | | | |  __/_| | | \ V /| | | | | | |
--  |_|_| |_|\__,_|\___|_| |_|\__|    |_.__/|_|\__,_|_| |_|_|\_\_|_|_| |_|\___(_)_| |_|\_/ |_|_| |_| |_|

require('indent_blankline').setup {
  space_char_blankline = ' ',
}

--              _                                    _ _ _                
--   _ ____   _(_)_ __ ___        ___  ___ _ __ ___ | | | |__   __ _ _ __ 
--  | '_ \ \ / / | '_ ` _ \ _____/ __|/ __| '__/ _ \| | | '_ \ / _` | '__|
--  | | | \ V /| | | | | | |_____\__ \ (__| | | (_) | | | |_) | (_| | |   
--  |_| |_|\_/ |_|_| |_| |_|     |___/\___|_|  \___/|_|_|_.__/ \__,_|_|   

require("scrollbar").setup({
  handle = {
    blend = 0
  },
  handlers = {
    cursor = false
  }
})
