function onEvent(eventEvent) {
    if (eventEvent.event.name == "Change Signature Time") {
            Conductor.beatsPerMesure = eventEvent.event.params[0];
            Conductor.stepsPerBeat = eventEvent.event.params[1];
    }
}