return {
  {
    -- Plugin: nvim-highlight-colors
    -- URL: https://github.com/brenoprata10/nvim-highlight-colors
    -- Description: A Neovim plugin that highlights color codes with their actual colors in real time.
    "brenoprata10/nvim-highlight-colors",
    config = function()
      -- Ensure termguicolors is enabled
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup({
        -- Default configuration
        render = "background", -- 'background'|'foreground'|'virtual'
        enable_tailwind = true, -- Enable/disable tailwind colors
        enable_named_colors = true, -- Highlight named colors like 'red'
        enable_hex = true, -- Highlight hex colors like '#FFFFFF'
        enable_rgb = true, -- Highlight rgb colors like 'rgb(255,255,255)'
        enable_hsl = true, -- Highlight hsl colors like 'hsl(0,100%,50%)'
        enable_var_usage = true, -- Highlight CSS variables
      })
    end,
  },
}
