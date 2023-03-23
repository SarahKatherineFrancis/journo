import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: [
        "Finding restaurants...",
        "Finding activities...",
        "Finding experiences...",
        "Planning your itinerary...",
        "Calculating a budget...",
      ],
      typeSpeed: 50,
      loop: true
    })
  }
  }
