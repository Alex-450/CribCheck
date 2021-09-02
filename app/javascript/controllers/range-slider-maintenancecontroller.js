import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'range', 'hidden' ]



  connect() {


    // console.log(this.rangeTarget)
    // console.log(this.hiddenTarget)

    // this.outputTarget.textContent = 'Hello, Stimulus!'
  }
  updateValue(e) {
    // this.updateText(e.currentTarget.value); t
    this.hiddenTarget.value = e.currentTarget.value;
  }
}
