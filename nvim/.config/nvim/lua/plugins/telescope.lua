return {
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    build = "make",
    keys = {
      {
        "<leader>uu",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("undo")
    end,
  },
}
