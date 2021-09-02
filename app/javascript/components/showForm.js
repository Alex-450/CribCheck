const showForm = () => {
  const button = document.getElementById('showLandlordForm')
  const landlordForm = document.getElementById("landlordForm")
  const propertyForm = document.getElementById("propertyForm")
  if (button && landlordForm && propertyForm) {
    button.addEventListener('click', (event) => {
        landlordForm.style.display = "block";
        propertyForm.style.display = "none"
        button.style.display = "none";
    })
  }
}

export { showForm }
