let
  config = import ./config.nix;
in
{
  panel-element-positions = 
    ''
    {
      "0": [
        {"element": "centerBox", "visible": true, "position": "stackedTL"},
        {"element": "showAppsButton", "visible": true, "position": "stackedTL"},
        {"element": "activitiesButton", "visible": true, "position": "stackedTL"},
        {"element": "leftBox", "visible": true, "position": "stackedTL"},
        {"element": "taskbar", "visible": true, "position": "centerMonitor"},
        {"element": "rightBox", "visible": true, "position": "stackedBR"},
        {"element": "dateMenu", "visible": true, "position": "stackedBR"},
        {"element": "systemMenu", "visible": true, "position": "stackedBR"},
        {"element": "desktopButton", "visible": true, "position": "stackedBR"}
      ]
    }
    '';
  panel-anchors = 
    ''
    {
      "0" : "middle"
    }
    '';
  appicon-style = "SYMBOLIC";
  appicon-margin = 4;
  appicon-padding = 14;
  animate-appicon-hover = true;
  animate-appicon-hover-animation-convexity = 
    ''
    {
      "RIPPLE": 2.0, 
      "PLANK": 1.0, 
      "SIMPLE": 0.0
    }
    '';
  animate-appicon-hover-animation-extent = 
    ''
    {
      "RIPPLE": 4, 
      "PLANK": 4, 
      "SIMPLE": 1
    }
    '';
  animate-appicon-hover-animation-travel = 
    ''
    {
      "SIMPLE": 0.05, 
      "RIPPLE": 0.4, 
      "PLANK": 0.0
    }
    '';
  animate-appicon-hover-animation-type = "SIMPLE";
}