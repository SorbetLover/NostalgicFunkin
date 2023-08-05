function create(){
    sky.scale.set(1.1, 1);
    train.scale.set(1.4, 1.8);
    bgLamp.scale.set(1.1, 1.2);
    floorLamps.scale.set(1.1, 1.2);
}

function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0){
        bgGirls.animation.play("dancing", true);
    }
}