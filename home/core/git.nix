{
  programs = {
    git = {
      enable = true;

      userName = "Miles Conn";
      userEmail = "milesjconn@gmail.com";

      extraConfig = {
        merge.conflictstyle = "zdiff3";
      };
    };
  };
}
