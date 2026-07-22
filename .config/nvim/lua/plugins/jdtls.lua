return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		local jdtls = require("jdtls")
		local mason_path = vim.fn.stdpath("data") .. "/mason"
		local jdtls_path = mason_path .. "/packages/jdtls"
		local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
		local config_path = jdtls_path .. "/config_linux"

		local home = os.getenv("HOME")
		local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }
		local root_dir = jdtls.setup.find_root(root_markers)
		if not root_dir then return end
		local workspace_dir = home .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

		local config = {
			cmd = {
				"java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens", "java.base/java.util=ALL-UNNAMED",
				"--add-opens", "java.base/java.lang=ALL-UNNAMED",
				"-jar", launcher_jar,
				"-configuration", config_path,
				"-data", workspace_dir,
			},
			root_dir = root_dir,
			settings = {
				java = {
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					maven = {
						downloadSources = true,
					},
					references = {
						includeDecompiledSources = true,
					},
					format = {
						enabled = true,
						settings = {
							url = "https://raw.githubusercontent.com/google/google-java-format/master/google-java-format.xml",
							profile = "GoogleStyle",
						},
					},
					eclipse = {
						downloadSources = true,
					},
				},
			},
			init_options = {
				bundles = {},
			},
		}

		local bundles = {
			vim.fn.glob(mason_path .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
		}
		config.init_options.bundles = bundles

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				jdtls.start_or_attach(config)
			end,
		})

	end,
}
