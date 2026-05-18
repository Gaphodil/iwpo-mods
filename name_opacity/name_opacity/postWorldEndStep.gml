// if (keyboard_check_pressed(%keybind_toggle_name_visibility)) {
if (keyboard_check_pressed(ord("U"))) {
    @text_mode += 1;
    @text_mode = @text_mode mod 3;
    
    @text_timer = 150; //keep messages visible for 150 frames
} 
if(@text_timer > 0){
    @text_timer -= 1; 
        
    if(@text_mode == 0){
            @onlineStatusText += "Names Always Visible#";
    }else if(@text_mode == 1){
            @onlineStatusText += "Names Fade With Distance#";
    }if(@text_mode == 2){
            @onlineStatusText += "Names Hidden#";
    }
}

// dupe the onlineStatusTextInstance code
if (@onlineStatusText != "") {
	if (!instance_exists(@onlineStatusTextInstance)) {
		@onlineStatusTextInstance = instance_create(20, 20, @playerSaved);
	}
	@onlineStatusTextInstance.image_alpha = 1.1;
	@onlineStatusTextInstance.@text = "[Online] " + @onlineStatusText;
} else if instance_exists(@onlineStatusTextInstance) {
	with (@onlineStatusTextInstance) instance_destroy();
}
