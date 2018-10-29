document.addEventListener('turbolinks:load', function() {
  var testTimer = document.querySelector(".test-timer");
  
  if (testTimer) { countDown(testTimer) }
})

function countDown(timer) {
  var limitInSeconds = timer.dataset.timeLimit * 60
  showRemainigTime(limitInSeconds, timer)

  setInterval(function() {
    limitInSeconds--
    showRemainigTime(limitInSeconds, timer)
    
    if (limitInSeconds == 0) window.location.replace(window.location + '/result')
  }, 1000)
}

function showRemainigTime(seconds, timer) {
  timer.innerHTML = parseInt(seconds / 60) + ":" + (seconds % 60)
}
