local function image_ft_options(ft)
  return {
    enabled = true,
    clear_in_insert_mode = false,
    download_remote_images = false,
    only_render_image_at_cursor = true,
    filetypes = ft,
  }
end

local exts = { "*.gif", "*.ico", "*.jpeg", "*.jpg", "*.png", "*.svg", "*.tiff", "*.webp", "*.bmp" }

return {
  "3rd/image.nvim",
  version = false,
  event = "BufReadPre " .. table.concat(exts, ","),
  init = function()
    local luarocks_base = vim.fn.fnamemodify("~/.luarocks/share/lua/5.1", ":p:h") -- change this based on ur OS
    if not string.find(package.path, "luarocks") then
      package.path = string.format([[%s;%s/?/init.lua;%s/?.lua]], package.path, luarocks_base, luarocks_base)
    end
  end,
  opts = {
    backend = "kitty",
    integrations = {
      markdown = image_ft_options({ "markdown", "vimwiki" }),
      neorg = image_ft_options({ "norg" }),
    },
    tmux_show_only_in_active_window = true,
    hijack_file_patterns = exts,
  },
}

--return {
--  "3rd/image.nvim",
--  config = function()
--    require("image").setup({
--      backend = "kitty",
--      integrations = {
--        markdown = {
--          enabled = true,
--          clear_in_insert_mode = false,
--          download_remote_images = true,
--          only_render_image_at_cursor = false,
--          filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--        },
--        neorg = {
--          enabled = true,
--          clear_in_insert_mode = false,
--          download_remote_images = true,
--          only_render_image_at_cursor = false,
--          filetypes = { "norg" },
--        },
--      },
--      max_width = nil,
--      max_height = nil,
--      max_width_window_percentage = nil,
--      max_height_window_percentage = 50,
--      window_overlap_clear_enabled = false,                                     -- toggles images when windows are overlapped
--      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
--      editor_only_render_when_focused = false,                                  -- auto show/hide images when the editor gains/looses focus
--      tmux_show_only_in_active_window = false,                                  -- auto show/hide images in the correct Tmux window (needs visual-activity off)
--      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
--    })
--  end
--}
