# NVIM配置方案

通过配置nvim获得更优质的编程体验

## 文件结构

![image-20220831154030391](https://huanyushi-1301536144.cos.ap-nanjing.myqcloud.com/uPic/image-20220831154030391.png)

- init.lua：入口文件

- basic.lua： 基础配置，是对默认配置的一个重置。

- colorscheme.lua： 我们安装的主题皮肤配置，在这里切换主题。
- keybindings.lua： 快捷键的设置，所有插件的快捷键也都会放在这里。
- plugins.lua： 插件安装管理，插件安装或卸载全在这里设置。
- lsp 文件夹： 是对 Neovim 内置 LSP 功能的配置，包括常见编程语言与语法提示等。
- config ： 文件夹包含各种语言服务器单独的配置文件。
- setup.lua ： 内置 LSP 的配置。
- cmp.lua ： 语法自动补全补全的配置，包括各种补全源，与自定义代码段。
- ui.lua： 对内置 LSP 功能增强和 UI 美化。
- plugin-config 文件夹： 是对第三方插件的配置，未来每添加一个插件，这里就多一个配置文件。

## 安装

### 安装nvim
```
brew install neovim 
```
### 安装字体 Nerd fonts
从 https://www.nerdfonts.com/font-downloads 下载喜欢的字体并配置字体到终端

### 添加配置到本地
```bash
git clone git@github.com:Jasonw372/my-lua-nvim.git ~/.config/nvim/
```
### 安装配置中的插件
nvim中输入`:PackerSync`
> 有能力建议科学上网，虽然已经换源，但是难免出现异常，可以多试几次

### 安装自己需要的LSP补全

运行 `:LspInstallInfo`，j / k 移动光标， 选中之后按 i 即可安装。大写的 X 是卸载。

默认使用，并且自动安装，在`lua/lsp/setup.lua`中配置

![image-20220831153027414](https://huanyushi-1301536144.cos.ap-nanjing.myqcloud.com/uPic/image-20220831153027414.png)

### 安装语法高亮
```
:TSInstall css scss json html vue javascript typescript
```
默认在`lua/plugin-config/nvim-treesitter.lua`中安装

```lua
treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
```
可以运行`TSInstallInfo`查看所有的代码高亮
### 添加代码格式化
默认在保存是自动格式化

在代码界面使用`:NullLsInfo`可以查看支持的代码格式化内容，添加到`lua/lsp/null-ls.lua`即可完成格式化，默认添加了rust、python等

```lua
  sources = {
    -- Formatting ---------------------
    --  brew install shfmt
    -- python format
    formatting.autopep8,
    -- rust format
    formatting.rustfmt,
```

### 快捷按键

在`lua/keybindings.lua`中配置了全部的快捷按键，例如：

- 左侧文件浏览器

  `Alt+m`打开关闭文件夹

  `o` 来打开关闭文件夹，`a` 添加一个文件，`d` 删除文件等等。

- Telescope

  `Ctrl+p`查找文件

  `Ctrl+f`全局搜索
