function create() importScript("data/scrollSpeed toggle");

function postCreate()
	PlayState.instance.update(0);
	// trace("dsadsad");
	if (playCutscenes)
		playCutscenes = true;