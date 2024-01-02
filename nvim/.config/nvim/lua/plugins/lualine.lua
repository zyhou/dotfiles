local icons = require("lazyvim.config").icons
local C = require("catppuccin.palettes").get_palette()

return {
  -- https://github.com/nvim-lualine/lualine.nvim
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.component_separators = ""
      opts.options.section_separators = ""

      opts.sections.lualine_a = {
        {
          function()
            return "▊"
          end,
          ---@diagnostic disable-next-line: need-check-nil
          color = { fg = C.mantle },
          padding = { left = 0, right = 1 },
        },
      }

      opts.sections.lualine_b = {
        ---@diagnostic disable-next-line: need-check-nil
        { "branch", icon = "", color = { bg = C.mantle, fg = C.mauve } },
        {
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
          ---@diagnostic disable-next-line: need-check-nil
          color = { bg = C.mantle },
        },
      }

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
          function()
            local gitblame = vim.b.gitsigns_blame_line
            if gitblame then
              return gitblame
            end
            return ""
          end,
        },
      }

      -- https://github.com/LazyVim/LazyVim/blob/879e29504d43e9f178d967ecc34d482f902e5a91/lua/lazyvim/plugins/ui.lua#L156
      -- remove diff
      table.remove(opts.sections.lualine_x, 5)

      opts.sections.lualine_y = {
        ---@diagnostic disable-next-line: need-check-nil
        { "progress", separator = " ", padding = { left = 1, right = 0 }, color = { bg = C.mantle, fg = C.text } },
        ---@diagnostic disable-next-line: need-check-nil
        { "location", padding = { left = 0, right = 1 }, color = { bg = C.mantle, fg = C.text } },
      }

      opts.sections.lualine_z = {
        {
          function()
            return "▊"
          end,
          ---@diagnostic disable-next-line: need-check-nil
          color = { fg = C.mantle },
          padding = { left = 0, right = 1 },
        },
      }
    end,
  },
}
