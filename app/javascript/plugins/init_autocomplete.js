import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#property-address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
