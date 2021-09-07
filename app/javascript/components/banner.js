import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerTyped = document.getElementById('banner-typed-text')
  if (bannerTyped) {
    new Typed(bannerTyped, {
      strings: ["No more surprises..."],
      typeSpeed: 50,
      loop: false
    });
  }
}

export { loadDynamicBannerText };
