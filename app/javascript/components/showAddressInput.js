const showAddressInput = () => {
  const addressInput = document.getElementById('propertyAddress');
  const createLandlordButton = document.getElementById('showLandlordForm')
  if (addressInput && createLandlordButton) {
    if ($('.select2Landloed').val !== "") {
      addressInput.style.display = "block";
      createLandlordButton.style.display = "none";
}}};

export { showAddressInput }
