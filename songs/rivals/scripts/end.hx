function beatHit(curBeat) {
	if (curBeat == 260) {
		boyfriend.playAnim('shoot', true);
		dad.playAnim('die', true);
	}
}