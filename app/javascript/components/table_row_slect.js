$("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})

const row = document.querySelector("tr[data-link]")

const clickRow = () => {
  row.addEventListener("click", (event) => {
    window.location = this.data("link")
  })
}

export { clickRow }
