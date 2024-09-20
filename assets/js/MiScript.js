let total = 0;

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    console.log("Nombre:", ev.target.dataset.name, "Precio:", ev.target.dataset.price);

    const name = ev.target.dataset.name;
    const price = ev.target.dataset.price;

    if (name && price) {
        ev.dataTransfer.setData("text", name + "," + price);
        ev.dataTransfer.setData("elementId", ev.target.id);  // Guardamos el id del elemento arrastrado
    } else {
        console.error("Los datos name o price no están disponibles en el elemento");
    }
}

function drop(ev) {
    ev.preventDefault();

    const data = ev.dataTransfer.getData("text").split(",");
    const name = data[0];
    const price = parseFloat(data[1]);

    console.log("Añadiendo al carrito:", name, price);

    if (name && !isNaN(price)) {
        const li = document.createElement("li");
        li.textContent = `${name} - $${price}`;

        // Hacer que cada elemento del carrito sea draggable y añada data-name y data-price
        li.setAttribute("draggable", "true");
        li.setAttribute("ondragstart", "drag(event)");
        li.setAttribute("data-name", name);
        li.setAttribute("data-price", price);
        li.setAttribute("id", `item-${name}`);  // Asignar un ID único al item

        document.getElementById("cart-items").appendChild(li);

        // Sumamos al total
        total += price;
        document.getElementById("total").textContent = total.toFixed(2);
    } else {
        console.error("Error: Los datos del ítem no son válidos", name, price);
    }
}

function dropTrash(ev) {
    ev.preventDefault();

    // Obtenemos el id del elemento arrastrado
    const elementId = ev.dataTransfer.getData("elementId");
    const element = document.getElementById(elementId);

    // Verificamos que el elemento existe en el carrito
    if (element) {
        const price = parseFloat(element.dataset.price);

        // Restamos del total el precio
        total -= price;
        document.getElementById("total").textContent = total.toFixed(2);

        // Eliminamos el elemento del carrito
        element.remove();
    } else {
        console.error("El elemento no se encuentra en el carrito");
    }
}
function mostrar(icono, titulo, mensaje) {
    Swal.fire({
        title: titulo,
        text: mensaje,
        icon: icono,
    });
}

function finalizePurchase() {
    const now = new Date();
    const currentHour = now.getHours();

    if (currentHour >= 16 || currentHour < 3) {
        
        mostrar("success", "Compra verificada", `gracias por tu compra!`);
        resetCart();
    } else {
        mostrar("success", "No se puede realizar la compraa", `Fuera del horario de 4:00 PM a 3:00 AM!`);
    }
}

function resetCart() {
    total = 0;
    document.getElementById("cart-items").innerHTML = "";
    document.getElementById("total").textContent = "0";
}

console.log("Hola desde MiScript.js")

//Google Map
function getGeo() {
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geoOK, geoERROR);

    }
}

function geoOK(position) {
    console.log(position)
    showLatLong(position.coords.latitude, position.coords.longitude)
    initMap2(position.coords.latitude, position.coords.longitude)
}

function geoERROR(error) {
    if (error.code = 1) {
        console.log("el usuario nego el permiso")
        alert("el usuario nego el permiso")
    } else if (error.code == 2) {
        console.log("no se puede recuperr la ubicacion")
        alert("No se puede recuperar la ubicacion")
    } else if (error.code == 3) {
        console.log("Expiro el tiempo de respuesta")
        alert("Expiro el tiempo de respuesta")
    } else {
        console.log("Error: " + error.code)
        alert("Error: " + error.code)
    }
}


function showLatLong(lat, long) {
    var geocoder = new google.maps.Geocoder();
    var milocalizacion = new google.maps.LatLng(lat, long);
    console.log(milocalizacion);
    geocoder.geocode({ 'latLng': milocalizacion }, processGeocoder);
}

function processGeocoder(result, status) {
    //imprimimos lo que estamos recoviendo en la funcion
    console.log(result);
    console.log(status);

    if (status == google.maps.GeocoderStatus.OK) {
        if (result[0]) {
            var direccion = result[0].formatted_address;
            $("#direccion").html(direccion);

        } else {
            error("Google no respondio ningun resultado")
        }
    }
    else {
        error("Google marco un error")
    }
}

let map;

async function initMap() {
    const { Map } = await google.maps.importLibrary("maps");
}

function initMap2(lat, lng) {
    var miscoordenadas = new google.maps.LatLng(lat, lng);
    var mapoptions = {
        zoom: 15,
        center: miscoordenadas,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map"), mapoptions)
    new google.maps.Marker({
        position: miscoordenadas,
        map,
        title: "Hola mudo"
    });
    //con jquery
    $("#street").css("height", 300);
    //creo y configuro el streetview
    var panorama = new google.maps.StreetViewPanorama(document.getElementById("street"),
        { position: miscoordenadas, pov: { heading: 90, pitch: 5 } })
    map.setStreetView(panorama)
    //recargo el mapa por ultima ocacion
    window.initMap = initMap;
}

// Función para obtener el día de la semana actual
function obtenerDia() {
    const dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const hoy = new Date().getDay(); // Obtiene el índice del día actual (0 es Domingo, 1 es Lunes, etc.)
    return dias[hoy]; // Devuelve el nombre del día
}

// Cuando el DOM esté cargado, resalta la promoción del día actual
document.addEventListener('DOMContentLoaded', function () {
    const promoDiaActual = obtenerDia(); // Obtener el día de hoy
    const promos = document.querySelectorAll('.testimonial-item'); // Seleccionar todas las promociones
    promos.forEach(function (promo) {
        const diaPromo = promo.querySelector('.promo-dia').textContent; // Obtener el día de la promo
        if (diaPromo === promoDiaActual) { // Comparar con el día actual
            promo.style.border = '2px solid #ff0000'; // Añadir borde rojo
            const titulo = document.createElement('h3'); // Crear título
            titulo.textContent = '¡Hoy es el día de esta promoción!'; // Texto de aviso
            promo.prepend(titulo); // Insertar el título al inicio del bloque de la promoción
        }
    });
});