/*
 * Open Settings
 */
document.getElementById('btn-settings').addEventListener('click', () => {
    // Load settings
    getSettings().then((data) => {
        // TODO: Set fields
        console.log(data);

        //Goto settings
        document.getElementById('main').classList.remove("invalid");
        document.getElementById('main').classList.remove("running");
        document.getElementById('main').classList.add("settings");
    });
});

document.getElementById('btn-audio-device-refresh').addEventListener('click', () => {
    getAudioDevices().then((data) => {
        // TODO: Set fields
        console.log(data);
    });
});

document.getElementById('btn-update').addEventListener('click', () => {
    // Load settings
    setSettings({ /*TODO*/ }).then((data) => {
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
        // document.getElementById('main').classList.remove("invalid");
        // document.getElementById('main').classList.remove("running");
        // document.getElementById('main').classList.remove("settings");
    });
});


// Listen for the event.
window.addEventListener('appError', (e) => {
	document.getElementById('main').classList.add("invalid");
    document.getElementById('main').classList.remove("running");
    document.getElementById('main').classList.remove("settings");
}, false);