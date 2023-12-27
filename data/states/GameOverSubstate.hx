import flixel.util.FlxAxes;
import flixel.util.FlxColor;

var mrBeastScare:Bool = false;
var mrCableBeastScare:Bool = false;
var isDateWeek:Bool = false;

var zardyScareSpr:FlxSprite = new FlxSprite();
var cableScareSpr:FlxSprite = new FlxSprite();
var cutscene:FlxSprite = new FlxSprite();

function create() {
    switch (PlayState.SONG.meta.name) {
        case "foolhardy" | "Bushwhack":
            lossSFXName = "Vs Zardy/jumpscare_sound";
            FlxG.camera.flash(FlxColor.WHITE, 0.3);
            FlxG.camera.zoom = 0.73;
            new FlxTimer().start(1.625, function(a:FlxTimer) {
                FlxG.camera.flash(FlxColor.RED, 0.5);
                FlxG.camera.zoom = 0.85;
            });
        case 'whitroll' | 'perfume' | 'heartbass':
            isDateWeek = true;
            lossSFXName = "date/fnf_loss_sfx";
            gameOverSong = 'nothing'; // i tried istg
    }
	zardyScareSpr.antialiasing = true;
    zardyScareSpr.scrollFactor.set(0, 0);
	zardyScareSpr.frames = Paths.getFrames("gameover assets/foolhardy/zardyScare");
	zardyScareSpr.animation.addByPrefix("scare", "mrbeast0", 24, true);
    zardyScareSpr.setGraphicSize(FlxG.width+500, FlxG.height+280);

	cableScareSpr.antialiasing = true;
    cableScareSpr.scrollFactor.set(0, 0);
	cableScareSpr.frames = Paths.getFrames("gameover assets/foolhardy/cableScare");
	cableScareSpr.animation.addByPrefix("scareCable", "mrcablebeast0", 24, true);
    cableScareSpr.setGraphicSize(FlxG.width+500, FlxG.height+280);

    if(isDateWeek){
		cutscene.frames = Paths.getSparrowAtlas("stages/date/boom");
		cutscene.scrollFactor.set();
		cutscene.animation.addByPrefix("boom", "Symbol 79", 24, false);
		cutscene.antialiasing = true;
		cutscene.visible = false;
        add(cutscene);
        members.remove(cutscene);
        members.insert(members.indexOf(character)+10,cutscene);
    }
}

var sh:Float = 0.03;

function update() {
    switch (PlayState.SONG.meta.name) {
        case "foolhardy":
            mrBeastScare = true;

        case "Bushwhack":
            mrCableBeastScare = true;
    }


    if (mrBeastScare && !PlayState.opponentMode) {
        zardyScareSpr.animation.play('scare');
        add(zardyScareSpr);
        FlxG.camera.follow(zardyScareSpr);
        new FlxTimer().start(1.625, function(a:FlxTimer) {
            zardyScareSpr.kill();
        });
    } else if (mrCableBeastScare && !PlayState.opponentMode) {
        cableScareSpr.animation.play('scareCable');
        add(cableScareSpr);
        FlxG.camera.follow(cableScareSpr);

        new FlxTimer().start(1.625, function(a:FlxTimer) {
            cableScareSpr.kill();
        });
    } else {
        zardyScareSpr.kill();
        cableScareSpr.kill();
    }   

    if(isDateWeek){  
		if(sh > 0)FlxG.camera.shake(sh, 3);
		sh -= 0.0008;
    }
}

function beatHit(curBeat:Int){
    if(curBeat == 0){
        if(isDateWeek){
            cutscene.visible = true;
            members.remove(cutscene);
            members.insert(members.indexOf(character)+10,cutscene);

			cutscene.animation.play("boom");
			FlxG.sound.play(Paths.sound("date/explosion"));
			FlxG.camera.fade(FlxColor.WHITE, 2, true);
        }
    }
}