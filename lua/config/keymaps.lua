-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

-- This binds the LSP rename function to `<leader>rn`
vim.api.nvim_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", { desc = "Replace every occurrence", noremap = true, silent = true })

-- Delete current buffer and its respective file
local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand("%"))
    vim.api.nvim_buf_delete(0, { force = true })
  end
end
vim.keymap.set("n", "<leader>rm", confirm_and_delete_buffer, { desc = "Delete current buffer and file" })

-- Delete current buffer
vim.keymap.set("n", "<leader>rb", function ()
  vim.api.nvim_buf_delete(0, { force = true })
end, { desc = "Delete current buffer" })

-- New file and buffer at currently opened buffer's dir
vim.keymap.set("n", "<leader>aa", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local filename = vim.fn.input("Enter filename: ")

  if filename == "" then
    print("Invalid filename or ESC entered")
    return
  end

  local fullpath = current_dir .. "/" .. filename
  if vim.fn.filereadable(fullpath) == 1 then
    print("File already exists: " .. fullpath)
    return
  end

  vim.cmd("edit " .. vim.fn.fnameescape(fullpath))
  print("New file created: " .. fullpath)
end, { desc = "Create new file in current buffer's dir" })

-- New file at given path
vim.keymap.set("n", "<leader>as", function()
  local filepath = vim.fn.input("Enter full path: ")
  if filepath == "" then
    print("Invalid path or ESC entered")
    return
  end

  local dir = vim.fn.fnamemodify(filepath, ":p:h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p") -- create dirs if missing
  end

  if vim.fn.filereadable(filepath) == 1 then
    print("File already exists: " .. filepath)
    return
  end

  vim.cmd("edit " .. vim.fn.fnameescape(filepath))
  print("New file created: " .. filepath)
end, { desc = "Create new file from path" })

