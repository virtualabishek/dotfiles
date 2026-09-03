 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#18192a',
    base02 = '#202135',
    base03 = '#646883',
    base04 = '#a3b4eb',
    base05 = '#cdd6f4',
    base06 = '#cdd6f4',
    base07 = '#cdd6f4',
    base08 = '#f38ba8',
    base09 = '#94e2d5',
    base0A = '#fab387',
    base0B = '#cba6f7',
    base0C = '#96e9db',
    base0D = '#bb8af4',
    base0E = '#fab185',
    base0F = '#fcd0b6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#cdd6f4',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#646883',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#cdd6f4',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#646883',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#cba6f7',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#a3b4eb',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#cba6f7' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#fab387' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#94e2d5' })
  hi('TelescopeSelection',      { fg = '#cdd6f4',          bg = '#202135' })
  hi('TelescopeSelectionCaret', { fg = '#cba6f7',             bg = '#202135' })
  hi('TelescopeMatching',       { fg = '#cba6f7',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
