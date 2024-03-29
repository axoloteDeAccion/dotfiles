-- Which-key to remap
local status_ok, wk = pcall(require, "which-key")

-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
wk.register({
  h = { "Remove highlights" },
}, { prefix = "<leader>" })

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
wk.register({
  e = { "Open File Explorer" },
}, { prefix = "<leader>" })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Register which-key labels
wk.register({
  f = {
    name = "Telescope",
    f = { "Find file" },
    t = { "Find text" },
    p = { "Find project" },
    b = { "Find buffer" },
  },
}, { prefix = "<leader>" })

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line()<CR>')
wk.register({
  g = { 
    name = "Git" ,
    g = { "Open Lazygit" },
    b = { "Blame" },
  },
}, { prefix = "<leader>" })

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
wk.register({
  ['/'] = { "Toggle comment" },
}, { prefix = "<leader>" })

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
wk.register({
  d = { 
    name = "DAP",
    b = { "Toggle breakpoint" },
    c = { "Continue" },
    i = { "Step into" },
    o = { "Step over" },
    O = { "Step Out" },
    r = { "REPL toggle" },
    l = { "Run last" },
    u = { "DAPUI Toggle" },
    t = { "Terminate" },
  },
}, { prefix = "<leader>" })

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>Mason<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

wk.register({
  l = { 
    name = "LSP",
    f = { "Format" },
    D = { "Go to declaration" },
    d = { "Go to definition" },
    K = { "Hover" },
    I = { "Go to implementation" },
    R = { "Reference" },
    l = { "Diagnostics" },
    i = { "LspInfo" },
    I = { "Mason" },
    a = { "Code action" },
    j = { "Go to next" },
    k = { "Go to previous" },
    r = { "Rename" },
    s = { "Signature help" },
    q = { "Set loclist" },
  },
}, { prefix = "<leader>" })
