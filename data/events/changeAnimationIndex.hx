import funkin.backend.system.Logs;

function onEvent(eventEvent) {
    if (eventEvent.event.name == "changeAnimationIndex") {
        Logs.trace("This event is deprecated. Use CNE's built-in 'Alt Animation Toggle' instead.", 1);
		/*var strLine = strumLines.members[eventEvent.event.params[0]];
		if (strLine != null) {
		    if (strLine.characters != null) // Alt anim Idle
				for (character in strLine.characters) {
					if (character == null) continue;
					character.idleSuffix = eventEvent.event.params[1];
				}
		}*/
    }
}
