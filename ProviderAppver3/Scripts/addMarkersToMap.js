//Chris - This concats a url that pulls an array of customer details back then sends to CreateCustMarker function

function addMarkersToMap(providers) {
    var RequestUrl = 'www.mapquestapi.com/geocoding/v1/batch?&inFormat=kvp&outFormat=json&thumbMaps=false&maxResults=1&location=';
    for (var i = 0; i < providers.length; i++) {
        if (i == 0) {
            RequestUrl += providers[i].Description;
        }
        else {
            RequestUrl += '&location=' + providers[i].Description;
        }
        console.log(providers[i].Description)
    }
    RequestUrl += '&key=b13zAYNPuUz6uaAeUCrHk3BvhAt0UnR6'
    console.log(RequestUrl);
    var OurRequest = new XMLHttpRequest()
    OurRequest.open('Get', 'http://' + RequestUrl)
    OurRequest.onload = function () {
        var custdata = JSON.parse(OurRequest.responseText);
        console.log(custdata)
        CreateCustMarker(custdata, providers);
    };
    OurRequest.send();
};
var icon;
var fg = L.featureGroup();
