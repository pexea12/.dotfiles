-- Configure language server
return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = true,
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
      --  capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              ignoreDir = { ".rockspec", "lua_modules" },
              ignoreSubmodules = true,
            },
          },
        },
      })

      vim.keymap.set(
        "n",
        "<leader>ca",
        vim.lsp.buf.code_action,
        { desc = "LSP code action" }
      )
    end
  },
}
