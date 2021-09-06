const initCarousel = () => {
  const carousel = document.querySelector('#carousel');
  const btnLeft = document.querySelector('#carousel .scroll-left');
  const btnRight = document.querySelector('#carousel .scroll-right');
  const firstCircle = document.querySelector('#first-circle');
  const secondCircle = document.querySelector('#second-circle');
  const thirdCircle = document.querySelector('#third-circle');

  if (btnLeft) {
    btnLeft.addEventListener('click', (event) => {
      shiftCarousel(-1);
      firstCircle.classList.remove('far');
      firstCircle.classList.add('fas');
      secondCircle.classList.remove('fas');
      secondCircle.classList.add('far');
    });
  }
  if (btnRight) {
    btnRight.addEventListener('click', (event) => {
      shiftCarousel(1);
      thirdCircle.classList.remove('far');
      thirdCircle.classList.add('fas');
      secondCircle.classList.remove('fas');
      secondCircle.classList.add('far');
    });
  }

}

const shiftCarousel = (dir) => {
      let items = document.querySelectorAll('#carousel li');
      let current = 0;
      items.forEach((element, index) => {
        if (element.classList.contains('first')) {
          element.classList.remove('first');
          current = index;
        }
      });
      let newIndex = Math.min(Math.max(current + dir, 0), items.length - 3)
      items[newIndex].classList.add('first');
}

export { initCarousel };
