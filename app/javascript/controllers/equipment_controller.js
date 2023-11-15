import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["portNumber", "portStatuses"]

  connect() {
    console.log("hello world")
    this.toggleFields();
  }

  toggleFields() {
    const equipmentType = document.getElementById("equipment_type").value

    if (equipmentType === "fiber" || equipmentType === "optical fiber") {
      this.portNumber.classlist.remove("hidden")
      this.portStatuses.classList.remove("hidden")
    } else {
      this.portNumber.classList.add("hidden")
      this.portStatuses.classList.add("hidden")
    }
  }
}