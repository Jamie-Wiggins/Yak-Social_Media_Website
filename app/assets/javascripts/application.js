// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


// navbar burger
document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }

});

// handles the display of new posts color for text and background
var colorWell;
var defaultColor = "#000000";
var backColor;
var defaultColor2 = "#000000";

window.addEventListener("load", startup, false);
function startup() {
colorWell = document.querySelector("#color");
colorWell.value = defaultColor;
colorWell.addEventListener("input", updateFirst, false);
colorWell.select();

backColor = document.querySelector("#backColor");
backColor.value = defaultColor2;
backColor.addEventListener("input", updateFirst2, false);
backColor.select();
};

// if the color selector has a color selected change the textarea background color to match this
function updateFirst(event) {
var textarea = document.querySelector(".textarea");

    if (textarea) {
        textarea.style.color = event.target.value;
    }
};

// if the text color selector has a color selected change the textarea text's color to match this
function updateFirst2(event) {
var textarea = document.querySelector(".textarea");

    if (textarea) {
      textarea.style.backgroundColor = event.target.value;
    }
  };

