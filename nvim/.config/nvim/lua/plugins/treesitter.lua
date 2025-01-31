return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  opts = {
    auto_install = true,
    ensure_installed = { "lua", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = true,
}
