import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxTextBorderStyle;

// var boxPage:FlxSprite;

var modBg_img_name:String = "default";
var currentWeek:String = null;

var modBg:FlxSprite = new FlxSprite();

var modBgPrev:FlxSprite = new FlxSprite();
var modTitle:FlxText = new FlxText(440, 5, 700);

function postCreate() {
    modBg.antialiasing = true;
    modBg.blend ="overlay";
    insert(members.indexOf(bg) + 1, modBg);
    insert(members.indexOf(bg) + 1, modBgPrev);
    modBgPrev.alpha = 0;
    switchBG("default");


    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/squrefreeplaybg"));
    modBg.color = FlxColor.fromString("#050505");
    for (a in [bg, modBg]) {
        a.alpha = 0.7;
    }

    modTitle.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    modTitle.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    modTitle.antialiasing = true;
    add(modTitle);

    // boxPage = new FlxSprite(scoreText.x - 7, 100).makeGraphic(600, 600, 0xFF000000);
    // boxPage.updateHitbox();
    // boxPage.alpha = 0.6;
    // add(boxPage);
    //     for (i in 0...weeks.length) {
    //     var text:FlxText = new FlxText(scoreText.x - 7, i * 40, 200, weeks[i] + " ");
    //     text.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    //     text.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    //     text.antialiasing = true;
    //     add(text);
    // }
    // FlxTween.tween(modBg, {alpha: 0.7}, 1);
}

function onChangeSelection(a) {
    switch(songs[a.value].name) {
        // format:
        // first ever song of the week/mod, last song of the mod including bonus songs
        case "tutorial-b", "thorns-b": switchBG("default");
        case "lo-fight", "remorse": switchBG("whitty");
        case "carol-roll", "boogie": switchBG("default");
        case "my-battle", "genocide": switchBG("tabi");
        case "foolhardy", "Bushwhack": switchBG("foolhardy");
        case "wocky", "Flatzone": switchBG("kapi");
    }

    switch(songs[a.value].name) {
        case "tutorial-b"
        | "bopeebo-b" | "fresh-b" | "dadbattle-b" 
        | "spookeez-b" | "south-b" 
        |"pico-b" | "philly-b" | "blammed-b" 
        | "satin-panties-b" | "high-b" | "milf-b" 
        | "cocoa-b" | "eggnog-b" | "witner-horroland-b" 
        |"senpai-b" | "roses-b" | "thorns-b":
            currentWeek = "B Sides";

        case "lo-fight" | "overhead" | "ballistic" | "remorse":
            currentWeek = "Vs Whitty";

        case "carol-roll" | "body" | "boogie":
            currentWeek = "Vs Carol";

        case "my-battle" | "last-chance" | "genocide":
            currentWeek = "Vs Tabi";

        case "foolhardy" | "Bushwhack":
            currentWeek = "Vs Foolhardy";

        case "wocky" | "Beathoven" | "Hariball" | "fuzzy-distortion" | "Nyaw" | "Flatzone":
            currentWeek = "Vs Kapi";
    }
    if (currentWeek == null) currentWeek = "unknown week";

}

function update(elapsed) {
    // trace(songs[curSelected].name + " || " + currentWeek);
    modTitle.text = "Current week: " + currentWeek;
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