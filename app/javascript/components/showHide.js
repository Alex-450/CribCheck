const button = document.getElementById('showHide')

const showHide = () => {
  button.addEventListener('click', (event) => {
    var x = document.getElementById("landlordForm")
  if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
})}

export { showHide }
