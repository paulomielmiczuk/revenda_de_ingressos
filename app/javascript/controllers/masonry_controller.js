import { Controller } from "@hotwired/stimulus"
import Masonry from 'masonry-layout'

// Connects to data-controller="masonry"
export default class extends Controller {
  static targets = [ 'image', 'item' ]

  connect() {
    const imagesLoaded = Promise.all(
      Array.from(this.imageTargets).map(img => {
        return new Promise((resolve) => {
          if (img.complete) {
            resolve();
          } else {
            img.onload = resolve;
            img.onerror = resolve;
          }
        });
      })
    );

    imagesLoaded.then(() => {
      console.log('images loaded');
      this.itemTargets.forEach(item => {
        item.classList.remove('d-none')
      });
      new Masonry( this.element, {
        "itemSelector": ".grid-item",
        "columnWidth": 277,
        "gutter": 30
      });
    });

  }
}
