import funkin.backend.scripting.events.PlayAnimEvent;
import funkin.backend.system.Logs;

function onEvent(eventEvent) {
    if (eventEvent.event.name == "changeAnimationIndex") {
        Logs.trace("This event is deprecated. Use CNE's built-in 'Alt Animation Toggle' instead.", 1);
    }
}
