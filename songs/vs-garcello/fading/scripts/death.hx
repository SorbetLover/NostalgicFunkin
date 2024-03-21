function stepHit(curStep:Int) {
    switch(curStep)
	{
		case 240:
            dad.playAnim('garTightBars', true);
            new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				dad.alpha -= 0.05;
				iconP2.alpha -= 0.05;

				if (dad.alpha > 0)
				{
					tmr.reset(0.1);
				}
			});
		case 247:
            dad.playAnim('garTightBars', true);
	}
}