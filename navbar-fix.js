/**
 * Navbar hamburger menu fix for mobile
 * Handles Bootstrap 3 navbar toggle collapse functionality
 */
document.addEventListener("DOMContentLoaded", function () {
  // Find all navbar toggle buttons
  var toggles = document.querySelectorAll(".navbar-toggle");

  toggles.forEach(function (toggle) {
    toggle.addEventListener("click", function (e) {
      e.preventDefault();

      // Get the target navbar-collapse element
      var target = document.querySelector(this.getAttribute("data-target"));

      if (target) {
        // Bootstrap 3 uses 'in' class for expanded state
        if (target.classList.contains("in")) {
          target.classList.remove("in");
          this.classList.add("collapsed");
        } else {
          target.classList.add("in");
          this.classList.remove("collapsed");
        }
      }
    });
  });
});
