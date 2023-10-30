using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class BinhLuan
    {
        public int MaBinhLuan { get; set; }
        public int? MaTaiKhoan { get; set; }
        public int? MaAnime { get; set; }
        public string NoiDung { get; set; } = null!;
        public DateTime ThoiGian { get; set; }

        public virtual Anime? MaAnimeNavigation { get; set; }
        public virtual TaiKhoan? MaTaiKhoanNavigation { get; set; }
    }
}
