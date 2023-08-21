function postCreate() {
    if (playCutscenes) {
        // iconP1.alpha = 0;
        // iconP2.alpha = 0;
        for (d in [cpuStrums, playerStrums])
            d.visible = false;
    } else {
        finishDialogue();
        // trace("dsad");
    }
}

function finishDialogue() {
    iconP1.alpha = 1;
    iconP2.alpha = 1;
    playerStrums.forEach(function(strum:StrumNote) {
        FlxTween(strum, {alpha: 1}, 0.5);
    });

    cpuStrums.forEach(function(strum:StrumNote) {
        FlxTween(strum, {alpha: 1}, 0.5);
    });
}