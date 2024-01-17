// app/javascript/controllers/review_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "link" ]

  disableLink() {
    this.linkTarget.classList.add('disabled');
  }
}
