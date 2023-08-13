import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxTextBorderStyle;

var boxPage:FlxSprite;

var weekBg:String = "default";
var currentWeek:String;
var freeplayText:FlxText;
// var indexs:Array = [5, 9, 15];

function create() {
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

}

function postCreate() {
    freeplayText = new FlxText(490, 5, 700);
    freeplayText.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    freeplayText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    freeplayText.antialiasing = true;
    add(freeplayText);
}

function postUpdate() {
    // trace(songs[curSelected].name + " || " + currentWeek);

    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/freeplay/" + weekBg));
    freeplayText.text = "Current week: " + currentWeek;

    switch(songs[curSelected].name) {
        case "tutorial-b" | "bopeebo-b" | "fresh-b" | "dadbattle-b" | "spookeez-b" | "south-b" | "pico-b" | "philly-b" | "blammed-b" | "satin-panties-b" | "high-b" | "milf-b":
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
    // if (FlxG.keys.justPressed.E && curSelected != null) {
    //     changeSelection(3);
    // }

    // else if (FlxG.keys.justPressed.Q && curSelected != null) {
    //     changeSelection(-3);
    // }
    changeSelection( (FlxG.keys.justPressed.Q ? -3 : 0) + (FlxG.keys.justPressed.E ? 3 : 0) );
}