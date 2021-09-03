const newReview = () => {
  const element = document.querySelector("#new-review");
  const div = document.querySelector("#toggle-review");
  element.addEventListener("click", (e) => {
    // e.preventDefault
    if (div.style.display !== "none") {
    div.style.display = "none";
    } else {
    div.style.display = "block";
    }
  });
}

export { newReview };
