// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// 好みでON/OFF
application.debug = false
window.Stimulus = application

export { application }
