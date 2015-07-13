import {Socket} from "phoenix"

jQuery.fn.random = function() {
  var randomIndex = Math.floor(Math.random() * this.length)
  return jQuery(this[randomIndex])
}

import ReactInitializer from "./react-initializer"

// let socket = new Socket("/ws")
// socket.connect()
// let chan = socket.chan("topic:subtopic", {})
// chan.join().receive("ok", chan => {
//   console.log("Success!")
// })

class App {
  static init() {
    $("[data-stupidtable]").stupidtable()
  }
}

$(function() { App.init() })

export default App
