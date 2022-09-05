local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
    cli_options = {
        config_precedence = 'file-override'
    },
	bin = 'prettierd',
	filetypes = {
		'css',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'json',
		'scss',
		'less'
	}
}
