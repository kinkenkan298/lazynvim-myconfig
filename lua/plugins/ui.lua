return {
  {
    "hiphish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      -- Modul ini berisi beberapa definisi default
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          -- lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
        blacklist = {
          "html",
          "tsx",
        },
      }
    end,
  },
  {
    "snacks.nvim",
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
      dashboard = {
        preset = {
          pick = nil,
          keys = {
            { icon = " ", key = "f", desc = "Cari File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "Buka File Baru", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Cari Teks", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Konfigurasi",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Memulihkan Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Keluar", action = ":qa" },
          },
          header = [[
        ██╗  ██╗██╗███╗   ██╗██╗  ██╗███████╗███╗   ██╗
        ██║ ██╔╝██║████╗  ██║██║ ██╔╝██╔════╝████╗  ██║
        █████╔╝ ██║██╔██╗ ██║█████╔╝ █████╗  ██╔██╗ ██║
        ██╔═██╗ ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██║╚██╗██║
        ██║  ██╗██║██║ ╚████║██║  ██╗███████╗██║ ╚████║
        ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝,
        ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>uI",
        function()
          require("incline").toggle()
        end,
        desc = "Toggle Incline",
      },
    },
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { default = true, group = "lualine_a_normal" },
            InclineNormalNC = { default = true, group = "Comment" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { icon and " " or "" }, { filename } }
        end,
      })
    end,
  },
}
