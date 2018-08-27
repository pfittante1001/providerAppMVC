//Chris - clears provider markers when new entry is sent
function ClearMap() {
    var layers = fg.getLayers();

    for (var i = 0; i < layers.length; i++) {

        fg.removeLayer(layers[i]);
    }
}