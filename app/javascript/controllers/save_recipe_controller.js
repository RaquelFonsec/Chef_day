
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-recipe"
export default class extends Controller {
  static values = {id: String, mealPlanningId: String}
  static targets = ["button", "message"]

  connect() {}

  save(event){
    event.preventDefault()
    let params = { "recipe_id": this.idValue, "meal_planning_id": this.mealPlanningIdValue }
    console.dir(params)
    fetch(`/meal_plannings/${params.meal_planning_id}/recipes`, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify(params)
    })
    .then(response =>response.json())
    .then((data)=>{
      console.log(data)
      console.log(this.buttonTarget)
      this.buttonTarget.innerText = "Recipe Saved"
      this.buttonTarget.disabled = true
      this.messageTarget.hidden = false
    })
  }
}

