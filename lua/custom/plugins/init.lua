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
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = { layout = 'diff3_mixed' },
      },
    },
  },
}
