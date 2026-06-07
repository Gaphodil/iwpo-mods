// toggle gui
var @poss_key; @poss_key = ord("L");
if ('%keybind_open_skins_menu' != '') @poss_key = %keybind_open_skins_menu -0;
if (keyboard_check_pressed(@poss_key)) {
    if (!@init)
        @init = @poss_InitSkinMod();
    if (@init)
        @show_selector = !@show_selector;
}

// cycle with ctrl+arrows
if (@show_selector and keyboard_check(vk_control)) {
    var diff; diff = 0;
    if (keyboard_check_pressed(vk_up)) diff = -1;
    if (keyboard_check_pressed(vk_down)) diff = 1;
    if (@skin_count > 9) {
        if (keyboard_check_pressed(vk_left)) diff = -5;
        if (keyboard_check_pressed(vk_right)) diff = 5;
    }
    @selector_index = (@selector_index + diff + @skin_count) mod @skin_count;
    if (diff != 0) {
        @poss_ReplaceSprites();
    }
}

// update sprite every frame in pre-WorldEndStep for sending online
//if (@init) @poss_UpdatePlayerSprite();
