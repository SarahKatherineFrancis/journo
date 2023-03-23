import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const eat = document.getElementById("eat");
    const eatRecs = document.getElementById("eat-rec")
    eat.addEventListener("click", (event) => {
      eatRecs.classList.remove("hide")
      doRecs.classList.add("hide");
      exploreRecs.classList.add("hide");

      eat.classList.add("active-tab");
      d.classList.remove("active-tab");
      explore.classList.remove("active-tab");
    });

    const d = document.getElementById("do");
    const doRecs = document.getElementById("do-rec")
    d.addEventListener("click", (event) => {
      eatRecs.classList.add("hide")
      doRecs.classList.remove("hide");
      exploreRecs.classList.add("hide");

      d.classList.add("active-tab");
      explore.classList.remove("active-tab");
      eat.classList.remove("active-tab");
    });

    const explore = document.getElementById("explore");
    const exploreRecs = document.getElementById("explore-rec")
    explore.addEventListener("click", (event) => {
      eatRecs.classList.add("hide")
      doRecs.classList.add("hide");
      exploreRecs.classList.remove("hide");

      explore.classList.add("active-tab");
      d.classList.remove("active-tab");
      eat.classList.remove("active-tab");
    });
  }
}
