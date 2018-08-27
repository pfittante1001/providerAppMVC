//pete get top ranking of snow providers script
function GetProvRankings(text) {
    $.post('/Customers/GetProvRankings', { text: text }, function (providers) {
        console.log(providers);
        document.getElementById('providerName').innerHTML = providers.providerName
        document.getElementById('providerName1').innerHTML = providers.providerName
        for (var i = 1; i <= providers.maxRating; i++) {
            $("#sRate" + i).attr('class', 'starGlowN');
        }
    });
}