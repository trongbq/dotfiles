local options = {
    background = "dark",                 -- Use spaces instead of tabs
    expandtab = true,                    -- Use spaces instead of tabs
    shiftwidth = 2,                      -- Size of an indent
    smartindent = true,                  -- Insert indents automatically
    tabstop = 2,                         -- Number of spaces tabs count for
    hidden = true,                       -- Enable modified buffers in background
    ignorecase = true,                   -- Ignore case
    joinspaces = false,                  -- No double spaces with join after a dot
    scrolloff = 4,                       -- Lines of context
    sidescrolloff = 8,                   -- Columns of context
    shiftround = true,                   -- Round indent
    smartcase = true,                    -- Don't ignore case with capitals
    splitbelow = true,                   -- Put new windows below current
    splitright = true,                   -- Put new windows right of current
    termguicolors = false,               -- True color support
    wildmode = "list:longest",           -- Command-line completion mode
    list = true,                         -- Show some invisible characters (tabs...)
    number = true,                       -- Print line number
    relativenumber = true,               -- Relative line numbers
    wrap = false,                        -- Disable line wrap
}

local function setOptions(opts)
    for key, val in pairs(opts) do
        if val == true then
            vim.api.nvim_command("set " .. key)
        elseif val == false then
            vim.api.nvim_command("set no" .. key)
        else
            vim.api.nvim_command("set " .. key .. "=" .. val)
        end
    end
end

setOptions(options)

vim.cmd("syntax on")
