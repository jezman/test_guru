document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password && password_confirmation) {
    password.addEventListener('input', checkPassword)
    password_confirmation.addEventListener('input', checkPasswordConfirmation)
  }
})

function checkPassword() {
  if (!this.value) { iconHide() }
}

function checkPasswordConfirmation() {
  var password = document.getElementById('user_password')

  if (password.value) {
    (this.value == password.value) ? iconSuccess() : iconDanger()
  }

  if (!this.value) { iconHide() }
}

function iconSuccess() {
  document.querySelector('.octicon-key').classList.remove('hide')
  document.querySelector('.octicon-key').classList.remove('text-danger')
  document.querySelector('.octicon-key').classList.add('text-success')
}

function iconDanger() {
  document.querySelector('.octicon-key').classList.remove('hide')
  document.querySelector('.octicon-key').classList.remove('text-success')
  document.querySelector('.octicon-key').classList.add('text-danger')
}

function iconHide() {
  document.querySelector('.octicon-key').classList.remove('text-success')
  document.querySelector('.octicon-key').classList.remove('text-danger')
  document.querySelector('.octicon-key').classList.add('hide')
}
