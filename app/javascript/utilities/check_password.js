document.addEventListener('turbo:load', function () {
  const newUserForm = document.querySelector("#new_user")
  const pass = document.querySelector('#user_password')
  const passConf = document.querySelector('#user_password_confirmation')

  if (pass && passConf) {
      newUserForm.parentNode.addEventListener('input', changeBorderColor)
  }

  function changeBorderColor() {
    const passValue = pass.value
    const passConfValue = passConf.value
    
    if (passValue === "" || passConfValue === "") {
      passConf.classList.remove('valid')
      passConf.classList.add('invalid')
    } else if (passValue === passConfValue) {
      pass.classList.add('valid')
      passConf.classList.remove('invalid')
      passConf.classList.add('valid')
    } else {
      pass.classList.remove('valid')
      passConf.classList.add('invalid')
    }
  }
})
