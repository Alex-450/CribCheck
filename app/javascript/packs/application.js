// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { navBarToggleMenu } from '../components/navbar';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initUpdateBtnOnScroll } from '../components/navbar';
import { initUpdateMenuOnScroll } from '../components/navbar';
import { initMapbox } from '../plugins/init_mapbox';
import { showForm } from '../components/showForm';
import { showAddressInput } from "../components/showAddressInput";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { clickRow } from "../components/table_row_select";
import { newReview } from '../components/new_review';
import { setSelectValue } from '../components/set_select_value';
import { initCarousel } from '../components/carousel';
import { loadDynamicBannerText } from '../components/banner';


document.addEventListener('turbolinks:load', () => {
  navBarToggleMenu();
  initMapbox();
  showForm();
  initAutocomplete();
  initUpdateNavbarOnScroll();
  initUpdateBtnOnScroll();
  initUpdateMenuOnScroll();
  clickRow();
  showAddressInput();
  newReview();
  setSelectValue();
  loadDynamicBannerText();
  initCarousel();
});

import "controllers"
