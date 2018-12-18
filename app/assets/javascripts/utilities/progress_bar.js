document.addEventListener('turbolinks:load', function() {
  var bar = document.querySelector('#bar')

  if (bar) {
    var barStep = 1/bar.dataset.count
    var steps = bar.dataset.questionIndex - 1

    bar.style.width = barStep * steps * 100 + '%'
  }  
})
