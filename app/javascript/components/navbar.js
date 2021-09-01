const navBarToggleMenu = () => {
  $('.menu-btn').on('click', function (e) {
    e.preventDefault();
    $(this).toggleClass('menu-btn--open');
    $('.menu-nav').toggleClass('menu-nav--open');
  });
}

// const navBarBackground = () => {
//   const nav = document.querySelector('.navbar')
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight)(
//         nav.classList.add('.background-white');
//       )
//     })
//   }

//   nav.classList.remove('.navbar-lewagon')
//   nav.classList.add('.background-white')


// }
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}
const initUpdateBtnOnScroll = () => {
  const navbar = document.querySelector('#btnnav');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY) {
        navbar.classList.remove('btn-submit');
        navbar.classList.add('btn-action');
      } else {
        navbar.classList.remove('btn-action');
        navbar.classList.add('btn-submit');
      }
    });
  }
}

const initUpdateMenuOnScroll = () => {
  const navbar = document.querySelector('.menu-btn');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY) {
        navbar.classList.remove('green');
        navbar.classList.add('white');
      } else {
        navbar.classList.remove('white');
        navbar.classList.add('green');
      }
    });
  }
}

export { navBarToggleMenu };
export { initUpdateNavbarOnScroll };
export { initUpdateBtnOnScroll };
export { initUpdateMenuOnScroll };
