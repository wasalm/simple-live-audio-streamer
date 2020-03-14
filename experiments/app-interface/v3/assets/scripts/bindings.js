/*
 * Open Settings
 */

function refreshAudiodevices(data, currentVal) {
    let select = document.getElementById("audio-device");
    select.innerHTML = "";

    if(data.length == 0) {
    	var el = document.createElement("option");
		el.value = -1;
		el.textContent = "No audio devices found";
		select.appendChild(el);
    }	else {
    	let selectedIndex = -1;
    	for(let i=0; i< data.length; i++) {
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

document.getElementById('btn-settings').addEventListener('click', () => {
    // Load settings
    getSettings().then((config) => {
    	getAudioDevices().then((devices) => {
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

document.getElementById('btn-audio-device-refresh').addEventListener('click', () => {
	getAudioDevices().then((data) => {
		let select = document.getElementById("audio-device");
		let currentOption = select.options.item(select.selectedIndex).value;
		refreshAudiodevices(data,currentOption);
    });
});

document.getElementById('btn-update').addEventListener('click', () => {
    let config = {
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
    setSettings(config).then((data) => {
        //Show Main
        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.remove("running");
        document.getElementById('main').classList.remove("settings");
    });
});


document.getElementById('btn-start').addEventListener('click', () => {
    startStream(
    	document.getElementById("info-title").value,
    	document.getElementById("info-speaker").value,
    	document.getElementById("info-text").value,
    ).then((data) => {
        qrLinks = data;
        showQrCode(false);

        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.add("running");
        document.getElementById('main').classList.remove("settings");
    });
});

document.getElementById('btn-stop').addEventListener('click', () => {
    stopStream().then(() => {
        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.remove("running");
        document.getElementById('main').classList.remove("settings");
    });
});

document.onkeyup = (e) => {
	console.log(e.which);
	console.log(e);
  if (e.which == 99 && e.keyIdentifier == "Meta") {
    console.log("Cmd + Q is pressed");
  } else if(e.which == 91 && e.keyIdentifier == "Meta") {
    console.log("Cmd + W is pressed");
  } 
};


// Listen for the event.
window.addEventListener('appError', (e) => {
	document.getElementById('main').classList.add("invalid");
    document.getElementById('main').classList.remove("running");
    document.getElementById('main').classList.remove("settings");
}, false);