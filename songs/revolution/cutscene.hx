function create() {
    game.startCutscene("_", null, function() {
        game.startCutscene(null, function() close());
    });
}