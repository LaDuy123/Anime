using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class TheLoai
    {
        public TheLoai()
        {
            Animes = new HashSet<Anime>();
        }

        public int MaTheLoai { get; set; }
        public string TenTheLoai { get; set; } = null!;

        public virtual ICollection<Anime> Animes { get; set; }
    }
}
