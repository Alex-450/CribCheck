import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Check out your future appartment"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };
