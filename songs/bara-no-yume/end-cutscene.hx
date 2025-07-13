import hxvlc.flixel.FlxVideoSprite;
var cutbg:FunkinSprite;
var vid:FlxVideoSprite;
function create() {
		this.startDialogue("assets/songs/bara-no-yume/end-dialogue.xml", shitFUCK);
    
    cutbg = new FunkinSprite();
    cutbg.frames = Paths.getSparrowAtlas("stages/school/animatedEvilSchool");
    cutbg.animation.addByPrefix("idle", "background 2 instance 1", 16);

    vid = new FlxVideoSprite(0,0);
    vid.load(Paths.video("monika"));
vid.bitmap.onFormatSetup.add(function():Void
{
    if (vid.bitmap != null && vid.bitmap.bitmapData != null)
    {
        final scale:Float = Math.min(FlxG.width / vid.bitmap.bitmapData.width, FlxG.height / vid.bitmap.bitmapData.height);

        vid.setGraphicSize(vid.bitmap.bitmapData.width * scale, vid.bitmap.bitmapData.height * scale);
        vid.updateHitbox();
        vid.screenCenter();
    }
});
vid.antialiasing = true;
}
function endThing(){
            PlayState.instance.camHUD.fade(0xFF000000, 0.0001, false);

    new FlxTimer().start(1, function(){

        PlayState.instance.nextSong();
    });
}
function shitFUCK(){
    add(cutbg);
    cutbg.cameras = [PlayState.instance.camHUD];
    cutbg.scale.set(6,6);
    cutbg.playAnim("idle");
    cutbg.screenCenter();
    FlxG.sound.play(Paths.sound("awhellnaw"));
    vid.visible = false;
    add(vid);
    vid.cameras = [PlayState.instance.camHUD];
    vid.screenCenter();
    // vid.play();
    
            PlayState.instance.camGame.fade(0xFF000000, 0.0001, false);
    new FlxTimer().start(1.5, function(ASD:FlxTimer){
        vid.play();
        vid.visible = true;
        new FlxTimer().start(26, function(ASD:FlxTimer){
            endThing();
        });
    });
}