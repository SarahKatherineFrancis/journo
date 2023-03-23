import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const itinerary = document.getElementById("itinerary");
    const itineraryContent = document.getElementById("itinerary-content");
    itinerary.addEventListener("click", (event) => {
      console.log(event);
      itineraryContent.classList.remove("d-none");
      budgetContent.classList.add("d-none");
      packingContent.classList.add("d-none");
      visaContent.classList.add("d-none");
    });

    const budget = document.getElementById("budget");
    const budgetContent = document.getElementById("budget-content");
    budget.addEventListener("click", (event) => {
      budgetContent.classList.remove("d-none");
      itineraryContent.classList.add("d-none");
      packingContent.classList.add("d-none");
      visaContent.classList.add("d-none");
    });

    const packing = document.getElementById("packing");
    const packingContent = document.getElementById("packing-content");
    packing.addEventListener("click", (event) => {
      packingContent.classList.remove("d-none");
      itineraryContent.classList.add("d-none");
      budgetContent.classList.add("d-none");
      visaContent.classList.add("d-none")
    });

    const visa = document.getElementById("visa");
    const visaContent = document.getElementById("visa-content");
    visa.addEventListener("click", (event) => {
      visaContent.classList.remove("d-none");
      itineraryContent.classList.add("d-none");
      budgetContent.classList.add("d-none");
      packingContent.classList.add("d-none");
    });
  }
}
