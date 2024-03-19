import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="instructions"
export default class extends Controller {
  static targets = ["revealInstructions"]

  connect() {
  }

  reveal() {
    this.revealInstructionsTarget.classList.toggle("d-none");
  }
}
