{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
    };

    autosuggestion = {
      enable = true;
      strategy = ["history"];
    };

    history = {
      append = true;
      ignoreAllDups = true;
      save = 10000;
      size = 10000;
      share = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
    '';
  };
}
