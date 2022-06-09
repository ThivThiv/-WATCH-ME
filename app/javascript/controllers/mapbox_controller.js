import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"


export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markerValue)
    console.log(this.apiKeyValue)

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/messa57fr/cl475o65p000w14nv1qh1dec7"
    })

    this.#addMarkersToMap()

    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .addTo(this.map)
   }

   #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([this.markerValue.lng, this.markerValue.lat ])
      //this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
      this.map.fitBounds([
        [8.215170977663734, 48.97584941615634], // Northeast
        [-3.914615903064396, 42.595905917991274]  // Southwest
    ]);
   }
}
