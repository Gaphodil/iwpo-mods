// derived from gms player_list code
@buffer_clear(@buffer);
@buffer_write_uint8(@buffer, @text_mode);
@buffer_write_to_file(@buffer, "__online_name_opacity");
