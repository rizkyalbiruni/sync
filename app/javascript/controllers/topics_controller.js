import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="topics"
export default class extends Controller {
  static targets = ["topicsMenu", "startGame", "button", "enterGame"]

  connect() {
    console.log("connected")
  }

  show() {
    this.topicsMenuTarget.classList.remove("d-none");
  }

  select(event) {
    console.log("working")

    const chosenTopic = event.currentTarget.dataset.topicName;

    this.topicsMenuTarget.classList.add("d-none");
    this.startGameTarget.classList.remove("d-none");
    this.buttonTarget.disabled = true;
    this.buttonTarget.textContent = `Your topic is ${chosenTopic}`;
  }
}
