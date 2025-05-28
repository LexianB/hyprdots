return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
      { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
      { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

      { "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
      {
        "<Leader>A",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword in previous area",
      },

      {
        "<Leader>d",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and jump to next cword",
      },
      { "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

      { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
    },
  },

  {
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {
        picker = {
          sources = {
            explorer = {
              on_show = function(picker)
                local show = false
                local gap = 1
                local min_width, max_width = 20, 100
                --
                local rel = picker.layout.root
                local update = function(win) ---@param win snacks.win
                  win.opts.row = vim.api.nvim_win_get_position(rel.win)[1]
                  win.opts.col = vim.api.nvim_win_get_width(rel.win) + gap
                  win.opts.height = 0.8
                  local border = win:border_size().left + win:border_size().right
                  win.opts.width = math.max(min_width, math.min(max_width, vim.o.columns - border - win.opts.col))
                  win:update()
                end
                local preview_win = Snacks.win.new({
                  relative = "editor",
                  external = false,
                  focusable = false,
                  border = "rounded",
                  backdrop = false,
                  show = show,
                  bo = {
                    filetype = "snacks_float_preview",
                    buftype = "nofile",
                    buflisted = false,
                    swapfile = false,
                    undofile = false,
                  },
                  on_win = function(win)
                    update(win)
                    picker:show_preview()
                  end,
                })
                rel:on("WinResized", function()
                  update(preview_win)
                end)
                picker.preview.win = preview_win
                picker.main = preview_win.win
              end,
              on_close = function(picker)
                picker.preview.win:close()
              end,
              layout = {
                -- preivew = 'main',
                layout = {
                  backdrop = false,
                  width = 40,
                  min_width = 40,
                  height = 0,
                  position = "left",
                  border = "none",
                  box = "vertical",
                  {
                    win = "input",
                    height = 1,
                    border = "rounded",
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                  },
                  { win = "list", border = "none" },
                  -- { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
                },
              },
              actions = {
                -- `<A-p>`
                toggle_preview = function(picker) --[[Override]]
                  picker.preview.win:toggle()
                end,
              },
            },
          },
        },
      },
    },
  },
}
