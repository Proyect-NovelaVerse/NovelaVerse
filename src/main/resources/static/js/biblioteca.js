const toggleSwitch = document.getElementById("toggleSwitch");
const faceOne = document.querySelector(".face-one");
const faceTwo = document.querySelector(".face-two");

// Función para actualizar la visibilidad de los divs
function updateVisibility() {
  if (toggleSwitch.checked) {
    faceOne.style.display = "block";
    faceTwo.style.display = "none";
  } else {
    faceOne.style.display = "none";
    faceTwo.style.display = "block";
  }
}

// Asignar un evento al interruptor para que llame a la función de actualización
toggleSwitch.addEventListener("change", updateVisibility);

// Llamar a la función de actualización al cargar la página para establecer el estado inicial
updateVisibility();
