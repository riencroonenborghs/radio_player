$(function() {
  class AudioPlayer {
    constructor (id) {
      this.player = $(id);
      this.audioSource = this.player.data('audio-src');
      this.pause()
    }

    add () {
      this.audio = document.createElement("audio");
      this.audio.setAttribute("id", "player");
      const source = document.createElement("source");
      source.setAttribute("src", this.audioSource);
      this.audio.appendChild(source);
      player[0].appendChild(this.audio);
    }

    play () {
      this.stopped = false;
      this.playing = true;
      if (this.audio) {
        this.audio.play();
      }
    }

    pause () {
      this.paused = true;
      this.playing = false;
      if (this.audio) {
        this.audio.pause();
      }
    }
  }
  
  const player = $("#audio-player");
  if (player.length > 0) {
    const audioPlayer = new AudioPlayer("#audio-player");  
    audioPlayer.add();

    player.find(".play").on("click", function() {
      audioPlayer.play();
      player.find(".play").addClass("d-none");
      player.find(".playing").removeClass("d-none");
      player.find(".paused").addClass("d-none");
      player.find(".pause").removeClass("d-none");
    });
    player.find(".pause").on("click", function() {
      audioPlayer.pause();
      player.find(".play").removeClass("d-none");
      player.find(".playing").addClass("d-none");
      player.find(".pause").addClass("d-none");
      player.find(".paused").removeClass("d-none");
    });
  }  
});
