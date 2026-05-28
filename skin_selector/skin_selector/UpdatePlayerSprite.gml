/// UpdatePlayerSprite
with (%player) {
    var spr_name; spr_name = sprite_get_name(sprite_index);
    if (spr_name == other.@name_idle)
        sprite_index = other.@skinsel_idle;
    if (spr_name == other.@name_jump)
        sprite_index = other.@skinsel_jump;
    if (spr_name == other.@name_run)
        sprite_index = other.@skinsel_run;
    if (spr_name == other.@name_fall)
        sprite_index = other.@skinsel_fall;
    if (spr_name == other.@name_slide)
        sprite_index = other.@skinsel_slide;
}
#if PLAYER2
with (%player2) {
    var spr_name; spr_name = sprite_get_name(sprite_index);
    if (spr_name == other.@name_idle)
        sprite_index = other.@skinsel_idle;
    if (spr_name == other.@name_jump)
        sprite_index = other.@skinsel_jump;
    if (spr_name == other.@name_run)
        sprite_index = other.@skinsel_run;
    if (spr_name == other.@name_fall)
        sprite_index = other.@skinsel_fall;
    if (spr_name == other.@name_slide)
        sprite_index = other.@skinsel_slide;
}
#endif

with (@bow_obj) sprite_index = other.@skinsel_bow;
