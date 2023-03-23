import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notes"
export default class extends Controller {
  connect() {
    tinymce.init({
      selector: 'textarea',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
      tinycomments_mode: 'embedded',
    });

    const pen = document.getElementById("pen");
    const noteEditor = document.getElementById("notes-form");
    const note = document.getElementById("note");
    const submit = document.querySelector("submit-button")
    pen.addEventListener("click", (event) => {
      note.classList.toggle("note-toggle");
      noteEditor.classList.toggle("note-toggle");
    });

    submit.addEventListener("click", (event) => {
      noteEditor.classList.add("note-toggle");
      note.classList.remove("note-toggle");
    })
  }
}
