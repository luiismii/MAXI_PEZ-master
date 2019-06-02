using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MAXI_PEZ.App_Data;

namespace MAXI_PEZ.Controllers
{
    public class CLIENTESController : Controller
    {
        private Entities db = new Entities();

        // GET: CLIENTES
        public async Task<ActionResult> Index()
        {
            return View(await db.CLIENTES.ToListAsync());
        }

        // GET: CLIENTES/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = await db.CLIENTES.FindAsync(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            return View(cLIENTES);
        }

        // GET: CLIENTES/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CLIENTES/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id_Cliente,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Direccion,Telefono,Correo,Fecha_Nacimiento")] CLIENTES cLIENTES)
        {
            if (ModelState.IsValid)
            {
                db.CLIENTES.Add(cLIENTES);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(cLIENTES);
        }

        // GET: CLIENTES/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = await db.CLIENTES.FindAsync(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            return View(cLIENTES);
        }

        // POST: CLIENTES/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id_Cliente,Primer_Nombre,Segundo_Nombre,Primer_Apellido,Segundo_Apellido,Direccion,Telefono,Correo,Fecha_Nacimiento")] CLIENTES cLIENTES)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cLIENTES).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(cLIENTES);
        }

        // GET: CLIENTES/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CLIENTES cLIENTES = await db.CLIENTES.FindAsync(id);
            if (cLIENTES == null)
            {
                return HttpNotFound();
            }
            return View(cLIENTES);
        }

        // POST: CLIENTES/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            CLIENTES cLIENTES = await db.CLIENTES.FindAsync(id);
            db.CLIENTES.Remove(cLIENTES);
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
