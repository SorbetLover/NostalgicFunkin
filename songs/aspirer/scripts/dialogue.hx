function create() importScript("data/scripts/scrollSpeed toggle");

function postCreate()
	PlayState.instance.update(0);
	// trace("dsadsad");
	if (playCutscenes)
		playCutscenes = true;