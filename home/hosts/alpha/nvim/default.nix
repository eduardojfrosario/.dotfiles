{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # lsp
        lsp.enable = true;
        snippets.luasnip.enable = true;
        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;

        # navigation
        telescope.enable = true;
        navigation.harpoon.enable = true;

        # utils
        utility.undotree.enable = true;
        autopairs.nvim-autopairs.enable = true;

        visuals = {
          rainbow-delimiters.enable = true;
          nvim-cursorline = {
            enable = true;
            setupOpts.cursorline.enable = true;
          };
        };

        # ddiagnostics
        diagnostics.enable = true;
        diagnostics.config = {
          virtual_text = true;
          signs.text = lib.generators.mkLuaInline ''
            {
              [vim.diagnostic.severity.ERROR] = "󰅚 ",
              [vim.diagnostic.severity.WARN] = "󰀪 ",
            }
          '';
          underline = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;
          ts.enable = true;
          rust.enable = true;
          clang.enable = true;
          markdown.enable = true;
        };

        formatter.conform-nvim = {
          enable = true;
          setupOpts.formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixpkgs-fmt" ];
            c = [ "clang-format" ];
            python = [ "black" ];
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            html = [ "prettierd" ];
          };
        };

        extraLuaFiles = [
          ./remap.lua
          ./set.lua
        ];

        extraPlugins = with pkgs.vimPlugins; {
          markdown-preview = {
            package = markdown-preview-nvim;
            setup = ''
              vim.g.mkdp_filetypes = { "markdown" }
            '';
          };
        };
      };
    };
  };
  home.packages = with pkgs; [
    stylua
    black
    clang-tools
    prettierd
    nixpkgs-fmt
  ];

}
