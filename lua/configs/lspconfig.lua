-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "eslint","ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)}
  }
  vim.lsp.buf.execute_command(params)
end

-- configuring single server, example: typescript
 lspconfig.ts_ls.setup {
   on_attach = nvlsp.on_attach,
   on_init = nvlsp.on_init,
   capabilities = nvlsp.capabilities,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize imports"
    }
  }
}

