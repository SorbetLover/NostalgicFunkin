// ya can use the code for another mods. - abby fan or toni
import flixel.animation.FlxAnimationController;

var img1:FlxSprite;
var magbox:FlxSprite;
var magtag1:FlxSprite;
var magtag2:FlxSprite;

function create(){    





// toni shit -------------------------------
    if(PlayState.instance.curSong == "tic tac foe"){
        
    magbox = new FlxSprite().loadGraphic(Paths.image("dialogue/boxes/magDia"));
    img1 = new FlxSprite().loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-1"));
    magbox.screenCenter();
    magbox.y = 425;
    magbox.x -= 10;

    
    
    add(img1);
    add(magbox);
    
    add(magtag1);
    add(magtag2);
}
}

var curMagDialogue:Int = 1; // var used to map what dialogue it is currently showing
function update(){





// toni shit -------------------------
if(PlayState.instance.curSong == "tic tac foe"){
    if(FlxG.keys.justPressed.SPACE){
        curMagDialogue += 1;
    }
    switch(curMagDialogue){
    // name shit
    }
    switch(curMagDialogue){ 
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
        case 14:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-10"));
        case 17:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-11"));
        case 21:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-12"));
        case 22:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-13"));
        case 23:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-14"));
        case 24:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-15"));
        case 25:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-16"));
        case 26:
            img1.loadGraphic(Paths.image("dialogue/characters/maginageimages/c1-17"));





       
    }
    dialogueBox.text.color = 0xFFFFFFFF;
    dialogueBox.text.scale.set(0.9,0.9);
    dialogueBox.alpha = 0;
    dialogueBox.characters.dad.alpha = 0;
    dialogueBox.characters.boyfriend.alpha = 0;
}
}