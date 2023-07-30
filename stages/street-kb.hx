function beatHit(curBeat:Int) {
	if (curBeat == 1){
		TV.playAnim("anim1", true);
	}
	if (curBeat == 240){
		TV.alpha = 1;
		TV2.alpha = 0.0001;
	}
}
function stepHit() {
	if (curStep == 758){
		TV.alpha = 0.0001;
		TV2.alpha = 1;
	}
}