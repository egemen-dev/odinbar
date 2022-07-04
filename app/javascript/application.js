// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"

const navbarMenu = document.getElementsByClassName('navbar-menu')[0]
const navbarBurger = document.getElementsByClassName('navbar-burger')[0]

navbarBurger.addEventListener('click', () => {
  navbarBurger.classList.toggle('is-active');
  navbarMenu.classList.toggle('is-active');
});