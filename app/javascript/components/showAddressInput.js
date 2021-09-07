const showAddressInput = () => {
  const addressInput = document.getElementById('propertyAddress');
  const createLandlordButton = document.getElementById('showLandlordForm')
  if (addressInput && createLandlordButton) {
    $('#select2Landlord').on('change', function() {
      if ($('#select2Landlord').val() !== "") {
      console.log($('#select2Landlord').val())
      addressInput.style.display = "block";
      createLandlordButton.style.display = "none";
    }
    })
  }
};

export { showAddressInput }
