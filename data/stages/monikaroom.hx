import flixel.addons.display.FlxBackdrop;

var bgSky:FlxBackdrop;
function create() {
    bgSky = new FlxBackdrop().loadGraphic(Paths.image("stages/monikaroom/FinaleSky"));
	insert(members.indexOf(BG), bgSky);
	bgSky.spacing.y = -20; 
	bgSky.velocity.x = -PlayState.SONG.meta.bpm / 4;

}