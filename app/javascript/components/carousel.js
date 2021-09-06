const initCarousel = () => {
  const carousel = document.querySelector('#carousel');
  const btnLeft = document.querySelector('#carousel .scroll-left');
  const btnRight = document.querySelector('#carousel .scroll-right');
  const middleCircle = document.querySelector('#middle-circle');


  if (btnLeft) {
    btnLeft.addEventListener('click', (event) => {
      shiftCarousel(-1);
      shiftCircle(-1);
    });
  }
  if (btnRight) {
    btnRight.addEventListener('click', (event) => {
      shiftCarousel(1);
      shiftCircle(1);
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

const shiftCircle = (dir) => {
  let items = document.querySelectorAll('.circle-review');
  let index = null;
  items.forEach((item, i) => {
    if (item.classList.contains('fas')) {
      index = i;
      item.classList.remove('fas');
      item.classList.add('far');
    }
  });
  items[index + dir].classList.add('fas');
  items[index + dir].classList.remove('far');
}

export { initCarousel };
