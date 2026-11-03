# Gramafon — نیتیو اندروید 🎧

پوسته نیتیو اندروید (WebView) برای اپ وب **گرامافون**. ظاهر و رفتار اپ با نسخه وب ۱۰۰٪ یکسان است،
چون همان فایل‌های خودت (index.html، app.css، app.js) بدون هیچ تغییری اجرا می‌شوند؛ فقط بسته‌بندی APK نیتیو گرفته می‌شود.

## ساختار پروژه

```
├─ .github/workflows/android-build.yml   ← بیلد خودکار با GitHub Actions
├─ settings.gradle
├─ build.gradle
├─ gradle.properties
├─ .gitignore
└─ app/
   ├─ build.gradle
   └─ src/main/
      ├─ AndroidManifest.xml
      ├─ java/com/gramafon/app/MainActivity.java
      └─ res/
         ├─ values/{strings,colors,themes}.xml
         ├─ drawable/ic_launcher_foreground.xml
         └─ mipmap-anydpi-v26/ic_launcher.xml
```

## مراحل راه‌اندازی

1. **هاست وب + بک‌اند:** فایل‌های `index.html`، `app.css`، `app.js` و `api.php` را روی یک هاست PHP
   (هاست اشتراکی، cPanel و…) در ریشه دامنه‌ات آپلود کن. PHP روی GitHub Pages اجرا نمی‌شود، پس `api.php` حتماً باید روی هاست PHP باشد.

2. **آدرس اپ:** در `app/src/main/res/values/strings.xml` مقدار `app_url` را آدرس همان هاست بگذار:
   ```xml
   <string name="app_url">https://your-domain.com/</string>
   ```

3. **پوش به گیت‌هاب:** کل پروژه را به یک ریپو GitHub پوش کن.

4. **بیلد خودکار:** با هر push روی `main` (یا Run دستی در تب Actions)، وردفلو
   `Build Gramafon APK` اجرا می‌شود و APK آماده را در بخش **Artifacts** می‌گذارد.

5. **رلیز:** با ایجاد تگ `v1.0` (و بالاتر) یک GitHub Release با APK ضمیمه ساخته می‌شود:
   ```bash
   git tag v1.0 && git push --tags
   ```

## امضا کردن نسخه رلیز (اختیاری ولی توصیه‌شده)

APK رلیز بدون امضاست. برای امضا:
1. یک keystore بساز: `keytool -genkey -v -keystore gramafon.keystore -alias gramafon -keyalg RSA -keysize 2048 -validity 10000`
2. فایل keystore را به‌صورت Base64 در **Secrets** ریپو بگذار (نام مثلاً `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD`).
3. در `app/build.gradle` یک `signingConfigs.release` اضافه کن که از متغیر محیطی بخواند.

## نکته‌ها

- **localStorage** (توکن کاربر، تنظیمات، ایموجی‌پک‌ها و کتابخونه موزیک) به‌صورت کامل در اپ حفظ می‌شود.
- آپلود **آواتار پروفایل** با انتخابگر فایل نیتیو کار می‌کند.
- لینک‌های بیرونی (تلگرام، اسپاتیفای، ساندکلود) در مرورگر باز می‌شوند؛ خود اپ همیشه داخل شل نیتیو می‌ماند.
- `minSdk 26` یعنی اندروید 8.0 به بالا.
