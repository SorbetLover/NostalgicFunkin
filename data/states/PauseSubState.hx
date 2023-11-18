/* 
    Skips the current song for the purpose of testing cutscenes 
    for the next song quickly (useless for freeplay)
*/
var isDebugEnabled:Bool = true; // set to false before release

function create()
    if (game.isStoryMode && isDebugEnabled && game.inst != null && game.vocals != null) menuItems.insert(1, 'Skip Song');

function postUpdate()
    if (controls.ACCEPT)
        if (menuItems[curSelected] == "Skip Song") game.endSong();