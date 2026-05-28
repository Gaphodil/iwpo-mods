/// ReplaceSprites
var sname; sname = ds_list_find_value(@skin_names, @selector_index);
@skinsel_idle   = ds_map_find_value(@skins_idle,  sname);
@skinsel_jump   = ds_map_find_value(@skins_jump,  sname);
@skinsel_run    = ds_map_find_value(@skins_run,   sname);
@skinsel_fall   = ds_map_find_value(@skins_fall,  sname);
@skinsel_slide  = ds_map_find_value(@skins_slide, sname);
if (ds_map_exists(@skins_bow, sname))
    @skinsel_bow    = ds_map_find_value(@skins_bow, sname);
else @skinsel_bow   = ds_map_find_value(@skins_bow, "Default");
