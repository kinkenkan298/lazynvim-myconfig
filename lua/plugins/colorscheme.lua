return {
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = { 
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, 
        show_end_of_buffer = false, 
        term_colors = false, 
        dim_inactive = {
          enabled = false, 
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = true, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        highlight_overrides = {
          all = function(colors)
            return {
              CurSearch = { bg = colors.sky },
              IncSearch = { bg = colors.sky },
              CursorLineNr = { fg = colors.blue, style = { "bold" } },
              DashboardFooter = { fg = colors.overlay0 },
              TreesitterContextBottom = { style = {} },
              WinSeparator = { fg = colors.overlay0, style = { "bold" } },
              ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
              ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
              Headline = { style = { "bold" } },
              Headline1 = { fg = colors.blue, style = { "bold" } },
              Headline2 = { fg = colors.pink, style = { "bold" } },
              Headline3 = { fg = colors.lavender, style = { "bold" } },
              Headline4 = { fg = colors.green, style = { "bold" } },
              Headline5 = { fg = colors.peach, style = { "bold" } },
              Headline6 = { fg = colors.flamingo, style = { "bold" } },
              rainbow1 = { fg = colors.blue, style = { "bold" } },
              rainbow2 = { fg = colors.pink, style = { "bold" } },
              rainbow3 = { fg = colors.lavender, style = { "bold" } },
              rainbow4 = { fg = colors.green, style = { "bold" } },
              rainbow5 = { fg = colors.peach, style = { "bold" } },
              rainbow6 = { fg = colors.flamingo, style = { "bold" } },
            }
          end,
        },
        color_overrides = {
          mocha = {
            -- rosewater = "#F5B8AB",
            -- flamingo = "#F29D9D",
            -- pink = "#AD6FF7",
            -- mauve = "#FF8F40",
            -- red = "#E66767",
            -- maroon = "#EB788B",
            -- peach = "#FAB770",
            -- yellow = "#FACA64",
            -- green = "#70CF67",
            -- teal = "#4CD4BD",
            -- sky = "#61BDFF",
            -- sapphire = "#4BA8FA",
            -- blue = "#00BFFF",
            -- lavender = "#00BBCC",
            -- text = "#C1C9E6",
            -- subtext1 = "#A3AAC2",
            -- subtext0 = "#8E94AB",
            -- overlay2 = "#7D8296",
            -- overlay1 = "#676B80",
            -- overlay0 = "#464957",
            -- surface2 = "#3A3D4A",
            -- surface1 = "#2F313D",
            -- surface0 = "#1D1E29",
            base = "#0b0b12",
            mantle = "#11111a",
            crust = "#191926",
          },
        },
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          blink_cmp = true
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha"
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
