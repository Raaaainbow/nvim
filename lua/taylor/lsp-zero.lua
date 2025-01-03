local lsp = require('lsp-zero').preset()

-- Ensure LSP servers for Python, Java, and Bash are set up
lsp.ensure_installed({
    'pyright',  -- Python
    'jdtls',    -- Java
    'bashls',   -- Bash
})

vim.env.JDTLS_JAVA_HOME = '/usr/lib/jvm/zulu-21-openjdk' -- sets path to java installation

-- Diagnostics and key mappings
vim.diagnostic.config({
    virtual_text = true
})
lsp.on_attach(function(client, bufnr)
    local opts = {noremap = true, silent = true}
    -- Go to definition
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    
    -- Go to type definition
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    
    -- Find references
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    
    -- Rename symbol
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    
    -- Signature help
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    
    -- Formatting
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end)
lsp.setup()
