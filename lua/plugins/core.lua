return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.compat",
      "xzbdmw/colorful-menu.nvim",
    },
    opts = {
      completion = {
        ghost_text = { enabled = true },
        menu = {
          scrollbar = false,
          draw = {
            padding = 2,
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            treesitter = { "lsp" },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
    },
  },
}
