{ config, pkgs, ... }:

{
  programs.nixvim = {
	globals = {
    	mapleader = " ";
     	maplocalleader = " ";
    };
	
	keymaps = [
		# Window navigation keymaps
		{
		  mode = "n"; # Normal mode
		  key = "<C-Up>"; # Ctrl + Up Arrow
		  action = "<C-w>k"; # Move to window above
		  options.desc = "Move To Window Up";
		}

		{
		  mode = "n";
		  key = "<C-Down>";
		  action = "<C-w>j"; # Move to window below
		  options.desc = "Move To Window Down";
		}

		{
		  mode = "n";
		  key = "<C-Left>";
		  action = "<C-w>h"; # Move to window left
		  options.desc = "Move To Window Left";
		}

		{
		  mode = "n";
		  key = "<C-Right>";
		  action = "<C-w>l"; # Move to window right
		  options.desc = "Move To Window Right";
		}

		# Window management keymaps
		{
		  mode = "n";
		  key = "<leader>wd";
		  action = "<C-W>c"; # Close current window
		  options = {
			silent = true;
			desc = "Delete window";
		  };
		}

		{
		  mode = "n";
		  key = "<leader>-";
		  action = "<C-W>s"; # Split window below (horizontal split)
		  options = {
			silent = true;
			desc = "Split window below";
		  };
		}

		{
		  mode = "n";
		  key = "<leader>|";
		  action = "<C-W>v"; # Split window to the right (vertical split)
		  options = {
			silent = true;
			desc = "Split window right";
		  };
		}

		# File save keymap
		{
		  mode = "n";
		  key = "<C-s>";
		  action = "<cmd>w<cr><esc>"; # Save file
		  options = {
			silent = true;
			desc = "Save file";
		  };
		}

		# Quit all sessions
		{
		  mode = "n";
		  key = "<leader>qq";
		  action = "<cmd>quitall<cr><esc>"; # Quit all open buffers and exit
		  options = {
			silent = true;
			desc = "Quit all";
		  };
		}

		# Toggle line numbers
		{
		  mode = "n";
		  key = "<leader>ul";
		  action = ":lua ToggleLineNumber()<cr>";
		  options = {
			silent = true;
			desc = "Toggle Line Numbers";
		  };
		}

		{
		  mode = "n";
		  key = "<leader>uL";
		  action = ":lua ToggleRelativeLineNumber()<cr>";
		  options = {
			silent = true;
			desc = "Toggle Relative Line Numbers";
		  };
		}

		{
		  mode = "n";
		  key = "<leader>uw";
		  action = ":lua ToggleWrap()<cr>"; # Toggle line wrapping
		  options = {
			silent = true;
			desc = "Toggle Line Wrap";
		  };
		}

		# Move lines up/down
		{
		  mode = "n";
		  key = "<A-Up>";
		  action = "<cmd>m .-2<cr>=="; # Move current line up
		  options.desc = "Move line up";
		}

		{
		  mode = "v";
		  key = "<A-Up>";
		  action = ":m '<-2<cr>gv=gv"; # Move selected lines up
		  options.desc = "Move line up";
		}

		{
		  mode = "n";
		  key = "<A-Down>";
		  action = "<cmd>m .+1<cr>=="; # Move current line down
		  options.desc = "Move line down";
		}

		{
		  mode = "v";
		  key = "<A-Down>";
		  action = ":m '>+1<cr>gv=gv"; # Move selected lines down
		  options.desc = "Move line Down";
		}

		# Better indenting in visual mode
		{
		  mode = "v";
		  key = "<";
		  action = "<gv"; # Shift left and keep selection
		}

		{
		  mode = "v";
		  key = ">";
		  action = ">gv"; # Shift right and keep selection
		}

		# Select all lines in insert mode
		{
		  mode = "i";
		  key = "<C-a>";
		  action = "<cmd> norm! ggVG<cr>"; # Select entire buffer
		  options.desc = "Select all lines in buffer";
		}
	  ];

	  # Custom Lua functions
	  extraConfigLua = ''
		function ToggleLineNumber()
		  if vim.wo.number then
			vim.wo.number = false
		  else
			vim.wo.number = true
			vim.wo.relativenumber = false
		  end
		end

		function ToggleRelativeLineNumber()
		  if vim.wo.relativenumber then
			vim.wo.relativenumber = false
		  else
			vim.wo.relativenumber = true
			vim.wo.number = false
		  end
		end

		function ToggleWrap()
		  vim.wo.wrap = not vim.wo.wrap
		end

		if vim.lsp.inlay_hint then
		  vim.keymap.set('n', '<leader>uh', function()
			vim.lsp.inlay_hint(0, nil)
		  end, { desc = 'Toggle Inlay Hints' })
		end
	  '';
	  };
}
