/// UpdatePlayerSprite
with (%player) {
    var spr_name; spr_name = sprite_get_name(sprite_index);
    if (other.@last_spr_name != spr_name) {
        other.@last_spr_name = spr_name;
        other.@def_spr_img_num = sprite_get_number(sprite_index);
        other.@real_image_index = -1;
        other.@appx_image_speed = -1;
    }
    switch (spr_name) {
        case other.@name_idle:
            sprite_index = other.@skinsel_idle;
            break;
        case other.@name_jump:
            sprite_index = other.@skinsel_jump;
            break;
        case other.@name_run:
            sprite_index = other.@skinsel_run;
            break;
        case other.@name_fall:
            sprite_index = other.@skinsel_fall;
            break;
        case other.@name_slide:
            sprite_index = other.@skinsel_slide;
            break;
    }
    if (sprite_get_number(sprite_index) > other.@def_spr_img_num) {
        if (other.@real_image_index == -1)
            other.@real_image_index = image_index;
        else if (other.@appx_image_speed == -1) {
            other.@appx_image_speed = image_index - other.@real_image_index;
            // assume 0 < 1 speed
            if (other.@appx_image_speed <= 0 || other.@appx_image_speed > 1) {
                other.@appx_image_speed = -1;
                other.@real_image_index = -1;
            }
            else other.@real_image_index = image_index;
        }
        else {
            other.@real_image_index = other.@real_image_index + other.@appx_image_speed
            if ((other.@real_image_index) >= other.@def_spr_img_num) {
                other.@real_image_index = other.@real_image_index mod (other.@def_spr_img_num * sprite_get_number(sprite_index))
                image_index = other.@real_image_index;
            }
        }
    }
}

#if PLAYER2
with (%player2) {
    var spr_name; spr_name = sprite_get_name(sprite_index);
    if (other.@last_spr_name != spr_name) {
        other.@last_spr_name = spr_name;
        other.@def_spr_img_num = sprite_get_number(sprite_index);
        other.@real_image_index = -1;
        other.@appx_image_speed = -1;
    }
    switch (spr_name) {
        case other.@name_idle:
            sprite_index = other.@skinsel_idle;
            break;
        case other.@name_jump:
            sprite_index = other.@skinsel_jump;
            break;
        case other.@name_run:
            sprite_index = other.@skinsel_run;
            break;
        case other.@name_fall:
            sprite_index = other.@skinsel_fall;
            break;
        case other.@name_slide:
            sprite_index = other.@skinsel_slide;
            break;
    }
    if (sprite_get_number(sprite_index) > other.@def_spr_img_num) {
        if (other.@real_image_index == -1)
            other.@real_image_index = image_index;
        else if (other.@appx_image_speed == -1) {
            other.@appx_image_speed = image_index - other.@real_image_index;
            // assume 0 < 1 speed
            if (other.@appx_image_speed <= 0 || other.@appx_image_speed > 1) {
                other.@appx_image_speed = -1;
                other.@real_image_index = -1;
            }
            else other.@real_image_index = image_index;
        }
        else {
            other.@real_image_index = other.@real_image_index + other.@appx_image_speed
            if ((other.@real_image_index) >= other.@def_spr_img_num) {
                other.@real_image_index = other.@real_image_index mod (other.@def_spr_img_num * sprite_get_number(sprite_index))
                image_index = other.@real_image_index;
            }
        }
    }
}
#endif

with (@bow_obj) sprite_index = other.@skinsel_bow;
