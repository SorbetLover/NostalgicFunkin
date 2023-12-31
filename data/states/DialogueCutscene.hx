// ya can use the code for another mods. - abby fan or toni
import flixel.animation.FlxAnimationController;

var img1:FlxSprite;
var magbox:FlxSprite;
var magtag1:FlxSprite;
var magtag2:FlxSprite;

function create(){    





// toni shit -------------------------------
    if(PlayState.instance.curSong == "tic tac foe" || PlayState.instance.curSong == "hit n' strike"){
        
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

    }
}


function update(){

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
                FlxG.music.stop();
        case "hit n' strike":    
            case 29:
                FlxG.music.stop();
        }
    }
    }
 
if(PlayState.instance.curSong == "tic tac foe" || PlayState.instance.curSong == "hit n' strike"){
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

}
