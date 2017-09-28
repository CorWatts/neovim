# neovim config  

`brew install neovim python3`  
`ln -s /usr/local/bin/nvim /usr/local/bin/vi`  
`git clone https://github.com/CorWatts/neovim.git ~/Repos/neovim`  
`mkdir -p ~/.config/' `
`ln -s Repos/neovim/nvim ~/.config/nvim`  
`ln -s Repos/neovim/tern-config .tern-config`  
`pip3 install --user neovim`

Open up neovim with the `vi` symlink and type `:PlugInstall`  