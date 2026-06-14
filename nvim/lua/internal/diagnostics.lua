vim.diagnostic.config {
  underline = true,
  virtual_lines = false,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    current_line = true,
    source = 'if_many',
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
    focusable = false,
    style = 'minimal',
  },
}
