const button = document.getElementById('showHide')

const showForm = () => {
  button.addEventListener('click', (event) => {
    var x = document.getElementById("landlordForm")
  if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
  button.style.display = "none";
})}

export { showForm }
