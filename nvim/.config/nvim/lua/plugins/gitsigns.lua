return {
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = false
      },
      current_line_blame_formatter = ' <author> (<author_time:%R>)',
    },
  },
}
