const origenSelect = document.getElementById('origen');
const destinoSelect = document.getElementById('destino');
const accesibilidadCheckbox = document.getElementById('accesibilidad');
const resultadoDiv = document.getElementById('resultado');

async function cargarEstaciones(accesibles = false) {
  try {
    const res = await fetch('estaciones.php' + (accesibles ? '?accesibles=si' : ''));
    if (!res.ok) throw new Error('Error al cargar estaciones');
    const estaciones = await res.json();

    origenSelect.innerHTML = '';
    destinoSelect.innerHTML = '';

    estaciones.forEach(nombre => {
      const optionOrigen = new Option(nombre, nombre);
      const optionDestino = new Option(nombre, nombre);
      origenSelect.add(optionOrigen);
      destinoSelect.add(optionDestino);
    });
  } catch (e) {
    resultadoDiv.textContent = e.message;
  }
}

accesibilidadCheckbox.addEventListener('change', () => {
  cargarEstaciones(accesibilidadCheckbox.checked);
});

document.getElementById('formulario').addEventListener('submit', async (e) => {
  e.preventDefault();
  resultadoDiv.textContent = 'Calculando ruta...';

  const formData = new FormData(e.target);

  try {
    const res = await fetch('ruta_dijkstra.php', {
      method: 'POST',
      body: formData
    });

    if (!res.ok) throw new Error('Error en la respuesta del servidor');
    const data = await res.json();

    if (data.error) {
      resultadoDiv.textContent = 'Error: ' + data.error;
    } else {
      resultadoDiv.innerHTML = `Ruta: ${data.camino.join(' → ')}<br>Tiempo estimado: ${data.tiempo} minutos`;
    }
  } catch (err) {
    resultadoDiv.textContent = 'Error en la solicitud.';
    console.error(err);
  }
});

cargarEstaciones(false);
