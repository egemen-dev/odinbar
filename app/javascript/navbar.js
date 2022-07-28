var navbarMenu = document.getElementsByClassName('navbar-menu')[0]
var navbarBurger = document.getElementsByClassName('navbar-burger')[0]
var current_user_id = document.cookie.split("=")[1]
var commentDivs = document.getElementsByClassName("comments")
var dropdButtons = document.getElementsByClassName("dropButton")
var commentsButtons = document.getElementsByClassName('comments_toggle')
var inputFields = document.querySelectorAll('#form input');
var forms = document.querySelectorAll('#form');

function reloadToggles() {
  // Comment buttons opens and hides comment section +
  // 'More' hides dropdown
  for (var i=0, l=commentsButtons.length; i<l; i++) {
    commentsButtons[i].addEventListener("click", toggleComments);
    if (typeof dropdButtons[i] !== 'undefined') {
      dropdButtons[i].addEventListener("click", toggleDropdown);
    }
  };

  function toggleComments(e) {
    var comment_section = document.getElementsByClassName('comments_of_'+e.target.id.split("_")[2])[0]
    comment_section.classList.toggle('is-hidden');
    e.target.classList.toggle('is-focused');
    e.target.classList.toggle('is-rounded');
    console.log(comment_section);
  }

  function toggleDropdown(e) {
    var dropdown_menu = e.target.parentNode
    dropdown_menu.classList.toggle('is-active');
    e.target.classList.toggle('is-rounded');
    console.log(dropdown_menu);
  }
}
reloadToggles()

// Reset all comment forms after clicking 'Create Comment' button
for (var i=0, l=inputFields.length; i<l; i++) {
  if (inputFields[i].type == 'submit') {
    inputFields[i].addEventListener("click", resetForms);
  }

  function resetForms(e) {
    function resetAllForms() {
      for (var i=0, l=forms.length; i<l; i++) {
        forms[i].reset()
        console.log('reseted all forms')
      }
    }
  // Wait for input to go to server
  setTimeout( resetAllForms, 250 )
  }
};

// Constantly checking and removing 'delete' buttons if ->
// delete_buttons_id does not match with current_user_id
var intervalId = window.setInterval(function(){
  for (var it=0, len=commentDivs.length; it<len; it++) {

    let comments = commentDivs[it];
    var deleteButtons = comments.querySelectorAll('button');

    for (var i=0, l=deleteButtons.length; i<l; i++) {
      if (deleteButtons[i].id != current_user_id) {
        deleteButtons[i].remove();
      };
    };
  };
  console.log('checked comment delete buttons')
}, 750);

navbarBurger.addEventListener('click', () => {
  navbarBurger.classList.toggle('is-active');
  navbarMenu.classList.toggle('is-active');
});


var flashMessage = document.getElementById('flash-messages')
if (flashMessage != null) {
  setTimeout(function removeFlash() {
    flashMessage.remove();
  }, 6000)
}