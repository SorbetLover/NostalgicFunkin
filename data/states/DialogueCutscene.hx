// ya can use the code for another mods. - abby fan or toni
import flixel.animation.FlxAnimationController;

var img1:FlxSprite;
var magbox:FlxSprite;
var magtag1:FlxSprite;
var magtag2:FlxSprite;

function create(){    





// toni shit -------------------------------
    if(PlayState.instance.curSong == "tic tac foe" || PlayState.instance.curSong == "hit n' strike" || PlayState.instance.curSong == "acrimony" || acrimonyend == true){
        
    magbox = new FlxSprite().loadGraphic(Paths.image("dialogue/boxes/magDia"));
    img1 = new FlxSprite().loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-1"));
    magbox.screenCenter();
    magbox.y = 425;
    magbox.x -= 10;

    
    add(img1);
    add(magbox);
    
    // add(magtag1);
    // add(magtag2);

   switch(PlayState.instance.curSong){
        case "tic tac foe", "hit n' strike":
            maginageMusic("baseball");

   }
}
}

var curDialogue:Int = 1; // var used to map what dialogue it is currently showing



 
var playingmusic:Bool = false;
function maginageMusic(arg1){
    switch(arg1){
        case "baseball":
            if(playingmusic == false)  CoolUtil.playMusic(Paths.music("maginage/baseball"));
        case "3chikensand":
            if(playingmusic == false)  CoolUtil.playMusic(Paths.music("maginage/3cs"));
        case "vindi":
            if(playingmusic == false)  CoolUtil.playMusic(Paths.music("maginage/vindi"));
        case "bowout":
            if(playingmusic == false)  CoolUtil.playMusic(Paths.music("maginage/bowout"));
        
        case "pause":
            playingmusic = false;
            FlxG.sound.music.pause();
        case "resume":
            if(playingmusic == false)  FlxG.sound.music.resume();

            playingmusic = true;
        case "stop":
            FlxG.sound.music.stop();

            playingmusic = false;

    }
}

public var acrimonyend:Bool = false;

function update(){
    if(FlxG.keys.justPressed.V){
        acrimonyend = true;
        endSong();
    }
    
    if(FlxG.keys.justPressed.Q){
        curDialogue -= 2;
    }
    if(FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER){
        curDialogue += 1;

        switch(PlayState.instance.curSong){ //////// DIALGOEU MUSIC!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11111111111111111111111111
        case "tic tac foe":

            switch(curDialogue){
            case 22:
                maginageMusic("pause");
            
            case 25:
                maginageMusic("resume");
            case 27:
                maginageMusic("stop");
        case "hit n' strike":    
            switch(curDialogue){
            case 29:
                maginageMusic("stop");
        }
        case "acrimony":
            if(PlayState.instance.curStep < 300){
            switch(curDialogue){

                case 1:
                    maginageMusic("vindi");
                case 24:
                    maginageMusic("stop");

            }
            }

            if(PlayState.instance.curStep > 1){
                switch(curDialogue){
    
                    case 1:
                        maginageMusic("bowout");
                    case 20:
                        maginageMusic("stop");
    
                }
                }        }
    }
    }
 
if(PlayState.instance.curSong == "tic tac foe" || PlayState.instance.curSong == "hit n' strike" || PlayState.instance.curSong == "acrimony"){
    dialogueBox.text.color = 0xFFFFFFFF;
    dialogueBox.text.scale.set(0.9,0.9);
    dialogueBox.alpha = 0;

}


 
// toni shit -------------------------
if(PlayState.instance.curSong == "tic tac foe"){
    switch(curDialogue){
    // name shit
    }
    switch(curDialogue){ 
    ////// bg images

        case 5:
            
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-2")); 
        case 7:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-3"));
        case 8:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-4"));
        case 9:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-5"));
        case 10:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-6"));
        case 11:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-7"));
        case 13:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-8"));
        case 14:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-9"));
        case 15:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-10"));
        case 17:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-11"));
        case 21:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-12"));
        case 22:
            
            FlxG.sound.music.pause();
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-13"));
        case 23:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-14"));
        case 24:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-15"));
        case 25:
            
        FlxG.sound.music.resume();
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-16"));
        case 26:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-17"));
        case 27:
            FlxG.sound.music.stop();

    }
 } // end of tic tac foe if
 
 if(PlayState.instance.curSong == "hit n' strike"){

    switch(curDialogue){
        // name shit
        }
    switch(curDialogue){ 
        ////// bg images
            case 1:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-1")); 
            case 3:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-2")); 
            case 5:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-3"));
            case 7:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-4"));
            case 8:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-5"));
            case 10:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-6"));
            case 11:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-7"));
            case 12:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-8"));
            case 13:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-9"));
            case 14:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-10"));
            case 15:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-11"));
            case 16:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-12"));
            case 17:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-13"));
            case 19:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-14"));
            case 20:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-15"));
            case 22:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-16"));
            case 23:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-17"));
            case 25:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-18"));
            case 26:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-19"));
            case 27:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-20"));
            case 28:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c2-21"));
            case 29:
            FlxG.sound.music.stop();

    
        }
   
 }
 if(PlayState.instance.curSong == "acrimony"){
    switch(acrimonyend){
    case false:
    // if(acrimonyend == false){
    switch(curDialogue){ 
        ////// bg images
        case 1:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-1")); 
        case 2:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-2")); 
        case 3:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-3")); 
        case 4:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-4")); 
        case 5:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-5")); 
        case 6:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-6")); 
        case 8:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-7")); 
        case 9:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-8")); 
        case 10:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-9")); 
        case 11:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-10")); 
        case 12:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-11")); 
        case 13:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-12")); 
        case 14:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-13")); 
        case 15:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-14")); 
        case 17:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-15")); 
        case 19:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-16")); 
        case 21:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-17")); 
        case 23:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c3-18")); 
    }
    case true:
    // if(acrimonyend == true ){
        switch(curDialogue){ 

            case 1:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-1")); 
            case 2:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-2")); 
            case 4:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-3")); 
            case 7:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-4")); 
            case 8:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-5")); 
            case 9:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-6")); 
            case 11:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-7")); 
            case 14:
                magbox.alpha = 0;
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-8")); 
            case 15:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-9")); 
            case 16:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-10")); 
            case 17:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-11")); 
            case 18:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-12")); 
            case 19:
                img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c4-13")); 
            case 20:
                FlxG.switchState(new FreeplayState());

            
        }
    
}
}
}
