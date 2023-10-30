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
        public IActionResult Index()
        {
                      
            var lstanime = db.Animes.Include(m => m.TheLoai).OrderBy(x => x.TenPhim);
          
            return View(lstanime);
        }
        public IActionResult AnimeTheoLoai(int? mid, int? page)
        {
            if (mid == null)
            {
                int pageSize = 9;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;

                var lstanime = db.Animes.Include(m => m.TheLoai).OrderBy(x => x.MaAnime).ToPagedList(pageNumber, pageSize);
                return View(lstanime);
            }
            else
            {
                int pageSize = 9;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;
                var lstanime = db.Animes.Where(l => l.MaTheLoai == mid).Include(m => m.TheLoai).OrderBy(x => x.MaAnime).ToPagedList(pageNumber, pageSize);
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
    }
}
