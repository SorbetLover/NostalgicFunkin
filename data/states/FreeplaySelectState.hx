var bg:FlxSprite = new FlxSprite();
function create() {
    FlxG.mouse.visible = true;
    var spongSpr = new FlxSprite().loadGraphic(Paths.image("spong")).screenCenter();
    FlxTween.tween(spongSpr, {angle: this.angle - 5}, Conductor.crochet / 2000, {ease: FlxEase.circOut, type: FlxTween.PINGPONG});
    var checkText = new FunkinText(spongSpr.width / 1.9, spongSpr.y - 50, FlxG.width - 32, "Hi Squidward!", 42);
    add(checkText);
    add(spongSpr);

    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/squrefreeplaybg"));
    bg.antialiasing = true;
    // add(bg);
}

function update() {
    if (controls.BACK) {
        // CoolUtil.playMenuSFX(CANCEL, 0.7);
        FlxG.switchState(new MainMenuState());
    }
}