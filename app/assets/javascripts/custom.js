// Dropdown JS mainly for navbars
function dropdownToggle(position) {
  var element = document.getElementById(`dropdown-menu-${position}`);
  element.classList.toggle("is-active");
}

// Toggle open and close form
function answer() {
  var x = document.getElementById("answer_form");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
