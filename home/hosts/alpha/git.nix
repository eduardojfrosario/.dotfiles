{
  programs.git = {
    enable    = true;
    userName  = "eduardojfrosario";
    userEmail = "eduardojfrosario@gmail.com";
    
    extraConfig = {
      init.defaultBranch   = "main";
      pull.rebase          = false;
      diff.external        = "difft";
    };
  };
}
