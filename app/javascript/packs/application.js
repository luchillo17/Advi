// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "../stylesheets/application";
import "@materializecss/materialize";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

addEventListener("turbolinks:load", () => {
  M.AutoInit(document.body);
  sideMenuInit();
});

const sideMenuInit = () => {
  const sideMenu = document.querySelector(".sidenav");

  if (!sideMenu) {
    return;
  }

  const instance = M.Sidenav.init(sideMenu, {
    edge: "right",
  });

  document.addEventListener(
    "turbolinks:before-cache",
    () => {
      // @ts-ignore
      if (instance._overlay && instance._overlay.parentNode) {
        instance.destroy();
      }
    },
    { once: true }
  );
};
