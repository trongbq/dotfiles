vim.g.gruvbox_bold = 1
vim.g.gruvbox_contrast_light = "soft"
vim.g.gruvbox_improved_strings = 1
vim.g.gruvbox_improved_warnings = 1
vim.g.gruvbox_invert_indent_guides = 1
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_invert_signs = 1
vim.g.gruvbox_invert_tabline = 1
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_comments = 1
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_undercurl = 1

local function hl(group, options)
    local bg = options.bg == nil and "" or "guibg=" .. options.bg
    local fg = options.fg == nil and "" or "guifg=" .. options.fg
    local gui = options.gui == nil and "" or "gui=" .. options.gui

    vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
end

function _G.applyGruvbox()
    local highlights = {
        -- normal stuff
        { "Normal", { bg = "NONE" } },
        { "SignColumn", { bg = "NONE" } },
        { "ColorColumn", { bg = "NONE", fg = "#928374" } },
        { "IncSearch", { bg = "#928374", fg = "#282828", gui = "bold" } },
        { "VertSplit", { bg = "#282828", fg = "#282828" } },

        -- statusline colours
        { "StatusLine", { bg = "#282828", fg = "#282828" } },
        { "StatusLineNC", { bg = "#282821", fg = "#282821" } },

        -- luatree
        { "NvimTreeFolderIcon", { fg = "#D79921" } },
        { "NvimTreeIndentMarker", { fg = "#928374" } },

        -- telescope
        { "TelescopeSelection", { bg = "NONE", fg = "#D79921", gui = "bold" } },
        { "TelescopeMatching", { bg = "NONE", fg = "#D79921", gui = "bold" } },
        { "TelescopePreviewBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopePromptBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopeResultsBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopePromptPrefix", { bg = "NONE", fg = "#D79921" } },
    }

    for _, highlight in pairs(highlights) do
        hl(highlight[1], highlight[2])
    end
end

-- automatically override colorscheme
vim.api.nvim_exec(
    [[
augroup NewColor
au!
au ColorScheme gruvbox8 call v:lua.applyGruvbox()
augroup END
colorscheme gruvbox8
]],
    false
)
