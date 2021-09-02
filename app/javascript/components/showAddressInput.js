const showAddressInput = () => {
  const addressInput = document.getElementById('propertyAddress');
  const createLandlordButton = document.getElementById('showLandlordForm')
  if (addressInput && createLandlordButton) {
  $('.select2Landlord').on("select2:selecting", function(e) {
    addressInput.style.display = "block";
    createLandlordButton.style.display = "none";
})}};

export { showAddressInput }
