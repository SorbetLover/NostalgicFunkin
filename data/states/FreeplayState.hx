import flixel.text.FlxTextBorderStyle;

var modBg_img_name:String = "default";
var currentWeek:String = null;

var modBg:FlxSprite = new FlxSprite();
var modBgPrev:FlxSprite = new FlxSprite();

var modTitle:FlxText = new FlxText(440, 5, 700);

function create() {
    switchBG("default");
}

function postCreate() {
    modBg.antialiasing = true;
    modBg.blend ="overlay";
    insert(members.indexOf(bg) + 1, modBg);
    insert(members.indexOf(bg) + 1, modBgPrev);
    modBgPrev.alpha = 0;


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
    if (currentWeek != null || songs[curSelected].week != null) currentWeek = songs[curSelected].week;
    modTitle.text = "Mod: " + currentWeek;
    modBgPrev.color = modBg.color;
    changeSelection( (FlxG.mouse.wheel > 0 ? -1 : 0) + (FlxG.mouse.wheel < 0 ? 1 : 0) );
}

function switchBG(bgName:String) {
    modBgPrev.loadGraphic(Paths.image("menus/freeplay/" + modBg_img_name));
    modBgPrev.alpha = 0.7;
    modBg.alpha = 0;
    FlxTween.tween(modBgPrev, { alpha: 0 }, 0.3, { ease: FlxEase.circOut });
    FlxTween.tween(modBg, { alpha: 0.7 }, 0.3, { ease: FlxEase.circIn });
    modBg_img_name = bgName;
    modBg.loadGraphic(Paths.image("menus/freeplay/" + bgName));
}