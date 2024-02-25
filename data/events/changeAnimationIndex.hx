function onEvent(eventEvent) {
    if (eventEvent.event.name == "changeAnimationIndex") {
		var strLine = strumLines.members[eventEvent.event.params[0]];
		strLine.animSuffix = eventEvent.event.params[1];
    }
}