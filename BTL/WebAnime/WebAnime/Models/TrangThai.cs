using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class TrangThai
    {
        public TrangThai()
        {
            Animes = new HashSet<Anime>();
        }

        public int MaTrangThai { get; set; }
        public string TenTrangThai { get; set; } = null!;

        public virtual ICollection<Anime> Animes { get; set; }
    }
}
