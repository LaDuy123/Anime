using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class ViDeo
    {
        public int MaViDeo { get; set; }
        public int? MaAnime { get; set; }
        public int? TapSo { get; set; }
        public string? ViDeoUrl { get; set; }

        public virtual Anime? Anime { get; set; }
    }
}
