-- convinient way to declare mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("", "<leader><cr>", "<cmd>nohlsearch<cr>", { noremap = true, silent = false })
map("", "<leader>y", "\"+y")

local wk = require("which-key")

local leader_normal_mappings = {
  a = { "<cmd>NvimTreeToggle<CR>", "Toggle file tree" },
  b = {
    name = "Buffers",
    s = { "<c-^>", "Switch back to the previous buffer" },
    d = { "<cmd>BufDel<cr>", "Delete the current buffer" },
    f = { "<cmd>Telescope buffers<cr>", "buffer" },
    l = { "<cmd>:bn<cr>", "Next buffer" },
    h = { "<cmd>:bp<cr>", "Previous buffer" },
    w = { "<cmd>:bw<cr>", "Save and close the current buffer" }
  },
  f = {
    name = "+find",
    w = { "<cmd>Telescope grep_string<cr>", "a file contains string under current cursor" },
    g = { "<cmd>Telescope live_grep<cr>", "a file contains typing word" },
  },
  o = { "<cmd>Telescope find_files<cr>", "open a file" },
  w = {
    name = "+window",
    h = { "<cmd>:wincmd h<cr>", "move left" },
    j = { "<cmd>:wincmd j<cr>", "move down" },
    k = { "<cmd>:wincmd k<cr>", "move up" },
    l = { "<cmd>:wincmd l<cr>", "move right" },
    s = { "<cmd>:wincmd s<cr>", "split horizontal" },
    v = { "<cmd>:wincmd v<cr>", "split vertical" },
    e = { "<cmd>:wincmd =<cr>", "equalize size" },
    t = { "<cmd>:wincmd T<cr>", "breakout into new tab" },
  },
  q = {
    name = "+quit",
    w = { "<cmd>wincmd o<cr>", "all other windows" },
    t = { "<cmd>tabonly<cr>", "all other tabs" },
  },
}
wk.register(leader_normal_mappings, { prefix = "<leader>" })
