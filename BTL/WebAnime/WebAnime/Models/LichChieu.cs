using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class LichChieu
    {
        public LichChieu()
        {
            Animes = new HashSet<Anime>();
        }

        public int MaLichChieu { get; set; }
        public string ThoiGianChieu { get; set; } = null!;

        public virtual ICollection<Anime> Animes { get; set; }
    }
}
