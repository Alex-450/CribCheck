import $ from 'jquery';
import 'select2';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['select-landlord']
  connect() {
    $('#select2Landlord').select2({
      width: 'resolve',
    placeholder: "Search for your landlord",
  });
  }
}
