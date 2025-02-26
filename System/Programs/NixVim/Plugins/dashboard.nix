# System/Programs/NixVim/Plugins/dashboard.nix

{ ... }:

{
  plugins.dashboard = {
    enable = true;
    settings = {
      theme = "doom";
      config = {
        header = [
          ""
          ""
          ""
          ""
          "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
          "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
          "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
          "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
          "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
          "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ""
          ""
        ];
        center = [
          { 
            action = "enew";
            icon = "  ";
            desc = "New file";
            key = "n";
            key_format = " %s";
          }
          {
            action = "Telescope oldfiles";
            icon = "󰌑  ";
            desc = "Reopen recent file";
            key = " r";
            key_format = " %s";
          }
          {
            action = "Telescope find_files";
            icon = "  ";
            desc = "Find file";
            key = "f";
            key_format = " %s";
          }
          {
            action = "Telescope fd";
            icon = "  ";
            desc = "File Browser";
            key = "b";
            key_format = " %s";
          }
          {
            action = "Telescope live_grep";
            icon = "  ";
            desc = "Find word";
            key = "g";
            key_format = " %s";
          }
        ];
        footer = [
          "⠀⠀⠀⠀⠀⠀⠀⣀⠤⠤⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣄⡄⣄⣀⠀⠀⠀⠀ "
          "⠀⠀⠀⠀⢠⡶⠛⠈⠉⠃⠛⢚⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⢖⡋⠯⠃⠅⠟⣅⡙⢦⡄⠀⠀"
          "⠀⠀⠀⡈⡕⠁⠀⠀⠀⠀⠀⠀⠈⣛⡷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠁⠀⠀⠀⠀⠀⠈⠋⢕⡹⣷⡀"
          "⠀⠀⢢⡷⠁⠀⠀⠀⠀⠀⠀⠀⠀⣂⢸⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣋⢽⡇"
          "⠀⠐⣪⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⢒⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡃⣿⡇"
          "⠀⣉⣞⡁⠀⠀⠀⠀⠀⠀⠀⠀⢀⠂⡓⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⠀⣳⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢁⣿⠁"
          " ⣒⢚⡆⠀⠀⠀⠀⠀⠀⠀⠀⠄⡊⣈⠾⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⣟⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢂⡖⡋⠀"
          "⠀⠀⢧⡧⠀⠀⠀⠀⠀⠀⠀⡀⠢⡐⡂⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠃⠀⠺⣇⢃⠀⠀⠀⠀⠀⠀⠀⠀⣔⣍⣞⠋⠀⠀"
          "⠀⠀⢑⠻⣗⣆⡀⡀⡀⠄⡂⡆⠧⠏⠀⠀⣻⡇⠀⠀⠀⡾⣇⠀⠀⢠⡿⠀⠀⠀⠛⣷⣷⣒⣀⠀⠀⣀⠤⢊⡥⠊⠀⠀⠀⠀"
          "⠀⠀⠀⠑⣯⣳⡞⣍⢟⠍⢊⠙⠁⠀⠀⠀⠘⣿⣧⣤⠞⠁⠙⢷⣶⡿⠃⠀⠀⠀⠀⠈⠛⠓⠓⠛⠛⠓⠉⠁⠀⠀⠀⠀⠀⠀"
          "⠀⠀⠀⠀⠀⠁⠁⠉⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ "
        ];
      };
    };
  };
}
