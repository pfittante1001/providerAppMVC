//Chris - goes to customer controller to Get Snow Providers function and passes info to AddMarkersToMap function

var providers;
function LoadProviders(text) {
    $.post('/Customers/GetSnowProviders', { text: text }, function (providers) {

        console.log(providers);
        providers = providers;
        addMarkersToMap(providers);
        document.getElementById('slide').style.display = "Flex";
        document.getElementById('slideTwo').style.display = "Flex";

    });
}