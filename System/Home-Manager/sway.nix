{ ... }:

{
  services.swaync = { 
    enable = true;
    settings = {
      schema = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control_center_layer = "top";
      layer_shell = true;
      cssPriority = "application";
      control_center_margin_top = 0;
      control_center_margin_bottom = 0;
      control_center_margin_right = 0;
      control_center_margin_left = 0;
      notification_2fa_action = true;
      notification_inline_replies = false;
      notification_icon_size = 64;
      notification_body_image_height = 100;
      notification_body_image_width = 200;
      timeout = 10;
      timeout_low = 5;
      timeout_critical = 0;
      fit_to_screen = true;
      relative_timestamps = true;
      control_center_width = 500;
      control_center_height = 600;
      notification_window_width = 500;
      keyboard_shortcuts = true;
      image_visibility = "when-available";
      transition_time = 200;
      hide_on_clear = false;
      hide_on_action = true;
      script_fail_notify = true;
      scripts = {
        example_script = {
          exec = "echo 'Do something...'";
          urgency = "Normal";
        };
        example_action_script = {
          exec = "echo 'Do something actionable!'";
          urgency = "Normal";
          run_on = "action";
        };
      };
      notification_visibility = {
        example_name = {
          state = "muted";
          urgency = "Low";
          app_name = "Spotify";
        };
      };
      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "notifications"
        "mpris"
      ];
      widget_config = {
        inhibitors = {
          text = "Inhibitors";
          button_text = "Clear All";
          clear_all_button = true;
        };
        title = {
          text = "Notifications";
          clear_all_button = true;
          button_text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max_lines = 5;
          text = "Label Text";
        };
        mpris = {
          image_size = 96;
          image_radius = 12;
        };
        buttons_grid = {
          actions = [
            {
              label = "直";
              type = "toggle";
              active = true;
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && nmcli radio wifi on || nmcli radio wifi off'";
              update_command = "sh -c '[[ $(nmcli radio wifi) == \"enabled\" ]] && echo true || echo false'";
            }
          ];
        };
      };
    };
  };
}

