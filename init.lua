-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

_G.Kodex = {
  color_0 = "#A888B5",
  color_1 = "#DD88CF",
  color_2 = "#574964",
  color_3 = "#F11A7B",
  color_4 = "#FAFAFA",
}

vim.cmd.colorscheme("evangelion")

-- vim.api.nvim_set_hl(0, "PMenu", { bg = Kodex.color_1, fg = Kodex.color_3, blend = 0 }) -- Change colors as needed
-- vim.api.nvim_set_hl(0, "PMenuSel", { bg = Kodex.color_3, fg = Kodex.color_4, blend = 0 }) -- Change colors for selected itemDefaults

-- vim.api.nvim_set_hl(0, "CursorLine", { bg = Kodex.color_2 })

-- Set the background color for the documentation pop-up
-- vim.cmd("highlight CmpDocumentation guibg=" .. Kodex.color_0 .. " guifg=" .. Kodex.color_4)
-- vim.cmd("highlight NormalFloat guibg=" .. Kodex.color_0)
-- vim.cmd("highlight FloatBorder guifg=" .. Kodex.color_0 .. " guibg=" .. Kodex.color_4)
