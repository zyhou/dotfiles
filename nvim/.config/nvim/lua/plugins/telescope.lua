return {
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    build = "make",
    keys = {
      {
        "<leader>uu",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
      {
        "<leader>.",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live Grep (Args)",
      },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("undo")
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
