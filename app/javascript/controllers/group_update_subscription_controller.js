import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="group-update-subscription"
export default class extends Controller {

  static targets = ["groups"]
  static values = {
    groupId: Number
  }

  connect() {
    console.log(`connecting to the action cable channel with id ${this.groupIdValue}`)
    createConsumer().subscriptions.create(
      {channel: "GroupUpdateChannel", id: this.groupIdValue},
      { received: (data) => {this.groupsTarget.insertAdjacentHTML("beforeend", data)} }
      )
  }
}
