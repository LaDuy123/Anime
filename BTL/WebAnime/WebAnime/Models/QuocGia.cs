using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class QuocGia
    {
        public QuocGia()
        {
            Animes = new HashSet<Anime>();
        }

        public int MaQuocGia { get; set; }
        public string TenQuocGia { get; set; } = null!;

        public virtual ICollection<Anime> Animes { get; set; }
    }
}
