const showAddressInput = () => {
  const addressInput = document.getElementById('propertyAddress');
  const landlordInput = document.getElementById('property_landlord_id');
  if (addressInput && landlordInput) {
  landlordInput.addEventListener('change', (event) => {
    console.log(event.target.value)
    console.log("value changed")
  //   if (landlordInput.value !== "")
  // addressInput.style.display = "block";
  //   else
  //   return
  })};

}

export { showAddressInput }
