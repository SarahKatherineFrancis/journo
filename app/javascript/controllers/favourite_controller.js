import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="favourite"
export default class extends Controller {
  static targets = ["heart"];
  connect() {}

  toggle() {
    this.heartTarget.classList.toggle("favourited");
  }
}
