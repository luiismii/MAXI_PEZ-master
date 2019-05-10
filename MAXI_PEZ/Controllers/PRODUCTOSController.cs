using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MAXI_PEZ.Models;


namespace MAXI_PEZ.Controllers
{
    public class PRODUCTOSController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: PRODUCTOS
        public async Task<ActionResult> Index()
        {
            return View(await db.PRODUCTOS.ToListAsync());
        }

        // GET: PRODUCTOS/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCTOS pRODUCTOS = await db.PRODUCTOS.FindAsync(id);
            if (pRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(pRODUCTOS);
        }

        // GET: PRODUCTOS/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PRODUCTOS/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id_Producto,Nombre_Producto,Descripcion,Precio")] PRODUCTOS pRODUCTOS)
        {
            if (ModelState.IsValid)
            {
                db.PRODUCTOS.Add(pRODUCTOS);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(pRODUCTOS);
        }

        // GET: PRODUCTOS/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCTOS pRODUCTOS = await db.PRODUCTOS.FindAsync(id);
            if (pRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(pRODUCTOS);
        }

        // POST: PRODUCTOS/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id_Producto,Nombre_Producto,Descripcion,Precio")] PRODUCTOS pRODUCTOS)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pRODUCTOS).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(pRODUCTOS);
        }

        // GET: PRODUCTOS/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PRODUCTOS pRODUCTOS = await db.PRODUCTOS.FindAsync(id);
            if (pRODUCTOS == null)
            {
                return HttpNotFound();
            }
            return View(pRODUCTOS);
        }

        // POST: PRODUCTOS/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            PRODUCTOS pRODUCTOS = await db.PRODUCTOS.FindAsync(id);
            db.PRODUCTOS.Remove(pRODUCTOS);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
