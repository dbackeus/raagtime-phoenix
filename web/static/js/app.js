import {Socket} from "phoenix"

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
