function beatHit(curBeat:Int) {
	if (curBeat == 43){
        TV10.alpha = 0.0001;
        TV13.alpha = 1;
	}
    if (curBeat == 19){
        TV13.alpha = 0.0001;
        TV12.alpha = 1;
    }
}
function stepHit(curStep:Int) {
    if (curStep == 86){
        TV12.alpha = 0.0001;
        TV11.alpha = 1;
    }
}
function onDadHit() {
    if (health > 0.1) {health -= 0.01;}
}