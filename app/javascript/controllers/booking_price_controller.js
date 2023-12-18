import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-price"
export default class extends Controller {
  static targets = ["startDate", "endDate", "priceContainer", "priceDisplay", "pricePerDay", "durationDisplay", "teapotStyle"];

  connect() {
  }

  priceDisplay() {
    const start = new Date(this.startDateTarget.value);
    const end = new Date(this.endDateTarget.value);
    if (!isNaN(start) && !isNaN(end)) {
      const duration = (end - start) / (1000 * 60 * 60 * 24);
      const totalPrice = duration * this.pricePerDayTarget.value;
      const day = duration > 1 ? "days" : "day";
      this.priceContainerTarget.classList.remove("d-none");
      this.durationDisplayTarget.innerText = `You will send a booking request for ${this.teapotStyleTarget.value} for ${duration} ${day}.`;
      this.priceDisplayTarget.innerText = `Your booking will cost ${totalPrice} euros.`;
      this.durationDisplayTarget.style.fontWeight = "bold";
      this.priceDisplayTarget.style.fontWeight = "bold";
    }
  }
}
