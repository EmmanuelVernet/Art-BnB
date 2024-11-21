import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    // console.log("Hello from toggle_controller.js")
    console.log(this.togglableElementTarget)
  }
  
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
