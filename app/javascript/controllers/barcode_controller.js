import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["barcodeInput", "fileInput", "display"]

  async submitAdd(event) {
    event.preventDefault();
    const inp = document.getElementById("barcode")
    const barcode = inp.value;
   
    if (!barcode) return this.showError("Please enter barcode.");
    if (![6, 8, 12, 13].includes(barcode.length)) return this.showError("barcode must be 6, 8, 12, or 13 characters long, symbology UPC-E, EAN-8, UPC-A, or EAN-13.");
    const formData = new FormData();
    //console.log("Barcode to submit:", barcode); // Debugging line
    formData.append("domains_croupier_core_bit_record[barcode]", barcode)
    try {
        const response = await fetch("/insert_barcode", {
          method: "POST",
          body: formData,
          headers: {
            "Accept": "application/json"
          }
        });
  
        const data = await response.json();
  
        if (Array.isArray(data.bit_records)) {
          document.getElementById("barcode").value = "";
          data.bit_records.forEach(record => {
            this.displayTarget.insertAdjacentHTML("afterbegin", `
               <tr>
                <td>${record.bit_rec.barcode}</td>
                <td>${record.bit_rec.status}</td>
                <td>${record.bit_rec.source}</td>
                <td>${record.bit_rec.user_id}</td>
                <td>${this.formatDate(record.bit_rec.created_at)}</td>
                <td>${record.message}</td>
                <td><a style="background-color: transparent;
                              border: 1px solid #8cc63f;
                              border-radius: 15px;
                              padding: 5px 20px 5px 20px;
                              text-decoration: none;"
                              color: #333 !important;
                              font-weight: 500;
                  href=/product_capture_interface?barcode=${record.bit_rec.barcode} 
                  target="_blank" >Add</a></td>
              </tr>
            `)
          })
        }
  
        if (data.error) this.showError(data.error)
  
      } catch (error) {
        this.showError("An error occurred while uploading.")
        console.error("Upload failed", error)
      }
  }

  async handleLoad(event) {
    event.preventDefault();

    const file = document.getElementById("fileinput").files[0]
    if (!file) return this.showError("Please choose a file to load.")

    const formData = new FormData()
    console.log("domains_croupier_core_bit_record[file]");
    formData.append("domains_croupier_core_bit_record[file]", file)

    try {
      const response = await fetch("/insert_barcode", {
        method: "POST",
        body: formData,
        headers: {
          "Accept": "application/json"
        }
      })

      const data = await response.json();
    
      if (Array.isArray(data.bit_records)) {
        document.getElementById("fileinput").value = ""
        data.bit_records.forEach(record => {
          this.displayTarget.insertAdjacentHTML("afterbegin", `
             <tr>
              <td>${record.bit_rec.barcode}</td>
              <td>${record.bit_rec.status}</td>
              <td>${record.bit_rec.source}</td>
              <td>${record.bit_rec.user_id}</td>
              <td>${this.formatDate(record.bit_rec.created_at)}</td>
              <td>${record.message}</td>
            </tr>
          `)
        })
      }

      if (data.error) this.showError(data.error)

    } catch (error) {
      this.showError("An error occurred while uploading.")
      console.error("Upload failed", error)
    }
  }

  
  showError(message) {
    document.getElementById("barcode-error").textContent = message
    document.getElementById("barcode-error").classList.remove("d-none")
    
    setTimeout(() => {
      document.getElementById("barcode-error").classList.add("d-none")
      document.getElementById("barcode-error").textContent = ""
    }, 5000)
  }

  formatDate(timestamp) {
    const date = new Date(timestamp);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); 
    const year = date.getFullYear();
    return `${month}/${day}/${year}`;
  }
  
}
