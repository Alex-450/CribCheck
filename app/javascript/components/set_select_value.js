import $ from 'jquery';
import 'select2';

const setSelectValue = () => {
  const queryString = window.location.search;
  if (queryString) {
    const landlordId = queryString.match(/\d+/)[0];
    $('#select2Landlord').val(landlordId).trigger('change');
  }
}

export { setSelectValue }
