using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using WebAnime.Models;
using X.PagedList;

namespace WebAnime.Controllers
{
    public class MyController : Controller
    {
        private AnimeContext db;
        public MyController(AnimeContext context)
        {
            db = context;
        }
        public IActionResult Index(int? mid)
        {
            if (mid == null)
            {

                var lstanime = db.Animes.Include(m => m.TheLoai).ToList();
                return View(lstanime);
            }
            else
            {
                var lstanime = db.Animes.Where(l => l.MaTheLoai == mid).Include(m => m.TheLoai).ToList();

                return View(lstanime);
            }
        }
        public IActionResult Details(int id)
        {
            if (id == null || db.Animes == null)
            {
                return NotFound();
            }
            var anime = db.Animes.Include(m=>m.TheLoai).Include(m => m.QuocGia).Include(m => m.TrangThai).Include(m => m.LichChieu).SingleOrDefault(a => a.MaAnime == id);
            if (anime == null)
            {
                return NotFound();
            }
            return View(anime);           
        }
        public IActionResult Watching(int id, int tapSo)
        {
            if (id == null || db.Animes == null)
            {
                return NotFound();
            }
            else
            {
                var anime = db.Animes
                    .Include(m => m.TheLoai)
                    .Include(m => m.QuocGia)
                    .Include(m => m.TrangThai)
                    .Include(m => m.LichChieu)
                    .SingleOrDefault(a => a.MaAnime == id);
                var video1 = db.ViDeos
                    .Where(x => x.MaAnime == id)
                    .ToList();
                var video2 = db.ViDeos
                    .Where(x => x.MaAnime == id && x.TapSo == tapSo)
                    .ToList();

                ViewBag.video1 = video1;
                ViewBag.video2 = video2;

                if (anime == null)
                {
                    return NotFound();
                }

                return View(anime);
            }
        }
        public IActionResult NextWatching(int id, int tapSo)
        {
            if (id == null || db.Animes == null)
            {
                return NotFound();
            }
            else
            {
                var anime = db.Animes
                    .Include(m => m.TheLoai)
                    .Include(m => m.QuocGia)
                    .Include(m => m.TrangThai)
                    .Include(m => m.LichChieu)
                    .SingleOrDefault(a => a.MaAnime == id);

                var video2 = db.ViDeos
                    .Where(x => x.MaAnime == id && x.TapSo == tapSo)
                    .ToList();
                var video1 = db.ViDeos
                    .Where(x => x.MaAnime == id)
                    .ToList();

                ViewBag.video1 = video1;
                ViewBag.video2 = video2;

                if (anime == null)
                {
                    return NotFound();
                }
                return View(anime);
                
            }
        }
        public IActionResult Blog()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult AjaxTheLoai(int mid,int? page)
        {
            int pageSize = 9;
             int pageNumber = page.HasValue && page.Value > 0 ? page.Value : 1;
            var lstanime = db.Animes.Where(l => l.MaTheLoai == mid).Include(m => m.TheLoai).OrderBy(x => x.MaAnime).ToPagedList(pageNumber, pageSize);
            return PartialView("TheLoai",lstanime);
        }
    }
}
