# neovim config  

Install and set up everything by running `make`


`make dependencies` installs the dependencies via Homebrew  
`make symlinks` sets up the necessary symlinks  
`make clean` removes the symlinks  

Once that's done, open up neovim with `vi` and type `:PlugInstall` to get the plugins.

## typescript

https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c


npm i -g typescript
OR
brew install typescript

npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

