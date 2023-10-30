using System;
using System.Collections.Generic;

namespace WebAnime.Models
{
    public partial class TaiKhoan
    {
        public TaiKhoan()
        {
            BinhLuans = new HashSet<BinhLuan>();
        }

        public int MaTaiKhoan { get; set; }
        public string? TenTaiKhoan { get; set; }
        public string? MatKhau { get; set; }
        public string? Email { get; set; }

        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
    }
}
