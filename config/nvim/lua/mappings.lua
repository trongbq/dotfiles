local keymap = vim.api.nvim_set_keymap

local mappings = {
    -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

    -- copy to system clipboard
    { "", "<Leader>c", "\"+y", { noremap = true, silent = false } },

    -- stop highlight search
    { "", "<Leader><CR>", "<CMD>nohlsearch<CR>", { noremap = true, silent = false } },

    -- moving window
    { "", "<C-h>", "<C-w>h", { noremap = true, silent = true } },
    { "", "<C-j>", "<C-w>j", { noremap = true, silent = true } },
    { "", "<C-k>", "<C-w>k", { noremap = true, silent = true } },
    { "", "<C-l>", "<C-w>l", { noremap = true, silent = true } },

    -- resize window
    { "n", "<C-w>h", "<CMD>vertical resize +5<CR>", { noremap = true, silent = true } },
    { "n", "<C-w>k", "<CMD>resize -5<CR>", { noremap = true, silent = true } },
    { "n", "<C-w>l", "<CMD>vertical resize -5<CR>", { noremap = true, silent = true } },
    { "n", "<C-w>j", "<CMD>resize +5<CR>", { noremap = true, silent = true } },

    -- Buffers
    { "n", "<A-l>", "<CMD>BufferNext<CR>", { noremap = true, silent = true } },
    { "n", "<A-h>", "<CMD>BufferPrevious<CR>", { noremap = true, silent = true } },
    { "n", "<A-L>", "<CMD>BufferMovePrevious<CR>", { noremap = true, silent = true } },
    { "n", "<A-H>", "<CMD>BufferMoveNext<CR>", { noremap = true, silent = true } },
    { "n", "<Leader>q", "<CMD>BufferClose<CR>", { noremap = true, silent = true } },
    { "n", "<Leader>qq", "<CMD>bufdo BufferClose<CR>", { noremap = true, silent = true } },
    { "n", "<Leader>qa", "<CMD>bufdo BufferClose!<CR>", { noremap = true, silent = true } },
    { "n", "<Leader>qo", "<CMD>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true } },
    { "n", "<A-1>", "<CMD>BufferGoto 1<CR>", { noremap = true, silent = true } },
    { "n", "<A-2>", "<CMD>BufferGoto 2<CR>", { noremap = true, silent = true } },
    { "n", "<A-3>", "<CMD>BufferGoto 3<CR>", { noremap = true, silent = true } },
    { "n", "<A-4>", "<CMD>BufferGoto 4<CR>", { noremap = true, silent = true } },
    { "n", "<A-5>", "<CMD>BufferGoto 5<CR>", { noremap = true, silent = true } },
    { "n", "<A-6>", "<CMD>BufferGoto 6<CR>", { noremap = true, silent = true } },
    { "n", "<A-7>", "<CMD>BufferGoto 7<CR>", { noremap = true, silent = true } },
    { "n", "<A-8>", "<CMD>BufferGoto 8<CR>", { noremap = true, silent = true } },
    { "n", "<A-9>", "<CMD>BufferGoto 9<CR>", { noremap = true, silent = true } },
    { "n", "<A-0>", "<CMD>BufferLast<CR>", { noremap = true, silent = true } },

    -- telescope
    {
        "n",
        "<Leader>b",
        '<CMD>lua require("telescope.builtin").buffers()<CR>',
        { noremap = true, silent = false },
    },
    {
        "n",
        "<Leader>o",
        '<CMD>lua require("telescope.builtin").find_files()<CR>',
        { noremap = true, silent = false },
    },
    {
        "n",
        "<Leader>m",
        '<cmd>lua require("telescope.builtin").marks()<cr>',
        { noremap = true, silent = false },
    },
    {
        "n",
        "<Leader>k",
        '<CMD>lua require("telescope.builtin").keymaps()<CR>',
        { noremap = true, silent = false },
    },
    {
        "n",
        "<Leader>/",
        '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
        { noremap = true, silent = false },
    },
    {
        "n",
        "<Leader>?",
        '<CMD>lua require("telescope.builtin").grep_string()<CR>',
        { noremap = true, silent = false },
    },
}

local function set_mappings(ms)
    for _, key in pairs(ms) do
        keymap(key[1], key[2], key[3], key[4])
    end
end

vim.cmd('let mapleader=" "')
set_mappings(mappings)
