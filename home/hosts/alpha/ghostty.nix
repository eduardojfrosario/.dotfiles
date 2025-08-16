{
  programs.ghostty = {
    enable = true;

    settings = {
      window-padding-x = 5;
      window-padding-y = 5;

      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      clipboard-read = "deny";
      clipboard-paste-protection = true;

      confirm-close-surface = false;
    };
  };
}

