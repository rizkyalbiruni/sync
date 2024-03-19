import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["createGroup"]
  connect() {
  }

  fire() {
    this.createGroupTarget.classList.toggle("d-none");
  }
}
