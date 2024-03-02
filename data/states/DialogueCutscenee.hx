// ya can use the code lmao. - sorbetLover or toni
import flixel.animation.FlxAnimationController;

var curDialogue:Int = 0; // var used to map what dialogue it is currently showing
var playingmusic:Bool = false;
var bg:FlxSprite;

function postCreate(){
    trace("Screw you.");
    bg = new FlxSprite().screenCenter();
    for (allChars in charMap) {
        insert(members.lastIndexOf(charMap[allChars]), bgImg);
    }
}

function shake(playFirst:Bool = false){
    // dialgoueCam.shake();
    trace("fdfdsfd");
}

public function bgImg(path:String){
    bg.loadAnimatedGraphic(Paths.image(path));
}

public function playVoice() {

}


function playMusic(arg1){
    switch(arg1){
        // add cases with your songs if u lazy like me - toni
            
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

function next(event) {
    if(canProceed) curDialogue++;
}

function update(){

    trace(curDialogue);
// image thing
    if(PlayState.instance.curSong == "seu pai"){
        switch(curDialogue){
            
        }
    }
}
