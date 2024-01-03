return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- c-space is my tmux shortcut
    keys = {
      { "<C-\\>", desc = "Increment selection" },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-\\>",
          node_incremental = "<C-\\>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
