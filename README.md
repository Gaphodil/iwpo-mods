Copy the .json and folder to `data/lib/mods` in the IWPO installation.

Catalogue of IWPO mod bugs in b22:

- Verve GM8.2: if `iwpo.saveGame=save_save` when a non-impossible mode save occurs a non-fatal error pops up about argument[0] not existing
- GM8: if at least some of the hooks for `OnUpdatePlayerCount`, `OnTcpReceived`, `OnUdpReceived`, `OnPlayerMovedSending`, and `OnPlayerMovedReceiving` are not supplied with code that uses the appropriate number of arguments, a GM8.2-built game will crash at runtime when that function is called
- GMS: custom keybinds are wholly ignored and will resolve to an empty string in code
- GMS: custom parameters must be supplied through config files or command line arguments, as the defaults in the mod json are wholly ignored and will resolve to an empty string in code
- GMS: including multiple mods at once will throw an exception when attempting and failing to sort an array
