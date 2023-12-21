import funkin.backend.scripting.events.PlayAnimEvent;

var characterAnimationIndex:Array<Array<String>> = [];

function onEvent(eventEvent) {
    if (eventEvent.event.name == "changeAnimationIndex") {
        for(char in strumLines.members[eventEvent.event.params[0]].characters)
            characterAnimationIndex.push([char.curCharacter,eventEvent.event.params[1]]);
    }
}

function onNoteHit(event){
	//event.animCancelled = true;
	var realChars = event.characters;
	event.characters = [];
	for(char in realChars){
		if (char != null){
            var altContext:String = '';
            for(charactersIndex in characterAnimationIndex){
                if(charactersIndex[0] == char.curCharacter){
                    altContext = charactersIndex[1];
                }
            }
			char.playSingAnim(event.direction, altContext);
        }
	}
	//FlxG.camera.flash();
}