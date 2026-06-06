/// InitSkinMod

// look in exe area for skins folder
@skins_dir = working_directory + "\iwposkins\";
var attempt; attempt = 0;
while (not directory_exists(@skins_dir)) {
    if (attempt == 3) return false;
    #if GM8
        show_message("[SkinMod] No iwposkins folder found! Add to exe folder and try again");
    #else
        get_open_filename_ext(
            "","",working_directory,
            "[SkinMod] No iwposkins folder found! Drag here and cancel this");
    #endif
    attempt += 1;
}

// load buffer as f2/tempfile protection
@preload = false;
if (file_exists("__online_skin_selector")) {
    @poss_buffer = @buffer_create();
    @buffer_read_from_file(@poss_buffer, "__online_skin_selector");

    // last skin for regular gameplay
    @selector_index = @buffer_read_uint16(@poss_buffer);

    // data struct ids
    @skin_names     = @buffer_read_uint16(@poss_buffer);
    @skins_idle     = @buffer_read_uint16(@poss_buffer);
    @skins_jump     = @buffer_read_uint16(@poss_buffer);
    @skins_run      = @buffer_read_uint16(@poss_buffer);
    @skins_fall     = @buffer_read_uint16(@poss_buffer);
    @skins_slide    = @buffer_read_uint16(@poss_buffer);
    @skins_bow      = @buffer_read_uint16(@poss_buffer);

    // gm8 validation without ds_exists: last loaded sprite index
    #if GM8
        var tempspr; tempspr = @buffer_read_uint16(@poss_buffer);
        if (sprite_exists(tempspr))
            @preload = true;
    #else
        if (ds_exists(@skin_names, ds_type_list) and ds_exists(@skins_bow, ds_type_map))
            @preload = true;
    #endif

    
    // read default sprite and bow indices

    @buffer_destroy(@poss_buffer);
}

if (not @preload) {
    // save ever dir name in @skins_dir
    var file; file = file_find_first(@skins_dir + "*", fa_directory);
    if (file == "") {
        file_find_close();
        show_message("[SkinMod] No skins found in iwposkins folder!");
        return false;
    }

    @skin_names = ds_list_create();
    ds_list_add(@skin_names, "Default");
    do {
        if (directory_exists(@skins_dir + file)
            and file != "." and file != "..")
            ds_list_add(@skin_names, filename_name(file));
        file = file_find_next();
    } until (file == "")
    file_find_close();
}
@skin_count = ds_list_size(@skin_names);
if (@skin_count == 0) {
    show_message("[SkinMod] No skins found in iwposkins folder!");
    ds_list_destroy(@skin_names);
    return false;
}

if (not @preload) {
    @skins_idle  = ds_map_create();
    @skins_jump  = ds_map_create();
    @skins_run   = ds_map_create();
    @skins_fall  = ds_map_create();
    @skins_slide = ds_map_create();
    @skins_bow   = ds_map_create();
}

@skinsel_idle   = -1;
@skinsel_jump   = -1;
@skinsel_run    = -1;
@skinsel_fall   = -1;
@skinsel_slide  = -1;
@skinsel_bow    = -1;

if (@poss_sprite_index_exists("%sprite_idle"))
    @skinsel_idle = %sprite_idle;
else if (@poss_sprite_index_exists("sprPlayerIdle"))
    @skinsel_idle = sprPlayerIdle;
else if (@poss_sprite_index_exists("sPlayerIdle"))
    @skinsel_idle = sPlayerIdle;
else if (@poss_sprite_index_exists("spr_player_idle"))
    @skinsel_idle = spr_player_idle;

if (@poss_sprite_index_exists("%sprite_jump"))
    @skinsel_jump = %sprite_jump;
else if (@poss_sprite_index_exists("sprPlayerJump"))
    @skinsel_jump = sprPlayerJump;
