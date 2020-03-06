/*
 * Portmap webserver test
 */

var Client = require('ssh2').Client;
var http = require('http');
var fs = require('fs');
var path = require('path');

/*
 * Configuration
 */

conf = {
	path: __dirname + "/../site/",
	passCode: "1234",
	usePortmap: true,
	blockIP: true,
	webserver: {
		host: "localhost",
		port: 34538
	},
	ssh: {
		host: "wasalm-34538.portmap.io",
		port: 22,
		username: "wasalm.first",
		privateKey: `-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAxj607vwuNJrHgYvd501HBTsDDzA84As0SSlYuuGixC+8mrHA
LHQmUVSmmpa5AH7GtyDUjcjd0DqpaBUs20BQE+FyDPY/NazX1OR0P/Acgi6Ntjry
Uharx1gnmf/REyuUG9btkIKGXbd0B3jfLOLOUuYr/JH0gNWh9jKKxzYlZZbjZ7VB
2TeoJ7WE8eFNX4cXC7aJiJlX9wbGOOvyjOBUswcCsyefvvDX66POthjDvbPvlTdc
Ht/b/+e/GiVdRZUyUCyc9NTmhUIBlO2xONGvM1yrR2VC7G987VzmmG3H9kAGdxSR
Yq1K8ir5vUaiiVcNj1KHZEDJuTSh+4T/FpudYwIDAQABAoIBAD31rVEgSkSwt3ga
weEf+vl8hylBF1WiytWu8Yd/LAMLNHRY58o9BxjWTzfzsaCg/vSPcz9ZL1J8cyQP
sjRYdm6wQJgigoEBI3fraxXsssxRRoNVCxVy9n9YYxAzryHBtgm5dAh9cwdpZf9L
3NzHilrIi6jl6Tg3DObIxy0aFDgakuh3eMGG5wna7UXLV9h5EMAhL6hmTc14aRln
H80cSdhgwn1Ilhun+vOovSQBU7Ecm3DOa6Be1Tp1ZKlz0PDNnIS9EjalQZx4oNv9
lgH0ckpF/K1h5dvB68Zt2rtGD3CaF9GJMnSr/tDHyiJJlUW38y9XCK24v5+YBiBQ
ldFd4KECgYEA4cTsHNxEmrklXXwrwqVpw8iI2dJ/avCJLNpjqPgnO3hAw/Zga7Pr
hPM0bS9EiAuA2Z5C8E56lPYjilv2TRYos5NpNGk9R8PrR24d338fNerYc6+05htK
4gEhENLOHW9RQY1oO+h22PEZYmCl13QrW4LIKFfGLUcMJU3TnJkcuJMCgYEA4MpJ
pdtSNNqpAusr93A5+xKpTvSns9yOfVAugrHUhSSYV0iE66z1XmxcBhfgf2fbURad
R0wIxWQYbf+7E0btDBZXwyKzpnuFYPHGyHhQRcgk8bkgd9eh3h7+USovwtcaDr59
5z7EB+9dHmdRTEXCwxfGDMBY5jSyUgFoxMn2mfECgYBzo4nMvoXlOjAJUjCX4mHq
Bi0SZN8ex1V7w+CIC5MMwutpdCivAdkAoBGaWzue80VsMcPXklr3MZvCopflpBP0
5uxcDAt3VsKMM7rZXyN9WmzD1JuzwQb5+9oT4+Xu7bWQ/f0FsmwtclCuMxK+6KHM
nZAoGc1II7v034gkDcjIQQKBgBg7lm7r0tPh0qB+67F0BrwbSec6Fq4cE7xMnYb3
Vrq3tDiMl8+0SItSUSVTA5+YeZsnPfNGrhdhcATDsc4lMj7AVduybP2AiWNnDQ/l
cHnlVp48X9SriUahvrbPPnDZsXRvcrEwIf/c/QPfDXOUfad8c5xCTBMdETAn+Lxm
LVBxAoGBAMXKbTqHyOvrTU8VBZLbQYWhE900IFnCzGcTbw2f19puHEvbajqDj4JS
Wl+6xGcsYglYVQNd/M1L3GtGQGZczmNPqs6HA43j4J3QwVfIiWbsZWOyBUdFUR4P
yHDnhAT3SACPJFgMCzljZS3re8Tg/AananFuO7vWGSEr12zaKjnt
-----END RSA PRIVATE KEY-----`
	}
}


/*
 *	Webserver
 */

var blockedIPs = [];

var http = require('http');
httpServer = http.createServer(function (req, res) {

	if(req.url.startsWith("/" + conf.passCode + "/")) {
		req.url = req.url.substring(conf.passCode.length+1);
	} else {
		if(req.url != "/favicon.ico") {
			blockedIPs.push(req.socket.sshSocketInformation.srcIP);
		}
		res.writeHead(403, {'Content-Type': 'text/plain'});
  		res.end("Forbidden", () => {
  			req.socket.destroy();
  		});
  		return;
	}

	if(req.url == "/") {
		req.url = "/index.html";
	}

	var filePath = path.join(path.normalize(conf.path), path.normalize(req.url));

	var extname = path.extname(filePath);
    var contentType = 'text/html';
    switch (extname) {
        case '.js':
            contentType = 'text/javascript';
            break;
        case '.css':
            contentType = 'text/css';
            break;
        case '.png':
            contentType = 'image/png';
            break;      
        case '.jpg':
            contentType = 'image/jpg';
            break;
        case '.m3u8':
        	contentType = 'application/x-mpegURL';
        	break;
        case '.ts':
        	contentType = 'video/MP2T';
        	break;
    }

    fs.readFile(filePath, function(error, content) {
        if (error) {
            if(error.code == 'ENOENT'){
                res.writeHead(404, { 'Content-Type': contentType });
                res.end("Not found.");	
            }
            else {
                res.writeHead(500);
                res.end('Sorry, check with the site admin for error: '+error.code+' ..\n');
                res.end(); 
            }
        }
        else {
            res.writeHead(200, { 'Content-Type': contentType });
            res.end(content, 'utf-8');
        }
    })

});

if(conf.usePortmap) {
	var conn = new Client();
	conn.on('ready', function() {
		console.log('Client :: ready');
		
		conn.forwardIn(conf.webserver.host, conf.webserver.port, function(err) {
			if (err) throw err;
			console.log('Listening for connections on server on http://' + conf.ssh.host + ":" + conf.webserver.port + ".");
		});
	}).on('tcp connection', function(info, accept, reject) {
		if(blockedIPs.indexOf(info.srcIP) != -1 && conf.blockIP) {
			console.log("Blocked connection");
			reject();
		} else {
			socket = accept();
			socket.sshSocketInformation = info;
			httpServer.emit("connection", socket);
		}
	}).connect(conf.ssh);
} else {
	httpServer.listen(conf.webserver.port);
}