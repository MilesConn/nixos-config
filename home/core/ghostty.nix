{ghostty, ...}: {
  # home.packages = [pkgs.ghostty];
  home.packages = [ghostty.packages.x86_64-linux.default];
  xdg.configFile."ghostty/config".text = ''
    theme = rose-pine
    keybind = super+c=copy_to_clipboard

    keybind = super+shift+h=goto_split:left
    keybind = super+shift+j=goto_split:bottom
    keybind = super+shift+k=goto_split:top
    keybind = super+shift+l=goto_split:right

    keybind = global:super+i=toggle_quick_terminal
    quick-terminal-position = center
    quick-terminal-animation-duration = 0
  '';
}
