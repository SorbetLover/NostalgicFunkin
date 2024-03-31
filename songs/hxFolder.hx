
function create(){
    for(file in Paths.getFolderContent('songs/'+SONG.meta.name.toLowerCase().split('/')[0], true, PlayState.fromMods ? false : null)) 
        importScript(file);
}