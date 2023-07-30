function onEvent(eventEvent) {
    if (eventEvent.event.name == "Zoom") {
            defaultCamZoom = eventEvent.event.params[0];
    }
}