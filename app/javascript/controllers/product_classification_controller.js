import { Controller } from "stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  static targets = ["brickSearch", "segment", "family", "klass", "brick"]

  connect() {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", () => this.initialize())
    } else {
      this.initialize();
    }
  }
  
  initialize() {
    if (!this.hasBrickTarget) return;

    if (!this.brickSearchSelect && this.hasBrickSearchTarget) {
      this.brickSearchSelect = new TomSelect(this.brickSearchTarget, {
        placeholder: "Search a brick title",
         valueField: 'id',
          labelField: 'title',
          searchField: 'title',
          maxOptions: 10,
          loadThrottle: 300,
          create: false,
          hideSelected: true,
          placeholder: 'Search for a brick by title',
    
          load: (query, callback) => {
      
            if (!query.length) return callback()
            fetch(`/bricks_by_title_search?q=${encodeURIComponent(query)}`)
              .then(response => response.json())
              .then(json => {
                this.brickCache = {} 
                json.forEach(brick => this.brickCache[brick.id] = brick)
                return json.map((brick) => ({
                  id: brick.id,
                  title: `${brick.code} ${brick.title}`
                }))
              })
              .then(res => callback(res))
              .catch(() => callback())
          },
    
          onItemAdd: (value) => {
            const brick = this.brickCache?.[value]
            if (!brick) return
           
            // Populate other select fields
            this.brickSelect.addOption({
              value: brick.id,
              text: `${brick.code} ${brick.title}`,
            });
            this.brickSelect.setValue(brick.id, true);
            this.brickSelect.refreshOptions(false)

            this.klassSelect.addOption({
              value: brick.klass.id,
              text: `${brick.klass.code} ${brick.klass.title}`,
            });
            this.klassSelect.setValue(brick.klass.id, true);
            this.brickSelect.refreshOptions(false)

            this.familySelect.addOption({
              value: brick.family.id,
              text: `${brick.family.code} ${brick.family.title}`,
            });
            this.familySelect.setValue(brick.family.id, true);
            this.familySelect.refreshOptions(false)

            this.segmentSelect.addOption({
              value: brick.segment.id,
              text: `${brick.segment.code} ${brick.segment.title}`,
            });
            this.segmentSelect.setValue(brick.segment.id, true);
            this.segmentSelect.refreshOptions(false)
          }
      })
    }

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