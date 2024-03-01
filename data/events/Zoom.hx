function onEvent(eventEvent) {
    if (eventEvent.event.name == "Zoom") {
        if(eventEvent.event.params[1] == "0" || eventEvent.event.params[1] == null)
            defaultCamZoom = eventEvent.event.params[0];
        else
            FlxTween.tween(FlxG.camera,{zoom:eventEvent.event.params[0]},eventEvent.event.params[1],{
                ease:FlxEase.sineInOut,
                onComplete:function(_)defaultCamZoom = FlxG.camera.zoom
            });
    }
}