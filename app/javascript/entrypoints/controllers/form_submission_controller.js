import { Controller } from "@hotwired/stimulus";
import DisablePdfLink from "../components/DisablePdfLink";

export default class extends Controller {
  connect() {
    DisablePdfLink();
  }
}
