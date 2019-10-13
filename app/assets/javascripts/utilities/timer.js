document.addEventListener('turbolinks:load', function() {
  var countdownLabel = document.querySelector('.countdownLabel')
  if (countdownLabel) {
    var seconds = countdownLabel.dataset.seconds;
    if (seconds) {
      createTimer();
    } else {
      return
    }
  }

  function createTimer() {
    seconds--;
    countdownLabel.textContent = secondsToTime(seconds)    
    setTimeout(createTimer, 1000)
    if (seconds == 0) {
      alert("Time is out!");
      location.reload(true);
    }
  }

  function secondsToTime(seconds) {
    var numminutes = Math.floor((((seconds % 31536000) % 86400) % 3600) / 60);
    var numseconds = (((seconds % 31536000) % 86400) % 3600) % 60;
    return "You have left: " + numminutes + " minutes, " + numseconds + " seconds";
  }
});
