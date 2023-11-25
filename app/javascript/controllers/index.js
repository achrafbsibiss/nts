// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

import SearchController from "./search_controller.js"
application.register("search", SearchController)

import DropdownController from "./dropdown_controller.js"
application.register('dropdown', DropdownController)

// import Notification from 'stimulus-notification'
import NotificationsContoller from "./notifications_controller.js"
application.register('notifications', NotificationsContoller)

import EquipmentController from "./equipment_controller"
application.register("equipment", EquipmentController )

// const application = Application.start()
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
