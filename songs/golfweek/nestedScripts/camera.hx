public var hardCamera = false;//haha *insert cock joke*
public var posX = 0;
public var posY = 0;
public var leanX = 0;
public var leanY = 0;

function onCameraMove(event){
    event.cancel();
    if(hardCamera)
	    camFollow.setPosition(posX, posY);
    else
	    camFollow.setPosition(event.position.x, event.position.y);

    camFollow.x += leanX;
    camFollow.y += leanY;
}

public function cameraLeanTo(x,y){
    leanX = x;
    leanY = y;
}

public function foucsON(objectName:String){
    cameraLeanTo(0,0);

    if(objectName=='dad'||objectName=='boyfriend'||objectName=='gf'){
        hardCamera = false;
        executeEvent({name:"Camera Movement",params:[objectName=='dad'?0:(objectName=='gf'?2:1)]});
    }

    if(objectName=='hole')
        cameraLeanTo(0,-200);
    
    if(objectName=='both'){
        hardCamera = true;

        var dadPos = dad.getCameraPosition();
        var bfPos = boyfriend.getCameraPosition();

        posX = (dadPos.x+bfPos.x)/2;
        posY = (dadPos.y+bfPos.y)/2;
    }

    if(objectName == 'miku'){
        foucsON('gf');
        cameraLeanTo(200,0);
    }
}