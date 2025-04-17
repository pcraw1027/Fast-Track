// app/javascript/controllers/product_classification_controller.js
import { Controller } from "stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  static targets = ["segment", "family", "klass", "brick"]

  connect() {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", () => this.initialize())
    } else {
      this.initialize()
    }
  }
  
  initialize() {
    console.log("Initializing...")
  
    if (!this.segmentSelect && this.hasSegmentTarget) {
      this.segmentSelect = new TomSelect(this.segmentTarget, {
        placeholder: "Select a segment",
        onChange: () => this.updateFamilies()
      })
    }
  
    if (!this.familySelect && this.hasFamilyTarget) {
      this.familySelect = new TomSelect(this.familyTarget, {
        placeholder: "Select a family",
        onChange: () => this.updateKlasses()
      })
    }
  
    if (!this.klassSelect && this.hasKlassTarget) {
      this.klassSelect = new TomSelect(this.klassTarget, {
        placeholder: "Select a klass",
        onChange: () => this.updateBricks()
      })
    }
  
    if (!this.brickSelect && this.hasBrickTarget) {
      this.brickSelect = new TomSelect(this.brickTarget, {
        placeholder: "Select a brick"
      })
    }
  }
  

  async updateFamilies() {
    console.log("updating family...");
    const segmentId = this.segmentTarget.value

    if (!segmentId) {
      this.familySelect.clearOptions()
      return
    }

    try {
      const response = await fetch(`/families_by_segment?segment_id=${segmentId}`)
      const families = await response.json();
      console.log("families", families);
      this.familySelect.clearOptions();
     
      families.forEach((family) => {
        this.familySelect.addOption({
          value: family.id,
          text: `${family.code} ${family.title}`,
        })
      })

      this.familySelect.refreshOptions(false)
    } catch (err) {
      console.error("Error loading families:", err)
    }
  }

  async updateKlasses() {
    const familyId = this.familyTarget.value

    if (!familyId) {
      this.klassSelect.clearOptions()
      return
    }

    try {
      const response = await fetch(`/klasses_by_family?family_id=${familyId}`)
      const klasses = await response.json()

      this.klassSelect.clearOptions()

      klasses.forEach((klass) => {
        this.klassSelect.addOption({
          value: klass.id,
          text: `${klass.code} ${klass.title}`,
        })
      })

      this.klassSelect.refreshOptions(false)
    } catch (err) {
      console.error("Error loading klasses:", err)
    }
  }

  async updateBricks() {
    const klassId = this.klassTarget.value

    if (!klassId) {
      this.brickSelect.clearOptions()
      return
    }

    try {
      const response = await fetch(`/bricks_by_klass?klass_id=${klassId}`)
      const bricks = await response.json()

      this.brickSelect.clearOptions()

      bricks.forEach((brick) => {
        this.brickSelect.addOption({
          value: brick.id,
          text: `${brick.code} ${brick.title}`,
        })
      })

      this.brickSelect.refreshOptions(false)
    } catch (err) {
      console.error("Error loading bricks:", err)
    }
  }


  disconnect() {
    this.segmentSelect?.destroy()
    this.familySelect?.destroy()
    this.klassSelect?.destroy()
    this.brickSelect?.destroy()
  
    this.segmentSelect = null
    this.familySelect = null
    this.klassSelect = null
    this.brickSelect = null
  }
  
}