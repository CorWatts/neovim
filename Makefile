all: dependencies symlinks

dependencies:
	brew install neovim python3
	pip3 install --user neovim

symlinks:
	mkdir -pv $(HOME)/.config
	ln -sf $(CURDIR)/nvim $(HOME)/.config
	ln -sf $(CURDIR)/tern-config $(HOME)/.tern-config
	ln -s `brew --prefix`/bin/nvim /usr/local/bin/vi

clean:
	rm -rf /usr/local/bin/vi $(HOME)/.config/nvim $(HOME)/.tern-config
