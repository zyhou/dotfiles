return {
  -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Mark file with harpoon",
      },
      {
        "<C-e>",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Toogle harpoon UI",
      },
      {
        "<C-h>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Prev harpoon item",
      },
      {
        "<C-j>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Next harpoon item",
      },
    },
  },
}
