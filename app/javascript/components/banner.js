import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerTyped = document.getElementById('banner-typed-text')
  if (bannerTyped) {
    new Typed(bannerTyped, {
      strings: ["Check out your future apartment"],
      typeSpeed: 50,
      loop: false
    });
  }
}

export { loadDynamicBannerText };
