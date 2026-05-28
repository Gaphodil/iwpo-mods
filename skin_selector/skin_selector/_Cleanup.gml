// instead of deleting anything
// write enough info to file to reuse loaded memory in case of f2/tempfile
// so sprite indices still match between players
with (@SkinSelector) if (@init) {
    @poss_buffer = @buffer_create();

    // last skin for regular gameplay
    @buffer_write_uint16(@poss_buffer, @selector_index);

    // data struct ids
    @buffer_write_uint16(@poss_buffer, @skin_names);
    @buffer_write_uint16(@poss_buffer, @skins_idle);
    @buffer_write_uint16(@poss_buffer, @skins_jump);
    @buffer_write_uint16(@poss_buffer, @skins_run);
    @buffer_write_uint16(@poss_buffer, @skins_fall);
    @buffer_write_uint16(@poss_buffer, @skins_slide);
    @buffer_write_uint16(@poss_buffer, @skins_bow);

    // gm8 validation without ds_exists: last loaded sprite index
    @buffer_write_uint16(@poss_buffer, ds_map_find_value(@skins_slide, ds_list_find_value(@skin_names, @skin_count-1)));

    @buffer_write_to_file(@poss_buffer, "__online_skin_selector");
    @buffer_destroy(@poss_buffer);
}
