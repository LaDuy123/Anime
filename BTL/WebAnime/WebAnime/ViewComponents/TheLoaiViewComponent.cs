using Microsoft.AspNetCore.Mvc;
using WebAnime.Models;

namespace WebAnime.ViewComponents 
{
    public class TheLoaiViewComponent : ViewComponent
    {
        AnimeContext db;
        List<TheLoai> theloais;

        public TheLoaiViewComponent(AnimeContext _context)
        {
            db = _context;
            theloais = db.TheLoais.ToList();
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            return View("RenderTheLoai", theloais);
        }
    }
}
