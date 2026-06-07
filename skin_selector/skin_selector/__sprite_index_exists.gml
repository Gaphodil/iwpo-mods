#if GM8
// asset_get_index workaround derived from end of iwpo draw code
// indices can skip - brute force assume fewer than 10000?
var @i;
for (@i = 0; @i < %max_search_depth; @i+=1)
    if (sprite_exists(@i) and sprite_get_name(@i) == argument0)
        return true;
return false;
#else
return sprite_exists(asset_get_index(argument0));
#endif
