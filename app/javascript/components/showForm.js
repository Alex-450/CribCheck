const showForm = () => {
  const button = document.getElementById('showHide')
  const landlordForm = document.getElementById("landlordForm")
  const propertyForm = document.getElementById("propertyForm")
  if (button && landlordForm && propertyForm) {
    button.addEventListener('click', (event) => {
    if (landlordForm.style.display === "none") {
        landlordForm.style.display = "block";
        propertyForm.style.display = "none"
        button.style.display = "none";
      } else {
        landlordForm.style.display = "none";
      }
    })
  }
}

export { showForm }
