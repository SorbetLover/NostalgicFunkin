function postUpdate() {
    switch (strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": camFollow.x -= 20;
        case "singDOWN": camFollow.y += 20;
        case "singUP": camFollow.y -= 20;
        case "singRIGHT": camFollow.x += 20;
    }
}
function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = 1;
    else if(curCameraTarget == 1)
            defaultCamZoom = 0.85;
    if(curCameraTarget == 2)
        defaultCamZoom = 1.1;
}