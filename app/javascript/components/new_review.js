const showAddReview = () => {
  const element = document.querySelector("#box");
  element.addEventListener("click", event => {
    console.log("Element clicked");
});
}

export { showAddReview };
