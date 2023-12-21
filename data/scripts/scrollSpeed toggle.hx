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
    if (FlxG.keys.justPressed.E && scrollSpeed < 4) scrollSpeed += 0.1; // Only increase the the scroll speed if it's less than 4
    if (FlxG.keys.justPressed.Q && scrollSpeed > 0.2) scrollSpeed -= 0.1; /*Only decrease the the scroll speed if it's more than 0.2*/
}