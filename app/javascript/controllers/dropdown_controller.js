import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["dropdownContent", "openbutton", "closebutton"]
  connect() {
   this.closeDropdown();
  }
  toggleDropdown(){
    if(this.dropdownContentTarget.hidden == true){
      this.openDropdown()
    }else{
      this.closeDropdown()
    }
  };
  openDropdown(){
    this.dropdownContentTarget.hidden = false;
    try{
    this.openbuttonTarget.hidden = true;
    this.closebuttonTarget.hidden = false;}
    catch{}

  }

  closeDropdown(){
    this.dropdownContentTarget.hidden = true;
    try{
    this.openbuttonTarget.hidden = false;
    this.closebuttonTarget.hidden = true;}
    catch{}

  }
}
