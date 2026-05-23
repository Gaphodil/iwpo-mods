// derived from player_list code
if (file_exists("__online_name_opacity")) {
    #if GM8
        @f = file_text_open_read("__online_name_opacity");
        @text_mode = file_text_read_real(@f)-1;
        file_text_close(@f);
    #else
        @temp_buffer = @buffer_create();
        @buffer_read_from_file(@temp_buffer, "__online_name_opacity");
        @text_mode = @buffer_read_uint8(@temp_buffer);
        @buffer_destroy(@temp_buffer);
    #endif
}
