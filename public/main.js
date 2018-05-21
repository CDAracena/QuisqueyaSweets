let jumboSearch = document.querySelector('.searchBar');

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