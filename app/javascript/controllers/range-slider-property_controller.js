import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'range', 'hidden' ]

  connect() {
    // console.log(this.rangeTarget)
    // console.log(this.hiddenTarget)
  }
  updateValue(e) {
    this.hiddenTarget.value = e.currentTarget.value;
  }
}
