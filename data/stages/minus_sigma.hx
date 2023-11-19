function postCreate(){
    /*maku = new FunkinSprite(-693.8, 282.8);
    maku.frames = Paths.getSparrowAtlas("stages/Vs RetroSpecter/minus/images/maku-bg");
    maku.animation.addByIndices("danceLeft", "m-saku-idle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14], "", 24);
    maku.animation.addByIndices("danceRight", "m-saku-idle", [17,18,19,20,21,22,23,24,25,26,27,28,29], "", 24);
    maku.animation.addByPrefix("cheer", "m saku cheer", 24, false);
    maku.updateHitbox();
    maku.alpha = 1;
    maku.antialiasing = true;
    maku.scale.set(0.8,0.8);
    maku.animation.play("cheer", true);
	insert(members.indexOf(dad)-1, maku);*/
    
    makuCheer.addOffset("cheer", 70, 113);// offset anims for maku cheer
    maku.addOffset("danceRight", 0, 0);// offset anims for maku idle
    maku.addOffset("danceLeft", 0, 0);// offset anims for maku idle
}
function beatHit(){
    if (curSong == "sigma"){
        if (curBeat >= 0 && curBeat < 145 || curBeat == 208){
            if (curBeat % 2 == 0){
                    maku.animation.play("danceRight", true);
                } else {
                    maku.animation.play("danceLeft", true);
            }
        }
        if (curBeat == 145){
            maku.alpha = 0.0001;
            makuCheer.alpha = 1;
        }
        if (curBeat == 208){
            maku.alpha = 1;
            makuCheer.alpha = 0.0001;
        }
    }
    
    if (curSong != "sigma"){
        if (curBeat % 2 == 0){
            maku.animation.play("danceRight", true);
        } else {
            maku.animation.play("danceLeft", true);
        }
    }
}
function stepHit(){
    if (curSong == "sigma"){
        switch (curStep){
            case 580, 596, 612, 628, 644, 660, 676, 692:
                maku.alpha = 0.0001;
                makuCheer.alpha = 1;
                gf.playAnim("cheer", true);
                makuCheer.animation.play("cheer", true);

            case 708, 716, 724, 732, 740, 748, 756, 764, 766, 772, 780, 788, 796, 798, 804, 812, 820, 828, 830, 832:
                maku.alpha = 0.0001;
                makuCheer.alpha = 1;
                gf.playAnim("cheer", true);
                makuCheer.animation.play("cheer", true);
        }
    }
}