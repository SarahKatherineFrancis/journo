// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ActivitiesTabsController from "./activities_tabs_controller"
application.register("activities-tabs", ActivitiesTabsController)

import ActivityDropdownController from "./activity_dropdown_controller"
application.register("activity-dropdown", ActivityDropdownController)

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import NotesController from "./notes_controller"
application.register("notes", NotesController)

import RecommendationTabsController from "./recommendation_tabs_controller"
application.register("recommendation-tabs", RecommendationTabsController)
