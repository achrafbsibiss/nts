// app/javascript/controllers/equipment_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["portNumber", "portStatuses"]

  connect() {
    this.toggleFields();
    const equipmentTypeInput = document.getElementById("equipment_type");
    if (equipmentTypeInput) {
      equipmentTypeInput.addEventListener("input", () => {
        console.log("change");
        this.toggleFields();
      });
    }
  }

  toggleFields() {
    const equipmentTypeInput = document.getElementById("equipment_type");
    const portNumber = this.portNumberTarget;
    const portStatuses = this.portStatusesTarget;

    const equipmentType = equipmentTypeInput.value.toLowerCase(); // Corrected
    const equipmentFbre = equipmentType.includes("optical fibre");
    if(equipmentFbre) {
      portNumber.classList.remove("hidden");
      portStatuses.classList.remove("hidden");
    } else {
      portNumber.classList.add("hidden");
      portStatuses.classList.add("hidden");
    }
  }
}
