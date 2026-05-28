// not draw_gui for gm8 compat
if (@show_selector) {
    @_alpha = draw_get_alpha();
    @_color = draw_get_color();

    draw_set_font(@ftOnlinePlayerName);
    draw_set_alpha(1);
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    var xoff; xoff = 800-20;
    var yoff; yoff = 304;
    if (view_enabled) {
        xoff = view_xview[0] + view_wview[0] - 20;
        yoff = view_yview[0] + view_hview[0] div 2;
    }
    var uitext; uitext = "[SkinMod]#"
        // + chr(%keybind_open_skins_menu) + " to close#"
        + "L to close#"
        + "Ctrl + arrows to select##";
    var temp_name; temp_name = "";
    var i;
    if (@skin_count > 9) {
        for (i = -4; i <= 4; i+=1) {
            var ind; ind = (@selector_index + i + @skin_count) mod @skin_count;
            temp_name = ds_list_find_value(@skin_names, ind);
            if (ind == @selector_index) temp_name = "[" + temp_name + "]";
            uitext += temp_name + "#";
        }
        uitext += "...";
    }
    else {
        for (i = 0; i < @skin_count; i+=1) {
            var ind; ind = (@selector_index + i-(@skin_count div 2) + @skin_count) mod @skin_count;
            temp_name = ds_list_find_value(@skin_names, ind);
            if (ind == @selector_index) temp_name = "[" + temp_name + "]";
            uitext += temp_name + "#";
        }
    }
    draw_set_color(c_black);
    draw_text(xoff+1, yoff, uitext);
    draw_text(xoff, yoff+1, uitext);
    draw_text(xoff-1, yoff, uitext);
    draw_text(xoff, yoff-1, uitext);
    draw_set_color(c_white);
    draw_text(xoff, yoff, uitext);

    draw_set_alpha(@_alpha);
    draw_set_color(@_color);
    @fl = 0;
    @set = false;
    while (font_exists(@fl)) {
        if (font_get_name(@fl) == "font12") {
            draw_set_font(@fl);
            @set = true;
            break;
        }
        @fl = @fl+1;
    }
    if (!@set && font_exists(0)) {
        draw_set_font(0);
    }
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}
