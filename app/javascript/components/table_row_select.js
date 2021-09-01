const clickRow = $("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})

export { clickRow }
