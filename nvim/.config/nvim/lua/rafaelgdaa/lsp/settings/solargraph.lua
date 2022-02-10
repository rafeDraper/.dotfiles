return {
  cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    init_options = {
      formatting = true
    },
    -- root_dir = root_pattern("Gemfile", ".git"),
    settings = {
      solargraph = {
        diagnostics = true
      }
    }
}
