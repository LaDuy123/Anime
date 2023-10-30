using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WebAnime.Models
{
    public partial class AnimeContext : DbContext
    {
        public AnimeContext()
        {
        }

        public AnimeContext(DbContextOptions<AnimeContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Anime> Animes { get; set; } = null!;
        public virtual DbSet<BinhLuan> BinhLuans { get; set; } = null!;
        public virtual DbSet<LichChieu> LichChieus { get; set; } = null!;
        public virtual DbSet<QuocGia> QuocGia { get; set; } = null!;
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; } = null!;
        public virtual DbSet<TheLoai> TheLoais { get; set; } = null!;
        public virtual DbSet<TrangThai> TrangThais { get; set; } = null!;
        public virtual DbSet<ViDeo> ViDeos { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=duyla;Initial Catalog=Anime;User ID=sa;Password=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Anime>(entity =>
            {
                entity.HasKey(e => e.MaAnime)
                    .HasName("PK__Anime__BF35B3703664E2AE");

                entity.ToTable("Anime");

                entity.Property(e => e.Anh).HasMaxLength(50);

                entity.Property(e => e.NamPhatHanh).HasColumnType("date");

                entity.Property(e => e.TenPhim).HasMaxLength(50);

                entity.HasOne(d => d.LichChieu)
                    .WithMany(p => p.Animes)
                    .HasForeignKey(d => d.MaLichChieu)
                    .HasConstraintName("FK__Anime__MaLichChi__0E6E26BF");

                entity.HasOne(d => d.QuocGia)
                    .WithMany(p => p.Animes)
                    .HasForeignKey(d => d.MaQuocGia)
                    .HasConstraintName("FK__Anime__MaQuocGia__17036CC0");

                entity.HasOne(d => d.TheLoai)
                    .WithMany(p => p.Animes)
                    .HasForeignKey(d => d.MaTheLoai)
                    .HasConstraintName("FK__Anime__MaTheLoai__0C85DE4D");

                entity.HasOne(d => d.TrangThai)
                    .WithMany(p => p.Animes)
                    .HasForeignKey(d => d.MaTrangThai)
                    .HasConstraintName("FK__Anime__MaTrangTh__160F4887");
            });

            modelBuilder.Entity<BinhLuan>(entity =>
            {
                entity.HasKey(e => e.MaBinhLuan)
                    .HasName("PK__BinhLuan__87CB66A0F8F3DCD7");

                entity.ToTable("BinhLuan");

                entity.Property(e => e.ThoiGian).HasColumnType("datetime");

                entity.HasOne(d => d.MaAnimeNavigation)
                    .WithMany(p => p.BinhLuans)
                    .HasForeignKey(d => d.MaAnime)
                    .HasConstraintName("FK__BinhLuan__MaAnim__01142BA1");

                entity.HasOne(d => d.MaTaiKhoanNavigation)
                    .WithMany(p => p.BinhLuans)
                    .HasForeignKey(d => d.MaTaiKhoan)
                    .HasConstraintName("FK__BinhLuan__MaTaiK__00200768");
            });

            modelBuilder.Entity<LichChieu>(entity =>
            {
                entity.HasKey(e => e.MaLichChieu)
                    .HasName("PK__LichChie__DC74019779A59617");

                entity.ToTable("LichChieu");

                entity.Property(e => e.ThoiGianChieu).HasMaxLength(100);
            });

            modelBuilder.Entity<QuocGia>(entity =>
            {
                entity.HasKey(e => e.MaQuocGia)
                    .HasName("PK__QuocGia__30D69ACB2EA49206");

                entity.Property(e => e.TenQuocGia).HasMaxLength(20);
            });

            modelBuilder.Entity<TaiKhoan>(entity =>
            {
                entity.HasKey(e => e.MaTaiKhoan)
                    .HasName("PK__TaiKhoan__AD7C652915476401");

                entity.ToTable("TaiKhoan");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.MatKhau).HasMaxLength(50);

                entity.Property(e => e.TenTaiKhoan).HasMaxLength(50);
            });

            modelBuilder.Entity<TheLoai>(entity =>
            {
                entity.HasKey(e => e.MaTheLoai)
                    .HasName("PK__TheLoai__D73FF34AABBFB910");

                entity.ToTable("TheLoai");

                entity.Property(e => e.TenTheLoai).HasMaxLength(50);
            });

            modelBuilder.Entity<TrangThai>(entity =>
            {
                entity.HasKey(e => e.MaTrangThai)
                    .HasName("PK__TrangTha__AADE4138DD58818C");

                entity.ToTable("TrangThai");

                entity.Property(e => e.TenTrangThai).HasMaxLength(20);
            });

            modelBuilder.Entity<ViDeo>(entity =>
            {
                entity.HasKey(e => e.MaViDeo)
                    .HasName("PK__ViDeo__C4AB745324C24C67");

                entity.ToTable("ViDeo");

                

                entity.Property(e => e.ViDeoUrl)
                    .HasMaxLength(50)
                    .HasColumnName("ViDeo_url");

                entity.HasOne(d => d.Anime)
                    .WithMany(p => p.ViDeos)
                    .HasForeignKey(d => d.MaAnime)
                    .HasConstraintName("FK__ViDeo__MaAnime__7D439ABD");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
