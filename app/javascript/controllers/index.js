import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import { Application } from '@hotwired/stimulus'
eagerLoadControllersFrom("controllers", application)
