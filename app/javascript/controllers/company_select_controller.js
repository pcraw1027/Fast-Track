import { Controller } from "stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  connect() {
    if (this.selectInstance) return

    this.selectInstance = new TomSelect(this.element, {
        valueField: 'id',
        labelField: 'name',
        searchField: 'name',
        create: false,
        //persist: false,
        hideSelected: true,
        placeholder: 'Search for a company',
        load: (query, callback) => {
          if (!query.length) return callback()
          fetch(`/companies_search?q=${encodeURIComponent(query)}`)
            .then(response => response.json())
            .then(json => callback(json))
            .catch(() => callback())
        },
      })
      
  }

  disconnect() {
    if (this.selectInstance) {
      this.selectInstance.destroy()
      this.selectInstance = null
    }
  }
}
