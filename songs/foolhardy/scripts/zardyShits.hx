var sway:Float = 0;
var swayDir:Bool = false;
var swaying = false;
function update(elapsed:Float)
{
    if (swaying)
    {
        if (sway < 0.4 && !swayDir)
        {
            sway += 0.01;
            if (sway >= 0.4)
                swayDir = !swayDir;
        }
        else if (sway > -0.4 && swayDir)
        {
            sway -= 0.01;
            if (sway <= -0.4)
                swayDir = !swayDir;
        }

        for (i in 0...playerStrums.members.length)
            playerStrums.members[i].x += sway;
        for (i in 0...cpuStrums.members.length)
            cpuStrums.members[i].x += sway;
    }
}

function stepHit(curStep:Int) {
    switch(curStep)
	{
		case 2426:
			swaying = true;
		case 2427 | 2428 | 2429 | 2430:
            if (!FlxG.save.data.shakeShit)
			    FlxG.camera.shake(0.05);
			dad.alpha -= 0.05;
		case 2432 | 2434 | 2435 | 2436 | 2437 | 2438 | 2439 | 2440:
			dad.alpha = 0.6;
			FlxG.camera.stopFX();
		case 2943 | 2946 | 2948 | 2950 | 2452 | 2454:
			dad.alpha -= 0.2;
	}
}