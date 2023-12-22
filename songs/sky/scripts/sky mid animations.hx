function beatHit(curBeat:Int) {
	switch(curBeat){
		case 30,31,62,63: dad.playAnim('oh');
		case 126,127,190,191: dad.playAnim('grr');
		case 254,255,270,271: dad.playAnim('huh');
		case 286,287: dad.playAnim('ugh');

		default: 
			if (curBeat < 287) dad.dance();
	}
}