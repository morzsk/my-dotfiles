{ config, pkgs, ... }:

{
  programs.nixvim = {
    # Define diagnostic signs for errors, warnings, hints, and info
    extraConfigLuaPre = ''
      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

    clipboard = {
		register = "unnamedplus"; # Use system clipboard
		providers.wl-copy.enable = true; # Use wayland clipboard support 
    };

    opts = {
		virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode
		cursorline = true; # Highlight the line where the cursor is located
		cmdheight = 2; # more space in the neovim command line for displaying messages
		showmode = false; # Dont show the editor mode in status line

		# Line number
		number = true; # Show absolute line numbers
      	relativenumber = true; # Show line numbers relative to the cursor line
		
		# Tab options
		tabstop = 4; # Number of spaces a <Tab> counts for
      	softtabstop = 4; # Number of spaces for editing <Tab>
      	shiftwidth = 4; # Indent width

		# Indent
      	wrap = true; # Enable line wrapping
	 	autoindent = true;	
      	smartindent = true; # Smart auto-indentation
      	breakindent = true;  # Keep indentation on wrapped lines

		# Backups
		swapfile = false; # Disable swap file
      	backup = false; # Disable backup file
    	undofile = true; # Enable persistent undo

		# Search
      	hlsearch = true; # Highlight all search matches
      	incsearch = true; # Show matches as you type
	    ignorecase = true; # Case-insensitive search...
     	smartcase = true; # ...unless search contains capital letters
	
		updatetime = 100; # Faster completion Line numbers
    };
  };
}
