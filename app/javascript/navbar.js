var navbarMenu = document.getElementsByClassName('navbar-menu')[0]
var navbarBurger = document.getElementsByClassName('navbar-burger')[0]

navbarBurger.addEventListener('click', () => {
  navbarBurger.classList.toggle('is-active');
  navbarMenu.classList.toggle('is-active');
  console.log('clicked')
});

var flashMessage = document.getElementById('flash-messages')
if (flashMessage != null) {
  setTimeout(function removeFlash() {
    flashMessage.remove();
    console.log(flashMessage);
  }, 6000)
}

console.log('loaded')