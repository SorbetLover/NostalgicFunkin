/* Skips song for the purpose of testing dialogue/cutscenes/song scripts quickly 
    without having to wait for the song to end in story mode
*/
var isDebugEnabled:Bool = true; // set to false before release

function create() {
    if (isDebugEnabled && game.inst != null && game.vocals != null) {
        menuItems.insert(1, 'Skip Song');
    }
}

function update() {
    if (controls.ACCEPT) {
        if (menuItems[curSelected] == "Skip Song") {
            game.nextSong();
        }
    }
}