// derived from gm8 player_list code
@f = file_text_open_write("__online_name_opacity");
file_text_write_real(@f, @text_mode+1);
file_text_close(@f);
