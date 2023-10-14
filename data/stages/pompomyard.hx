// using strumLines.members[0].characters[0] as PomPom crying
// using strumLines.members[0].characters[1] as PomPom mad

function postCreate(){
    // stomachache thing
if(PlayState.SONG.meta.name == "stomachache"){
    strumLines.members[0].characters[1].x -= 35;
    strumLines.members[0].characters[1].y += 60;
    strumLines.members[0].characters[1].alpha = 0;
    dad.setPosition(dad.x + 30, dad.y + 60);
}
}

function stepHit(curStep){
    // more stomachache thing
if(PlayState.SONG.meta.name == "stomachache"){
    switch(curStep){
        case 320:
        strumLines.members[0].characters[0].alpha = 0;
        strumLines.members[0].characters[1].alpha = 1;
    }
}
}
