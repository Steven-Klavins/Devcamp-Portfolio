import "../stylesheets/portfolio"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "packs/html.sortable"
import { ready } from "jquery"
require('webpack-jquery-ui');
require('webpack-jquery-ui/css');

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// On document load find each item with css class .sortable and call sortable method
document.addEventListener('turbolinks:load', () => {
    $('.sortable').sortable()
})