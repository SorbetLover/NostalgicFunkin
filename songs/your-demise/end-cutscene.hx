import hxvlc.flixel.FlxVideoSprite;
var cutbg:FunkinSprite;
var cutbg2:FunkinSprite;
var vid:FlxVideoSprite;
function create() {
		this.startDialogue("assets/songs/your-demise/end-dialogue.xml", shitFUCK);
    cutbg = new FunkinSprite();
    cutbg.frames = Paths.getSparrowAtlas("stages/monikaroom/End1");
    cutbg.animation.addByPrefix("idle", "Endscene", 24, false);
    PlayState.instance.camHUD.fade(0xFF000000, 0.001, false);
    PlayState.instance.camHUD.alpha = 0;
    cutbg2 = new FunkinSprite().loadGraphic(Paths.image("stages/monikaroom/monikasenpaistanding"));
    
}
function shitFUCK(){
    
    add(cutbg);
    cutbg.cameras = [PlayState.instance.camHUD];
    cutbg.screenCenter();
    cutbg.alpha = 0;
        cutbg.antialiasing = false;

        new FlxTimer().start(2, function(){
            cutbg.alpha = 1;
                PlayState.instance.camHUD.alpha = 1;
                cutbg.playAnim("idle");
                PlayState.instance.camHUD.fade(0xFFFFFFFF, 1, true);
                FlxG.sound.playMusic(Paths.music('pixel/cutscene_jargon_shmargon'), 1);
                new FlxTimer().start(2.2, function(swagTimer:FlxTimer)
					{
						FlxG.sound.play(Paths.sound('dah'));
                });
                new FlxTimer().start(3.8, function(swagTimer:FlxTimer)
					{
                        PlayState.instance.camHUD.fade(FlxColor.BLACK, 2, false);
						new FlxTimer().start(2.2, function(swagTimer:FlxTimer)
						{
                            otherCuts();
						});                
                });
                


        });
}
function otherCuts(){
    
    add(cutbg2);
    cutbg2.cameras = [PlayState.instance.camHUD];
    cutbg2.antialiasing = false;
    PlayState.instance.camHUD.fade(FlxColor.BLACK, 3, true);
    new FlxTimer().start(4, function(){
        this.startDialogue("assets/songs/your-demise/funnydialogue.xml", endTSHIT);
    });

}
function postUpdate(){
    PlayState.instance.camHUD.zoom = 1;
}

function endTSHIT(){
    PlayState.instance.camHUD.fade(0xFF000000, 4, false);
    new FlxTimer().start(5, function(sd:FlxTimer){
                PlayState.instance.nextSong();
    });
}