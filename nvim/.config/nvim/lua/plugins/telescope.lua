return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function (_, opts)
      local builtin = require("telescope.builtin")
      vim.keymap.set(
        "n",
        "<C-p>",
        builtin.find_files,
        { desc = "Telescope find files" }
      )

      vim.keymap.set(
        "n",
        "<leader>lg",
        builtin.live_grep,
        { desc = "Telescope live grep" }
      )

      return opts
    end
  },
  {
    --- For LSP. Check mason.lua for more information
    "nvim-telescope/telescope-ui-select.nvim",
    opts = function ()
      require("telescope").load_extension("ui-select")

      return {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      }
    end
  },
}
