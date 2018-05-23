let jumboSearch = document.querySelector('.searchBar');

let menuToggler = document.querySelector('.hamburgerToggler');
let menuTogglerOff = document.querySelector('.closebutton');

jumboSearch.addEventListener('keyup', function() {
  if (jumboSearch.value === "cookies" || jumboSearch.value === "Cookies") {
    window.location.href = "/cookies";
  } else if (jumboSearch.value === "muffins" || jumboSearch.value === "Muffins") {
    window.location.href = "/muffins";
  } else if (jumboSearch.value === "cakes" || jumboSearch.value === "Cakes") {
    window.location.href = "/cakes";
  } else if (jumboSearch.value === "home" || jumboSearch.value === "Home") {
    window.location.href = "/";
  }
})


menuToggler.addEventListener('click', function() {
  document.querySelector('.sidenav').style.width = "150px";
  document.querySelector('.hamburgerToggler').style.textShadow = "5px 4px #aa2d24";

})

menuTogglerOff.addEventListener('click', function() {
  document.querySelector('.sidenav').style.width = "0px";
  document.querySelector('.hamburgerToggler').style.textShadow = "0px 0px"
})