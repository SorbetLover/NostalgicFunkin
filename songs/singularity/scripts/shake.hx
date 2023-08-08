function postUpdate() {
    switch (strumLines.members[0].characters[0].getAnimName()) {
        case "singLEFT-alt": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            if (health > 0.1) {health -= 0.0020;}
        case "singDOWN-alt": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            if (health > 0.1) {health -= 0.0020;}
        case "singUP-alt": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            if (health > 0.1) {health -= 0.0020;}
        case "singRIGHT-alt": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            if (health > 0.1) {health -= 0.0020;}
    }
}
/*function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = 1;
    else if(curCameraTarget == 1)
            defaultCamZoom = 0.85;
    if(curCameraTarget == 2)
        defaultCamZoom = 1.1;
}*/