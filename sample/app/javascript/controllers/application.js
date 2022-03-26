import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
export { application }
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts
window.ApexCharts = require("apexcharts") // expose to window
