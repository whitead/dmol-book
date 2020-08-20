
function insert_anchor(element) {
    if (element.parentElement.tagName !== 'A') {
        let new_a = document.createElement('a')
        new_a.href = element.getAttribute('src')
        let p = element.parentElement
        element.parentElement.removeChild(element)
        new_a.appendChild(element)
        p.appendChild(new_a)
    }
}

function add_img_anchors() {
    let figs = document.querySelectorAll(".figure img")
    figs.forEach(insert_anchor)
    let cell_outputs = document.querySelectorAll(".cell_output img")
    cell_outputs.forEach(insert_anchor)
}

window.addEventListener('load', add_img_anchors)