import { Controller } from "stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  connect() {
    if (this.selectInstance) return

    this.selectInstance = new TomSelect(this.element, {
        valueField: 'id',
        labelField: 'title',
        searchField: 'title',
        create: false,
        //persist: false,
        hideSelected: true,
        placeholder: 'Search for an industry category',
        load: (query, callback) => {
          if (!query.length) return callback()
          fetch(`/industry_categories_search?q=${encodeURIComponent(query)}`)
            .then(response => response.json())
            .then(json => json.map((c)=>({id: c.id, title: `${c.category_code} - ${c.title}`})))
            .then(res => callback(res))
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
