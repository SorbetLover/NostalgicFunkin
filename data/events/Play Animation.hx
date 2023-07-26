function onEvent(eventEvent) {
    if (eventEvent.event.name == "Play Animation") {
        for (char in strumLines.members[eventEvent.event.params[0]].characters)
            char.playAnim(eventEvent.event.params[1], eventEvent.event.params[2], null);
    }
}