import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const eat = document.getElementById("eat");
    const eatRecs = document.getElementById("eat-rec")
    eat.addEventListener("click", (event) => {
      console.log(event);
      eatRecs.classList.remove("hide")
      doRecs.classList.add("hide");
      exploreRecs.classList.add("hide");
    });

    const d = document.getElementById("do");
    const doRecs = document.getElementById("do-rec")
    d.addEventListener("click", (event) => {
      eatRecs.classList.add("hide")
      doRecs.classList.remove("hide");
      exploreRecs.classList.add("hide");
    });

    const explore = document.getElementById("explore");
    const exploreRecs = document.getElementById("explore-rec")
    explore.addEventListener("click", (event) => {
      eatRecs.classList.add("hide")
      doRecs.classList.add("hide");
      exploreRecs.classList.remove("hide");
    });
  }
}
