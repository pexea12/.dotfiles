return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format code" })

    return {
      sources = {
        -- Install via mason
        null_ls.builtins.formatting.stylua,
      },
    }
  end,
}
