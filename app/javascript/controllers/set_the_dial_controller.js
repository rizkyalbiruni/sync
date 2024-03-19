import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-the-dial"
export default class extends Controller {
  connect() {
    console.log("connected")
  }
}
