function create() importScript("data/scrollSpeed toggle");

function beatHit() {
    switch (curBeat) {
        case 240:
            dad.playAnim("fallOver", true);
        case 244:
            dad.animation.pause();
    }
}