import flixel.text.FlxTextBorderStyle;

var modBg_img_name:String = "default";
var currentWeek:String = "";
var modBg:FlxSprite = new FlxSprite();
var modTitle:FlxText = new FlxText(440, 5, 700);
// var tipText:FlxText = new FlxText(FlxG.width * 0.7, 100, 700);

function postCreate() {
    // Will be used later for tips on songs and a tip for the ability to scroll in freeplay
    // var boxPage = new FlxSprite(scoreText.x - 7, 100).makeGraphic(400, 200, 0xFF000000);
    // boxPage.updateHitbox();
    // boxPage.alpha = 0.6;
    // add(boxPage);

    modBg.antialiasing = true;
    modBg.blend ="overlay";
    insert(members.indexOf(bg) + 1, modBg);
    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/squrefreeplaybg"));
    modBg.color = FlxColor.fromString("#050505");
    for (a in [bg, modBg]) {
        a.alpha = 0.7;
    }

    modTitle.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    modTitle.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    modTitle.antialiasing = true;
    add(modTitle);
}

function postUpdate() {
    if (currentWeek != null || songs[curSelected].week != null)
        currentWeek = songs[curSelected].week;

    if (modBg_img_name != null || songs[curSelected].BG != null)
        modBg_img_name = songs[curSelected].BG;

    if (modBg_img_name == null) modBg_img_name = "default";
    modTitle.text = "Mod: " + currentWeek;
    
    modBg.loadGraphic(Paths.image("menus/freeplay/" + modBg_img_name));
    changeSelection( (FlxG.mouse.wheel > 0 ? -1 : 0) + (FlxG.mouse.wheel < 0 ? 1 : 0) );
}