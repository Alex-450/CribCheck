$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})

const clickRow = () => {
  const row = document.querySelector("tr[data-link]")
  if (row) {
    row.addEventListener("click", (event) => {
      window.location = this.data("link")
    })
  }
}

export { clickRow }
