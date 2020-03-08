var music = document.getElementById('music'); // id for audio element
var pButton = document.getElementById('pButton'); // play button


if (Hls.isSupported()) {
    var hls = new Hls();
    hls.loadSource('stream/live.m3u8');
    hls.attachMedia(music);
}
else if (music.canPlayType('application/vnd.apple.mpegurl')) {
    music.src = 'stream/live.m3u8';
}


// play button event listenter
pButton.addEventListener("click", play);


window.addEventListener("pageshow", () => {
  updateBtn();
});


function updateBtn() {
  // start music
  if (music.paused) {
    pButton.className = "";
    pButton.className = "fas fa-play";
  } else { // pause music
    // remove pause, add play
    pButton.className = "";
    pButton.className = "fas fa-pause";
  }  
}

//Play and Pause
function play(ev) {
  // start music
  if (music.paused) {
    music.play();
  } else { // pause music
    music.pause();
    music.currentTime = 0
  }

  updateBtn();
}

