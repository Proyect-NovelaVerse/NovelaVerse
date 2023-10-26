// Variables globales para gestionar spoilers
let markingSpoiler = false;

// Abrir la ventana flotante al hacer clic en el botón "Escribir Comentario"
document.getElementById('openPopup').addEventListener('click', function () {
    document.getElementById('commentPopup').style.display = 'block';
    markingSpoiler = false; // Al abrir, no estamos marcando spoilers
});

// Cerrar la ventana flotante al hacer clic en la "X"
document.getElementById('closePopup').addEventListener('click', function () {
    document.getElementById('commentPopup').style.display = 'none';
    document.getElementById('markSpoiler').style.backgroundColor = ''; // Restaurar color del botón
    markingSpoiler = false;
});

// Marcar o desmarcar el texto como spoiler al hacer clic en el botón "Marcar como Spoiler"
document.getElementById('markSpoiler').addEventListener('click', function (event) {
    event.preventDefault(); // Evita que el formulario se envíe automáticamente
    const commentText = document.getElementById('commentText');

    if (!markingSpoiler) {
        // Marcar como spoiler
        commentText.value = "<span class='spoiler'>" + commentText.value + "</span>";
        document.getElementById('markSpoiler').style.backgroundColor = 'red'; // Cambiar color del botón
        markingSpoiler = true;
    } else {
        // Desmarcar spoiler
        const spoilerText = commentText.value.replace('<span class=\'spoiler\'>', '').replace('</span>', '');
        commentText.value = spoilerText;
        document.getElementById('markSpoiler').style.backgroundColor = ''; // Restaurar color del botón
        markingSpoiler = false;
    }
});

// Mostrar u ocultar el spoiler al pasar el cursor por encima
document.querySelectorAll('.comments .spoiler').forEach(function (spoilerElement) {
    // Verificar si el comentario actual es un spoiler
    if (spoilerElement.classList.contains('spoiler')) {
        spoilerElement.addEventListener('mouseover', function (event) {
            event.target.classList.remove('spoiler');
        });

        spoilerElement.addEventListener('mouseout', function (event) {
            event.target.classList.add('spoiler');
        });
    }
});



