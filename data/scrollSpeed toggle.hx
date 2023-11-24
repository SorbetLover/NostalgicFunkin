import flixel.text.FlxText.FlxTextAlign;
var scrollSpeedText:FunkinText;

function postCreate() {
    scrollSpeedText = new FunkinText(Std.int(healthBarBG.width / 1.75), healthBarBG.y - 100, 600, "", 24);
    scrollSpeedText.alignment =  FlxTextAlign.CENTER;
    scrollSpeedText.cameras = [camHUD];
    add(scrollSpeedText);
}

function postUpdate() {
    scrollSpeedText.text = "Press E/Q to change the scroll speed.\nCurrent scroll speed:" + scrollSpeed;
    if (FlxG.keys.justPressed.E && scrollSpeed < 6) scrollSpeed += 0.1;
    if (FlxG.keys.justPressed.Q && scrollSpeed > 0.1) scrollSpeed -= 0.1;
    else if (scrollSpeed < 0.1) scrollSpeed = 0.1;
}