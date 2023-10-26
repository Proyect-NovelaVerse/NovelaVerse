document.addEventListener("DOMContentLoaded", function() {
    const nav = document.querySelector(".nav");
    const navMenuBtn = document.querySelector(".nav-menu-btn");
    const navMenu = document.querySelector(".nav-menu ul");

    window.addEventListener("scroll", function() {
      if (window.scrollY > 0) {
        nav.classList.add("hidden");
      } else {
        nav.classList.remove("hidden");
      }
    });

    navMenuBtn.addEventListener("click", () => {
      navMenu.classList.toggle("show");
    });
  });