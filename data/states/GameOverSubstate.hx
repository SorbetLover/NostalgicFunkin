import flixel.util.FlxAxes;
import flixel.util.FlxColor;

var mrBeastScare:Bool = false;
var mrCableBeastScare:Bool = false;

var zardyScareSpr:FlxSprite = new FlxSprite();
var cableScareSpr:FlxSprite = new FlxSprite();

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
}

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
}