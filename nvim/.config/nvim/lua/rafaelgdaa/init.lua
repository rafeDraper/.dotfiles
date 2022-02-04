require('rafaelgdaa.telescope')
require('rafaelgdaa.lsp')
require('rafaelgdaa.tree-sitter')
require('rafaelgdaa.options')

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
