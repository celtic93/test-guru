document.addEventListener('turbolinks:load', function() {
  var passwordInput = document.querySelector('.password')
  var passwordConfirmationInput = document.querySelector('.password-confirmation')

  if (passwordInput && passwordConfirmationInput) {
    passwordInput.addEventListener('input', checkPassword)
    passwordConfirmationInput.addEventListener('input', checkPassword)    
  }
})

function checkPassword() {
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')

  if (passwordConfirmation.value.length == 0) {
    password.classList.remove('border-alert')
    password.classList.remove('border-success')
    passwordConfirmation.classList.remove('border-alert')
    passwordConfirmation.classList.remove('border-success')
  } else if (password.value == passwordConfirmation.value) {
    password.classList.remove('border-alert')
    password.classList.add('border-success')
    passwordConfirmation.classList.remove('border-alert')
    passwordConfirmation.classList.add('border-success')
  } else {
    password.classList.add('border-alert')
    password.classList.remove('border-success')
    passwordConfirmation.classList.add('border-alert')
    passwordConfirmation.classList.remove('border-success')
  }
}
