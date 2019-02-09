using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VideoTutorial.Models;

namespace VideoTutorial.Controllers {
    public class JugadoresController : Controller {
        HelperJugadores helper;
        public JugadoresController() {
            this.helper = new HelperJugadores();
        }
        /*__________________________________________________*/
        //Paginación con Linq, filtrando por equipos
        // GET: PaginarJugadores
        public ActionResult PaginarJugadores(int? posicion, String  equipos) {
            if (posicion == null ) {
                posicion = 0;
            }
            int totalregistros = 0;
            List<InformacionJugadores> jugadores = helper.GetPaginarJugadores(equipos, posicion.GetValueOrDefault(), ref totalregistros);
            ViewBag.TotalRegistros = totalregistros;
            ViewBag.ListEquipo = helper.GetEquipos(); 
            return View(jugadores);
        }
        //POST: PaginarJugadores
        [HttpPost]
        public ActionResult PaginarJugadores(String equipos, int? posicion) {
            if (posicion == null || equipos != ViewBag.Equipos) {
                posicion = 0;
            }
            int totalregistros = 0;
            List<InformacionJugadores> jugadores = helper.GetPaginarJugadores(equipos, posicion.GetValueOrDefault(), ref totalregistros);
            ViewBag.TotalRegistros = totalregistros;
            ViewBag.ListEquipo = helper.GetEquipos();

            ViewBag.Equipos = equipos;

            return View(jugadores);
        }
        /*__________________________________________________*/
        //Paginación con Linq sencilla
        // GET: PaginarLinq
        public ActionResult PaginarLinq(int? posicion){
            if (posicion == null) {
                posicion = 0;
            }
            int totalregistros = 0;
            List<InformacionJugadores> jugadores = helper.GetPaginarLINQ(posicion.GetValueOrDefault(), ref totalregistros);
            ViewBag.TotalRegistros = totalregistros;
            return View(jugadores);
        }
    }
}