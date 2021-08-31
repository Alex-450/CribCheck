import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2Landlord').select2({
    placeholder: "Search for your landlord"
  });
};

export { initSelect2 };
