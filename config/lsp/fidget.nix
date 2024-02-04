{
  plugins.fidget = {
    enable = false;
    progress = {
      suppressOnInsert = true;
    };
    logger = {
      level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
    };
    notification = {
      filter = "trace"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
      overrideVimNotify = true;
      window = {
        winblend = 0;
        relative = "editor";
        normalHl = "Comment";
        border = "none"; # none, single, double, rounded, solid, shadow
        borderHl = "";
      };
    };
  };
}
