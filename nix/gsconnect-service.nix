{pkgs, ...}: {
  systemd.user.services = {
    gsconnect = {
      Unit = {
        Description = "GSConnect CLI";
        Documentation = "https://github.com/GSConnect/gnome-shell-extension-gsconnect/wiki/CLI-usage-without-Gnome-environment";
        PartOf = "graphical-session.target";
        After = "graphical-session.target";
        Requisite = "graphical-session.target";
      };
      Service = {
        ExecStart = "${pkgs.gnomeExtensions.gsconnect}/share/gnome-shell/extensions/gsconnect@andyholmes.github.io/service/daemon.js";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = "graphical-session.target";
      };
    };
  };
}
