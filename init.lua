-- if windows then use pwsh
if vim.fn.has("win32") == 1 then
	vim.o.shell = "pwsh"
end

-- core
require("michael.core.autocmds")
require("michael.core.options")
require("michael.core.key-bindings")

require("michael.core.lazy")
require("michael.user_plugins")
