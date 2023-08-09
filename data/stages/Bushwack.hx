function postCreate() {
	gf.kill();
}

function postUpdate(elapsed:Float) {
    switch (curCameraTarget) {
		case 0:
			defaultCamZoom = 0.7;
		case 1:
        	defaultCamZoom = 0.75;
	}
}