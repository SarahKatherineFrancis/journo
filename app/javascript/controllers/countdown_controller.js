import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="countdown"
export default class extends Controller {
  connect() {
    setInterval(function () {
      const second = 1000,
        minute = second * 60,
        hour = minute * 60,
        day = hour * 24;

      const endDateText = document.getElementById("end-date");
      const endDate = new Date(endDateText.innerText);
      const time = endDate.getTime();

      const timezoneOffset = endDate.getTimezoneOffset();

      const dateNow = new Date().getTime(),
        difference = time + timezoneOffset * 60 * 1000 - dateNow;

      (document.getElementById("days").innerText = Math.floor(
        difference / day
      )),
        (document.getElementById("hours").innerText = Math.floor(
          (difference % day) / hour
        )),
        (document.getElementById("minutes").innerText = Math.floor(
          (difference % hour) / minute
        )),
        (document.getElementById("seconds").innerText = Math.floor(
          (difference % minute) / second
        ));
    }, 1000);
  }
}