return {
  "xero/evangelion.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    overrides = {
      keyword = { fg = "#00ff00", bg = "#222222", undercurl = false },
      ["@boolean"] = { link = "Special" },
    },
  },
  init = function()
    vim.cmd.colorscheme("evangelion")
  end,
}
