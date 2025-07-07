import { Controller } from "stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  static targets = [
   "personSelect"
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

        const str = this.element.id
        const idStr = str.replace(/_person_id$/, '');
        
        if(document.getElementById(`${idStr}_first_name`)){
            document.getElementById(`${idStr}_first_name`).value = person.first_name;
        }

        if(document.getElementById(`${idStr}_middle_name`)){
            document.getElementById(`${idStr}_middle_name`).value = person.middle_name;
        }
        
        if(document.getElementById(`${idStr}_last_name`)){
            document.getElementById(`${idStr}_last_name`).value = person.last_name;
        }



      

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
