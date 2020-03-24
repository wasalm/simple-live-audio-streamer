/*
 * Open Settings
 */

var intervalAlive;
var checkAlive = false;

function isAlive() {
    if(checkAlive){
        isStreaming().then(function(state) {
            if(checkAlive){
                if(!state) {
                    //Something went wrong
                    checkAlive = false;
                    clearInterval(intervalAlive);

                    stopStream();
                    document.getElementById('main').classList.add("invalid");
                    document.getElementById('main').classList.remove("running");
                    document.getElementById('main').classList.remove("settings");
                }
            }
        });
    }
}

function refreshAudiodevices(data, currentVal) {
    var select = document.getElementById("audio-device");
    select.innerHTML = "";

    if(data.length == 0) {
    	var el = document.createElement("option");
		el.value = -1;
		el.textContent = "No audio devices found";
		select.appendChild(el);
    }	else {
    	var selectedIndex = -1;
    	for(var i=0; i< data.length; i++) {
    		var el = document.createElement("option");
    		el.value = data[i].id;
    		el.textContent = data[i].name;

    		if(data[i].id == currentVal) {
    			selectedIndex = i;
    		}
    		select.appendChild(el);
    	}

    	if(selectedIndex != -1) {
    		select.selectedIndex = selectedIndex;
    	}
    }
}

document.getElementById('btn-settings').addEventListener('click', function() {
    // Load settings
    getSettings().then(function(config) {
    	getAudioDevices().then(function(devices) {
			refreshAudiodevices(devices,config.audioDevice);

	    	document.getElementById("audio-channels").checked = config.audioChannels;
	    	document.getElementById("audio-channels-left").value = config.audioChannelsLeft;
	    	document.getElementById("audio-channels-right").value = config.audioChannelsRight;

	    	document.getElementById("audio-volume").checked = config.audioVolume;
	    	document.getElementById("audio-volume-val").value = config.audioVolumeVal;

	    	switch(config.audioBitrate) {
	    		case 32:
	    			document.getElementById("audio-bitrate").selectedIndex = 0;
	    			break;
	    		case 96:
	    			document.getElementById("audio-bitrate").selectedIndex = 1;
	    			break;
	    		case 128:
	    			document.getElementById("audio-bitrate").selectedIndex = 2;
	    			break;
	    		case 192:
	    			document.getElementById("audio-bitrate").selectedIndex = 3;
	    			break;
	    		case 256:
	    			document.getElementById("audio-bitrate").selectedIndex = 4;
	    			break;
	    		case 320:
	    			document.getElementById("audio-bitrate").selectedIndex = 5;
	    			break;
	    		default:
	    		document.getElementById("audio-bitrate").selectedIndex = 3;
	    	}

	    	document.getElementById("webserver-host").value = config.webserverHost;
	    	document.getElementById("webserver-port").value = config.webserverPort;

	    	document.getElementById("proxy").checked = config.proxy;
	    	document.getElementById("proxy-user").value = config.proxyUser;
	    	document.getElementById("proxy-host").value = config.proxyHost;
	    	document.getElementById("proxy-port").value = config.proxyPort;
	    	document.getElementById("proxy-key").value = config.proxyKey;

	    	// Update screen
	        updateSettingsScreen();

	        //Goto settings
	        document.getElementById('main').classList.remove("invalid");
	        document.getElementById('main').classList.remove("running");
	        document.getElementById('main').classList.add("settings");
	    });
    });
});

document.getElementById('btn-audio-device-refresh').addEventListener('click', function() {
	getAudioDevices().then(function(data) {
		var select = document.getElementById("audio-device");
		var currentOption = select.options.item(select.selectedIndex).value;
		refreshAudiodevices(data,currentOption);
    });
});

document.getElementById('btn-update').addEventListener('click', function() {
    var config = {
    	"audioDevice": document.getElementById("audio-device").options.item(document.getElementById("audio-device").selectedIndex).value,
    	
    	"audioChannels": document.getElementById("audio-channels").checked,
    	"audioChannelsLeft": parseInt(document.getElementById("audio-channels-left").value),
    	"audioChannelsRight": parseInt(document.getElementById("audio-channels-right").value),

    	"audioVolume": document.getElementById("audio-volume").checked,
    	"audioVolumeVal": parseInt(document.getElementById("audio-volume-val").value),
    	
    	"audioBitrate": parseInt(document.getElementById("audio-bitrate").value),

    	"webserverHost": document.getElementById("webserver-host").value,
    	"webserverPort": parseInt(document.getElementById("webserver-port").value),

    	"proxy": document.getElementById("proxy").checked,
    	"proxyUser": document.getElementById("proxy-user").value,
    	"proxyHost": document.getElementById("proxy-host").value,
    	"proxyPort": parseInt(document.getElementById("proxy-port").value),
    	"proxyKey": document.getElementById("proxy-key").value
    };

    setSettings(config).then(function(data) {
        //Show Main
        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.remove("running");
        document.getElementById('main').classList.remove("settings");
    });
});


document.getElementById('btn-start').addEventListener('click', function() {
    startStream({
    	title: document.getElementById("info-title").value,
    	speaker: document.getElementById("info-speaker").value,
    	text: document.getElementById("info-text").value
    }).then(function(data) {
        checkAlive = true;
        intervalAlive = setInterval(isAlive, 1000);

        qrLinks = data;
        showQrCode(false);

        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.add("running");
        document.getElementById('main').classList.remove("settings");
    });
});

document.getElementById('btn-stop').addEventListener('click', function() {
    checkAlive = false;
    clearInterval(intervalAlive);

    stopStream().then(function() {
        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.remove("running");
        document.getElementById('main').classList.remove("settings");
    });
});
