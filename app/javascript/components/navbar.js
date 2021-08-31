const navBarToggleMenu = () => {
  $('.menu-btn').on('click', function (e) {
    e.preventDefault();
    $(this).toggleClass('menu-btn--open');
    $('.menu-nav').toggleClass('menu-nav--open');
  });
}

export { navBarToggleMenu };
