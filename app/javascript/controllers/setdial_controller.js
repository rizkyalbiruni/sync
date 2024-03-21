import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-the-dial"
export default class extends Controller {
  static targets = ["setterValue"]

  connect() {
  }

  set () {
    this.setterValueTarget.classList.remove("d-none");
  }
}
