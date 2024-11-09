local wezterm = require 'wezterm'
local act = wezterm.action
local action_callback = wezterm.action_callback
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end
-- config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Dracula'
config.default_domain = 'WSL:Ubuntu-22.04'
-- config.enable_csi_u_key_encoding = false
config.freetype_load_flags = 'NO_HINTING'
config.initial_cols = 175
config.initial_rows = 45
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_max_width = 20
config.switch_to_last_active_tab_when_closing_tab = true
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 5000
config.default_workspace = "main"
-- Dim inactive panes
config.inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5
}
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 0,
}
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.colors = {
    tab_bar = {
        background = "rgba(0, 0, 0, 0.2)",
        active_tab = {
            bg_color = "rgba(0, 0, 0, 0.4)",
            fg_color = "#c0c0c0",
        },
        inactive_tab = {
            bg_color = "rgba(0, 0, 0, 0.1)",
            fg_color = "#808080",
        },
    }
    -- almost transparent active and inactive tabs
}
-- config.background = {
--     {
--         source = {
--             File = 'C:\\Users\\Jan\\.config\\wezterm\\nature-bg.png',
--         },
--         width = "Cover",
--         height = "Cover",
--         hsb = {
--             brightness = 0.005,
--             saturation = 0,
--             hue = 0.0,
--         },
--         opacity=0.9,
--     },
--     {
--         source = {
--             Color = "#282c35",
--         },
--         width = "100%",
--         height = "100%",
--         opacity = 0.55,
--     }
-- }
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
-- multiplexer keybindings viable for neovim
-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    print(pane:get_user_vars())
    return pane:get_user_vars().IS_NVIM == 'true'
end
local function find_vim_pane(tab)
    for _, pane in ipairs(tab:panes()) do
        if is_vim(pane) then
            return pane
        end
    end
end
local direction_keys = {
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
}
local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == 'resize' and 'META' or 'CTRL',
        action = action_callback(function(win, pane)
            if is_vim(pane) then
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
                }, pane)
            else
                if resize_or_move == 'resize' then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end
config.keys = {
    -- {
    --     key = "w",
    --     mods = "CTRL",
    --     action = act.ActivateKeyTable {
    --         name = 'window',
    --         one_shot = false,
    --     },
    -- },
    { key = "v", mods = "LEADER", action = act { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "s", mods = "LEADER", action = act { SplitVertical = { domain = "CurrentPaneDomain" } } },
    --close all other
    {
        key = 'o',
        mods = 'LEADER',
        action = action_callback(function(win, pane)
            local tab = win:active_tab()
            for _, p in ipairs(tab:panes()) do
                if p:pane_id() ~= pane:pane_id() then
                    p:activate()
                    win:perform_action(act.CloseCurrentPane { confirm = false }, p)
                end
            end
        end),
    },
    { key = "q", mods = "LEADER", action = act { CloseCurrentPane = { confirm = false } } },
    { key = "h", mods = "LEADER", action = act { ActivatePaneDirection = "Left" } },
    { key = "j", mods = "LEADER", action = act { ActivatePaneDirection = "Down" } },
    { key = "k", mods = "LEADER", action = act { ActivatePaneDirection = "Up" } },
    { key = "l", mods = "LEADER", action = act { ActivatePaneDirection = "Right" } },
    { key = "w", mods = "LEADER", action = act { ActivatePaneDirection = "Next" } },
    { key = "H", mods = "LEADER", action = act { AdjustPaneSize = { "Left", 1 } } },
    { key = "J", mods = "LEADER", action = act { AdjustPaneSize = { "Down", 1 } } },
    { key = "K", mods = "LEADER", action = act { AdjustPaneSize = { "Up", 1 } } },
    { key = "L", mods = "LEADER", action = act { AdjustPaneSize = { "Right", 1 } } },
    --fullscreen
    { key = "f", mods = "LEADER", action = act.TogglePaneZoomState },
    -- move pane to new tab
    {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action_callback(function(win, pane)
            local tab, window = pane:move_to_new_tab()
            tab:activate()
        end),
    },
    { key = "ü", mods = "LEADER", action = act.SpawnWindow },
    {
        key = 'c',
        mods = 'LEADER',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'F2',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(
                function(window, pane, line)
                    if line then
                        window:active_tab():set_title(line)
                    end
                end
            ),
        },
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = act.ShowTabNavigator,
    },
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(1),
    },
    {
        key = 'N',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    { key = "1", mods = "LEADER", action = act { ActivateTab = 0 } },
    { key = "2", mods = "LEADER", action = act { ActivateTab = 1 } },
    { key = "3", mods = "LEADER", action = act { ActivateTab = 2 } },
    { key = "4", mods = "LEADER", action = act { ActivateTab = 3 } },
    -- resize panes
    split_nav('resize', 'h'),
    split_nav('resize', 'j'),
    split_nav('resize', 'k'),
    split_nav('resize', 'l'),
    {
        key = "b",
        mods = "CTRL",
        action = wezterm.action_callback(function(window, pane)
            local tab = window:active_tab()
            -- Open pane below if current pane is vim
            if is_vim(pane) then
                if (#tab:panes()) == 1 then
                    -- Open pane below if when there is only one pane and it is vim
                    pane:split({ direction = "Bottom" })
                else
                    -- Send `CTRL-; to vim`, navigate to bottom pane from vim
                    -- window:perform_action({
                    --     SendKey = { key = "j", mods = "CTRL" },
                    -- }, pane)
                    window:perform_action({ ActivatePaneDirection = "Down" }, pane)
                end
                return
            end
            -- Zoom to vim pane if it exists
            local vim_pane = find_vim_pane(tab)
            if vim_pane then
                vim_pane:activate()
                tab:set_zoomed(true)
            end
        end),
    },
}
-- config.key_tables = {
--     window = {
--         split_nav('move', 'h'),
--         split_nav('move', 'j'),
--         split_nav('move', 'k'),
--         split_nav('move', 'l'),
--         -- all other keys passthrouh to neovim program outside of we
--         
--         
--     }
-- }
config.ssh_domains = {
    {
        name = "wsl",
        remote_address = "127.0.0.1",
        username = "jan",
    }
}
wezterm.on('update-status', function(window, pane)
    local meta = pane:get_metadata() or {}
    if meta.is_tardy then
        local secs = meta.since_last_response_ms / 1000.0
        window:set_right_status(string.format('tardy: %5.1fs⏳', secs))
    end
end)
return config
