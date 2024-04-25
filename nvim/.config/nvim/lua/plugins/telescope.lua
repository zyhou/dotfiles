return {
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
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
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
      require("telescope").load_extension("live_grep_args")
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        preview = {
          hide_on_startup = true,
        },
        layout_config = {
          horizontal = {
            preview_width = 0.6,
          },
        },
      },
      pickers = {
        find_files = {
          path_display = {
            "filename_first",
          },
        },
        git_files = {
          path_display = {
            "filename_first",
          },
        },
      },
    },
  },
}
