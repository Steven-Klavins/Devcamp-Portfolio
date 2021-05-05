import "../stylesheets/portfolio";

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "bootstrap";
import "packs/html.sortable";
import { ready } from "jquery";
import 'sweetalert'
require("webpack-jquery-ui");
require("webpack-jquery-ui/css");
require("@nathanvda/cocoon")

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// On document load find each item with css class .sortable and call sortable method
document.addEventListener("turbolinks:load", () => {
  $(".sortable").sortable();
});

function set_positons() {
  $(".card").each(function (element) {
    $(this).attr("data-pos"), element + 1;
    return;
  });
}

$(window).on("load", function () {
  console.log("called");
  set_positons();

  $(".sortable").sortable();

  $(".sortable")
    .sortable()
    .bind("sortupdate", function (e, ui) {
      let updated_order = [];
      set_positons();
      $(".card").each(function (element) {
        updated_order.push({ id: $(this).data("id"), position: element + 1 });
      });

      $.ajax({
        type: "PUT",
        url: "portfolios/sort",
        data: { order: updated_order },
      });
    });
  //dom is changed
});
