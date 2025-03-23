import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["audio"]

  connect() {
    // Este método é chamado quando o controller é conectado ao DOM
    console.log("Olá mundo")
  }

  play() {
    console.log("Olá mundo")
    this.audioTarget.play()

    event.preventDefault();
    this.audioTarget.addEventListener("ended", () => {
      this.element.querySelector("form").submit();
    });
  }

}
