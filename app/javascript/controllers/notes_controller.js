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
    const noteEditor = document.getElementById("note-form");
    const note = document.getElementById("note");

    pen.addEventListener("click", (event) => {
      note.classList.add("note-hide");
      noteEditor.classList.remove("note-hide")
    });
  }
}
