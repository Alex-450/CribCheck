const clickRow = () => {
  if ($("tr[data-link]")) {
  $("tr[data-link]").click(function() {
  window.location = $(this).data("link")
})}}

export { clickRow }
