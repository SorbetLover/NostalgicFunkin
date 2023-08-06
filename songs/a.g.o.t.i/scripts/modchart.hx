function postUpdate(elapsed) {
	for(s in strumLines) {
		for(i in 0...4) {
			var n = s.members[i];
			n.y = Math.sin(curBeatFloat + (i * -0.45)) * -30;
			//n.x += Math.sin(curBeatFloat + (i * -120));// * -10;
		}
	}

	
	// for(s in strumLines) {
	// 	for(i in 0...4) {
	// 		var n = s.members[i];
	// 		n.y = FlxG.height - 200;
	// 		n.angle = 180;
	// 	}
	// }
    
    // if (curSection != null)
    //     defaultCamZoom = curSection.mustHitSection ? 0.9 : 0.5;
}