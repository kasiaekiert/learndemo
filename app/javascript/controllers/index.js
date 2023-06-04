// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Probably in app/javascript/controllers/index.js
import { Application } from '@hotwired/stimulus'

// import HelloController from "./controllers/hello_controller"
import CharacterCounter from 'stimulus-character-counter'

window.Stimulus = Application.start()

// Stimulus.register("hello", HelloController)
Stimulus.register('character-counter', CharacterCounter)

import Popover from 'stimulus-popover'

const application = Application.start()
application.register('popover', Popover)