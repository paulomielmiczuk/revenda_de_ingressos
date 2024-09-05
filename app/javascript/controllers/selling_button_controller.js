import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["ticket"]

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  cancel() {
    this.ticketTarget.innerText = 'Opa';
  }
}
