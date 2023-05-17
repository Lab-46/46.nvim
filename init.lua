--  ____            _          
-- | __ )  __ _ ___(_) ___ ___ 
-- |  _ \ / _` / __| |/ __/ __|
-- | |_) | (_| \__ \ | (__\__ \
-- |____/ \__,_|___/_|\___|___/

vim.g.mapleader = " "
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
vim.opt.fillchars = { eob = " "}

vim.api.nvim_set_keymap("n", "<leader>c", ":CocRestart<CR><CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })

--  ____  _             _           
-- |  _ \| |_   _  __ _(_)_ __  ___ 
-- | |_) | | | | |/ _` | | '_ \/ __|
-- |  __/| | |_| | (_| | | | | \__ \
-- |_|   |_|\__,_|\__, |_|_| |_|___/
--                |___/             

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'neoclide/coc.nvim', branch = 'release' },
  'kvrohit/rasmus.nvim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-commentary',
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  "nvim-lualine/lualine.nvim",
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require('leap').add_default_mappings(true)
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end
  }
})

--    ____      _                
--   / ___|___ | | ___  _ __ ___ 
--  | |   / _ \| |/ _ \| '__/ __|
--  | |__| (_) | | (_) | |  \__ \
--   \____\___/|_|\___/|_|  |___/

vim.g.rasmus_transparent = true
vim.cmd.colors("rasmus")
vim.o.background = 'dark'

--   _____                   _ _   _            
--  |_   _| __ ___  ___  ___(_) |_| |_ ___ _ __ 
--    | || '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
--    | || | |  __/  __/\__ \ | |_| ||  __/ |   
--    |_||_|  \___|\___||___/_|\__|\__\___|_|   

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript" },
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

vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

--   _____    _                                
--  |_   _|__| | ___  ___  ___ ___  _ __   ___ 
--    | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
--    | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
--    |_|\___|_|\___||___/\___\___/| .__/ \___|
--                                 |_|         

local telescope = require("telescope")

telescope.setup{
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    }
  },
}

vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })

--              _                 _                 
--   _ ____   _(_)_ __ ___       | |_ _ __ ___  ___ 
--  | '_ \ \ / / | '_ ` _ \ _____| __| '__/ _ \/ _ \
--  | | | \ V /| | | | | | |_____| |_| | |  __/  __/
--  |_| |_|\_/ |_|_| |_| |_|      \__|_|  \___|\___|

local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  api.node.open.edit()
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- global
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<cr>", {silent = true, noremap = true})

-- empty setup using defaults
require("nvim-tree").setup {
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
    dotfiles = true,
  },
}

--   _                _ _            
--  | |   _   _  __ _| (_)_ __   ___ 
--  | |  | | | |/ _` | | | '_ \ / _ \
--  | |__| |_| | (_| | | | | | |  __/
--  |_____\__,_|\__,_|_|_|_| |_|\___|

require('lualine').setup {
  options = {
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    globalstatus = false
  },
  sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {'location'},
    lualine_z = {}
  },
}
