function postCreate(){
    iconP1.visible = false;
    iconP2.y -= 20;
    healthBar.createFilledBar(dad.iconColor,dad.iconColor);
}

function postUpdate()
    iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 1, 0))) - (iconP2.width/2);