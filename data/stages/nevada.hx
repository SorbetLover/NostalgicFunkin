var tstatic:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('stages/Vs Tricky/clown/TrickyStatic'), true, 320, 180);
//var tStaticSound:FlxSound = new FlxSound().loadEmbedded(Paths.sound("staticSound","preload"));
function create(){
    
    remove(comboGroup);
    remove(gf);
    remove(dad);
    remove(boyfriend);

    tstatic.antialiasing = true;
    tstatic.scrollFactor.set(0,0);
    tstatic.setGraphicSize(Std.int(tstatic.width * 8.3));
    tstatic.animation.add('static', [0, 1, 2], 24, true);
    tstatic.animation.play('static');

    tstatic.alpha = 0;

    var bg:FlxSprite = new FlxSprite(-350, -300).loadGraphic(Paths.image('stages/Vs Tricky/red'));
    // bg.setGraphicSize(Std.int(bg.width * 2.5));
    // bg.updateHitbox();
    bg.antialiasing = true;
    bg.scrollFactor.set(0.9, 0.9);
    var stageFront:FlxSprite;
    if (curSong != 'madness')
    {
        add(bg);
        stageFront = new FlxSprite(-1100, -460).loadGraphic(Paths.image('stages/Vs Tricky/clown/island_but_dumb'));
    }
    else
        stageFront = new FlxSprite(-1100, -460).loadGraphic(Paths.image('stages/Vs Tricky/clown/island_but_rocks_float'));

    stageFront.setGraphicSize(Std.int(stageFront.width * 1.4));
    stageFront.antialiasing = true;
    stageFront.scrollFactor.set(0.9, 0.9);
    stageFront.active = false;
    add(stageFront);
    
    MAINLIGHT = new FlxSprite(-470, -150).loadGraphic(Paths.image('stages/Vs Tricky/clown/hue'));
    MAINLIGHT.alpha - 0.3;
    MAINLIGHT.setGraphicSize(Std.int(MAINLIGHT.width * 0.9));
    //MAINLIGHT.blend = "screen";
    MAINLIGHT.updateHitbox();
    MAINLIGHT.antialiasing = true;
    MAINLIGHT.scrollFactor.set(1.2, 1.2);
    add(MAINLIGHT);
    
    add(gf);
    add(dad);
    add(boyfriend);
    add(comboGroup);
}