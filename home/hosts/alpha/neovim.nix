{
    programs.nvf = {
        enable = true;
        settings = {
            statusline.lualine.enable = true;
            telescope.enable = true;
            navigation.harpoon.enable = true;
            visuals.rainbow-delimiters.enable = true;
            utility.undotree.enable = true;
            autocomplete.nvim-cmp.enable = true;
            laguages = {
                enableTreesitter = true;

                nix.lsp.enable = true;
                python.lsp.enable = true;
                ts.lsp.enable = true;
                rust.lsp.enable = true;
                clang.lsp.enable = true;
                java.lsp.enable = true;
            };
            formatter.conform-nvim.enable = true;
        };
    }
}
