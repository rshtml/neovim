# rshtml.nvim

This plugin provides official language support for the [RsHtml](https://github.com/rshtml/rshtml) templating engine in Neovim.

## Prerequisites

-   Neovim (v11.3+)

## Installation

**Language Server Management:** This extension requires the `rshtml-analyzer` language server to provide language features. The extension handles this for you automatically:
If you have `rshtml-analyzer` already installed and available in your system's `PATH`, the extension will use     your existing version. This is ideal for users who prefer to manage their own toolchains.
The server can be downloaded from the [releases](https://github.com/rshtml/rshtml-analyzer/releases) page or use the command below:

```sh
cargo install --git https://github.com/rshtml/rshtml-analyzer.git --tag v0.1.7
```
*Note: The tag can be updated according to the version.*
    
If the server is not found in your `PATH`, the extension will seamlessly download and manage the latest compatible version for your operating system in the background. This provides a zero-configuration experience.


**Lazy:**

```lua
{
  "rshtml/neovim",
  name = "rshtml",

  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
}
```


---


**Enjoy working with RsHtml!**
