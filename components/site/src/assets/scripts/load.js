fetch('api/details.json')
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        
        // Step one fill in data
        document.getElementById("title").innerHTML = data.sermon.title;
        document.getElementById("subtitle").innerHTML = data.sermon.speaker + " &middot; " + data.sermon.text;

        loadPlayer(data.audio.src);

        if(document.getElementById("qrcode")) {
        	loadQRCode(data.links.live);
        }
    });