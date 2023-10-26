import { Controller } from "@hotwired/stimulus";
import debounce from "debounce";

export default class extends Controller {
  initialize() {
    console.log("Controller initialized")
    this.submit = debounce(this.submit.bind(this), 500);
  };

  submit(_event) {
    console.log("Submit button clicked")
    this.element.requestSubmit();
  };
}
