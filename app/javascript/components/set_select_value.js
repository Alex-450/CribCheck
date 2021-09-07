import $ from 'jquery';
import 'select2';

const setSelectValue = () => {
  const queryString = window.location.search;
  const select2 = document.getElementById('select2Landlord')
  if (queryString && select2) {
    const landlordId = queryString.match(/\d+/)[0];
    $('#select2Landlord').val(landlordId).trigger('change');
  }
}

export { setSelectValue }
