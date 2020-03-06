var dataUriSvgImage = document.createElement("img");
var u = "http://wasalm-34538.portmap.io:34538/1234/index.html";
var s = QRCode.generateSVG(u, {
    ecclevel: "M",
    fillcolor: "#ffffff",
    textcolor: "#000000",
    margin: 6,
    modulesize: 8
});

var XMLS = new XMLSerializer();
s = XMLS.serializeToString(s);
s =  transformQRCode(s);
s = "data:image/svg+xml;base64," + window.btoa(unescape(encodeURIComponent(s)));
dataUriSvgImage.src = s;
document.getElementById("qrcode").appendChild(dataUriSvgImage);

function transformQRCode(s) {

    //Replace colors
    s = s.replace("</style>", ".bg2{fill:#f2f2f2}</style><rect class=\"bg2\" fill=\"none\" x=\"0\" y=\"0\" width=\"1000\" height=\"1000\" mask=\"url(#mask)\"/><mask id='mask'>");
    s = s.replace("</svg>", "</mask></svg>");


    return s;
}