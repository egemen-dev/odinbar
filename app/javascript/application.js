// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
var navbarMenu = document.querySelector('.navbar-menu');
var navbarBurger = document.querySelector('.navbar-burger');
navbarBurger.addEventListener('click', () => {
  navbarMenu.classList.toggle('is-active')
});