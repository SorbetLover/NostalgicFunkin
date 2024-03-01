var game;
var pauseMusic:FlxSound;

function create(){
	persistentUpdate = true;
	persistentDraw = true;

    pauseMusic = FlxG.sound.load(Paths.music('gapicity'), 0.8, true);
    pauseMusic.persist = false;
    pauseMusic.group = FlxG.sound.defaultMusicGroup;
    pauseMusic.play(false);

    game = PlayState.instance;

    FlxG.camera.zoom = 1;

    game.camHUD.visible = false;

    game.camFollow.x = game.dad.getCameraPosition().x;
    game.camFollow.y = game.dad.getCameraPosition().y;

    
    game.dad.playAnim('kitty');
}

function update(){
    if(game.dad.isAnimFinished())
        game.dad.playAnim('dia',true);

    if(FlxG.keys.justPressed.ENTER && game.dad.getAnimName() == 'dia'){
        game.dad.playAnim('idle');
        game.camHUD.visible = true;
        FlxG.sound.destroySound(pauseMusic);
        close();
    }
}