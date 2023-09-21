import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxTextBorderStyle;

// var boxPage:FlxSprite;

var modBg_img_name:String = "default";
var currentWeek:String;

var modBg:FlxSprite = new FlxSprite();

var modBgPrev:FlxSprite = new FlxSprite();
var modTitle:FlxText;

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

    modTitle = new FlxText(440, 5, 700);
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

    modTitle.text = "Current week: " + currentWeek;

    switch(songs[a.value].name) {
        case "tutorial-b" | "bopeebo-b" | "fresh-b" | "dadbattle-b" | "spookeez-b" | "south-b" | "pico-b" | "philly-b" | "blammed-b" | "satin-panties-b" | "high-b" | "milf-b" | "cocoa-b" | "eggnog-b" | "winter-horrorland-b" | "senpai-b" | "roses-b" | "thorns-b":
            currentWeek = "B Sides";
            switchBG("default");

        case "lo-fight" | "overhead" | "ballistic" | "remorse":
            currentWeek = "Vs Whitty";
            switchBG("whitty");

        case "carol-roll" | "body" | "boogie":
            currentWeek = "Vs Carol";
            switchBG("default");

        case "my-battle" | "last-chance" | "genocide":
            currentWeek = "Vs Tabi";
            switchBG("tabi");

        case "foolhardy" | "Bushwhack":
            currentWeek = "Vs Foolhardy";
            switchBG("foolhardy");

        default:
            currentWeek = "some other week";
            switchBG("default");
    }

}

function postUpdate() {
    // trace(songs[curSelected].name + " || " + currentWeek);
    modBgPrev.color = modBg.color;
    changeSelection( (FlxG.keys.justPressed.Q ? -3 : 0) + (FlxG.keys.justPressed.E ? 3 : 0) );
}

function switchBG(bgName:String) {
    modBgPrev.loadGraphic(Paths.image("menus/freeplay/" + modBg_img_name));
    modBgPrev.alpha = 1;
    modBg.alpha = 0;
    FlxTween.tween(modBgPrev, { alpha: 0 }, 0.3, { ease: FlxEase.circOut });
    FlxTween.tween(modBg, { alpha: 1 }, 0.3, { ease: FlxEase.circIn });
    modBg_img_name = bgName;
    modBg.loadGraphic(Paths.image("menus/freeplay/" + bgName));
}