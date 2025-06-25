import { Controller } from "stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  static targets = [
   "personSelect",  "firstName", "lastName", "email", "website",
    "genderType", "ethnicityType", "countryReference",
    "photo", "photoPreview", "middleName", "letters"
  ]

  connect() {
    if (this.selectInstance) return
    this.peopleCache = {}
    this.selectInstance = new TomSelect(this.element, {
      valueField: 'id',
      labelField: 'first_name',
      searchField: 'first_name',
      maxOptions: 10,
      loadThrottle: 300,
      create: false,
      hideSelected: true,
      placeholder: 'Search for a person',

      load: (query, callback) => {
        if (!query.length) return callback()
        fetch(`/people_search?q=${encodeURIComponent(query)}`)
          .then(response => response.json())
          .then(json => {
            this.peopleCache = {} 
            json.forEach(person => this.peopleCache[person.id] = person)
            return json.map((person) => ({
              id: person.id,
              first_name: `${person.first_name} ${person.last_name} - ${person.email}`
            }))
          })
          .then(res => callback(res))
          .catch(() => callback())
      },

      onItemAdd: (value) => {
        const person = this.peopleCache?.[value]
        if (!person) return

        // Populate the fields
        this.firstNameTarget.value = person.first_name
        this.lastNameTarget.value = person.last_name
        this.middleNameTarget.value = person.middle_name
        this.lettersTarget.value = person.letters
        this.emailTarget.value = person.email
        this.websiteTarget.value = person.website
        this.genderTypeTarget.value = person.gender_type_id
        this.ethnicityTypeTarget.value = person.ethnicity_type_id
        this.countryReferenceTarget.value = person.country_reference_id
        // if (person.picture && this.hasPhotoTarget) {
        //     this.photoTarget.value = person.picture
        // }

        // if (person.picture && this.hasPhotoPreviewTarget) {
        //     this.photoPreviewTarget.src = person.picture
        //     this.photoPreviewTarget.classList.remove("d-none")
        // }
      }
    })
  }

  disconnect() {
    if (this.selectInstance) {
      this.selectInstance.destroy()
      this.selectInstance = null
    }
  }
}
