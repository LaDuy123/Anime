using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebAnime.Models;

namespace WebAnime.ViewComponents
{
    public class TapPhimViewComponent : ViewComponent
    {
        AnimeContext db;
        List<ViDeo> viDeos;

        public TapPhimViewComponent(AnimeContext _context)
        {
            db = _context;
            viDeos = db.ViDeos.ToList();
        }
        public async Task<IViewComponentResult> InvokeAsync(int animeId)
        {
           
            return View("RenderTapPhim", viDeos);
        }
    }
}
