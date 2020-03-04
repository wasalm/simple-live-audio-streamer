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
		port: 60086
	},
	ssh: {
		host: "wasalm-60086.portmap.io",
		port: 22,
		username: "wasalm.first",
		privateKey: `-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAyebuxosyP8+4wOT68nowTxNkXjFpa69H/wLdQWkVxkLqrV7J
apMVTgx9Z7YuDRVbET+/98fGA8NqFDgQ0a9YaGsEImSkAEnZiUdox0BNZ2/4xeEx
PEnRNhUQW/8Br+2ePAml+FLsd+uB50/WHoH3S8A/DMzZmSfNvfcVxoIwkm800mI/
X0JJMUaFYuHgdhXZDr3SP9AKwTr8yt5Ik62q+njzAAhtZ0fKp4HUfze+uiN3pQTB
DpCJtq3e/LTZpB/hGG7/A2F7M9Rd7gGtUZA7UMAMo5JicEV2pRp9+dfncj+6BdZh
qnHQqxbZYHRVodXPBRNledobJ7dtr/nj8vuKIQIDAQABAoIBAGUxYHWUaIABDXlo
irojMblAX+qx20OEm5IdjmVtVOOEwHhabJsE0wXGTsg/T/9wt68Cg6WdtApI1A8E
NrHRr37OPEk8pdIbMXOTndlXyjPQtCABiRrNaJUxo3xoaCET+F3g/BVlAm3sVLRp
mEi8HQUTesZgmaMghwbyIzDWKaAKRp2XDhtvjcFzycdoMGKGKQxR953h8624STHe
bPsHAcsiqshg46tSToZv8LIgtySSvQflG+sWGAmJ5VOGrm2MQ3shhZsl+uqIG6Rw
0MNvnb/M9jBtirF8Zd/bkgf47q8cieEldJaEEJJ0VH59CKJNlNUeRAVjMplUQmjy
vkXBrb0CgYEA7HzK/6nlbPndpylct9U4pFMy8SflQiB36uIVmnenMmr25PRuEl+L
ajHXdnvwo8SsWHA5hfzkn8F0x9dJB6l9adg54ibDUsV2J9NjhiBJXOlGDYps705g
FQk461GJDidj7n4vcco4UfTL5jxhSvbqC6nHyW0lePIl0Oxl7f+ERFcCgYEA2o+c
GVIS0Yf+C7ERcHcZ5CJTaXQOx0o+ieBumALCFx9cWXr0SW4tMyIm+tZaAr/UdmO3
/VFkj7+iTHuolJITnVvmBDR+v6/9qVhlG/2v8y3SKLSv/WKDUWld3CvZvEKwZFX4
7c2PtVOMFwpH58vFDvk58K0rKRVF1A8JFTkqWkcCgYAqZVDrNqUXvU+8WRDzL/mA
lB3M1+8kxLda138x+wNxaXWrpBpblt9igV70MdH5Ohf/ntbhK249Kaxq6zB/fCYs
pIP0BCj+HMJK732nHQCp9HQHl2piGHXnL4kRvsNIU016Aws0ZiFkp/Mp6mcyzkM1
JhHYDYYrQZX/93FqkmU+7wKBgHJI18oRtY9k+f1pGIJjdOFq5Yzlx/iDpRH5jjrk
blMi7epINcbT2sS7HgDZ5vU7E8DYQdQvJFNaVGaD3tHZVHJbJHqcbI6VWyGa/DvX
upKBKjxoxwHK6nm+i/rd3xvnD09X+TN34qZhSoadtJ3LWn6K6bYlBsWTvxC0z/4O
B0xvAoGAFMZZU+PLc2A7aVrBmhnFi9kudqhjI/Bq97cMZmXTTNES8L6ktrelf1zw
ic22XsDxVNeeTNf0UN8E0C5cHutU8AGwtMkJdaGScdyq40vZg1tOpyDpY4qHVTFG
EyKSY2FTUHqbyRlQnG96pIO2PLpxcjD+QaVcd1JOu4PknNiX/QQ=
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