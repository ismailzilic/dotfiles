return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      quickfile = {
        enabled = true,
      },
      picker = {
        enabled = true,
        matchers = {
          frecency = true,
          cwd_bonus = true,
        },
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          preset = "telescope",
          cycle = false,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = false,
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = "vertical",
              border = "rounded",
              title = "{title}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
            },
          },
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                {
                  win = "input",
                  height = 1,
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                  border = "rounded",
                },
              },
              {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.50,
                border = "rounded",
                title_pos = "center",
              },
            },
          },
          ivy = {
            layout = {
              box = "vertical",
              backdrop = false,
              width = 0,
              height = 0.4,
              position = "bottom",
              border = "top",
              titlle = " {title} {live} {flags}",
              title_pos = "left",
              { win = "input", height = 1, border = "bottom" },
              {
                box = "horizontal",
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
              },
            },
          },
        },
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
    keys = {

      -- Pickers & explorers
      {
        "<leader>pf",
        function() require("snacks").picker.files() end,
        desc = "Find files",
      },
      {
        "<leader>pg",
        function() require("snacks").picker.grep() end,
        desc = "Grep word",
      },
      {
        "<leader>pwg",
        function() require("snacks").picker.grep_word() end,
        desc = "Search visual selection or word",
        mode = { "n", "x" },
      },
      {
        "<leader>pm",
        function() require("snacks").picker.keymaps({ layout = "ivy" }) end,
        desc = "Search keymaps",
      },
      {
        "<leader>e",
        function() require("snacks").explorer() end,
        desc = "Open snacks explorer",
      },

      -- Git
      {
        "<leader>gg",
        function() require("snacks").lazygit() end,
        desc = "LazyGit",
      },
      {
        "<leader>gb",
        function() require("snacks").picker.git_branches({ layout = "select" }) end,
        desc = "Git branches",
      },

      -- Find
      {
        "<leader>ph",
        function() require("snacks").picker.help() end,
        desc = "Help pages",
      },

      -- Other
      {
        "<leader>rN",
        function() require("snacks").rename.rename_file() end,
        desc = "Rename current file",
      },
    },
  },
}
