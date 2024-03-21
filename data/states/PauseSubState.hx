/* 
    Ends the current song for the purpose of testing
    end-cutscene.hx for current song and cutscene.hx for the next song
    without playing the entire song (useless for freeplay)
*/
var isDebugEnabled:Bool = true; // set to false before release

function create()
    if (game.isStoryMode && isDebugEnabled && game.inst != null && game.vocals != null) menuItems.insert(1, 'End Song');

function postUpdate()
    if (controls.ACCEPT)
        if (menuItems[curSelected] == "Skip Song") game.endSong();