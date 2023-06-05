import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import { Application } from '@hotwired/stimulus'
import Popover from 'stimulus-popover'

application.register('popover', Popover)
eagerLoadControllersFrom("controllers", application)

const application = Application.start()
