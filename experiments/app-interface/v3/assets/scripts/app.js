var qrLinks = {};

function showQrCode(share = false) {
	u = qrLinks.liveUrl;
	if(share) {
		u = qrLinks.shareUrl;
	}
    
    s = QRCode.generateSVG(u, {
        ecclevel: "M",
        fillcolor: "#ffffff", //f2f2f2
        textcolor: "#000000",
        margin: 20, //15
        modulesize: 6 //6
    });


    var XMLS = new XMLSerializer();
    s = XMLS.serializeToString(s);
    s = transformQRCode(s);

    s = "data:image/svg+xml;base64," + window.btoa(unescape(encodeURIComponent(s)));
    document.getElementById('qrcode-bg').style.backgroundImage = "url('" + s + "')";
}

function transformQRCode(s) {
    //Replace colors
    s = s.replace("</style>", ".bg2{fill:#f2f2f2}</style><rect class=\"bg2\" fill=\"none\" x=\"0\" y=\"0\" width=\"1000\" height=\"1000\" mask=\"url(#mask)\"/><mask id='mask'>");
    s = s.replace("</svg>", "</mask></svg>");
    return s;
}

document.getElementById('btn-qr-live').addEventListener('click', () => {
	showQrCode(false);
	document.getElementById("btn-qr-live").classList.add("active");
	document.getElementById("btn-qr-share").classList.remove("active");
});

document.getElementById('btn-qr-share').addEventListener('click', () => {
	showQrCode(true);
	document.getElementById("btn-qr-live").classList.remove("active");
	document.getElementById("btn-qr-share").classList.add("active");
});

document.getElementById('btn-cancel').addEventListener('click', () => {
    //Goto main screen
    document.getElementById('main').classList.remove("invalid");
    document.getElementById('main').classList.remove("running");
    document.getElementById('main').classList.remove("settings");
});