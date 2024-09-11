import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.modal = this.element
    this.backdrop = this.modal.querySelector('.modal-backdrop')
    this.modalContent = this.modal.querySelector('.modal-content')

    this.backdrop.addEventListener('click', this.close.bind(this))
  }

  open() {
    this.modal.classList.remove('hidden')
    this.modal.classList.add('block')
  }

  close(event) {
    if (event && event.detail && event.detail.success) {
      this.modal.classList.add('hidden')
      this.modal.classList.remove('block')
    }
    else {
      // Hide the modal if the click is outside the content area.
      if (!this.modalContent.contains(event.target)) {
        this.modal.classList.add('hidden')
        this.modal.classList.remove('block')
      }
    }
  }
}
