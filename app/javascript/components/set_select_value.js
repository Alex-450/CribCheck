const setSelectValue = () => {
  const queryString = window.location.search;
  console.log(queryString)
  $('.select2Landlord').val('1');
}

export { setSelectValue }
