This mod reads player sprites that are placed in a 'iwposkins' folder in the same directory as the patched game executable. Structure within should be 'skinname/state.png' in the strip format, e.g. 'crimson/slide.png'. Available states are idle, jump, run, fall, and slide; a bow.png can optionally be provided. Frame count and origin can be set by adding 'info.ini' to the skin folder, but animation behaviour is game-dependent. A sample ini is provided.

Bows can also be disabled with the ini, but the image files must still exist across all players or behaviour can be unexpected. They may not be used if the bow sprite is drawn directly instead of through a bow object.

Keybind hardcoded to "L" in GMS due to bug in GMS converter. `parameters` must be set in config file or command line for GMS due to defaults being ignored in GMS converter. Hooks with arguments are required in all mods for GM8.2 compatibility.

`max_search_depth` is a setting for GM8 initialization - because there is no `asset_get_index`, sprites and objects are searched manually once at mod initialization.