else if (@poss_sprite_index_exists("sPlayerJump"))
    @skinsel_jump = sPlayerJump;
else if (@poss_sprite_index_exists("spr_player_jump"))
    @skinsel_jump = spr_player_jump;

if (@poss_sprite_index_exists("%sprite_run"))
    @skinsel_run = %sprite_run;
else if (@poss_sprite_index_exists("sprPlayerRunning"))
    @skinsel_run = sprPlayerRunning;
else if (@poss_sprite_index_exists("sprPlayerRun"))
    @skinsel_run = sprPlayerRun;
else if (@poss_sprite_index_exists("sPlayerRunning"))
    @skinsel_run = sPlayerRunning;
else if (@poss_sprite_index_exists("sPlayerRun"))
    @skinsel_run = sPlayerRun;
else if (@poss_sprite_index_exists("spr_player_running"))
    @skinsel_run = spr_player_running;
else if (@poss_sprite_index_exists("spr_player_run"))
    @skinsel_run = spr_player_run;

if (@poss_sprite_index_exists("%sprite_fall"))
    @skinsel_fall = %sprite_fall;
else if (@poss_sprite_index_exists("sprPlayerFall"))
    @skinsel_fall = sprPlayerFall;
else if (@poss_sprite_index_exists("sPlayerFall"))
    @skinsel_fall = sPlayerFall;
else if (@poss_sprite_index_exists("spr_player_fall"))
    @skinsel_fall = spr_player_fall;

if (@poss_sprite_index_exists("%sprite_slide"))
    @skinsel_slide = %sprite_slide;
else if (@poss_sprite_index_exists("sprPlayerSliding"))
    @skinsel_slide = sprPlayerSliding;
else if (@poss_sprite_index_exists("sprPlayerSlide"))
    @skinsel_slide = sprPlayerSlide;
else if (@poss_sprite_index_exists("sPlayerSliding"))
    @skinsel_slide = sPlayerSliding;
else if (@poss_sprite_index_exists("sPlayerSlide"))
    @skinsel_slide = sPlayerSlide;
else if (@poss_sprite_index_exists("spr_player_sliding"))
    @skinsel_slide = spr_player_sliding;
else if (@poss_sprite_index_exists("spr_player_slide"))
    @skinsel_slide = spr_player_slide;

if (@poss_sprite_index_exists("%sprite_bow"))
    @skinsel_bow = %sprite_bow;
else if (@poss_sprite_index_exists("sprBow"))
    @skinsel_bow = sprBow;
else if (@poss_sprite_index_exists("sprPlayerBow"))
    @skinsel_bow = sprPlayerBow;
else if (@poss_sprite_index_exists("sBow"))
    @skinsel_bow = sBow;
else if (@poss_sprite_index_exists("sPlayerBow"))
    @skinsel_bow = sPlayerBow;
else if (@poss_sprite_index_exists("spr_bow"))
    @skinsel_bow = spr_bow;

@name_idle  = sprite_get_name(@skinsel_idle);
@name_jump  = sprite_get_name(@skinsel_jump);
@name_run   = sprite_get_name(@skinsel_run);
@name_fall  = sprite_get_name(@skinsel_fall);
@name_slide = sprite_get_name(@skinsel_slide);
//@name_bow   = sprite_get_name(@skinsel_bow);

@bow_obj = noone;
if (@poss_object_index_exists("%object_bow"))
    @bow_obj = %object_bow;
else if (@poss_object_index_exists("Bow"))
    @bow_obj = Bow;
else if (@poss_object_index_exists("bow"))
    @bow_obj = bow;
else if (@poss_object_index_exists("oBow"))
    @bow_obj = oBow;
else if (@poss_object_index_exists("obj_bow"))
    @bow_obj = obj_bow;
else if (@poss_object_index_exists("objBow"))
    @bow_obj = objBow;

if (not @preload)
    @poss_MapSprites();
@poss_ReplaceSprites();

return true;
