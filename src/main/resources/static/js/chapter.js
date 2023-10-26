
const titleInput = document.getElementById("titleInput");
titleInput.addEventListener("input", () => {
    titleInput.style.width = (titleInput.value.length + 2) + "ch";
});

const textarea = document.getElementById("editor");

textarea.addEventListener("input", () => {
    textarea.style.height = "auto";
    textarea.style.height = textarea.scrollHeight + "px";
});
