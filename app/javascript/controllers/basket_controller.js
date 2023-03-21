import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="basket"
export default class extends Controller {
  connect() {
    const addedTrips = document.querySelector(".added-trips")

    if (addedTrips.children.length === 0) {
      const emptyTripDiv = document.createElement("div");
      emptyTripDiv.classList.add("empty-trip");
      emptyTripDiv.innerHTML = "<h3>Add activities to your trip.</h3>";
      addedTrips.parentNode.insertAdjacentElement("beforeend", emptyTripDiv);
}}
}
