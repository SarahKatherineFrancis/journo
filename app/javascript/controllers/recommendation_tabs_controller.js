import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const budget = document.getElementById("budget");
    const budgetContent = document.getElementById("budget-content")
    budget.addEventListener("click", (event) => {
      budgetContent.classList.toggle("hide")
      packing.classList.toggle("hide");
      exploreRecs.classList.toggle("hide");
    });

    const packing = document.getElementById("packing");
    const packingContent = document.getElementById("packing-content")
    packing.addEventListener("click", (event) => {
      budgetContent.classList.toggle("hide")
      packingContent.classList.toggle("hide");
      visaContent.classList.toggle("hide");
    });

    const visa = document.getElementById("visa");
    const visaContent = document.getElementById("visa-content")
    visa.addEventListener("click", (event) => {
      budgetContent.classList.toggle("hide")
      packingContent.classList.toggle("hide");
      visaContent.classList.toggle("hide");
    });
  }
}
