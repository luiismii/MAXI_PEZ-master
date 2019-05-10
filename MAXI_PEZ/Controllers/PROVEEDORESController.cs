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
    public class PROVEEDORESController : Controller
    {
        private Entities1 db = new Entities1();

        // GET: PROVEEDORES
        public async Task<ActionResult> Index()
        {
            return View(await db.PROVEEDORES.ToListAsync());
        }

        // GET: PROVEEDORES/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PROVEEDORES pROVEEDORES = await db.PROVEEDORES.FindAsync(id);
            if (pROVEEDORES == null)
            {
                return HttpNotFound();
            }
            return View(pROVEEDORES);
        }

        // GET: PROVEEDORES/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PROVEEDORES/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id_Proveedor,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Empresa,Direccion,Telefono,Correo,Fecha_Nacimiento")] PROVEEDORES pROVEEDORES)
        {
            if (ModelState.IsValid)
            {
                db.PROVEEDORES.Add(pROVEEDORES);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(pROVEEDORES);
        }

        // GET: PROVEEDORES/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PROVEEDORES pROVEEDORES = await db.PROVEEDORES.FindAsync(id);
            if (pROVEEDORES == null)
            {
                return HttpNotFound();
            }
            return View(pROVEEDORES);
        }

        // POST: PROVEEDORES/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id_Proveedor,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Empresa,Direccion,Telefono,Correo,Fecha_Nacimiento")] PROVEEDORES pROVEEDORES)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pROVEEDORES).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(pROVEEDORES);
        }

        // GET: PROVEEDORES/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PROVEEDORES pROVEEDORES = await db.PROVEEDORES.FindAsync(id);
            if (pROVEEDORES == null)
            {
                return HttpNotFound();
            }
            return View(pROVEEDORES);
        }

        // POST: PROVEEDORES/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            PROVEEDORES pROVEEDORES = await db.PROVEEDORES.FindAsync(id);
            db.PROVEEDORES.Remove(pROVEEDORES);
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
