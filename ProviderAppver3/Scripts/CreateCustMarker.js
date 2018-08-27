
//Chris - This function generates both the provider markers and the text bubbles inside them - looks confusing because in order to put html inside of the popup, the html has to be in a string, but putting it directly into the popup will display the code. This way is the way it works.
function CreateCustMarker(custdata, providers) {
    var MapData = [];
    var Prov = [];
    
    var range = document.getElementById('demo').innerText;
    for (var i = 0; i < providers.length; i++) {
        var providerID = providers[i].ProviderID;
        var proLat = custdata.results[i].locations[0].displayLatLng.lat;
        var proLng = custdata.results[i].locations[0].displayLatLng.lng;
        var unit = "K";
        var Data = {
            ProID: providerID,
            ProLat: proLat,
            ProLng: proLng,
            CustLat: custLat,
            CustLng: custLng,
            Unit: unit,
            Range: range
        };
        MapData.push(Data);
    }

    for (var i = 0; i < providers.length; i++){
        Prov.push(providers[i]);
    }
    
    var model = {
        Prov: Prov,
        MapData: MapData
    };
    var provider = [];
    $.ajax({

        url: '/Customers/GetDist',
        //url: "@Url.Action("GetDist")",
        dataType: 'JSON',
        type: 'POST',
        data: JSON.stringify(model),
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            provider = data.prov.SelectedProv
            for (var i = 0; i < provider.length; i++) {

                icon = L.mapquest.textMarker([custdata.results[i].locations[0].displayLatLng.lat, custdata.results[i].locations[0].displayLatLng.lng], {
                    text: provider[i].ProviderName,
                    position: 'right',
                    type: 'marker',
                    icon: {
                        primaryColor: '#3582ff',
                        secondaryColor: '#ff3535',
                        size: 'sm'
                    }

                });

                //chris - popup contents
                var rate = provider[i].ProviderPhone;
                var rating = rate + '/5 Stars'
                if (rate == 0) {
                    rating = "This Provider has not yet been rated"
                }
                var pid = provider[i].ProviderID;
                console.log(pid)
                var text = provider[i].ProviderName;
                var link = '<a href="/Providers/Details/1" target="_blank" style="font-size:20px">name</a>';
                link = link.replace('name', text);
                link = link.replace('1', pid);
                var button = '<button class="btn btn-danger" onclick="OpenChat(provider)">Get A Quote</button>';
                button = button.replace('provider', pid);
                var premium = '<button class="btn btn-warning" onclick="PaymentProcessed()">Pay Premium</button>';

                icon.addTo(fg);
                icon.bindPopup(link + '<hr/>' + rating + '<br/>' + button + '  OR  ' + premium).addTo(fg);
            }
            document.getElementById('providerName2').innerHTML = data.dist.providerName
        },
        error: function () {
            alert("error");
        },
    });
    //Chris-provider marker style
      
    

    
    
    
}