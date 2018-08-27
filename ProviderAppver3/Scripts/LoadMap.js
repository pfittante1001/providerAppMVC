function LoadMap(results) {

    L.mapquest.key = 'b13zAYNPuUz6uaAeUCrHk3BvhAt0UnR6';
    // 'map' refers to a <div> element with the ID map
    var baseLayer = L.mapquest.tileLayer('map');
    map = L.mapquest.map('map', {
        center: [results.results[0].locations[0].displayLatLng.lat, results.results[0].locations[0].displayLatLng.lng],
        layers: [baseLayer, fg],
        zoom: 15
    });
    map.addControl(L.mapquest.control());
    var marker = L.mapquest.textMarker([results.results[0].locations[0].displayLatLng.lat, results.results[0].locations[0].displayLatLng.lng], {
        text: '@ViewBag.Name',
        position: 'right',
        type: 'marker',
        icon: {
            primaryColor: '#333333',
            secondaryColor: '#333333',
            size: 'sm'
        }
    });
    marker.addTo(map);
    custLat = results.results[0].locations[0].displayLatLng.lat;
    custLng = results.results[0].locations[0].displayLatLng.lng;
    L.control.layers({
        'Map': baseLayer,
        'Hybrid': L.mapquest.tileLayer('hybrid'),
        'Satellite': L.mapquest.tileLayer('satellite'),
        'Light': L.mapquest.tileLayer('light'),
        'Dark': L.mapquest.tileLayer('dark')
    }).addTo(map);
};
