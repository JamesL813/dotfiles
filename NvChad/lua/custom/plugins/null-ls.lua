local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
  -- general
  -- b.diagnostics.semgrep,
  
  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Python
  b.formatting.yapf,
  b.diagnostics.flake8,
  b.diagnostics.pycodestyle,
  b.diagnostics.pydocstyle,

  -- Java
  b.formatting.npm_groovy_lint,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  
  -- Rust
  b.formatting.rustfmt,

}

null_ls.setup {
  debug = true,
  sources = sources,
}