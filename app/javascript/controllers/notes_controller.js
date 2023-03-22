import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notes"
export default class extends Controller {
  connect() {
    tinymce.init({
      selector: 'textarea',
      hidden_input: false,
      plugins: 'anchor autolink codesample emoticons image link lists visualblocks wordcount checklist mediaembed export pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage mergetags autocorrect typography inlinecss',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline | link image media table mergetags | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
      mergetags_list: [
        { value: 'First.Name', title: 'First Name' },
        { value: 'Email', title: 'Email' },
      ]
    });

    const pen = document.querySelector("pen")
    const note = document.querySelector(".notes-form")

    pen.addEventListener("click", (event) =>
    note.classList.toggle("hide")
    )
  }
}
