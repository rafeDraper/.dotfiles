return {
  cmd = { "golangci-lint-langserver" },
  filetypes = {"go", "gomod"},
  command = {
    "golangci-lint",
    "run",
    "--out-format",
    "json"
  }
}
