import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log("Tirap Tchoron Oh Ah")
    flatpickr(this.element, {
      dateFormat: 'd/m/Y'
    });
  }
}
