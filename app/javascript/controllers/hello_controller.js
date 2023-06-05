import { Controller } from "@hotwired/stimulus"

import CharacterCounter from 'stimulus-character-counter'

export default class extends Controller {
  connect() {
    Stimulus.register('character-counter', CharacterCounter)
    this.element.textContent = "Hello World!"
  }
}
