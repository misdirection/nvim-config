return {
  'folke/todo-comments.nvim', --colors TODO: commtents like that
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  },
}

--PERF: fully optimized
--HACK: oh boi
--TODO: will never be done
--NOTE: so true
--FIX: bug 9001
--WARN: care
