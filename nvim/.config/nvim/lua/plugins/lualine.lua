local icons = require("lazyvim.config").icons

return {
  -- https://github.com/nvim-lualine/lualine.nvim
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_b, {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      })

      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        {
          function ()
            local gitblame = vim.b.gitsigns_blame_line
            if gitblame then
              return gitblame
            end
            return ""
          end,
         },
      }

      -- https://github.com/LazyVim/LazyVim/blob/879e29504d43e9f178d967ecc34d482f902e5a91/lua/lazyvim/plugins/ui.lua#L156
      -- remove diff
      table.remove(opts.sections.lualine_x, 5)

      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%I:%M %p")
        end,
      }
    end,
  },
}
