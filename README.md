# rshtml.nvim

Language support for RsHtml in Neovim. This plugin provides Language Server Protocol (LSP) support for `.rs.html` files.

## Prerequisites

-   Neovim (v11.3+)
-   [rshtml-analyzer](https://github.com/rshtml/rshtml-analyzer) must be installed.
      It can be downloaded from the [releases](https://github.com/rshtml/rshtml-analyzer/releases) page or use the command below:

    ```sh
    cargo install --git https://github.com/rshtml/rshtml-analyzer.git --tag v0.1.5
    ```

## Installation

Lazy:

```lua
{
  "rshtml/neovim",
  name = "rshtml",
}
```


---


**Enjoy working with RsHtml!**
