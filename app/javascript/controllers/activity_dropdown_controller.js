import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="activity-dropdown"
export default class extends Controller {
  static targets = ["description"];
  connect() {}

  toggle() {
    this.descriptionTarget.classList.toggle("activity-description");
  }
}
