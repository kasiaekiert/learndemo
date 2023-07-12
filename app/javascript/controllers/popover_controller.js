import { application } from "controllers/application"

import Popover from 'stimulus-popover'
application.register('popover', Popover)

export default class extends Popover {
  connect() {
    console.log("Popover is working")
  }
}
