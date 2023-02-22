local o = vim.opt

o.number        = true
o.number        = true
o.title         = true
o.showmode      = true
o.showmatch     = true
o.ignorecase    = true
o.wrapscan      = true
o.termguicolors = true
o.hidden        = true

-- tabspace
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.autoindent = true

-- encoding
o.encoding = 'utf-8'
o.fileencodings = 'utf-8,iso-2022-jp,euc-jp,cp932'
o.fileformats = 'unix'

-- clipboard
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
if in_wsl then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf"
        },
        paste = {
            ["+"] = "win32yank.exe -o --crlf",
            ["*"] = "win32yank.exe -o --crlf"
        },
        cache_enable = 0,
    }
end
