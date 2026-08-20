-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Side-by-side review of any git revision, with LSP live in both panes
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff working tree' },
      { '<leader>gD', '<cmd>DiffviewOpen origin/HEAD...HEAD<cr>', desc = '[G]it [D]iff vs origin' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [H]istory of this file' },
      { '<leader>gq', '<cmd>DiffviewClose<cr>', desc = '[G]it [Q]uit diff view' },
    },
    opts = function()
      local actions = require 'diffview.actions'

      -- Scroll the diff windows without leaving the file tree, using the same
      -- keys lazygit uses for its main panel: J/K, <c-d>/<c-u>, page keys.
      local scroll_from_panel = {
        { 'n', 'J', actions.scroll_view(0.25), { desc = 'Scroll the diff down' } },
        { 'n', 'K', actions.scroll_view(-0.25), { desc = 'Scroll the diff up' } },
        { 'n', '<c-d>', actions.scroll_view(0.5), { desc = 'Scroll the diff down half a screen' } },
        { 'n', '<c-u>', actions.scroll_view(-0.5), { desc = 'Scroll the diff up half a screen' } },
        { 'n', '<pagedown>', actions.scroll_view(0.5), { desc = 'Scroll the diff down half a screen' } },
        { 'n', '<pageup>', actions.scroll_view(-0.5), { desc = 'Scroll the diff up half a screen' } },
      }

      return {
        enhanced_diff_hl = true,
        view = {
          merge_tool = { layout = 'diff3_mixed' },
        },
        keymaps = {
          file_panel = scroll_from_panel,
          file_history_panel = scroll_from_panel,
        },
      }
    end,
  },
}
