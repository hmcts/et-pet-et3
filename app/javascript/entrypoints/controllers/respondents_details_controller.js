import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["otherTitle", "title"]
  connect() {
    this.showOrHideOtherTitle()
  }

  showOrHideOtherTitle() {
    this.otherTitleTarget.hidden = this.titleTarget.value !== "Other"
    this.otherTitleTarget.querySelector('input').disabled = this.titleTarget.value !== "Other"
  }
}
