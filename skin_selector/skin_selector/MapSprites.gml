/// MapSprites

var i;
// i = 0 -> Default
ds_map_add(@skins_idle,  "Default", @skinsel_idle)
ds_map_add(@skins_jump,  "Default", @skinsel_jump)
ds_map_add(@skins_run,   "Default", @skinsel_run)
ds_map_add(@skins_fall,  "Default", @skinsel_fall)
ds_map_add(@skins_slide, "Default", @skinsel_slide)
ds_map_add(@skins_bow,   "Default", @skinsel_bow)

for (i = 1; i < @skin_count; i+=1) {
    var sname; sname = ds_list_find_value(@skin_names, i);
    var fname; fname = @skins_dir + sname;
    var ininame; ininame = fname + "\info.ini"
    #if GM8
        file_copy(ininame, "poss_temp.ini");
        ininame = "poss_temp.ini";
    #endif
    ini_open(ininame);
    ds_map_add(@skins_idle, sname,
        sprite_add(
            fname+"\idle.png",
            ini_read_real("idle", "imgnum", 4),
            false, false,
            ini_read_real("idle", "xorig", 17),
            ini_read_real("idle", "yorig", 23)));
    ds_map_add(@skins_jump, sname,
        sprite_add(
            fname+"\jump.png",
            ini_read_real("jump", "imgnum", 2),
            false, false,
            ini_read_real("jump", "xorig", 17),
            ini_read_real("jump", "yorig", 23)));
    ds_map_add(@skins_run, sname,
        sprite_add(
            fname+"\run.png",
            ini_read_real("run", "imgnum", 4),
            false, false,
            ini_read_real("run", "xorig", 17),
            ini_read_real("run", "yorig", 23)));
    ds_map_add(@skins_fall, sname,
        sprite_add(
            fname+"\fall.png",
            ini_read_real("fall", "imgnum", 2),
            false, false,
            ini_read_real("fall", "xorig", 17),
            ini_read_real("fall", "yorig", 23)));
    ds_map_add(@skins_slide, sname,
        sprite_add(
            fname+"\slide.png",
            ini_read_real("slide", "imgnum", 2),
            false, false,
            ini_read_real("slide", "xorig", 7),
            ini_read_real("slide", "yorig", 10)));
    if (file_exists(fname+"\bow.png")) {
        ds_map_add(@skins_bow, sname,
            sprite_add(
                fname+"/bow.png",
                ini_read_real("bow", "imgnum", 1),
                false, false,
                ini_read_real("bow", "xorig", 17),
                ini_read_real("bow", "yorig", 23)));
        if (not ini_read_real("bow", "usebow", 1))
            ds_map_replace(@skins_bow, sname, @skinsel_bow);
    }
    ini_close();
    #if GM8
        file_delete(ininame);
    #endif
}

