import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="basket"
export default class extends Controller {
  connect() {
    console.log("hello")
    const addedTrips = document.querySelector(".added-trips")

    if (addedTrips) {
      const emptyTripDiv = document.createElement("div");
      emptyTripDiv.classList.add("empty-trip");
      emptyTripDiv.innerHTML = "<h3>Add activities to your trip.</h3>";
      addedTrips.parentNode.insertAdjacentElement("beforeend", emptyTripDiv);
    }
  }
}
