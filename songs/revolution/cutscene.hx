function postCreate() {
    startVideo(Paths.video("revolution"), null, function() {
        game.startCutscene(null, function() close());
    });
}