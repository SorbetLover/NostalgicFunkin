function postUpdate() {
    switch (strumLines.members[0].characters[0].getAnimName()) {
        case "singLEFT": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            gf.playAnim("worried", true);
        case "singDOWN": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            gf.playAnim("worried", true);
        case "singUP": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            gf.playAnim("worried", true);
        case "singRIGHT": 
            camera.shake(0.008, 0.08);//, null, true, null);
            camHUD.shake(0.004, 0.08);//, null, true, null);
            gf.playAnim("worried", true);
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