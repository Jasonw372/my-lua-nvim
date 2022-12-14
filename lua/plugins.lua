local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        -- 你的插件列表...
        -- onenord
        use 'rmehri01/onenord.nvim'
        -- nvim-tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        -- lualine
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- telescope
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- telescope extensions
        use "LinArcX/telescope-env.nvim"
        -- dashboard-nvim
        use("glepnir/dashboard-nvim")
        -- project
        use("ahmedkhalf/project.nvim")
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        --------------------- LSP --------------------
        use("williamboman/nvim-lsp-installer")
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- nvim-autopairs
        use("windwp/nvim-autopairs")
        -- copilot
        use("github/copilot.vim")
        use { "zbirenbaum/copilot.lua" }

        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
        use {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
            config = function ()
              require("copilot_cmp").setup()
            end
          }
        use("onsails/lspkind-nvim")
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")

        use("simrat39/rust-tools.nvim")
        use("b0o/schemastore.nvim")
        use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

        

        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        use('vimlab/split-term.vim')
        use {"akinsho/toggleterm.nvim", tag = 'v2.*'}

    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
