document.getElementById("audio-channels").addEventListener("change", updateSettingsScreen);
document.getElementById("proxy").addEventListener("change", updateSettingsScreen);


function updateSettingsScreen() {
	document.getElementById("audio-channels-left").disabled = !document.getElementById("audio-channels").checked;
	document.getElementById("audio-channels-right").disabled = !document.getElementById("audio-channels").checked;

	document.getElementById("proxy-user").disabled = !document.getElementById("proxy").checked;
	document.getElementById("proxy-host").disabled = !document.getElementById("proxy").checked;
	document.getElementById("proxy-port").disabled = !document.getElementById("proxy").checked;
	document.getElementById("proxy-key").disabled = !document.getElementById("proxy").checked;
	document.getElementById("webserver-host").disabled = !document.getElementById("proxy").checked;


	if(document.getElementById("proxy").checked) {
		document.getElementById("proxy-user").parentNode.classList.remove("disabled");
		document.getElementById("proxy-port").parentNode.classList.remove("disabled");
	} else {
		document.getElementById("proxy-user").parentNode.classList.add("disabled");
		document.getElementById("proxy-port").parentNode.classList.add("disabled");
	}
}

updateSettingsScreen();