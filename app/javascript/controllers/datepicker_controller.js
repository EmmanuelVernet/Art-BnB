import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  // static values = { datepicker: Number}

  connect() {
    flatpickr(this.element, {
      mode: "range",
      onChange: this.handleDateChange.bind(this) // Bind the method to ensure proper `this` context
    })
    
  }
  handleDateChange(selectedDates, dateStr, instance) {
      const price = parseInt(this.element.dataset.datepickerValue, 10);
      // `selectedDates` is an array of Date objects representing the selected date(s)
      // `dateStr` is the formatted date string (e.g., "2023-12-25 to 2023-12-31" for range mode)
      // `instance` is the Flatpickr instance
      
      console.log("Selected dates:", selectedDates);
      console.log("Formatted date string:", dateStr);
      // split dateStr string to isolate dates
      const dateSplit = dateStr.split("to");
      // calculate time delta
      const startDate = new Date(dateSplit[0].trim());
      const endDate = new Date(dateSplit[1].trim());
      const timeDelta = (endDate - startDate) / (1000 * 60 * 60 * 24); // Convert milliseconds to days
      console.log("Delta: ",timeDelta);
      // multiply by price
      const totalPrice = timeDelta * price;
      console.log("Price: ", totalPrice);
      // select target element in DOM to update
      const dynamicPriceElement = document.getElementById("dynamic-price"); // Adjust selector as needed
      // insert innerHTML 
      dynamicPriceElement.innerHTML = `<strong> Renting price: </strong> ${new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
      }).format(totalPrice)}`;

      
      // Example: Update an element or perform an action based on the selected date range
      // const price = this.datepickerValue; // Access the value passed to the controller
      console.log("Price based on selection:", price);
    }
}
