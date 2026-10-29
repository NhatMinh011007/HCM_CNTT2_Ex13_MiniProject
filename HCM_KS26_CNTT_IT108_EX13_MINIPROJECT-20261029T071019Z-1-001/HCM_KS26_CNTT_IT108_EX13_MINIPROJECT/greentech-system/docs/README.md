# Hệ thống quản trị hạ tầng & nhật ký kỹ thuật – GreenTech

Hệ thống giúp DevOps của Startup **GreenTech** tự động lọc nhật ký (log) khổng lồ và quản lý danh mục phần cứng của 100 trạm cảm biến IoT.

## 1. Cấu trúc thư mục

```text
greentech-system/
├── docs/        # README.md, srs-he-thong.docx
├── scripts/     # auto_report.bat
├── data/        # log-he-thong.log, quan-ly-thiet-bi.xlsx
├── backup/      # bao-cao-su-co.txt (kết quả lọc log)
└── .env         # cấu hình giả định
```

## 2. Hướng dẫn chạy script

**Bước 1 – Khởi tạo cây thư mục (1 dòng lệnh, CMD):**

```bat
mkdir greentech-system\docs greentech-system\scripts greentech-system\data greentech-system\backup
```

**Bước 2 – Tạo file `.env` bằng đường dẫn tương đối:**

```bat
cd greentech-system
echo DB_PASSWORD=GreenTech@2026_demo> .env
```

**Bước 3 – Chạy robot lọc log:**

```bat
cd scripts
auto_report.bat
```

Kết quả được **nối thêm** (`>>`) vào `backup/bao-cao-su-co.txt`.

## 3. Checklist kiểm tra thiết bị

- [x] Cây thư mục đặt tên kebab-case, không dấu, không khoảng trắng
- [x] `auto_report.bat` chạy thành công, không lỗi
- [x] Báo cáo `bao-cao-su-co.txt` có tiêu đề và các dòng CRITICAL/ERROR
- [x] Excel: VLOOKUP (FALSE + `$`) điền đúng `ten_thiet_bi`, không còn `#N/A`
- [x] Mã linh kiện đã làm sạch bằng `TRIM`
- [ ] Kiểm tra pin / tín hiệu 100 trạm ngoài trang trại
- [ ] Sao lưu `backup/` định kỳ

## 4. Bảng thông số phần cứng

| Mã linh kiện | Tên thiết bị | Loại lưu trữ | Đơn giá (VNĐ) |
|--------------|--------------|--------------|--------------:|
| LK001 | Raspberry Pi 4 – 4GB | SSD | 1.450.000 |
| LK002 | Raspberry Pi 4 – 8GB | SSD | 2.100.000 |
| LK003 | ESP32 DevKit | HDD | 180.000 |
| LK004 | Jetson Nano | SSD | 3.200.000 |
| LK005 | Orange Pi 5 | SSD | 1.900.000 |

> Dữ liệu đầy đủ (10 linh kiện, 100 trạm) nằm trong `data/quan-ly-thiet-bi.xlsx`.

## 5. Tính thời gian tải log (bẫy phần cứng)

Tốc độ mạng tính bằng **Mbps** (bit), file tính bằng **MB** (byte) → chia 8.

`Thời gian (giây) = Dung lượng (MB) ÷ (Mbps ÷ 8)`

| File log | Mạng | Tốc độ thực | Thời gian tải |
|----------|------|-------------|---------------|
| 500 MB | 100 Mbps | 12,5 MB/s | 40 giây |
| 500 MB | 50 Mbps | 6,25 MB/s | 80 giây |
