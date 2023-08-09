import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxTextBorderStyle;

var boxPage:FlxSprite;
var currentPage:Int = 1;
var weeks:Array<String> = [
    "B Sides",
    "Vs Whitty",
    "Vs Carol",
    "Vs Tabi",
    "Vs Foolhardy"
];

var weekBg:String = "default";
var currentWeek:String;
var freeplayText:FlxText;
// var indexs:Array = [5, 9, 15];

function create() {
    boxPage = new FlxSprite(scoreText.x - 7, 100).makeGraphic(600, 600, 0xFF000000);
    boxPage.updateHitbox();
    boxPage.alpha = 0.6;
    add(boxPage);
}

function postCreate() {
    freeplayText = new FlxText(490, 5, 700);
    freeplayText.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    freeplayText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    freeplayText.antialiasing = true;
    add(freeplayText);
    FlxG.mouse.visible = true;
}

function postUpdate() {
    // for (bleh in weeks)
    //     trace(weeks[bleh]);
    // CoolUtil.loadAnimatedGraphic(bgr, Paths.image("menus/freeplay/square"));
    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/freeplay/" + weekBg));
    freeplayText.text = "Current week: " + currentWeek;
    // trace(songs[curSelected].name + " || " + currentWeek);
    
    // if (currentWeek != null) {
    //         FlxTween.tween(bg, {alpha: 1}, 0.1);
    // }
    //     bg.alpha = FlxMath.lerp(0, 1, 1);
    //     // trace('dsa"');
    // }

    switch(songs[curSelected].name) {
        case "tutorial-b" | "bopeebo-b" | "fresh-b" | "dadbattle-b" | "spookeez-b" | "south-b" | "pico-b" | "philly-b" | "blammed-b":
            currentWeek = "B Sides";
            weekBg = "default";

        case "lo-fight" | "overhead" | "ballistic" | "remorse":
            currentWeek = "Vs Whitty";
            weekBg = "whitty";

        case "carol-roll" | "body" | "boogie":
            currentWeek = "Vs Carol";
            weekBg = "default";

        case "my-battle" | "last-chance" | "genocide":
            currentWeek = "Vs Tabi";
            weekBg = "tabi";

        case "foolhardy" | "Bushwhack":
            currentWeek = "Vs Foolhardy";
            weekBg = "foolhardy";

        default:
            currentWeek = "some other week";
            weekBg = "default";
    }

}

function update(elapsed:Float) {
    // if (FlxG.mouse.overlaps(freeplayText))
    //     {
    //         trace("scheduled");
    //     }
}