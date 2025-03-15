-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable New Line Comment",
})

-- Disable autoformat for files in list
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Simple LSP progress
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- Show line diagnostics automatically in specific cursor position
-- local util = require("lazyvim.util.lsp")
-- util.on_attach(function(_, bufnr)
--   vim.api.nvim_create_autocmd("CursorHold", {
--     buffer = bufnr,
--     callback = function()
--       local opts = {
--         focusable = false,
--         close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--         border = "rounded",
--         source = "always",
--         prefix = "● ",
--         scope = "cursor",
--       }
--
--       vim.diagnostic.open_float(nil, opts)
--     end,
--   })
-- end)
