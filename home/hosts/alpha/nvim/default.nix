{ config, pkgs, inputs, ... }:
{
    imports = [
        inputs.nvf.homeManagerModules.default
    ];
    programs.nvf = {
        enable = true;
        settings = {
            vim = {
                lsp.enable = true;
                statusline.lualine.enable = true;
                telescope.enable = true;
                navigation.harpoon.enable = true;
                visuals.rainbow-delimiters.enable = true;
                utility.undotree.enable = true;
                autocomplete.nvim-cmp.enable = true;
                languages = {
                    enableTreesitter = true;

                    nix.enable = true;
                    python.enable = true;
                    ts.enable = true;
                    rust.enable = true;
                    clang.enable = true;
                    java.enable = true;
                    markdown.extensions.markview-nvim.enable = true;
                };
                formatter.conform-nvim.enable = true;
                extraLuaFiles = [
                    ./remap.lua
                    ./set.lua
                ];
            };
        };
    };
}
