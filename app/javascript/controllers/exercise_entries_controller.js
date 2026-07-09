import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "container",
    "template",
    "row",
    "setContainer",
    "setTemplate",
    "setRow",
    "setLabel"
  ]

  add() {
    const content = this.templateTarget.innerHTML.replaceAll(
      "NEW_RECORD",
      new Date().getTime()
    )

    this.containerTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    const row = event.target.closest("[data-exercise-entries-target~='row']")
    const destroyInput = row.querySelector("input[name*='[_destroy]']")
    const idInput = row.querySelector("input[name*='[id]']")

    if (idInput && idInput.value && destroyInput) {
      destroyInput.value = "1"
      row.classList.add("hidden")
    } else {
      row.remove()
    }
  }

  addSet(event) {
    const exerciseRow = event.target.closest("[data-exercise-entries-target~='row']")
    const container = exerciseRow.querySelector("[data-exercise-entries-target~='setContainer']")
    const template = exerciseRow.querySelector("[data-exercise-entries-target~='setTemplate']")

    const content = template.innerHTML.replaceAll(
      "NEW_SET_RECORD",
      new Date().getTime()
    )

    container.insertAdjacentHTML("beforeend", content)
    this.renumberSets(exerciseRow)
  }

  removeSet(event) {
    const exerciseRow = event.target.closest("[data-exercise-entries-target~='row']")
    const setRow = event.target.closest("[data-exercise-entries-target~='setRow']")
    const destroyInput = setRow.querySelector("input[name*='[_destroy]']")
    const idInput = setRow.querySelector("input[name*='[id]']")

    if (idInput && idInput.value && destroyInput) {
      destroyInput.value = "1"
      setRow.classList.add("hidden")
    } else {
      setRow.remove()
    }

    this.renumberSets(exerciseRow)
  }

  renumberSets(exerciseRow) {
    const visibleSetRows = Array.from(
      exerciseRow.querySelectorAll("[data-exercise-entries-target~='setRow']")
    ).filter((setRow) => !setRow.classList.contains("hidden"))

    visibleSetRows.forEach((setRow, index) => {
      const setNumber = index + 1
      const setNumberInput = setRow.querySelector("input[name*='[set_number]']")
      const setLabel = setRow.querySelector("[data-exercise-entries-target~='setLabel']")

      if (setNumberInput) {
        setNumberInput.value = setNumber
      }

      if (setLabel) {
        setLabel.textContent = setNumber
      }
    })
  }
}
