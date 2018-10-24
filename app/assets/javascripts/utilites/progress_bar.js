document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) { setProgress(progressBar) }
})

function setProgress(progressBar) {
  var currentQuestionNumber = progressBar.dataset.currentQuestionNumber
  var questionsCount = progressBar.dataset.questionsCount

  var completionPercent = (currentQuestionNumber / questionsCount) * 100

  progressBar.style.width = completionPercent + "%"
}
