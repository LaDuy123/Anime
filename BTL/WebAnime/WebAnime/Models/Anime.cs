using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class Anime
    {
        public Anime()
        {
            BinhLuans = new HashSet<BinhLuan>();
            ViDeos = new HashSet<ViDeo>();
        }

        public int MaAnime { get; set; }
        public string TenPhim { get; set; } = null!;
        public int? SoTap { get; set; }
        public int? LuotView { get; set; }
        public string? Anh { get; set; }
        public int? Trend { get; set; }
        public int? MaTheLoai { get; set; }
        public int? MaLichChieu { get; set; }
        public int? MaQuocGia { get; set; }
        public int? MaTrangThai { get; set; }
        public int? ThoiLuongPhim { get; set; }
        public string? MoTa { get; set; }
        public DateTime? NamPhatHanh { get; set; }

        public virtual LichChieu? LichChieu { get; set; }
        public virtual QuocGia? QuocGia { get; set; }
        public virtual TheLoai? TheLoai { get; set; }
        public virtual TrangThai? TrangThai { get; set; }
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
        public virtual ICollection<ViDeo> ViDeos { get; set; }
    }
}
