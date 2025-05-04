param (
[string]$i
)
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'
$itt = [Hashtable]::Synchronized(@{
database       = @{}
ProcessRunning = $false
lastupdate     = "05/04/2025"
registryPath   = "HKCU:\Software\ITT@emadadel"
icon           = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"
Theme          = "default"
Date           = (Get-Date -Format "MM/dd/yyy")
Music          = "0"
PopupWindow    = "0"
Language       = "default"
ittDir         = "$env:ProgramData\itt\"
command        = "$($MyInvocation.MyCommand.Definition)"
})
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
Start-Process -FilePath "PowerShell" -ArgumentList "-ExecutionPolicy Bypass -NoProfile -Command `"$($MyInvocation.MyCommand.Definition)`"" -Verb RunAs
exit
}
$itt.mediaPlayer = New-Object -ComObject WMPlayer.OCX
$Host.UI.RawUI.WindowTitle = "Install Twaeks Tool"
$ittDir = $itt.ittDir
if (-not (Test-Path -Path $ittDir)) {New-Item -ItemType Directory -Path $ittDir -Force | Out-Null}
$logDir = Join-Path $ittDir 'logs'
$timestamp = Get-Date -Format "yyyy-MM-dd"
Start-Transcript -Path "$logDir\log_$timestamp.log" -Append -NoClobber *> $null
$itt.database.locales = @'
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الويندوز. انضم إلينا وكن جزءًا في تطويرها","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Msconfig":"تكوين النظام","Environment_Variables":"متغيرات بيئة النظام","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"ادوات اخرى","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"برامج","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":" إعادة التفضيلات إلى الوضع الافتراضي","Reopen_itt_again":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"...جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه","easter_egg":"تقدر تكتشف الميزة المخفية؟ تصفح الكود، وكن أول واحد يكتشف الميزة، ويضيفها للأداة"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein ","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Msconfig":"Systemkonfiguration","Environment_Variables":"Umgebungsvariablen","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus","easter_egg":"Kannst du das verborgene Geheimnis entdecken? Tauche in den Quellcode ein sei der erste der die Funktion entdeckt und integriere sie in das Tool"},"en":{"name":"English","Welcome":"Save time and install all your programs at once and debloat Windows and more. Be part of ITT and contribute to improving it","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On","Off":"Off","Disk_Managment":"Disk Managment","Msconfig":"System Configuration","Environment_Variables":"Environment Variables","Task_Manager":"Task Manager","Apps_features":"Programs and Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power options","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","Browsers_extensions":"Browsers extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","Please_wait":"Please wait a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? Any ongoing installations will be canceled","Empty_save_msg":"Choose at least One app to save it","easter_egg":"Can you uncover the hidden secret? Dive into the source code be the first to discover the feature and integrate it into the tool"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido","Off":"Apagado","Disk_Managment":"Administración de discos","Msconfig":"Configuración del sistema","Environment_Variables":"Variables de entorno","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Empty_save_msg":"Elige al menos una aplicación para guardarla.","easter_egg":"¿Puedes descubrir el secreto oculto? Sumérgete en el código fuente sé el primero en descubrir la función e intégrala en la herramienta"},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé ","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Msconfig":"Configuration du système","Environment_Variables":"Variables d'environnement","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder","easter_egg":"Peux-tu découvrir le secret caché ? Plonge dans le code source sois le premier à découvrir la fonctionnalité et intègre-la dans l'outil"},"ga":{"name":"Gaeilge","Welcome":"Sábháil am trí níos mó ná clár amháin a shuiteáil ag an am céanna agus feabhsaigh feidhmíocht do Windows. Bí linn ag feabhsú an uirlis seo agus ag déanamh é níos fearr. Is féidir leat do chuid Apps ceoil agus feabhsúcháin is fearr leat a chur leis freisin.","Install":"Suiteáil","Apply":"Cuir i bhfeidhm","Downloading":"Ag suiteáil...","About":"Faoi","Third_party":"Tríú páirtí","Preferences":"Roghanna","Management":"Bainistíocht","Apps":"Aplaicí","Tweaks":"Feabhsúcháin","Settings":"Socruithe","Save":"Sábháil","Restore":"Athchóirigh","Music":"Ceol","On":"Ar ","Off":"Múchta","Disk_Managment":"Bainistíocht Diosca","Msconfig":"Cumraíocht an Chórais","Environment_Variables":"Variables d'environnement","Task_Manager":"Bainisteoir Tascanna","Apps_features":"Gnéithe Aipeanna","Networks":"LíOnraí","Services":"Seirbhísí","Device_Manager":"Bainisteoir Gléasanna","Power_Options":"Roghanna Cumhachta","System_Info":"Eolas Córas","Use_system_setting":"Úsáid socrú an chórais","Create_desktop_shortcut":"Cruthaigh gearrthagairt deisce","Reset_preferences":"Athshocraigh Roghanna","Reopen_itt_again":"Oscail ITT arís le do thoil.","Theme":"Téama","Language":"Teanga","Browsers_extensions":"Síntí Brabhsálaí","All":"Uile","Search":"Cuardaigh","Create_restore_point":"Cruthaigh pointe athchóirithe","Portable_Downloads_Folder":"Fillteán Íoslódálacha Inaistrithe","Install_msg":"An bhfuil tú cinnte gur mhaith leat na feidhmchláir seo a shuiteáil","Apply_msg":"An bhfuil tú cinnte gur mhaith leat na feabhsúcháin seo a chur i bhfeidhm","Applying":"Cur i bhfeidhm...","Please_wait":"Fan le do thoil tá próiseas ag rith sa chúlra","Last_update":"An nuashOnrú deireanach","Exit_msg":"An bhfuil tú cinnte gur mhaith leat an clár a dhúnadh? Má tá suiteálacha ar siúl beidh siad curtha ar ceal.","Empty_save_msg":"Roghnaigh ar a laghad aip amháin chun é a shábháil","easter_egg":"An féidir leat an rúndiamhair atá i bhfolach a nochtadh? Tum isteach sa chód foinse bí an chéad duine a aimsíonn an gné agus é a chomhtháthú sa uirlis"},"hi":{"name":"अंग्रेज़ी","Welcome":"एक बार में कई प्रोग्राम इंस्टॉल करके समय बचाएं और अपने विंडोज़ के प्रदर्शन को बढ़ावा दें। इस टूल को बेहतर बनाने और इसे और अच्छा बनाने में हमारा साथ दें। आप अपने पसंदीदा म्यूज़िक ऐप्स और ट्विक्स भी जोड़ सकते हैं।","Install":"इंस्टॉल करें","Apply":"लागू करें","Downloading":"डाउनलोड हो रहा है...","About":"के बारे में","Third_party":"थर्ड-पार्टी","Preferences":"पसंद","Management":"प्रबंधन","Apps":"ऐप्स","Tweaks":"ट्विक्स","Settings":"सेटिंग्स","Save":"सहेजें","Restore":"पुनर्स्थापित करें","Music":"संगीत","On":"चालू ","Off":"बंद","Disk_Managment":"डिस्क प्रबंधन","Msconfig":"सिस्टम कॉन्फ़िगरेशन","Environment_Variables":"एन्विर्बल वार्डियल्स","Task_Manager":"टास्क मैनेजर","Apps_features":"ऐप्स-फीचर्स","Networks":"नेटवर्क्स","Services":"सेवाएँ","Device_Manager":"डिवाइस मैनेजर","Power_Options":"पावर विकल्प","System_Info":"सिस्टम जानकारी","Use_system_setting":"सिस्टम सेटिंग का उपयोग करें","Create_desktop_shortcut":"डेस्कटॉप शॉर्टकट बनाएं","Reset_preferences":"पसंद रीसेट करें","Reopen_itt_again":"कृपया इसे फिर से खोलें।","Theme":"थीम","Language":"भाषा","Browsers_extensions":"ब्राउज़र एक्सटेंशन","All":"सभी","Search":"खोज","Create_restore_point":"पुनर्स्थापना बिंदु बनाएँ","Portable_Downloads_Folder":"पोर्टेबल डाउनलोड फ़ोल्डर","Install_msg":"क्या आप निश्चित हैं कि आप निम्न ऐप्स इंस्टॉल करना चाहते हैं?","Apply_msg":"क्या आप निश्चित हैं कि आप निम्न ट्विक्स लागू करना चाहते हैं?","Applying":"लागू किया जा रहा है...","Please_wait":"कृपया प्रतीक्षा करें बैकग्राउंड में एक प्रक्रिया चल रही है","Last_update":"आखिरी अपडेट","Exit_msg":"क्या आप निश्चित हैं कि आप प्रोग्राम बंद करना चाहते हैं? यदि कोई इंस्टॉलेशन चल रहा हो तो वह समाप्त हो जाएगा","Empty_save_msg":"कम से कम एक ऐप चुनें और उसे सहेजें।","easter_egg":"क्या आप छिपे हुए रहस्य को उजागर कर सकते हैं? सोर्स कोड में डूबकी लगाएं पहले व्यक्ति बनें जो फीचर को खोजे और इसे टूल में इंटीग्रेट करें"},"it":{"name":"Italiano","Welcome":"Risparmia tempo installando più programmi contemporaneamente e migliora le prestazioni di Windows. Unisciti a noi per migliorare questo strumento e renderlo migliore. Puoi anche aggiungere le tue app musicali preferite e le personalizzazioni.","Install":"Installa","Apply":"Applica","Downloading":"Download in corso...","About":"Informazioni","Third_party":"Terze parti","Preferences":"Preferenze","Management":"Gestione","Apps":"App","Tweaks":"Personalizzazioni","Settings":"Impostazioni","Save":"Salva","Restore":"Ripristina","Music":"Musica","On":"Acceso","Off":"Spento","Disk_Managment":"Gestione disco","Msconfig":"Configurazione di sistema","Environment_Variables":"Variabili di ambiente","Task_Manager":"Gestore attività","Apps_features":"App-Funzionalità","Networks":"Reti","Services":"Servizi","Device_Manager":"Gestore dispositivi","Power_Options":"Opzioni risparmio energia","System_Info":"Informazioni di sistema","Use_system_setting":"Usa impostazioni di sistema","Create_desktop_shortcut":"Crea collegamento sul desktop","Reset_preferences":"Reimposta preferenze","Reopen_itt_again":"Per favore riapri di nuovo.","Theme":"Tema","Language":"Lingua","Browsers_extensions":"Estensioni per browser","All":"Tutti","Search":"Cerca","Create_restore_point":"Crea un punto di ripristino","Portable_Downloads_Folder":"Cartella download portatile","Install_msg":"Sei sicuro di voler installare le seguenti app?","Apply_msg":"Sei sicuro di voler applicare le seguenti personalizzazioni?","Applying":"Applicazione in corso...","Please_wait":"Attendere un processo è in corso in background","Last_update":"Ultimo aggiornamento","Exit_msg":"Sei sicuro di voler chiudere il programma? Se ci sono installazioni in corso verranno terminate.","Empty_save_msg":"Scegli almeno un'app per salvarla.","easter_egg":"Riuscirai a scoprire il segreto nascosto? Tuffati nel codice sorgente sii il primo a scoprire la funzionalità e integrala nello strumento"},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Msconfig":"시스템 구성","Environment_Variables":"연습별 변수","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","easter_egg":"隠された秘密を見つけられますか？ソースコードに飛び込んで、最初に機能を発見し、ツールに統合しましょう"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл","Off":"Выкл","Disk_Managment":"Управление дисками","Msconfig":"Конфигурация системы","Environment_Variables":"Переменные окружения","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения","easter_egg":"Можешь ли ты раскрыть скрытый секрет? Погрузись в исходный код стань первым кто обнаружит функцию и интегрируй её в инструмент"},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık ","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Msconfig":"Sistem Yapılandırması","Environment_Variables":"Ortam Değişkenleri","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin","easter_egg":"Gizli sırrı keşfedebilir misin? Kaynağa dal özelliği ilk keşfeden ol ve araca entegre et"},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Msconfig":"系统配置","Environment_Variables":"环境变量","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again":"请重新打开ITT。","Theme":"主题","Language":"语言","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","easter_egg":"你能发现隐藏的秘密吗？深入源代码，成为第一个发现功能的人，并将其集成到工具中"}}}
'@ | ConvertFrom-Json
$itt.database.Tweaks = @'
[
{
"Name": "Disk cleanup",
"Description": "Clean temporary files that are not necessary",
"Category": "Storage",
"Check": "false",
"Refresh": "false",
"Script": [
"irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/Disk%20cleanup.ps1 | iex"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "System File Checker",
"Description": "sfc /scannow Use the System File Checker tool to repair missing or corrupted system files",
"Category": "Fixer",
"Check": "false",
"Refresh": "false",
"Script": [
"Add-Log -Message 'This may take a few minutes' -Level 'Info' Chkdsk /scan\r\n sfc /scannow\r\n DISM /Online /Cleanup-Image /Restorehealth\r\n sfc /scannow\r\n"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Restore Classic Context Menu Windows 11",
"Description": "Restore the old context menu for Windows 11",
"Category": "Classic",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Classes\\CLSID\\",
"Name": "{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}",
"Type": "String",
"Value": "",
"defaultValue": ""
},
{
"Path": "HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\\InprocServer32",
"Name": "",
"Type": "String",
"Value": "",
"defaultValue": "default"
}
]
},
{
"Name": "Restore All Windows Services to Default",
"Description": "if you face issues with services, try Restore All Windows Services to Default",
"Category": "Fixer",
"Check": "false",
"Refresh": "false",
"Script": [
"Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/test.bat' -OutFile $env:TEMP\\script.bat \r\n Start-Process -FilePath 'cmd.exe' -ArgumentList '/c %TMP%\\script.bat && del /f /q %TMP%\\script.bat ' -NoNewWindow -Wait "
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Super Privacy Disable all Privacy Settings",
"Description": "Disable Wifi-Sense & Activity History & ActivityFeed All Telemetry & DataCollection & disable various telemetry and annoyances in Edge",
"Category": "Privacy",
"Check": "false",
"Refresh": "true",
"Script": [
"Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\Microsoft Compatibility Appraiser' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Application Experience\\ProgramDataUpdater' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Autochk\\Proxy' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Customer Experience Improvement Program\\UsbCeip' | Out-Null; Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' | Out-Null; schtasks /change /TN '\\Microsoft\\Windows\\Customer Experience Improvement Program\\Consolidator' /DISABLE > NUL 2>&1; schtasks /change /TN '\\Microsoft\\Windows\\DiskDiagnostic\\Microsoft-Windows-DiskDiagnosticDataCollector' /DISABLE > NUL 2>&1; schtasks /change /TN '\\Microsoft\\Windows\\Windows Error Reporting\\QueueReporting' /DISABLE > NUL 2>&1"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
"Name": "Value",
"Type": "String",
"Value": "Deny",
"defaultValue": "Deny"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Sensor\\Overrides\\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",
"Name": "SensorPermissionState",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\lfsvc\\Service\\Configuration",
"Name": "Status",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SYSTEM\\Maps",
"Name": "AutoUpdateEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
"Name": "EnableActivityFeed",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
"Name": "Value",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "Disabled",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "Disabled",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowTelemetry",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "ContentDeliveryAllowed",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "OemPreInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "PreInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "PreInstalledAppsEverEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SilentInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SubscribedContent-338387Enabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SubscribedContent-338388Enabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SubscribedContent-338389Enabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SubscribedContent-353698Enabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SystemPaneSuggestionsEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Siuf\\Rules",
"Name": "NumberOfSIUFInPeriod",
"Value": "0",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "DoNotShowFeedbackNotifications",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
"Name": "DisableTailoredExperiencesWithDiagnosticData",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AdvertisingInfo",
"Name": "DisabledByGroupPolicy",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "Disabled",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config",
"Name": "DODownloadMode",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Remote Assistance",
"Name": "fAllowToGetHelp",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\OperationStatusManager",
"Name": "EnthusiastMode",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "ShowTaskViewButton",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
"Name": "PeopleBand",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "LaunchTo",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem",
"Name": "LongPathsEnabled",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DriverSearching",
"Name": "SearchOrderConfig",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
"Name": "SystemResponsiveness",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile",
"Name": "NetworkThrottlingIndex",
"Value": "4294967295",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Control Panel\\Desktop",
"Name": "MenuShowDelay",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Control Panel\\Desktop",
"Name": "AutoEndTasks",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
"Name": "ClearPageFileAtShutdown",
"Value": "0",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SYSTEM\\ControlSet001\\Services\\Ndu",
"Name": "Start",
"Value": "2",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Control Panel\\Mouse",
"Name": "MouseHoverTime",
"Value": "400",
"Type": "String",
"defaultValue": "400"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters",
"Name": "IRPStackSize",
"Value": "30",
"Type": "DWord",
"defaultValue": "20"
},
{
"Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
"Name": "EnableFeeds",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
"Name": "ShellFeedsTaskbarViewMode",
"Value": "2",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "HideSCAMeetNow",
"Value": "1",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\UserProfileEngagement",
"Name": "ScoobeSystemSettingEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
"Name": "EnableFeeds",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "ConnectedSearchPrivacy",
"Value": "3",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
"Name": "DisableSearchHistory",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AllowSearchToUseLocation",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "EnableDynamicContentInWSB",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "DisableWebSearch",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
"Name": "DisableSearchBoxSuggestions",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "PreventUnwantedAddIns",
"Value": " ",
"Type": "String",
"defaultValue": " "
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "PreventRemoteQueries",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AlwaysUseAutoLangDetection",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AllowIndexingEncryptedStoresOrItems",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "DisableSearchBoxSuggestions",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "CortanaInAmbientMode",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "BingSearchEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "ShowCortanaButton",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "CanCortanaBeEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "CanCortanaBeEnabled",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "ConnectedSearchUseWebOverMeteredConnections",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AllowCortanaAboveLock",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
"Name": "IsDynamicSearchBoxEnabled",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\Experience\\AllowCortana",
"Name": "value",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "AllowSearchToUseLocation",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
"Name": "ModelDownloadAllowed",
"Value": "0",
"Type": "DWord",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
"Name": "IsDeviceSearchHistoryEnabled",
"Value": "1",
"Type": "DWord",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
"Name": "VoiceActivationOn",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
"Name": "VoiceActivationEnableAboveLockscreen",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\OOBE",
"Name": "DisableVoice",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AllowCortana",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "DeviceHistoryEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "HistoryViewEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Speech_OneCore\\Preferences",
"Name": "VoiceActivationDefaultOn",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "CortanaEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "CortanaEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
"Name": "IsMSACloudSearchEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\SearchSettings",
"Name": "IsAADCloudSearchEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search",
"Name": "AllowCloudSearch",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "VoiceShortcut",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "CortanaConsent",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowDesktopAnalyticsProcessing",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowDeviceNameInTelemetry",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "MicrosoftEdgeDataOptIn",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowWUfBCloudProcessing",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowUpdateComplianceProcessing",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowCommercialDataPipeline",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\SQMClient\\Windows",
"Name": "CEIPEnable",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\DataCollection",
"Name": "AllowTelemetry",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "AllowTelemetry",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DataCollection",
"Name": "DisableOneSettingsDownloads",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\CurrentVersion\\Software Protection Platform",
"Name": "NoGenTicket",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "Disabled",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "Disabled",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting\\Consent",
"Name": "DefaultConsent",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting\\Consent",
"Name": "DefaultOverrideBehavior",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "DontSendAdditionalData",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\Windows Error Reporting",
"Name": "LoggingDisabled",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "ContentDeliveryAllowed",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "OemPreInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "PreInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "PreInstalledAppsEverEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SilentInstalledAppsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SystemPaneSuggestionsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\SystemSettings\\AccountNotifications",
"Name": "EnableAccountNotifications",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\SystemSettings\\AccountNotifications",
"Name": "EnableAccountNotifications",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Notifications\\Settings",
"Name": "NOC_GLOBAL_SETTING_TOASTS_ENABLED",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\EdgeUI",
"Name": "DisableMFUTracking",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EdgeUI",
"Name": "DisableMFUTracking",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKCU:\\Control Panel\\International\\User Profile",
"Name": "HttpAcceptLanguageOptOut",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
"Name": "PublishUserActivities",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Personalization",
"Name": "NoLockScreenCamera",
"Value": "1",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\webcam",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\microphone",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\documentsLibrary",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\picturesLibrary",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\videosLibrary",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\broadFileSystemAccess",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\userAccountInformation",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\contacts",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\phoneCallHistory",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\chat",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\email",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\userDataTasks",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\appDiagnostics",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Settings\\VoiceActivation\\UserPreferenceForAllApps",
"Name": "AgentActivationEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
"Name": "LetAppsAccessPhone",
"Value": "2",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
"Name": "LetAppsAccessPhone_UserInControlOfTheseApps",
"Value": "",
"Type": "REG_MULTI_SZ",
"DefaultValue": ""
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
"Name": "LetAppsAccessPhone_ForceAllowTheseApps",
"Value": "",
"Type": "REG_MULTI_SZ",
"DefaultValue": ""
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AppPrivacy",
"Name": "LetAppsAccessPhone_ForceDenyTheseApps",
"Value": "",
"Type": "REG_MULTI_SZ",
"DefaultValue": ""
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeviceAccess\\Global\\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\appointments",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\activity",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\radios",
"Name": "Value",
"Value": "Deny",
"Type": "String",
"DefaultValue": "Allow"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "EdgeEnhanceImagesEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "PersonalizationReportingEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "ShowRecommendationsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "HideFirstRunExperience",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "UserFeedbackAllowed",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "ConfigureDoNotTrack",
"Value": "1",
"Type": "DWord",
"DefaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "AlternateErrorPagesEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "EdgeCollectionsEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "EdgeFollowEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "EdgeShoppingAssistantEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "MicrosoftEdgeInsiderPromotionEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "ShowMicrosoftRewards",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "WebWidgetAllowed",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "DiagnosticData",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "EdgeAssetDeliveryServiceEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "CryptoWalletEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "WalletDonationEnabled",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
}
]
},
{
"Name": "Clean Taskbar",
"Description": "Disable icons",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Feeds",
"Name": "ShellFeedsTaskbarViewMode",
"Type": "DWord",
"Value": "0",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "SearchboxTaskbarMode",
"Type": "DWord",
"Value": "1",
"defaultValue": "2"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\People",
"Name": "PeopleBand",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "HideSCAMeetNow",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "NoNewsAndInterests",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\NewsAndInterests\\AllowNewsAndInterests",
"Name": "value",
"Type": "DWord",
"Value": "0",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Feeds",
"Name": "EnableFeeds",
"Type": "DWord",
"Value": "0",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "ShowCortanaButton",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "ShowTaskViewButton",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Remove Microsoft Apps",
"Description": "Uninstalls pre-installed Microsoft apps like Clipchamp, People etc",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [
"Microsoft.Copilot",
"Microsoft.BingNews",
"Microsoft.WindowsCamera",
"Microsoft.Getstarted",
"Microsoft.BingWeather_1.0.6.0_x64__8wekyb3d8bbwe",
"MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy",
"Microsoft.GetHelp",
"Microsoft.AppConnector",
"Microsoft.BingFinance",
"Microsoft.BingTranslator",
"Microsoft.BingSports",
"MicrosoftCorporationII.MicrosoftFamily",
"Microsoft.BingHealthAndFitness",
"Microsoft.BingTravel",
"Microsoft.MinecraftUWP",
"PowerAutomate",
"MicrosoftTeams",
"Microsoft.Todos",
"Microsoft.AsyncTextService",
"Microsoft.GamingServices",
"Microsoft.BingFoodAndDrink",
"Microsoft.BingWeather",
"Microsoft.Messaging",
"Microsoft.Microsoft3DViewer",
"Microsoft.3DBuilder",
"Microsoft.MicrosoftOfficeHub",
"Microsoft.MicrosoftSolitaireCollection",
"Microsoft.NetworkSpeedTest",
"Microsoft.News",
"Microsoft.549981C3F5F10",
"Microsoft.Office.Lens",
"Microsoft.Office.OneNote",
"Microsoft.Office.Sway",
"Microsoft.OutlookForWindows",
"Microsoft.OneConnect",
"Microsoft.People",
"Microsoft.Print3D",
"Microsoft.RemoteDesktop",
"Microsoft.SkypeApp",
"Microsoft.StorePurchaseApp",
"Microsoft.Office.Todo.List",
"Microsoft.Whiteboard",
"Microsoft.CommsPhone",
"Microsoft.windowscommunicationsapps",
"Microsoft.WindowsFeedbackHub",
"Microsoft.Wallet",
"Microsoft.WindowsMaps",
"Microsoft.YourPhone",
"Microsoft.WindowsSoundRecorder",
"Microsoft.Windows.Cortana",
"Microsoft.ScreenSketch",
"Microsoft.Windows.DevHome",
"Microsoft.MixedReality.Portal",
"Microsoft.MSPaint",
"Microsoft.Getstarted",
"Microsoft.ZuneVideo",
"Microsoft.ZuneMusic",
"EclipseManager",
"ActiproSoftwareLLC",
"AdobeSystemsIncorporated.AdobePhotoshopExpress",
"Duolingo-LearnLanguagesforFree",
"PandoraMediaInc",
"CandyCrush",
"BubbleWitch3Saga",
"Wunderlist",
"Flipboard",
"Twitter",
"Facebook",
"Minecraft",
"Royal Revolt",
"Sway",
"Disney.37853FC22B2CE",
"disney",
"Microsoft.549981",
"Microsoft.MicrosoftStickyNotes",
"TikTok.TikTok_8wekyb3d8bbwe",
"TikTok",
"Microsoft.NetworkSpeedTest"
],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "NoStartMenuMorePrograms",
"Type": "DWord",
"Value": "2",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "NoStartMenuMorePrograms",
"Type": "DWord",
"Value": "2",
"defaultValue": "1"
}
]
},
{
"Name": "Remove Xbox Apps",
"Description": "Uninstalls pre-installed Xbox apps",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [
"Microsoft.XboxApp",
"Microsoft.Xbox.TCUI",
"Microsoft.XboxGamingOverlay",
"Microsoft.XboxGameOverlay",
"Microsoft.XboxIdentityProvider",
"Microsoft.XboxSpeechToTextOverlay"
],
"Services": [],
"Registry": []
},
{
"Name": "Fix Stutter in games",
"Description": "Fix Stutter in Games (Disable GameBarPresenceWriter). Windows 10/11",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"irm https://raw.githubusercontent.com/emadadel4/Fix-Stutter-in-Games/main/fix.ps1 | iex "
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Enable the Ultimate Performance Power Plan",
"Description": "This will add the Ultimate Performance power plan, to enable it go to the power options",
"Category": "Power",
"Check": "false",
"Refresh": "false",
"Script": [
"powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61; Start-Process powercfg.cpl"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Reset the TCP/IP Stack",
"Description": "If you have an internet issue, reset the network configuration",
"Category": "Fixer",
"Check": "false",
"Refresh": "false",
"Script": [
"netsh int ip reset"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Setup Auto login",
"Description": "Setup auto login Windows username",
"Category": "Other",
"Check": "false",
"Refresh": "false",
"Script": [
"curl.exe -ss \"https://live.sysinternals.com/Autologon.exe\" -o $env:temp\\autologin.exe ; cmd /c $env:temp\\autologin.exe /accepteula"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Disable Xbox Services",
"Description": "Disables all Xbox Services Game Mode",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"Disable-MMAgent -MemoryCompression | Out-Null",
"\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.exe\r\n\r\n        takeown /f C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll\r\n\r\n        takeown /f C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.exe /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll /grant administrators:F\r\n\r\n        icacls C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll /grant administrators:F\r\n\r\n        Start-Sleep -Seconds 1\r\n\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.exe -NewName GameBarPresenceWriter.exe_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\GameBarPresenceWriter.proxy.dll -NewName GameBarPresenceWriter.proxy.dll_backup\r\n\r\n        Rename-Item C:\\Windows\\System32\\Windows.Gaming.UI.GameBar.dll -NewName Windows.Gaming.UI.GameBar.dll_backup\r\n\r\n      "
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
"Name": "AutoGameModeEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
"Name": "AllowAutoGameMode",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\GameBar",
"Name": "ShowStartupPanel",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_Enabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
"Name": "AppCaptureEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
"Name": "UseNexusForGameBarEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
"Name": "AudioCaptureEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\GameBar",
"Name": "CursorCaptureEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameDVR",
"Name": "AllowgameDVR",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\System\\CurrentControlSet\\Services\\xbgm",
"Name": "Start",
"Type": "DWord",
"Value": "4",
"defaultValue": "0"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_FSEBehaviorMode",
"Type": "DWord",
"Value": "2",
"defaultValue": "0"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_HonorUserFSEBehaviorMode",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_FSEBehavior",
"Type": "DWord",
"Value": "2",
"defaultValue": "0"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_EFSEFeatureFlags",
"Type": "DWord",
"Value": "0",
"defaultValue": "0"
},
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_DSEBehavior",
"Type": "DWord",
"Value": "2",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences",
"Name": "DirectXUserGlobalSettings",
"Type": "String",
"Value": "SwapEffectUpgradeEnable=1;",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
"Name": "",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\DirectX\\GraphicsSettings",
"Name": "SwapEffectUpgradeCache",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SoftwareProtectionPlatform",
"Name": "InactivityShutdownDelay",
"Type": "DWord",
"Value": "4294967295",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Dwm",
"Name": "OverlayTestMode",
"Type": "DWord",
"Value": "5",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
"Name": "GPU Priority",
"Type": "DWord",
"Value": "8",
"defaultValue": "8"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
"Name": "Scheduling Category",
"Type": "String",
"Value": "High",
"defaultValue": "High"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Multimedia\\SystemProfile\\Tasks\\Games",
"Name": "SFIO Priority",
"Type": "String",
"Value": "High",
"defaultValue": "High"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl",
"Name": "IRQ8Priority",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
"Name": "DisableWindowsConsumerFeatures",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Disable Start Menu Ads",
"Description": "Start menu Ads and web search",
"Category": "Privacy",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "BingSearchEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo",
"Name": "Enabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SystemPaneSuggestionsEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager",
"Name": "SoftLandingEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "ShowSyncProviderNotifications",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Turn off background Apps",
"Description": "Turn off background apps",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications",
"Name": "GlobalUserDisabled",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Name": "BackgroundAppGlobalToggle",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Disable suggestions on Start Menu",
"Description": "Suggestions on start menu",
"Category": "Privacy",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
"Name": "DisableWindowsConsumerFeatures",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Remove Folder Shortcuts From File Explorer",
"Description": "Documents, Videos, Pictures, Desktop. Shortcuts from File Explorer",
"Category": "Other",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{088e3905-0323-4b02-9826-5d99428e115f}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Explorer\\MyComputer\\NameSpace\\{d3162b92-9365-467a-956b-92703aca08af}",
"Value": "Remove"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer",
"Name": "HubMode",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCR:\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
"Name": "System.IsPinnedToNameSpaceTree",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCR:\\Wow6432Node\\CLSID\\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
"Name": "System.IsPinnedToNameSpaceTree",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Classes\\CLSID\\{031E4825-7B94-4dc3-B131-E946B44C8DD5}",
"Name": "System.IsPinnedToNameSpaceTree",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Optimize Windows Services",
"Description": "(Print Spooler), (Fax), (Diagnostic Policy), (Downloaded Maps Manager), (Windows Error Reporting Service), (Remote Registry) , (Internet Connection Sharing), (Disables Telemetry and Data)",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [
{
"Name": "Spooler",
"StartupType": "Disabled",
"DefaultType": "Automatic"
},
{
"Name": "Fax",
"StartupType": "Disabled",
"DefaultType": "Automatic"
},
{
"Name": "DPS",
"StartupType": "Disabled",
"DefaultType": "Automatic"
},
{
"Name": "MapsBroker",
"StartupType": "Disabled",
"DefaultType": "Automatic"
},
{
"Name": "WerSvc",
"StartupType": "Disabled",
"DefaultType": "Manual"
},
{
"Name": "RemoteRegistry",
"StartupType": "Disabled",
"DefaultType": "Disabled"
},
{
"Name": "lmhosts",
"StartupType": "Disabled",
"DefaultType": "Manual"
},
{
"Name": "SharedAccess",
"StartupType": "Disabled",
"DefaultType": "Manual"
},
{
"Name": "DiagTrack",
"StartupType": "Disabled",
"DefaultType": "Manual"
}
],
"Registry": []
},
{
"Name": "Disable Hibernate",
"Description": "Allows the system to save the current state of your computer",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"powercfg.exe /hibernate off"
],
"UndoScript": [
"powercfg.exe /hibernate on"
],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Power",
"Name": "HibernateEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings",
"Name": "ShowHibernateOption",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Disable OneDrive",
"Description": "Disabling OneDrive",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [
"OneDrive",
"MicrosoftEdge"
],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\OneDrive",
"Name": "DisableFileSyncNGSC",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run",
"Name": "OneDrive",
"Value": "Remove"
}
]
},
{
"Name": "Remove OneDrive",
"Description": "Removes OneDrive from the system",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/OneDrive-Uninstaller.ps1 | iex"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Activate Windows Classic Photo Viewer",
"Description": "Classic Photo Viewer",
"Category": "Classic",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": ".jpg",
"Type": "String",
"Value": "PhotoViewer.FileAssoc.Tiff",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": ".jpeg",
"Type": "String",
"Value": "PhotoViewer.FileAssoc.Tiff",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": ".png",
"Type": "String",
"Value": "PhotoViewer.FileAssoc.Tiff",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": ".bmp",
"Type": "String",
"Value": "PhotoViewer.FileAssoc.Tiff",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": ".gif",
"Type": "String",
"Value": "PhotoViewer.FileAssoc.Tiff",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": "ApplicationIcon",
"Type": "String",
"Value": "C:\\Program Files (x86)\\Windows Photo Viewer\\photoviewer.dll",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows Photo Viewer\\Capabilities\\FileAssociations",
"Name": "ApplicationName",
"Type": "String",
"Value": "Windows Photo Viewer",
"defaultValue": "0"
}
]
},
{
"Name": "Remove Copilot in Windows 11",
"Description": "AI assistance",
"Category": "Privacy",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsCopilot",
"Name": "TurnOffWindowsCopilot",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsCopilot",
"Name": "TurnOffWindowsCopilot",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
"Name": "HubsSidebarEnabled",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
"Name": "DisableSearchBoxSuggestions",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
"Name": "DisableSearchBoxSuggestions",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Disable Recall Snapshots in Windows 11 24H",
"Description": "Recall is an upcoming preview experience exclusive to Copilot+",
"Category": "Privacy",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\WindowsAI",
"Name": "DisableAIDataAnalysis",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsAI",
"Name": "DisableAIDataAnalysis",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Delete Thumbnail Cache",
"Description": "Removing the stored image thumbnails",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"Remove-Item \"$env:LocalAppData\\Microsoft\\Windows\\Explorer\\thumbcache*\" -Force -Recurse"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Classic Volume Control",
"Description": "The old volume control",
"Category": "Classic",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\MTCUVC",
"Name": "EnableMtcUvc",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Disable Toggle Key Sounds",
"Description": "Toggle key sounds are audio cues that play when you press the Caps Lock, Num Lock, or Scroll Lock keys",
"Category": "Classic",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Control Panel\\Accessibility\\ToggleKeys",
"Name": "Flags",
"Type": "String",
"Value": "58",
"defaultValue": "62"
}
]
},
{
"Name": "Disable Homegroup",
"Description": "HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs",
"Category": "Privacy",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [
{
"Name": "HomeGroupListener",
"StartupType": "Manual ",
"DefaultType": "Automatic"
},
{
"Name": "HomeGroupProvider",
"StartupType": "Manual ",
"DefaultType": "Automatic"
}
],
"Registry": []
},
{
"Name": "Remove Home and Gallery from explorer in Windows 11",
"Description": "Home and Gallery from explorer and sets This PC as default",
"Category": "Privacy",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Name": "1",
"Type": "DWord",
"Value": "1",
"defaultValue": "1"
},
{
"Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
"Value": "Remove"
},
{
"Path": "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\NameSpace\\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
"Value": "Remove"
}
]
},
{
"Name": "Disable Wifi Sense",
"Description": "Service that phones home all nearby scanned wifi networks and your location",
"Category": "Protection",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\WiFi\\AllowWiFiHotSpotReporting",
"Name": "value",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\default\\WiFi\\AllowAutoConnectToWiFiSenseHotspots",
"Name": "value",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\WcmSvc\\wifinetworkmanager\\config",
"Name": "AutoConnectAllowedOEM",
"Value": "0",
"Type": "DWord",
"DefaultValue": "1"
}
]
},
{
"Name": "Disable Autoplay and Autorun",
"Description": "Autoplay in prevents the automatic launch of media or applications when a removable device, such as a USB drive or CD",
"Category": "Protection",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoplayHandlers",
"Name": "DisableAutoplay",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
"Name": "NoDriveTypeAutoRun",
"Type": "DWord",
"Value": "255",
"defaultValue": "255"
}
]
},
{
"Name": "Disable SMB Server",
"Description": "SMB Server enables file and printer sharing over a network, allowing access to resources on remote computers",
"Category": "Protection",
"Check": "false",
"Refresh": "false",
"Script": [
"Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force; Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Set current network profile to public",
"Description": "Deny file sharing, device discovery",
"Category": "",
"Check": "false",
"Refresh": "false",
"Script": [
"Set-NetConnectionProfile -NetworkCategory Public"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Enable F8 boot menu options",
"Description": "Enable F8 boot menu options",
"Category": "BIOS",
"Check": "false",
"Refresh": "false",
"Script": [
"bcdedit /set bootmenupolicy Standard | Out-Null"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Disable display and sleep mode timeouts",
"Description": "If you frequently use your device, disable this",
"Category": "Power",
"Check": "false",
"Refresh": "false",
"Script": [
"\r\n        powercfg /X monitor-timeout-ac 0\r\n        powercfg /X monitor-timeout-dc 0\r\n        powercfg /X standby-timeout-ac 0\r\n        powercfg /X standby-timeout-dc 0\r\n      "
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Set Wallpaper desktop Quality to 100%",
"Description": "Set Wallpaper desktop Quality",
"Category": "Personalization",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\System\\CurrentControlSet\\Control\\CrashControl",
"Name": "DisplayParameters",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Disable Windows Transparency",
"Description": "Disableing improve performance",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
"Name": "EnableTransparency",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Disable scheduled defragmentation task",
"Description": "Optimizes disk performance",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"Disable-ScheduledTask -TaskName 'Microsoft\\Windows\\Defrag\\ScheduledDefrag' | Out-Null"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Enable NET 3.5",
"Description": "Some old games and applications require .NET Framework 3.5",
"Category": "Classic",
"Check": "false",
"Refresh": "false",
"Script": [
"DISM /Online /Enable-Feature /FeatureName:NetFx3 /All"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Super Performance",
"Description": "Disabled all windows effects. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"defaultValue": "1",
"Type": "String",
"Path": "HKCU:\\Control Panel\\Desktop",
"Value": "0",
"Name": "DragFullWindows"
},
{
"defaultValue": "1",
"Type": "String",
"Path": "HKCU:\\Control Panel\\Desktop",
"Value": "200",
"Name": "MenuShowDelay"
},
{
"defaultValue": "1",
"Type": "String",
"Path": "HKCU:\\Control Panel\\Desktop\\WindowMetrics",
"Value": "0",
"Name": "MinAnimate"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Control Panel\\Keyboard",
"Value": "0",
"Name": "KeyboardDelay"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "ListviewAlphaSelect"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "ListviewShadow"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "TaskbarAnimations"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects",
"Value": "2",
"Name": "VisualFXSetting"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\DWM",
"Value": "0",
"Name": "EnableAeroPeek"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "TaskbarMn"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "TaskbarDa"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
"Value": "0",
"Name": "ShowTaskViewButton"
},
{
"defaultValue": "1",
"Type": "DWord",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
"Value": "0",
"Name": "SearchboxTaskbarMode"
}
]
},
{
"Name": "Remove Widgets from Taskbar in Windows 11",
"Description": "Widgets are one of the new user interface elements in Windows 11",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [
"Install-Winget \r\n winget uninstall 'windows web experience pack' --silent"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Name": "TaskbarDa",
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings",
"defaultValue": "1",
"Value": "0",
"Type": "DWord"
}
]
},
{
"Name": "Set Username to Unknown",
"Description": "Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer",
"Category": "Privacy",
"Check": "false",
"Refresh": "false",
"Script": [
"Rename-Computer -NewName 'Unknown'",
"$currentUsername = $env:USERNAME; Rename-LocalUser -Name $currentUsername -NewName 'Unknown'"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Fix Arabic encoding",
"Description": "Fix issues related to strange symbols appearing in Arabic text",
"Category": "Fixer",
"Check": "false",
"Refresh": "false",
"Script": [
"Set-WinSystemLocale -SystemLocale 'ar-EG'"
],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": []
},
{
"Name": "Restore Default File Type Associations",
"Description": "Restoring default apps for file type associations resets Windows settings, allowing the system to select the appropriate programs by default",
"Category": "Fixer",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FileExts",
"Value": "Remove"
}
]
},
{
"Name": "Limit Defender CPU Usage",
"Description": "Limits Defender CPU maximum usage at 25% instead of default 50%",
"Category": "Performance",
"Check": "false",
"Refresh": "true",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Scan",
"Name": "AvgCPULoadFactor",
"Type": "DWord",
"Value": "25",
"defaultValue": "0"
}
]
},
{
"Name": "Optimizing GPU scheduling",
"Description": "Disables Hardware-Accelerated GPU Scheduling, which may improve performance",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\SOFTWARE\\CurrentControlSet\\Control\\GraphicsDrivers",
"Name": "HwSchMode",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Disable Fullscreen Optimizations",
"Description": "Fullscreen Optimizations, which may improve performance",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKCU:\\System\\GameConfigStore",
"Name": "GameDVR_DXGIHonorFSEWindowsCompatible",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Optimize Network",
"Description": "Optimize network performance",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters",
"Name": "TcpAckFrequency",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters",
"Name": "TCPNoDelay",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Enable system cache",
"Description": "Enabling large system cache can improve performance for certain workloads but may affect system stability",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Memory Management",
"Name": "LargeSystemCache",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Optimizing NVIDIA GPU settings",
"Description": "Optimize NVIDIA GPU settings ",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
"Name": "PowerMizerEnable",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
"Name": "PowerMizerLevel",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
},
{
"Path": "HKLM:\\Software\\NVIDIA Corporation\\Global\\NvCplApi\\Policies",
"Name": "PowerMizerLevelAC",
"Type": "DWord",
"Value": "0",
"defaultValue": "1"
}
]
},
{
"Name": "Enable Faster Shutdown",
"Description": "Optimize NVIDIA GPU settings ",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [],
"UndoScript": [],
"ScheduledTask": [],
"AppxPackage": [],
"Services": [],
"Registry": [
{
"Path": "HKLM:\\System\\CurrentControlSet\\Control",
"Name": "WaitToKillServiceTimeout",
"Type": "String",
"Value": "2000",
"defaultValue": "100"
},
{
"Path": "HKCU:\\Control Panel\\Desktop",
"Name": "WaitToKillAppTimeout",
"Type": "String",
"Value": "2000",
"defaultValue": "100"
},
{
"Path": "HKCU:\\Control Panel\\Desktop",
"Name": "HungAppTimeout",
"Type": "String",
"Value": "2000 ",
"defaultValue": "100"
}
]
},
{
"Name": "Super Control Panel",
"Description": "Create Super Control Panel shortcut on Desktop",
"Category": "Personalization",
"Check": "false",
"Refresh": "false",
"Script": ["New-Item -Path \"$env:USERPROFILE\\Desktop\\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}\" -ItemType Directory"]
},
{
"Name": "Detailed BSoD",
"Description": "You will see a detailed Blue Screen of Death (BSOD) with more information",
"Category": "Fixer",
"Check": "false",
"Refresh": "false",
"Script": [],
"Registry": [
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CrashControl",
"Name": "DisplayParameters",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
},
{
"Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CrashControl",
"Name": "DisableEmoticon",
"Type": "DWord",
"Value": "1",
"defaultValue": "0"
}
]
},
{
"Name": "Disable Powershell 7 Telemetry",
"Description": "Tell Powershell 7 to not send Telemetry Data",
"Category": "Privacy",
"Check": "false",
"Refresh": "false",
"Script": []
}
]
'@ | ConvertFrom-Json
function Invoke-Button {
Param ([string]$action,[string]$Content)
Switch -Wildcard ($action) {
"installBtn" {
$itt.SearchInput.Text = $null
Invoke-Install
}
"applyBtn" {
Invoke-Apply
}
"$($itt.CurrentCategory)" {
FilterByCat($itt["window"].FindName($itt.CurrentCategory).SelectedItem.Content)
}
"searchInput" {
Search
}
"systemlang" {
Set-Language -lang "default"
}
"ar" {
Set-Language -lang "ar"
}
"de" {
Set-Language -lang "de"
}
"en" {
Set-Language -lang "en"
}
"es" {
Set-Language -lang "es"
}
"fr" {
Set-Language -lang "fr"
}
"ga" {
Set-Language -lang "ga"
}
"hi" {
Set-Language -lang "hi"
}
"it" {
Set-Language -lang "it"
}
"ko" {
Set-Language -lang "ko"
}
"ru" {
Set-Language -lang "ru"
}
"tr" {
Set-Language -lang "tr"
}
"zh" {
Set-Language -lang "zh"
}
"save" {
Save-File
}
"load" {
Get-file
}
"deviceManager" {
Start-Process devmgmt.msc
}
"appsfeatures" {
Start-Process appwiz.cpl
}
"sysinfo" {
Start-Process msinfo32.exe
Start-Process dxdiag.exe
}
"poweroption" {
Start-Process powercfg.cpl
}
"services" {
Start-Process services.msc
}
"network" {
Start-Process ncpa.cpl
}
"taskmgr" {
Start-Process taskmgr.exe
}
"diskmgmt" {
Start-Process diskmgmt.msc
}
"msconfig" {
Start-Process msconfig.exe
}
"ev" {
rundll32 sysdm.cpl,EditEnvironmentVariables
}
"spp" {
systemPropertiesProtection
}
"systheme" {
SwitchToSystem
}
"Dark" {
Set-Theme -Theme $action
}
"DarkKnight" {
Set-Theme -Theme $action
}
"Light" {
Set-Theme -Theme $action
}
"Palestine" {
Set-Theme -Theme $action
}
"chocoloc" {
Start-Process explorer.exe "C:\ProgramData\chocolatey\lib"
}
"itt" {
Start-Process explorer.exe $env:ProgramData\itt
}
"restorepoint" {
ITT-ScriptBlock -ScriptBlock{CreateRestorePoint}
}
"moff" {
Manage-Music -action "SetVolume" -volume 0
}
"mon" {
Manage-Music -action "SetVolume" -volume 100
}
"unhook" {
Start-Process "https://unhook.app/"
}
"efy" {
Start-Process "https://www.mrfdev.com/enhancer-for-youtube"
}
"uBlock" {
Start-Process "https://ublockorigin.com/"
}
"mas" {
Add-Log -Message "Microsoft Activation Scripts (MAS)" -Level "info"
ITT-ScriptBlock -ScriptBlock {irm https://get.activated.win | iex}
}
"idm" {
Add-Log -Message "Running IDM Activation..." -Level "info"
ITT-ScriptBlock -ScriptBlock {curl.exe -L -o $env:TEMP\\IDM_Trial_Reset.exe "https://github.com/itt-co/itt-packages/raw/refs/heads/main/automation/idm-trial-reset/IDM%20Trial%20Reset.exe"; cmd /c "$env:TEMP\\IDM_Trial_Reset.exe"}
}
"winoffice" {
Start-Process "https://massgrave.dev/genuine-installation-media"
}
"sordum" {
Start-Process "https://www.sordum.org/"
}
"majorgeeks" {
Start-Process "https://www.majorgeeks.com/"
}
"techpowerup" {
Start-Process "https://www.techpowerup.com/download/"
}
"ittshortcut" {
ITTShortcut $action
}
"dev" {
About
}
"shelltube"{
Start-Process -FilePath "powershell" -ArgumentList "irm https://github.com/emadadel4/shelltube/releases/latest/download/st.ps1 | iex"
}
"fmhy"{
Start-Process ("https://fmhy.net/")
}
"rapidos"{
Start-Process ("https://github.com/rapid-community/RapidOS")
}
"asustool"{
Start-Process ("https://github.com/codecrafting-io/asus-setup-tool")
}
"webtor"{
Start-Process ("https://webtor.io/")
}
"spotifydown"{
Start-Process ("https://spotidownloader.com/")
}
"taps"{
ChangeTap
}
Default {
Write-Host "Unknown action: $action"
}
}
}
function ITT-ScriptBlock {
param(
[scriptblock]$ScriptBlock,
[array]$ArgumentList,
$Debug
)
$script:powershell = [powershell]::Create()
$script:powershell.AddScript($ScriptBlock)
$script:powershell.AddArgument($ArgumentList)
$script:powershell.AddArgument($Debug)
$script:powershell.RunspacePool = $itt.runspace
$script:handle = $script:powershell.BeginInvoke()
if ($script:handle.IsCompleted) {
$script:powershell.EndInvoke($script:handle)
$script:powershell.Dispose()
$itt.runspace.Dispose()
$itt.runspace.Close()
[System.GC]::Collect()
}
return $handle
}
function CreateRestorePoint {
try {
Set-Statusbar -Text "✋ Please wait Creating a restore point..."
Set-ItemProperty "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" "SystemRestorePointCreationFrequency" 0 -Type DWord -Force
powershell.exe -NoProfile -Command {
Enable-ComputerRestore -Drive $env:SystemDrive
Checkpoint-Computer -Description ("ITT-" + (Get-Date -Format "yyyyMMdd-hhmmss-tt")) -RestorePointType "MODIFY_SETTINGS"
}
Set-ItemProperty $itt.registryPath "backup" 1 -Force
Set-Statusbar -Text "✔ Created successfully. Applying tweaks..."
} catch {
Add-Log "Error: $_" "ERROR"
}
}
function Add-Log {
param ([string]$Message, [string]$Level = "Default")
$level = $Level.ToUpper()
$colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
$iconMap  = @{ INFO="[+]"; WARNING="[!]"; ERROR="[X]"; DEFAULT=""; DEBUG="[Debug]"; ITT="[ITT]"; Chocolatey="[Chocolatey]"; Winget="[Winget]" }
$color = if ($colorMap.ContainsKey($level)) { $colorMap[$level] } else { "White" }
$icon  = if ($iconMap.ContainsKey($level)) { $iconMap[$level] } else { "i" }
Write-Host "$icon $Message" -ForegroundColor $color
}
function Disable-Service {
param([array]$tweak)
foreach ($serv in $tweak) {
try {
Add-Log  -Message "Setting Service $($serv.Name)" -Level "info"
$service = Get-Service -Name $serv.Name -ErrorAction Stop
Stop-Service -Name $serv.Name -ErrorAction Stop
$service | Set-Service -StartupType $serv.StartupType -ErrorAction Stop
}
catch {
Add-Log -Message "Service $Name was not found" -Level "info"
}
}
}
function ExecuteCommand {
param ([array]$tweak)
try {
foreach ($cmd in $tweak) {
Add-Log -Message "Please wait..."
$script = [scriptblock]::Create($cmd)
Invoke-Command  $script -ErrorAction Stop
}
} catch  {
Add-Log -Message "The specified command was not found." -Level "WARNING"
}
}
function Finish {
param (
[string]$ListView,
[string]$title = "ITT Emad Adel",
[string]$icon = "Info"
)
switch ($ListView) {
"AppsListView" {
UpdateUI -Button "InstallBtn" -Content "Install" -Width "140"
Notify -title "$title" -msg "All installations have finished" -icon "Info" -time 30000
Add-Log -Message "::::All installations have finished::::"
Set-Statusbar -Text "✔ All installations have finished"
}
"TweaksListView" {
UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
Add-Log -Message "::::All tweaks have finished::::"
Set-Statusbar -Text "✔ All tweaks have finished"
Notify -title "$title" -msg "All tweaks have finished" -icon "Info" -time 30000
}
}
$itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "None" -value 0.01 -icon "done" })
$itt.$ListView.Dispatcher.Invoke([Action] {
foreach ($item in $itt.$ListView.Items) {
if ($item.Children.Count -gt 0 -and $item.Children[0].Children.Count -gt 0) {
$item.Children[0].Children[0].IsChecked = $false
}
}
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
$collectionView.Filter = $null
$collectionView.Refresh()
})
}
function Show-Selected {
param (
[string]$ListView,
[string]$mode
)
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.$ListView.Items)
switch ($mode) {
"Filter" {
$collectionView.Filter = {
param ($item)
return $item.Children[0].Children[0].IsChecked -eq $true
}
}
Default {
$collectionView.Filter = {
param ($item)
$item.Children[0].Children[0].IsChecked = $false
}
$collectionView.Filter = $null
}
}
}
function Get-SelectedItems {
param ([string]$Mode)
switch ($Mode) {
"Apps" {
$items = @()
foreach ($item in $itt.AppsListView.Items) {
$checkbox = $item.Children[0].Children[0]
$tags = $item.Children[0].Children[0].Tag -split " \| "
if ($checkbox.IsChecked) {
$items += @{
Name    = $checkbox.Content
Choco   = $tags[0]
Winget  = $tags[1]
ITT     = $tags[2]
}
}
}
}
"Tweaks" {
$items = @()
foreach ($item in $itt.TweaksListView.Items) {
$child = $item.Children[0].Children[0]
if ($tweaksDict.ContainsKey($child.Content) -and $child.IsChecked) {
$items += @{
Name          = $tweaksDict[$child.Content].Name
Registry      = $tweaksDict[$child.Content].Registry
Services      = $tweaksDict[$child.Content].Services
ScheduledTask = $tweaksDict[$child.Content].ScheduledTask
AppxPackage   = $tweaksDict[$child.Content].AppxPackage
Script        = $tweaksDict[$child.Content].Script
UndoScript    = $tweaksDict[$child.Content].UndoScript
Refresh       = $tweaksDict[$child.Content].Refresh
}
}
}
}
}
return $items
}
function Get-ToggleStatus {
Param($ToggleSwitch)
if ($ToggleSwitch -eq "darkmode") {
$app = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').AppsUseLightTheme
$system = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize').SystemUsesLightTheme
if ($app -eq 0 -and $system -eq 0) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "showfileextensions") {
$hideextvalue = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').HideFileExt
if ($hideextvalue -eq 0) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "showsuperhidden") {
$hideextvalue = (Get-ItemPropertyValue -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden")
if ($hideextvalue -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "numlook") {
$numlockvalue = (Get-ItemProperty -path 'HKCU:\Control Panel\Keyboard').InitialKeyboardIndicators
if ($numlockvalue -eq 2) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "stickykeys") {
$StickyKeys = (Get-ItemProperty -path 'HKCU:\Control Panel\Accessibility\StickyKeys').Flags
if ($StickyKeys -eq 58) {
return $false
}
else {
return $true
}
}
if ($ToggleSwitch -eq "mouseacceleration") {
$Speed = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseSpeed
$Threshold1 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold1
$Threshold2 = (Get-ItemProperty -path 'HKCU:\Control Panel\Mouse').MouseThreshold2
if ($Speed -eq 1 -and $Threshold1 -eq 6 -and $Threshold2 -eq 10) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "endtaskontaskbarwindows11") {
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
if (-not (Test-Path $path)) {
return $false
}
else {
$TaskBar = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings').TaskbarEndTask
if ($TaskBar -eq 1) {
return $true
}
else {
return $false
}
}
}
if ($ToggleSwitch -eq "clearpagefileatshutdown") {
$PageFile = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management').ClearPageFileAtShutdown
if ($PageFile -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "autoendtasks") {
$PageFile = (Get-ItemProperty -path 'HKCU:\Control Panel\Desktop').AutoEndTasks
if ($PageFile -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "performanceoptions") {
$VisualFXSetting = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects').VisualFXSetting
if ($VisualFXSetting -eq 2) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "launchtothispc") {
$LaunchTo = (Get-ItemProperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced').LaunchTo
if ($LaunchTo -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "disableautomaticdriverinstallation") {
$disableautomaticdrive = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching').SearchOrderConfig
if ($disableautomaticdrive -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "AlwaysshowiconsneverThumbnail") {
$alwaysshowicons = (Get-ItemProperty -path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced').IconsOnly
if ($alwaysshowicons -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "CoreIsolationMemoryIntegrity") {
$CoreIsolationMemory = (Get-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard').Enabled
if ($CoreIsolationMemory -eq 1) {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "WindowsSandbox") {
$WS = Get-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM"
if ($WS.State -eq "Enabled") {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "WindowsSubsystemforLinux") {
$WSL = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"
if ($WSL.State -eq "Enabled") {
return $true
}
else {
return $false
}
}
if ($ToggleSwitch -eq "HyperVVirtualization") {
$HyperV = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V"
if ($HyperV.State -eq "Enabled") {
return $true
}
else {
return $false
}
}
}
function Install-App {
param ([string]$Name,[string]$Choco,[string]$Winget,[string]$ITT)
function Install-AppWithInstaller {
param ([string]$Installer,[string]$InstallArgs)
$process = Start-Process -FilePath $Installer -ArgumentList $InstallArgs -NoNewWindow -Wait -PassThru
return $process.ExitCode
}
function Log {
param ([string]$Installer,[string]$Source)
if ($Installer -ne 0) {
Add-Log -Message "Installation Failed for ($Name). Report the issue in ITT repository." -Level "$Source"
return $false
}
else {
Add-Log -Message "Successfully Installed ($Name)" -Level "$Source"
return $true
}
}
$wingetArgs = "install --id $Winget --silent --accept-source-agreements --accept-package-agreements --force"
$chocoArgs = "install $Choco --confirm --acceptlicense -q --ignore-http-cache --limit-output --allowemptychecksumsecure --ignorechecksum --allowemptychecksum --usepackagecodes --ignoredetectedreboot --ignore-checksums --ignore-reboot-requests"
$ittArgs = "install $ITT -y"
if ($Choco -eq "na" -and $Winget -eq "na" -and $itt -ne "na") {
Install-ITTAChoco
Add-Log -Message "Attempting to install $Name." -Level "ITT"
$ITTResult = Install-AppWithInstaller "itt" $ittArgs
Log $ITTResult "itt"
}
else
{
if ($Choco -eq "na" -and $Winget -ne "na")
{
Install-Winget
Add-Log -Message "Attempting to install $Name." -Level "Winget"
Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
$wingetResult = Install-AppWithInstaller "winget" $wingetArgs
Log $wingetResult "Winget"
}
else
{
if ($Choco -ne "na" -or $Winget -ne "na")
{
Install-ITTAChoco
Add-Log -Message "Attempting to install $Name." -Level "Chocolatey"
$chocoResult = Install-AppWithInstaller "choco" $chocoArgs
if ($chocoResult -ne 0) {
Install-Winget
Add-Log -Message "installation failed, Falling back to Winget." -Level "Chocolatey"
Start-Process -FilePath "winget" -ArgumentList "settings --enable InstallerHashOverride" -NoNewWindow -Wait -PassThru
$wingetResult = Install-AppWithInstaller "winget" $wingetArgs
Log $wingetResult "Winget"
}else {
Log $chocoResult "Chocolatey"
}
}else {
Add-Log -Message "Package not found in any package manager" -Level "ERROR"
}
}
}
}
function Install-ITTAChoco {
if (-not (Get-Command choco -ErrorAction SilentlyContinue))
{
Add-Log -Message "Checking dependencies This won't take a minute..." -Level "INFO"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) *> $null
}
if (-not (Get-Command itt -ErrorAction SilentlyContinue))
{
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/itt-co/bin/refs/heads/main/install.ps1')) *> $null
}
else
{
try {
$currentVersion = (itt.exe -ver)
$installerPath = "$env:TEMP\installer.msi"
$latestReleaseApi = "https://api.github.com/repos/itt-co/bin/releases/latest"
$latestVersion = (Invoke-RestMethod -Uri $latestReleaseApi).tag_name
if ($latestVersion -eq $currentVersion) {return}
Invoke-WebRequest "https://github.com/itt-co/bin/releases/latest/download/installer.msi" -OutFile $installerPath
Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /q" -NoNewWindow -Wait
Write-Host "Updated to version $latestVersion successfully."
}
catch {
Add-Log -Message "$_" -Level "error"
}
}
}
function Install-Winget {
if(Get-Command winget -ErrorAction SilentlyContinue) {return}
$ComputerInfo = Get-ComputerInfo -ErrorAction Stop
$arch = [int](($ComputerInfo).OsArchitecture -replace '\D', '')
if ($ComputerInfo.WindowsVersion -lt "1809") {
Add-Log -Message "Winget is not supported on this version of Windows Upgrade to 1809 or newer." -Level "info"
return
}
$VCLibs = "https://aka.ms/Microsoft.VCLibs.x$arch.14.00.Desktop.appx"
$UIXaml = "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x$arch.appx"
$WingetLatset = "https://aka.ms/getwinget"
try {
Add-Log -Message "Installing Winget... This might take several minutes" -Level "info"
Start-BitsTransfer -Source $VCLibs -Destination "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
Start-BitsTransfer -Source $UIXaml -Destination "$env:TEMP\Microsoft.UI.Xaml.appx"
Start-BitsTransfer -Source $WingetLatset -Destination "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Add-AppxPackage "$env:TEMP\Microsoft.VCLibs.Desktop.appx"
Add-AppxPackage "$env:TEMP\Microsoft.UI.Xaml.appx"
Add-AppxPackage "$env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
Start-Sleep -Seconds 1
Add-Log -Message "Successfully installed Winget. Continuing to install selected apps..." -Level "info"
return
}
catch {
Write-Error "Failed to install $_"
}
}
function Refresh-Explorer {
Add-Log -Message "Restart explorer." -Level "info"
Stop-Process -Name explorer -Force
Start-Sleep -Seconds 1
if (-not (Get-Process -Name explorer -ErrorAction SilentlyContinue)) {
Start-Process explorer.exe -Verb RunAs
}
}
function Remove-ScheduledTasks {
param ([Parameter(Mandatory = $true)][array]$tweak)
foreach ($task in $tweak) {
Add-Log -Message "Removing $task ScheduledTask..." -Level "info"
$tasks = Get-ScheduledTask -TaskName "*$task*" -ErrorAction SilentlyContinue
if ($tasks)
{
foreach ($task in $tasks)
{
Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false
Add-Log -Message "$($task.TaskName) Removed" -Level "INFO"
}
}
else
{
if ($Debug)
{
Add-Log -Message "No tasks matching '$task' found" -Level "debug"
}
}
}
}
function Get-file {
if ($itt.ProcessRunning) {
Message -key "Please_wait" -icon "Warning" -action "OK"
return
}
$openFileDialog = New-Object Microsoft.Win32.OpenFileDialog -Property @{
Filter = "itt files (*.itt)|*.itt"
Title  = "itt File"
}
if ($openFileDialog.ShowDialog() -eq $true) {
try {
$FileContent = Get-Content -Path $openFileDialog.FileName -Raw | ConvertFrom-Json -ErrorAction Stop
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt.AppsListView.Items)
$collectionView.Filter = {
param($item)
if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
}
}
catch {
Write-Warning "Failed to load or parse JSON file: $_"
}
}
$itt.Search_placeholder.Visibility = "Visible"
$itt.SearchInput.Text = $null
}
function Save-File {
$itt['window'].FindName("AppsCategory").SelectedIndex = 0
Show-Selected -ListView "AppsListView" -Mode "Filter"
$items = foreach ($item in $itt.AppsListView.Items) {
if ($item.Children[0].Children[0].IsChecked) {
[PSCustomObject]@{
Name  = $item.Children[0].Children[0].Content
}
}
}
if ($items.Count -eq 0) {
Message -key "Empty_save_msg" -icon "Information" -action "OK"
return
}
$saveFileDialog = New-Object Microsoft.Win32.SaveFileDialog -Property @{
Filter = "JSON files (*.itt)|*.itt"
Title  = "Save JSON File"
}
if ($saveFileDialog.ShowDialog() -eq $true) {
$items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
Write-Host "Saved: $($saveFileDialog.FileName)"
}
Show-Selected -ListView "AppsListView" -Mode "Default"
$itt.Search_placeholder.Visibility = "Visible"
$itt.SearchInput.Text = $null
}
function Quick-Install {
param (
[string]$file
)
try {
if ($file -match "^https?://") {
$FileContent = Invoke-RestMethod -Uri $file -ErrorAction Stop
if ($FileContent -isnot [array] -or $FileContent.Count -eq 0) {
Message -NoneKey "The file is corrupt or access is forbidden" -icon "Warning" -action "OK"
return
}
}
else {
$FileContent = Get-Content -Path $file -Raw | ConvertFrom-Json -ErrorAction Stop
if ($file -notmatch "\.itt") {
Message -NoneKey "Invalid file format. Expected .itt file." -icon "Warning" -action "OK"
return
}
}
}
catch {
Write-Warning "Failed to load or parse JSON file: $_"
return
}
if ($null -eq $FileContent) { return }
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['Window'].FindName('appslist').Items)
$collectionView.Filter = {
param($item)
if ($FileContent.Name -contains $item.Children[0].Children[0].Content) { return $item.Children[0].Children[0].IsChecked = $true } else { return $false }
}
try {
Invoke-Install *> $null
}
catch {
Write-Warning "Installation failed: $_"
}
}
function Set-Registry {
param ([array]$tweak)
try {
if(!(Test-Path 'HKU:\')) {New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS}
$tweak | ForEach-Object {
if($_.Value -ne "Remove")
{
If (!(Test-Path $_.Path)) {
Add-Log -Message "$($_.Path) was not found, Creating..." -Level "info"
New-Item -Path $_.Path | Out-Null
}
Add-Log -Message "Optmize $($_.name)..." -Level "info"
New-ItemProperty -Path $_.Path -Name $_.Name -PropertyType $_.Type -Value $_.Value -Force | Out-Null
}else
{
if($_.Name -ne $null)
{
Add-Log -Message "Remove $($_.name) from registry..." -Level "info"
Remove-ItemProperty -Path $_.Path -Name $_.Name -Force -ErrorAction SilentlyContinue
}else{
Add-Log -Message "Remove $($_.Path)..." -Level "info"
Remove-Item -Path $_.Path -Recurse -Force -ErrorAction SilentlyContinue
}
}
}
} catch {
Add-Log -Message "An error occurred: $_" -Level "WARNING"
}
}
function Set-Taskbar {
param ([string]$progress,[double]$value,[string]$icon)
try {
if ($value) {
$itt["window"].taskbarItemInfo.ProgressValue = $value
}
if($progress)
{
switch ($progress) {
'None' { $itt["window"].taskbarItemInfo.ProgressState = "None" }
'Normal' { $itt["window"].taskbarItemInfo.ProgressState = "Normal" }
'Indeterminate' { $itt["window"].taskbarItemInfo.ProgressState = "Indeterminate" }
'Error' { $itt["window"].taskbarItemInfo.ProgressState = "Error" }
default { throw "Set-Taskbar Invalid state" }
}
}
if($icon)
{
switch ($icon) {
"done" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/done.png"}
"logo" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico"}
"error" {$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/IT/main/static/Icons/error.png"}
default{$itt["window"].taskbarItemInfo.Overlay = "https://raw.githubusercontent.com/emadadel4/main//static/Icons/icon.ico"}
}
}
}
catch {
}
}
function Startup {
$UsersCount = "https://ittools-7d9fe-default-rtdb.firebaseio.com/message/message.json"
ITT-ScriptBlock -ArgumentList $Debug $UsersCount -ScriptBlock {
param($Debug, $UsersCount)
function Telegram {
param (
[string]$Message
)
try {
$BotToken = "7140758327:AAF4BeD8wl4xspYvtYu7qwhd0XC82bubI1k"
$ChatID = "1299033071"
$SendMessageUrl = "https://api.telegram.org/bot$BotToken"
$PostBody = @{
chat_id = $ChatID
text    = $Message
}
$Response = Invoke-RestMethod -Uri "$SendMessageUrl/sendMessage" -Method Post -Body $PostBody -ContentType "application/x-www-form-urlencoded"
}
catch {
Add-Log -Message "Your internet connection appears to be slow." -Level "WARNING"
}
}
function GetCount {
$response = Invoke-RestMethod -Uri $UsersCount -Method Get
return $response
}
function PlayMusic {
$ST = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/OST.json" -Method Get
function PlayAudio($track) {
$mediaItem = $itt.mediaPlayer.newMedia($track)
$itt.mediaPlayer.currentPlaylist.appendItem($mediaItem)
$itt.mediaPlayer.controls.play()
}
function GetShuffledTracks {
switch ($itt.Date.Month, $itt.Date.Day) {
{ $_ -eq 9, 1 } { return $ST.Favorite | Get-Random -Count $ST.Favorite.Count }
{ $_ -eq 10, 6 -or $_ -eq 10, 7 } { return $ST.Otobers | Get-Random -Count $ST.Otobers.Count }
default { return $ST.Tracks | Get-Random -Count $ST.Tracks.Count }
}
}
function PlayPreloadedPlaylist {
$shuffledTracks = GetShuffledTracks
foreach ($track in $shuffledTracks) {
PlayAudio -track $track.url
while ($itt.mediaPlayer.playState -in @(3, 6)) {
Start-Sleep -Milliseconds 100
}
}
}
PlayPreloadedPlaylist
}
function Quotes {
function Get-Quotes {(Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }}
function Show-Quote($text, $icon) {}
Set-Statusbar -Text "☕ $($itt.database.locales.Controls.$($itt.Language).welcome)"
Start-Sleep 18
Set-Statusbar -Text "👁‍🗨 $($itt.database.locales.Controls.$($itt.Language).easter_egg)"
Start-Sleep 18
$iconMap = @{quote = "💬"; info = "📢"; music = "🎵"; Cautton = "⚠"; default = "☕" }
do {
foreach ($q in Get-Quotes) {
$icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
$text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
Set-Statusbar -Text "$icon $text"
Start-Sleep 25
}
} while ($true)
}
function UsageCount {
$currentCount = Invoke-RestMethod -Uri $UsersCount -Method Get
$Runs = ([int]$currentCount + 1).ToString()
Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($Runs | ConvertTo-Json -Compress) -Headers @{ "Content-Type" = "application/json" }
Telegram -Message "Version: $($itt.lastupdate)`nURL: $($itt.command)`nLang: $($itt.Language)`nTotal Usage: $($Runs)"
}
function LOG {
Write-Host "  `n` "
Write-Host "  ███████████████████╗ Be the first to uncover the secret! Dive into"
Write-Host "  ██╚══██╔══╚═══██╔══╝ the source code, find the feature and integrate it"
Write-Host "  ██║  ██║ Emad ██║    https://github.com/emadadel4/itt"
Write-Host "  ██║  ██║ Adel ██║    "
Write-Host "  ██║  ██║      ██║    "
Write-Host "  ╚═╝  ╚═╝      ╚═╝    "
UsageCount
Write-Host "`n  ITT has been used $(GetCount) times worldwide.`n" -ForegroundColor White
}
LOG
PlayMusic
Quotes
}
}
function ChangeTap {
$tabSettings = @{
'apps'        = @{
'installBtn' = 'Visible';
'applyBtn' = 'Hidden';
'CurrentList' = 'appslist';
'CurrentCategory' = 'AppsCategory'
}
'tweeksTab'   = @{
'installBtn' = 'Hidden';
'applyBtn' = 'Visible';
'CurrentList' = 'tweakslist';
'CurrentCategory' = 'TwaeksCategory'
}
'SettingsTab' = @{
'installBtn' = 'Hidden';
'applyBtn' = 'Hidden';
'CurrentList' = 'SettingsList'
}
}
foreach ($tab in $tabSettings.Keys) {
if ($itt['window'].FindName($tab).IsSelected) {
$settings = $tabSettings[$tab]
$itt.CurrentList = $settings['CurrentList']
$itt.CurrentCategory = $settings['CurrentCategory']
$itt['window'].FindName('installBtn').Visibility = $settings['installBtn']
$itt['window'].FindName('applyBtn').Visibility = $settings['applyBtn']
$itt['window'].FindName('AppsCategory').Visibility = $settings['installBtn']
$itt['window'].FindName('TwaeksCategory').Visibility = $settings['applyBtn']
break
}
}
}
function Uninstall-AppxPackage {
param ([array]$tweak)
try {
foreach ($name in $tweak) {
Add-Log -Message "Removing $name..." -Level "info"
Get-AppxPackage "*$name*" | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}
}
catch
{
Add-Log -Message "PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL $NAME." -Level "WARNING"
}
}
function Invoke-Install {
if ($itt.ProcessRunning) {
Message -key "Please_wait" -icon "Warning" -action "OK"
return
}
$itt.searchInput.text = $null
$itt.Search_placeholder.Visibility = "Visible"
$itt['window'].FindName("AppsCategory").SelectedIndex = 0
$selectedApps = Get-SelectedItems -Mode "Apps"
if ($selectedApps.Count -le 0) {return}
Show-Selected -ListView "AppsListView" -Mode "Filter"
if (-not $i) {
$result = Message -key "Install_msg" -icon "ask" -action "YesNo"
}
if ($result -eq "no") {
Show-Selected -ListView "AppsListView" -Mode "Default"
return
}
ITT-ScriptBlock -ArgumentList $selectedApps $i -Debug $debug -ScriptBlock {
param($selectedApps , $i)
UpdateUI -Button "installBtn" -Content "Downloading" -Width "auto"
$itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })
$itt.ProcessRunning = $true
foreach ($App in $selectedApps) {
Set-Statusbar -Text "⬇ Current task: Downloading $($App.Name)"
$chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($App.Choco)"
$ITTFolder = Join-Path $env:ProgramData "itt\downloads\$($App.ITT)"
Remove-Item -Path "$chocoFolder" -Recurse -Force
Remove-Item -Path "$chocoFolder.install" -Recurse -Force
Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
Remove-Item -Path "$ITTFolder" -Recurse -Force
$Install_result = Install-App -Name $App.Name -Winget $App.Winget -Choco $App.Choco -itt $App.ITT
if ($Install_result) {
Set-Statusbar -Text "✔ $($App.Name) Installed successfully "
} else {
Set-Statusbar -Text "✖ $($App.Name) Installation failed "
}
}
Finish -ListView "AppsListView"
$itt.ProcessRunning = $false
}
}
function Invoke-Apply {
$itt.searchInput.text = $null
$itt.Search_placeholder.Visibility = "Visible"
$itt['window'].FindName("TwaeksCategory").SelectedIndex = 0
$selectedTweaks = Get-SelectedItems -Mode "Tweaks"
if ($itt.ProcessRunning) {
Message -key "Please_wait" -icon "Warning" -action "OK"
return
}
if ($selectedTweaks.Count -le 0) {return}
Show-Selected -ListView "TweaksListView" -Mode "Filter"
$result = Message -key "Apply_msg" -icon "ask" -action "YesNo"
if ($result -eq "no") {
Show-Selected -ListView "TweaksListView" -Mode "Default"
return
}
ITT-ScriptBlock -ArgumentList $selectedTweaks -debug $debug -ScriptBlock {
param($selectedTweaks, $debug)
if((Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup -eq 0){CreateRestorePoint}
$itt.ProcessRunning = $true
UpdateUI -Button "ApplyBtn" -Content "Applying" -Width "auto"
$itt["window"].Dispatcher.Invoke([action] { Set-Taskbar -progress "Indeterminate" -value 0.01 -icon "logo" })
foreach ($tweak in $selectedTweaks) {
Add-Log -Message "::::$($tweak.Name)::::" -Level "default"
$tweak | ForEach-Object {
if ($_.Script -and $_.Script.Count -gt 0) {
ExecuteCommand -tweak $tweak.Script
if ($_.Refresh -eq $true) {
Refresh-Explorer
}
}
if ($_.Registry -and $_.Registry.Count -gt 0) {
Set-Registry -tweak $tweak.Registry
if ($_.Refresh -eq $true) {
Refresh-Explorer
}
}
if ($_.AppxPackage -and $_.AppxPackage.Count -gt 0) {
Uninstall-AppxPackage -tweak $tweak.AppxPackage
if ($_.Refresh -eq $true) {
Refresh-Explorer
}
}
if ($_.ScheduledTask -and $_.ScheduledTask.Count -gt 0) {
Remove-ScheduledTasks -tweak $tweak.ScheduledTask
if ($_.Refresh -eq $true) {
Refresh-Explorer
}
}
if ($_.Services -and $_.Services.Count -gt 0) {
Disable-Service -tweak $tweak.Services
if ($_.Refresh -eq $true) {
Refresh-Explorer
}
}
}
}
$itt.ProcessRunning = $false
Finish -ListView "TweaksListView"
}
}
function Invoke-Toggle {
Param ([string]$debug)
Switch -Wildcard ($debug) {
"showfileextensions" { Invoke-ShowFile-Extensions $(Get-ToggleStatus showfileextensions) }
"darkmode" { Invoke-DarkMode $(Get-ToggleStatus darkmode) }
"showsuperhidden" { Invoke-ShowFile $(Get-ToggleStatus showsuperhidden) }
"numlook" { Invoke-NumLock $(Get-ToggleStatus numlook) }
"stickykeys" { Invoke-StickyKeys $(Get-ToggleStatus stickykeys) }
"mouseacceleration" { Invoke-MouseAcceleration $(Get-ToggleStatus mouseacceleration) }
"endtaskontaskbarwindows11" { Invoke-TaskbarEnd $(Get-ToggleStatus endtaskontaskbarwindows11) }
"clearpagefileatshutdown" { Invoke-ClearPageFile $(Get-ToggleStatus clearpagefileatshutdown) }
"autoendtasks" { Invoke-AutoEndTasks $(Get-ToggleStatus autoendtasks) }
"performanceoptions" { Invoke-PerformanceOptions $(Get-ToggleStatus performanceoptions) }
"launchtothispc" { Invoke-LaunchTo $(Get-ToggleStatus launchtothispc) }
"disableautomaticdriverinstallation" { Invoke-DisableAutoDrivers $(Get-ToggleStatus disableautomaticdriverinstallation) }
"AlwaysshowiconsneverThumbnail" { Invoke-ShowFile-Icons $(Get-ToggleStatus AlwaysshowiconsneverThumbnail) }
"CoreIsolationMemoryIntegrity" { Invoke-Core-Isolation $(Get-ToggleStatus CoreIsolationMemoryIntegrity) }
"WindowsSandbox" { Invoke-WindowsSandbox $(Get-ToggleStatus WindowsSandbox) }
"WindowsSubsystemforLinux" { Invoke-WindowsSandbox $(Get-ToggleStatus WindowsSubsystemforLinux) }
"HyperVVirtualization" { Invoke-HyperV $(Get-ToggleStatus HyperVVirtualization) }
}
}
function Invoke-AutoEndTasks {
Param(
$Enabled,
[string]$Path = "HKCU:\Control Panel\Desktop",
[string]$name = "AutoEndTasks"
)
Try{
if ($Enabled -eq $false){
$value = 1
Add-Log -Message "Enabled auto end tasks" -Level "info"
}
else {
$value = 0
Add-Log -Message "Disabled auto end tasks" -Level "info"
}
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-LaunchTo {
Param(
$Enabled,
[string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
[string]$name = "LaunchTo"
)
Try{
if ($Enabled -eq $false){
$value = 1
Add-Log -Message "Launch to This PC" -Level "info"
}
else {
$value = 2
Add-Log -Message "Launch to Quick Access" -Level "info"
}
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-ClearPageFile {
Param(
$Enabled,
[string]$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\\Memory Management",
[string]$name = "ClearPageFileAtShutdown"
)
Try {
if ($Enabled -eq $false) {
$value = 1
Add-Log -Message "Show End Task on taskbar" -Level "info"
}
else {
$value = 0
Add-Log -Message "Disable End Task on taskbar" -Level "info"
}
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch {
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-Core-Isolation {
param ($Enabled, $Name = "Enabled", $Path = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard")
Try {
if ($Enabled -eq $false) {
$value = 1
Add-Log -Message "This change require a restart" -Level "info"
}
else {
$value = 0
Add-Log -Message "This change require a restart" -Level "info"
}
Set-ItemProperty -Path $Path -Name $Name -Value $value -ErrorAction Stop
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch {
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-DarkMode {
Param($DarkMoveEnabled)
Try{
$Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme").Theme
if ($DarkMoveEnabled -eq $false){
$DarkMoveValue = 0
Add-Log -Message "Dark Mode" -Level "info"
if($Theme -eq "default")
{
$itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Dark"))
$itt.Theme = "Dark"
}
}
else {
$DarkMoveValue = 1
Add-Log -Message "Light Mode" -Level "info"
if($Theme -eq "default")
{
$itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource("Light"))
$itt.Theme = "Light"
}
}
$Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $DarkMoveValue
Set-ItemProperty -Path $Path -Name SystemUsesLightTheme -Value $DarkMoveValue
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-DisableAutoDrivers {
Param(
$Enabled,
[string]$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching",
[string]$name = "SearchOrderConfig"
)
Try{
if ($Enabled -eq $false){
$value = 1
Add-Log -Message "Enabled auto drivers update" -Level "info"
}
else {
$value = 0
Add-Log -Message "Disabled auto drivers update" -Level "info"
}
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-HyperV {
Param($Enabled)
Try{
if ($Enabled -eq $false){
Add-Log -Message "HyperV disabled" -Level "info"
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
}
else {
Add-Log -Message "HyperV enabled" -Level "info"
dism.exe /online /disable-feature /featurename:Microsoft-Hyper-V-All /norestart
}
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set HyperV due to a Security Exception"
}
}
function Invoke-MouseAcceleration {
param (
$Mouse,
$Speed = 0,
$Threshold1  = 0,
$Threshold2  = 0,
[string]$Path = "HKCU:\Control Panel\Mouse"
)
try {
if($Mouse -eq $false)
{
Add-Log -Message "Mouse Acceleration" -Level "info"
$Speed = 1
$Threshold1 = 6
$Threshold2 = 10
}else {
$Speed = 0
$Threshold1 = 0
$Threshold2 = 0
Add-Log -Message "Mouse Acceleration" -Level "info"
}
Set-ItemProperty -Path $Path -Name MouseSpeed -Value $Speed
Set-ItemProperty -Path $Path -Name MouseThreshold1 -Value $Threshold1
Set-ItemProperty -Path $Path -Name MouseThreshold2 -Value $Threshold2
}
catch {
Add-Log -Message "Unable  set valuse" -LEVEL "ERROR"
}
}
function Invoke-NumLock {
param(
[Parameter(Mandatory = $true)]
[bool]$Enabled
)
try {
if ($Enabled -eq $false)
{
Add-Log -Message "Numlock Enabled" -Level "info"
$value = 2
}
else
{
Add-Log -Message "Numlock Disabled" -Level "info"
$value = 0
}
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS -ErrorAction Stop
$Path = "HKU:\.Default\Control Panel\Keyboard"
$Path2 = "HKCU:\Control Panel\Keyboard"
Set-ItemProperty -Path $Path -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
Set-ItemProperty -Path $Path2 -Name InitialKeyboardIndicators -Value $value -ErrorAction Stop
}
catch {
Write-Warning "An error occurred: $($_.Exception.Message)"
}
}
function Invoke-PerformanceOptions {
Param(
$Enabled,
[string]$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects",
[string]$name = "VisualFXSetting"
)
Try{
if ($Enabled -eq $false){
$value = 2
Add-Log -Message "Enabled auto end tasks" -Level "info"
}
else {
$value = 0
Add-Log -Message "Disabled auto end tasks" -Level "info"
}
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-ShowFile {
Param($Enabled)
Try {
if ($Enabled -eq $false)
{
$value = 1
Add-Log -Message "Show hidden files , folders etc.." -Level "info"
}
else
{
$value = 2
Add-Log -Message "Don't Show hidden files , folders etc.." -Level "info"
}
$hiddenItemsKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $hiddenItemsKey -Name Hidden -Value $value
Set-ItemProperty -Path $hiddenItemsKey -Name ShowSuperHidden -Value $value
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set registry keys due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch {
Write-Warning "Unable to set registry keys due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-ShowFile-Extensions {
Param($Enabled)
Try{
if ($Enabled -eq $false){
$value = 0
Add-Log -Message "Hidden extensions" -Level "info"
}
else {
$value = 1
Add-Log -Message "Hidden extensions" -Level "info"
}
$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $Path -Name HideFileExt -Value $value
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-ShowFile-Icons {
param ($Enabled, $Name = "IconsOnly", $Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced")
Try {
if ($Enabled -eq $false) {
$value = 1
Add-Log -Message "ON" -Level "info"
}
else {
$value = 0
Add-Log -Message "OFF" -Level "info"
}
Set-ItemProperty -Path $Path -Name $Name -Value $value -ErrorAction Stop
Refresh-Explorer
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch {
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-TaskbarEnd {
Param($Enabled)
Try{
if ($Enabled -eq $false){
$value = 1
Add-Log -Message "Show End Task on taskbar" -Level "info"
}
else {
$value = 0
Add-Log -Message "Disable End Task on taskbar" -Level "info"
}
$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings\"
$name = "TaskbarEndTask"
if (-not (Test-Path $path)) {
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
}else {
Set-ItemProperty -Path $Path -Name $name -Value $value -ErrorAction Stop
Refresh-Explorer
Add-Log -Message "This Setting require a restart" -Level "INFO"
}
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch [System.Management.Automation.ItemNotFoundException] {
Write-Warning $psitem.Exception.ErrorRecord
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
Write-Warning $psitem.Exception.StackTrace
}
}
function Invoke-StickyKeys {
Param($Enabled)
Try {
if ($Enabled -eq $false){
$value = 510
$value2 = 510
Add-Log -Message "Sticky Keys" -Level "info"
}
else {
$value = 58
$value2 = 122
Add-Log -Message "Sticky Keys" -Level "info"
}
$Path = "HKCU:\Control Panel\Accessibility\StickyKeys"
$Path2 = "HKCU:\Control Panel\Accessibility\Keyboard Response"
Set-ItemProperty -Path $Path -Name Flags -Value $value
Set-ItemProperty -Path $Path2 -Name Flags -Value $value2
Refresh-Explorer
Add-Log -Message "This Setting require a restart" -Level "INFO"
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set $Path\$Name to $Value due to a Security Exception"
}
Catch{
Write-Warning "Unable to set $Name due to unhandled exception"
}
}
function Invoke-WindowsSandbox {
Param($Enabled)
Try{
if ($Enabled -eq $false){
Add-Log -Message "Sandbox disabled" -Level "info"
Dism /online /Disable-Feature /FeatureName:"Containers-DisposableClientVM"
}
else {
Add-Log -Message "Sandbox enabled" -Level "info"
Dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All
}
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set Windows Sandbox due to a Security Exception"
}
}
function Invoke-WSL {
Param($Enabled)
Try{
if ($Enabled -eq $false){
Add-Log -Message "WSL2 disabled" -Level "info"
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
}
else {
Add-Log -Message "WSL2 enabled" -Level "info"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
}
}
Catch [System.Security.SecurityException] {
Write-Warning "Unable to set WSL2 due to a Security Exception"
}
}
function About {
[xml]$about = $AboutWindowXaml
$childWindowReader = (New-Object System.Xml.XmlNodeReader $about)
$itt.about = [Windows.Markup.XamlReader]::Load($childWindowReader)
$itt.about.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.about.Close() } })
$itt['about'].Resources.MergedDictionaries.Clear()
$itt["about"].Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))
$itt.about.FindName('ver').Text = "Last update $($itt.lastupdate)"
$itt.about.FindName("telegram").Add_Click({ Start-Process("https://t.me/emadadel4") })
$itt.about.FindName("github").Add_Click({ Start-Process("https://github.com/emadadel4/itt") })
$itt.about.FindName("blog").Add_Click({ Start-Process("https://emadadel4.github.io") })
$itt.about.FindName("yt").Add_Click({ Start-Process("https://www.youtube.com/@emadadel4") })
$itt.about.FindName("coffee").Add_Click({ Start-Process("https://buymeacoffee.com/emadadel") })
$itt.about.DataContext = $itt.database.locales.Controls.$($itt.Language)
$itt.about.ShowDialog() | Out-Null
}
function ITTShortcut {
$appDataPath = "$env:ProgramData/itt"
$localIconPath = Join-Path -Path $appDataPath -ChildPath "icon.ico"
Invoke-WebRequest -Uri $itt.icon -OutFile $localIconPath
$Shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$([Environment]::GetFolderPath('Desktop'))\ITT Emad Adel.lnk")
$Shortcut.TargetPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -NoProfile -Command ""irm raw.githubusercontent.com/emadadel4/ITT/main/itt.ps1 | iex"""
$Shortcut.IconLocation = "$localIconPath"
$Shortcut.Save()
}
function Search {
$filter = $itt.searchInput.Text.ToLower() -replace '[^\p{L}\p{N}]', ''
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.currentList).Items)
$collectionView.Filter = {
param ($item)
if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
return $false
}
return $item.Children[0].Children[0].Content -match $filter -or $item.Children[0].Children[0].Tag -match $filter
}
}
function FilterByCat {
param ($Cat)
$validCategories = @(
"Web Browsers", "Media", "Media Tools", "Documents", "Compression",
"Communication", "File Sharing", "Imaging", "Gaming", "Utilities",
"Disk Tools", "Development", "Security", "Portable", "Runtimes",
"Drivers", "Performance", "Privacy", "Fixer", "Personalization",
"Power", "Protection", "Classic", "GPU Drivers"
)
$collectionView = [System.Windows.Data.CollectionViewSource]::GetDefaultView($itt['window'].FindName($itt.CurrentList).Items)
if ($validCategories -contains $Cat) {
$collectionView.Filter = {
param ($item)
if ($item.Children.Count -lt 1 -or $item.Children[0].Children.Count -lt 1) {
return $false
}
$tags = $item.Children[0].Children[0].Tag -split " \| "
return $tags[3] -eq $Cat
}
}
else {
$collectionView.Filter = $null
}
$collectionView.Refresh()
}
$KeyEvents = {
if ($itt.ProcessRunning) { return }
$modifiers = $_.KeyboardDevice.Modifiers
$key = $_.Key
switch ($key) {
"Enter" {
if ($itt.currentList -eq "appslist") { Invoke-Install }
elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
}
"S" {
if ($modifiers -eq "Ctrl") {
if ($itt.currentList -eq "appslist") { Invoke-Install }
elseif ($itt.currentList -eq "tweakslist") { Invoke-Apply }
}
elseif ($modifiers -eq "Shift") { Save-File }
}
"D" { if ($modifiers -eq "Shift") { Get-file } }
"M" {
if ($modifiers -eq "Shift") {
$global:toggleState = -not $global:toggleState
if ($global:toggleState) { Manage-Music -action "SetVolume" -volume 100 }
else { Manage-Music -action "SetVolume" -volume 0 }
}
}
"Q" {
if ($modifiers -eq "Ctrl") {
$itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "apps" }
}
elseif ($modifiers -eq "Shift") { RestorePoint }
}
"W" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "tweeksTab" } } }
"E" { if ($modifiers -eq "Ctrl") { $itt.TabControl.SelectedItem = $itt.TabControl.Items | Where-Object { $_.Name -eq "SettingsTab" } } }
"I" {
if ($modifiers -eq "Ctrl") { About }
elseif ($modifiers -eq "Shift") { ITTShortcut }
}
"C" { if ($modifiers -eq "Shift") { Start-Process explorer.exe $env:ProgramData\chocolatey\lib } }
"T" { if ($modifiers -eq "Shift") { Start-Process explorer.exe $env:ProgramData\itt } }
"G" { if ($modifiers -eq "Ctrl") { $this.Close() } }
"F" { if ($modifiers -eq "Ctrl") { $itt.SearchInput.Focus() } }
"Escape" {
$itt.SearchInput.MoveFocus([System.Windows.Input.TraversalRequest]::New([System.Windows.Input.FocusNavigationDirection]::Next))
$itt.SearchInput.Text = $null
$itt["window"].FindName("search_placeholder").Visibility = "Visible"
}
"A" {
if ($modifiers -eq "Ctrl" -and ($itt.CurrentCategory -eq "AppsCategory" -or $itt.CurrentCategory -eq "TwaeksCategory")) {
$itt["window"].FindName($itt.CurrentCategory).SelectedIndex = 0
}
}
}
}
function Message {
param([string]$key,[string]$NoneKey,[string]$title = "ITT",[string]$icon,[string]$action)
$iconMap = @{ info = "Information"; ask = "Question"; warning = "Warning"; default = "Question" }
$actionMap = @{ YesNo = "YesNo"; OK = "OK"; default = "OK" }
$icon = if ($iconMap.ContainsKey($icon.ToLower())) { $iconMap[$icon.ToLower()] } else { $iconMap.default }
$action = if ($actionMap.ContainsKey($action.ToLower())) { $actionMap[$action.ToLower()] } else { $actionMap.default }
$msg = if ([string]::IsNullOrWhiteSpace($key)) { $NoneKey } else { $itt.database.locales.Controls.$($itt.Language).$key }
[System.Windows.MessageBox]::Show($msg, $title, [System.Windows.MessageBoxButton]::$action, [System.Windows.MessageBoxImage]::$icon)
}
function Notify {
param(
[string]$title,
[string]$msg,
[string]$icon,
[Int32]$time
)
$notification = New-Object System.Windows.Forms.NotifyIcon
$notification.Icon = [System.Drawing.SystemIcons]::Information
$notification.BalloonTipIcon = $icon
$notification.BalloonTipText = $msg
$notification.BalloonTipTitle = $title
$notification.Visible = $true
$notification.ShowBalloonTip($time)
$notification.Dispose()
}
function Manage-Music {
param([string]$action, [int]$volume = 0)
switch ($action) {
"SetVolume" {
$itt.mediaPlayer.settings.volume = $volume
$global:toggleState = ($volume -ne 0)
Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value "$volume" -Force
$itt["window"].title = "Install Tweaks Tool " + @("🔊", "🔈")[$volume -eq 0]
}
"StopAll" {
$itt.mediaPlayer.controls.stop()
$itt.mediaPlayer = $null
$itt.runspace.Dispose()
$itt.runspace.Close()
$script:powershell.Dispose()
$script:powershell.Stop()
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
}
default { Write-Host "Invalid action. Use 'SetVolume' or 'StopAll'." }
}
}
function System-Default {
try {
$dc = $itt.database.locales.Controls.$shortCulture
if (-not $dc -or [string]::IsNullOrWhiteSpace($dc)) {
Set-Statusbar -Text "Your default system language is not supported yet, fallback to English"
$dc = $itt.database.locales.Controls.en
}
$itt["window"].DataContext = $dc
Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
}
catch {
Write-Host "An error occurred: $_"
}
}
function Set-Language {
param ([string]$lang)
if ($lang -eq "default") { System-Default }
else {
$itt.Language = $lang
$itt["window"].DataContext = $itt.database.locales.Controls.$($itt.Language)
Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value $lang -Force
}
}
function SwitchToSystem {
try {
$appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
$theme = if ($AppsTheme -eq "0") { "Dark" } elseif ($AppsTheme -eq "1") { "Light" } else { Write-Host "Unknown theme: $AppsTheme"; return }
$itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($theme))
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
$itt.Theme = $Theme
}
catch { Write-Host "Error: $_" }
}
function Set-Theme {
param ([string]$Theme)
try {
$itt['window'].Resources.MergedDictionaries.Clear()
$itt['window'].Resources.MergedDictionaries.Add($itt['window'].FindResource($Theme))
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value $Theme -Force
$itt.Theme = $Theme
}
catch { Write-Host "Error: $_" }
}
function Set-Statusbar {
param ([string]$Text)
$itt.Statusbar.Dispatcher.Invoke([Action]{$itt.Statusbar.Text = $Text })
}
function UpdateUI {
param([string]$Button,[string]$Content,[string]$Width = "140")
$itt['window'].Dispatcher.Invoke([Action]{
$itt.$Button.Width = $Width
$itt.$Button.Content = $itt.database.locales.Controls.$($itt.Language).$Content
})
}
$MainWindowXaml = '
<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window"
Title="Install Tweaks Tool"
WindowStartupLocation = "CenterScreen"
Background="{DynamicResource PrimaryBackgroundColor}"
Height="700" Width="1000"
MinHeight="600"
MinWidth="900"
Topmost="False"
ShowInTaskbar = "True"
TextOptions.TextFormattingMode="Ideal"
TextOptions.TextRenderingMode="Auto"
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/icon.ico">
<Window.Resources>
<Storyboard x:Key="FadeOutStoryboard">
<DoubleAnimation
Storyboard.TargetProperty="Opacity"
From="0" To="1" Duration="0:0:0.2" />
</Storyboard>
<Storyboard x:Key="Logo" RepeatBehavior="Forever">
<DoubleAnimation
Storyboard.TargetProperty="Opacity"
From="0.1" To="1.0"
Duration="0:0:01" />
<DoubleAnimation
Storyboard.TargetProperty="Opacity"
From="1.0" To="0.0"
Duration="0:0:1"
BeginTime="0:0:15" />
</Storyboard>
<Style TargetType="Button">
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
<Setter Property="BorderBrush" Value="Transparent"/>
<Setter Property="BorderThickness" Value="1"/>
<Setter Property="Padding" Value="10,5"/>
<Setter Property="FontSize" Value="16"/>
<Setter Property="Cursor" Value="Hand"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="Button">
<Grid>
<Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="0" CornerRadius="25">
<ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
</Border>
</Grid>
</ControlTemplate>
</Setter.Value>
</Setter>
<Style.Triggers>
<Trigger Property="IsMouseOver" Value="True">
<Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter Property="Foreground" Value="{DynamicResource HighlightColor}"/>
<Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
</Trigger>
<Trigger Property="IsPressed" Value="True">
<Setter Property="Background" Value="{DynamicResource PressedButtonColor}"/>
</Trigger>
</Style.Triggers>
</Style>
<Style TargetType="ListViewItem">
<Setter Property="Margin" Value="0 5 0 0"/>
<Setter Property="BorderThickness" Value="0.5"/>
<Setter Property="BorderBrush" Value="DarkGray"/>
<Setter Property="Padding" Value="0"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="ListViewItem">
<Border Name="bg"
CornerRadius="6"
Padding="{TemplateBinding Padding}"
BorderBrush="{TemplateBinding BorderBrush}"
BorderThickness="{TemplateBinding BorderThickness}"
Background="{TemplateBinding Background}">
<ContentPresenter HorizontalAlignment="Left"
VerticalAlignment="Center"
ContentSource="Content"/>
</Border>
</ControlTemplate>
</Setter.Value>
</Setter>
<Style.Triggers>
<Trigger Property="ItemsControl.AlternationIndex" Value="0">
<Setter Property="Background" Value="{DynamicResource itemColor1}" />
</Trigger>
<Trigger Property="ItemsControl.AlternationIndex" Value="1">
<Setter Property="Background" Value="{DynamicResource itemColor2}" />
</Trigger>
<EventTrigger RoutedEvent="FrameworkElement.Loaded">
<BeginStoryboard Storyboard="{StaticResource FadeOutStoryboard}" />
</EventTrigger>
</Style.Triggers>
</Style>
<Style TargetType="CheckBox">
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="Margin" Value="0"/>
<Setter Property="Padding" Value="6"/>
<Setter Property="Background" Value="{x:Null}"/>
<Setter Property="BorderThickness" Value="0"/>
<Setter Property="BorderBrush" Value="DarkGray"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="CheckBox">
<StackPanel Orientation="Horizontal">
<Border Name="CheckRadius" Width="20" Height="20" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="5" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
<Grid>
<TextBlock x:Name="CheckIcon" HorizontalAlignment="Center" VerticalAlignment="Center" FontSize="17" />
<Path x:Name="CheckMark" Width="Auto" Margin="4" Height="Auto" Stretch="Uniform" Stroke="White" StrokeThickness="2" Data="M 0 5 L 4 8 L 10 0" Visibility="Collapsed" HorizontalAlignment="Center" VerticalAlignment="Center"/>
</Grid>
</Border>
<ContentPresenter Margin="8 0 0 0" VerticalAlignment="Center"/>
</StackPanel>
<ControlTemplate.Triggers>
<Trigger Property="IsChecked" Value="True">
<Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
<Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
<Setter TargetName="CheckIcon" Property="Visibility" Value="Hidden"/>
</Trigger>
<Trigger Property="IsMouseOver" Value="True">
<Setter TargetName="CheckIcon" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
<Setter Property="Foreground" Value="{DynamicResource HighlightColor}"/>
<Setter Property="Cursor" Value="Hand"/>
</Trigger>
<DataTrigger Binding="{Binding SelectedItem.Header, ElementName=taps}" Value="📦">
<Setter TargetName="CheckIcon" Property="Text" Value="📦"/>
</DataTrigger>
<DataTrigger Binding="{Binding SelectedItem.Header, ElementName=taps}" Value="🛠">
<Setter TargetName="CheckIcon" Property="Text" Value="🛠"/>
</DataTrigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="SearchBox" TargetType="TextBox">
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
<Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
<Setter Property="BorderThickness" Value="0"/>
<Setter Property="Padding" Value="8"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="TextBox">
<Border Margin="0"
Background="{TemplateBinding Background}"
BorderBrush="{TemplateBinding BorderBrush}"
BorderThickness="{TemplateBinding BorderThickness}"
CornerRadius="15">
<ScrollViewer x:Name="PART_ContentHost"
Background="Transparent"/>
</Border>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="Label">
<Setter Property="Background" Value="Transparent"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="Padding" Value="7.5"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="Label">
<Border Padding="{TemplateBinding Padding}" Background="{TemplateBinding Background}"
BorderBrush="{TemplateBinding BorderBrush}"
BorderThickness="{TemplateBinding BorderThickness}"
CornerRadius="0">
<ContentPresenter HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}"
VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
</Border>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="TextBlock">
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="TextOptions.TextFormattingMode" Value="Ideal" />
<Setter Property="TextOptions.TextRenderingMode" Value="ClearType" />
</Style>
<Style TargetType="Menu">
<Setter Property="Background" Value="#FFFFFF"/>
<Setter Property="Foreground" Value="#000000"/>
<Setter Property="Margin" Value="5"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="Menu">
<Border Background="{TemplateBinding Background}"
BorderBrush="{TemplateBinding BorderBrush}"
BorderThickness="0"
CornerRadius="8">
<ItemsPresenter />
</Border>
</ControlTemplate>
</Setter.Value>
</Setter>
<Style.Triggers>
<EventTrigger RoutedEvent="FrameworkElement.Loaded">
</EventTrigger>
</Style.Triggers>
</Style>
<Style TargetType="MenuItem">
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="Margin" Value="1"/>
<Setter Property="Padding" Value="0"/>
<Setter Property="BorderBrush" Value="{DynamicResource BorderBrush}"/>
<Setter Property="BorderThickness" Value="1"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="MenuItem">
<Border x:Name="Border"
BorderBrush="{TemplateBinding BorderBrush}"
BorderThickness="{TemplateBinding BorderThickness}"
Padding="8"
CornerRadius="0">
<Grid>
<Grid.ColumnDefinitions>
<ColumnDefinition Width="Auto"/>
<ColumnDefinition Width="*"/>
<ColumnDefinition Width="Auto"/>
</Grid.ColumnDefinitions>
<ContentPresenter Grid.Column="0"
ContentSource="Icon"
HorizontalAlignment="Left"
VerticalAlignment="Center"
Margin="0,0,4,0"/>
<TextBlock x:Name="TextBlock"
Grid.Column="1"
Text="{TemplateBinding Header}"
Foreground="{TemplateBinding BorderThickness}"
VerticalAlignment="Center"
Margin="0"/>
<TextBlock x:Name="ShortcutText"
Grid.Column="2"
Text="{TemplateBinding InputGestureText}"
Foreground="{DynamicResource TextColorSecondaryColor}"
VerticalAlignment="Center"
HorizontalAlignment="Right"
Margin="5,0"/>
<Path x:Name="Arrow"
Grid.Column="2"
Data="M0,0 L4,4 L8,0 Z"
Fill="{DynamicResource TextColorSecondaryColor}"
HorizontalAlignment="Center"
VerticalAlignment="Center"
Visibility="Collapsed"
Margin="4,0,0,0"/>
<Popup Name="PART_Popup"
Placement="Right"
IsOpen="{Binding IsSubmenuOpen, RelativeSource={RelativeSource TemplatedParent}}"
AllowsTransparency="True"
Focusable="False"
PopupAnimation="Fade">
<Border Background="{TemplateBinding Background}"
BorderBrush="{DynamicResource BorderBrush}"
BorderThickness="2"
CornerRadius="0">
<StackPanel IsItemsHost="True"
KeyboardNavigation.DirectionalNavigation="Continue"/>
</Border>
</Popup>
</Grid>
</Border>
<ControlTemplate.Triggers>
<Trigger Property="IsMouseOver" Value="True">
<Setter TargetName="Border" Property="Background" Value="Transparent"/>
<Setter TargetName="TextBlock" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
<Setter TargetName="ShortcutText" Property="Foreground" Value="{DynamicResource HighlightColor}"/>
<Setter TargetName="Arrow" Property="Fill" Value="{DynamicResource HighlightColor}"/>
</Trigger>
<Trigger Property="HasItems" Value="True">
<Setter TargetName="Arrow" Property="Visibility" Value="Visible"/>
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type Thumb}">
<Grid x:Name="Grid">
<Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
<Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
</Grid>
<ControlTemplate.Triggers>
<Trigger Property="Tag" Value="Horizontal">
<Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
<Setter TargetName="Rectangle1" Property="Height" Value="7" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
<Setter Property="Stylus.IsFlicksEnabled" Value="false" />
<Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
<Setter Property="Width" Value="8" />
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type ScrollBar}">
<Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
<Grid.RowDefinitions>
<RowDefinition Height="0.00001*" />
</Grid.RowDefinitions>
<Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
<Track.Thumb>
<Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
</Track.Thumb>
<Track.IncreaseRepeatButton>
<RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
</Track.IncreaseRepeatButton>
<Track.DecreaseRepeatButton>
<RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
</Track.DecreaseRepeatButton>
</Track>
</Grid>
<ControlTemplate.Triggers>
<Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
<Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger SourceName="Thumb" Property="IsDragging" Value="true">
<Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger Property="IsEnabled" Value="false">
<Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
</Trigger>
<Trigger Property="Orientation" Value="Horizontal">
<Setter TargetName="GridRoot" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter TargetName="PART_Track" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter Property="Width" Value="Auto" />
<Setter Property="Height" Value="8" />
<Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
<Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
<Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="ScrollViewer">
<Setter Property="CanContentScroll" Value="False"/>
<Setter Property="IsDeferredScrollingEnabled" Value="False"/>
<Setter Property="VerticalScrollBarVisibility" Value="Auto"/>
<Setter Property="HorizontalScrollBarVisibility" Value="Hidden"/>
</Style>
<Style TargetType="TabItem">
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="TabItem">
<Border Name="Border"
CornerRadius="6"
BorderThickness="0"
Height="auto"
Width="auto"
Padding="8"
BorderBrush="Transparent"
Background="Transparent"
Margin="5">
<ContentPresenter
x:Name="ContentSite"
VerticalAlignment="Center"
HorizontalAlignment="Center"
ContentSource="Header"
/>
</Border>
<ControlTemplate.Triggers>
<Trigger Property="IsSelected" Value="True">
<Setter TargetName="Border" Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
<Setter Property="Foreground" Value="{DynamicResource HighlightColor}" />
</Trigger>
<Trigger Property="IsSelected" Value="False">
<Setter TargetName="Border" Property="Background" Value="Transparent" />
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="ComboBox">
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
<Setter Property="BorderBrush" Value="{DynamicResource SecondaryPrimaryBackgroundColor}"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="BorderThickness" Value="1"/>
<Setter Property="Padding" Value="6,3"/>
<Setter Property="HorizontalContentAlignment" Value="Left"/>
<Setter Property="VerticalContentAlignment" Value="Center"/>
<Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Disabled"/>
<Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="ComboBox">
<Grid>
<ToggleButton
Name="ToggleButton"
Grid.Column="2"
Focusable="false"
IsChecked="{Binding Path=IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}"
ClickMode="Press"
Background="Transparent"
BorderBrush="Transparent">
<ToggleButton.Template>
<ControlTemplate TargetType="ToggleButton">
<Border Name="Border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
<Grid>
<ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Path x:Name="Arrow" Data="M 0 0 L 4 4 L 8 0 Z" Fill="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Right" Margin="5" VerticalAlignment="Center"/>
</Grid>
</Border>
</ControlTemplate>
</ToggleButton.Template>
</ToggleButton>
<ContentPresenter
Name="ContentSite"
IsHitTestVisible="False"
Content="{TemplateBinding SelectionBoxItem}"
ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}"
ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}"
Margin="3,3,23,3"
VerticalAlignment="Center"
HorizontalAlignment="Left"/>
<TextBox
x:Name="PART_EditableTextBox"
Style="{x:Null}"
HorizontalAlignment="Left"
VerticalAlignment="Center"
Margin="3,3,23,3"
Focusable="True"
Background="Transparent"
Visibility="Hidden"
IsReadOnly="{TemplateBinding IsReadOnly}"/>
<Popup
Name="Popup"
Placement="Bottom"
IsOpen="{TemplateBinding IsDropDownOpen}"
AllowsTransparency="True"
Focusable="False"
PopupAnimation="Slide">
<Grid
Name="DropDown"
SnapsToDevicePixels="True"
MinWidth="{TemplateBinding ActualWidth}"
MaxHeight="{TemplateBinding MaxDropDownHeight}">
<Border
x:Name="DropDownBorder"
Background="{DynamicResource SecondaryPrimaryBackgroundColor}"
BorderBrush="Gray"
BorderThickness="1"/>
<ScrollViewer Margin="4,6,4,6" SnapsToDevicePixels="True">
<StackPanel IsItemsHost="True" KeyboardNavigation.DirectionalNavigation="Contained"/>
</ScrollViewer>
</Grid>
</Popup>
</Grid>
<ControlTemplate.Triggers>
<Trigger Property="HasItems" Value="false">
<Setter TargetName="DropDownBorder" Property="MinHeight" Value="95"/>
</Trigger>
<Trigger Property="IsEnabled" Value="false">
<Setter Property="Foreground" Value="Gray"/>
</Trigger>
<Trigger Property="IsGrouping" Value="true">
<Setter Property="ScrollViewer.CanContentScroll" Value="false"/>
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="ToggleSwitchStyle" TargetType="CheckBox">
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="CheckBox">
<Grid VerticalAlignment="Center">
<Grid.ColumnDefinitions>
<ColumnDefinition Width="Auto"/>
<ColumnDefinition Width="Auto"/>
<ColumnDefinition Width="Auto"/>
</Grid.ColumnDefinitions>
<TextBlock Grid.Column="0"
Text="{TemplateBinding Content}"
VerticalAlignment="Center"
Margin="0,0,10,0"/>
<Grid Grid.Column="1" Width="40" Height="20">
<Border x:Name="Track"
Background="{DynamicResource SecondaryPrimaryBackgroundColor}"
BorderThickness="1.2"
BorderBrush="{DynamicResource ToggleSwitchBorderBrush}"
CornerRadius="10"/>
<Ellipse x:Name="Thumb"
Width="10" Height="10"
Fill="Black"
HorizontalAlignment="Left"
VerticalAlignment="Center"
Margin="2,0,0,0"/>
</Grid>
<TextBlock Grid.Column="2"
VerticalAlignment="Center"
Margin="10,0,0,0">
<TextBlock.Style>
<Style TargetType="TextBlock">
<Setter Property="Text" Value="Off"/>
<Style.Triggers>
<DataTrigger Binding="{Binding RelativeSource={RelativeSource TemplatedParent}, Path=IsChecked}" Value="True">
<Setter Property="Text" Value="On"/>
</DataTrigger>
</Style.Triggers>
</Style>
</TextBlock.Style>
</TextBlock>
</Grid>
<ControlTemplate.Triggers>
<Trigger Property="IsChecked" Value="True">
<Trigger.EnterActions>
<RemoveStoryboard BeginStoryboardName="ToggleSwitchLeft"/>
<BeginStoryboard x:Name="ToggleSwitchRight">
<Storyboard>
<ThicknessAnimation Storyboard.TargetName="Thumb"
Storyboard.TargetProperty="Margin"
To="22,0,0,0"
Duration="0:0:0.1" />
</Storyboard>
</BeginStoryboard>
</Trigger.EnterActions>
<Setter TargetName="Thumb" Property="Fill" Value="{DynamicResource ToggleSwitchEnableColor}"/>
<Setter TargetName="Track" Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter TargetName="Track" Property="BorderBrush" Value="{x:Null}"/>
</Trigger>
<Trigger Property="IsChecked" Value="False">
<Trigger.EnterActions>
<RemoveStoryboard BeginStoryboardName="ToggleSwitchRight"/>
<BeginStoryboard x:Name="ToggleSwitchLeft">
<Storyboard>
<ThicknessAnimation Storyboard.TargetName="Thumb"
Storyboard.TargetProperty="Margin"
To="5,0,0,0"
Duration="0:0:0.1" />
</Storyboard>
</BeginStoryboard>
</Trigger.EnterActions>
<Setter TargetName="Thumb" Property="Fill" Value="{DynamicResource ToggleSwitchDisableColor}"/>
</Trigger>
<Trigger Property="IsMouseOver" Value="True">
<Setter TargetName="Track" Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter TargetName="Track" Property="Opacity" Value="0.2" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="TextBlock" x:Key="logoText">
<Setter Property="Foreground" Value="{DynamicResource logo}"/>
<Setter Property="TextOptions.TextFormattingMode" Value="Ideal" />
<Setter Property="FontFamily" Value="Arial"/>
<Setter Property="FontWeight" Value="bold"/>
<Setter Property="FontSize" Value="60"/>
<Setter Property="TextAlignment" Value="Center"/>
<Setter Property="TextOptions.TextRenderingMode" Value="ClearType" />
<Style.Triggers>
<EventTrigger RoutedEvent="FrameworkElement.Loaded">
<BeginStoryboard Storyboard="{StaticResource Logo}" />
</EventTrigger>
</Style.Triggers>
</Style>
<ResourceDictionary x:Key="Dark">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#22272e"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#2d333b"/>
<SolidColorBrush x:Key="TextColorPrimary" Color="#adbac7"/>
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="#cdd9e5"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#768390"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#539bf5"/>
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#539bf5"/>
<SolidColorBrush x:Key="ButtonBorderColor" Color="#539bf5"/>
<SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>
<SolidColorBrush x:Key="BorderBrush" Color="#444c56"/>
<SolidColorBrush x:Key="Label" Color="#373e47"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#373e47"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#22272e"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#768390"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#444c56"/>
<SolidColorBrush x:Key="itemColor1" Color="#2d333b"/>
<SolidColorBrush x:Key="itemColor2" Color="#333942"/>
<SolidColorBrush x:Key="logo" Color="#539bf5"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
<x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="DarkKnight">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#0a0a0a"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#121212"/>
<SolidColorBrush x:Key="TextColorPrimary" Color="#e6e6e6"/>
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="#cccccc"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#999999"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#00b7ff"/>
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#00b7ff"/>
<SolidColorBrush x:Key="ButtonBorderColor" Color="#ff0000"/>
<SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>
<SolidColorBrush x:Key="BorderBrush" Color="#1c1c1c"/>
<SolidColorBrush x:Key="Label" Color="#2a2a2a"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#1a1a1a"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#0f0f0f"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#666666"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#444444"/>
<SolidColorBrush x:Key="itemColor1" Color="#141414"/>
<SolidColorBrush x:Key="itemColor2" Color="#1c1c1c"/>
<SolidColorBrush x:Key="logo" Color="#00b7ff"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://images.hdqwalls.com/wallpapers/the-batman-fan-made-4k-xx.jpg" Stretch="UniformToFill" Opacity="0.4" />
<x:String x:Key="SubText">I am not a hero</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="Light">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#ffffff"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#f6f8fa"/>
<SolidColorBrush x:Key="TextColorPrimary" Color="#24292f"/>
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="#1f2328"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#57606a"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#0969da"/>
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#ffffff"/>
<SolidColorBrush x:Key="ButtonBorderColor" Color="#0969da"/>
<SolidColorBrush x:Key="HighlightColor" Color="#218bff"/>
<SolidColorBrush x:Key="BorderBrush" Color="#d0d7de"/>
<SolidColorBrush x:Key="Label" Color="#d8e0e7"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#d0d7de"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#f6f8fa"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#57606a"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#d0d7de"/>
<SolidColorBrush x:Key="itemColor1" Color="#f6f8fa"/>
<SolidColorBrush x:Key="itemColor2" Color="#ebf0f4"/>
<SolidColorBrush x:Key="logo" Color="#0969da"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
<x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="Palestine">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="black"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="black"/>
<SolidColorBrush x:Key="TextColorPrimary" Color="#F5F5F5"/>
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="#CCCCCC"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#888888"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#00D99D"/>
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="#FFFFFF"/>
<SolidColorBrush x:Key="ButtonBorderColor" Color="#007A3D"/>
<SolidColorBrush x:Key="HighlightColor" Color="#00D96D"/>
<SolidColorBrush x:Key="BorderBrush" Color="black"/>
<SolidColorBrush x:Key="Label" Color="#444444"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#202020"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#2b2b2b"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#555555"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#777777"/>
<SolidColorBrush x:Key="itemColor1" Color="#000000"/>
<SolidColorBrush x:Key="itemColor2" Color="#000002"/>
<SolidColorBrush x:Key="logo" Color="#00D96D"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://w.wallhaven.cc/full/we/wallhaven-wegrj6.jpg" Stretch="UniformToFill" Opacity="0.3"/>
<x:String x:Key="SubText">#StandWithPalestine</x:String>
</ResourceDictionary>
</Window.Resources>
<Grid Background="{DynamicResource BackgroundImage}">
<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="*"/>
<RowDefinition Height="Auto"/>
</Grid.RowDefinitions>
<Grid>
<Grid.ColumnDefinitions>
<ColumnDefinition Width="Auto"/>
<ColumnDefinition Width="*"/>
</Grid.ColumnDefinitions>
<Menu Grid.Row="0" Grid.Column="0" Background="Transparent" BorderBrush="Transparent" HorizontalAlignment="Left" BorderThickness="0">
<MenuItem Background="Transparent" BorderBrush="Transparent" BorderThickness="0"  IsEnabled="False" ToolTip="Emad Adel">
<MenuItem.Icon>
<Border Background="Transparent" CornerRadius="10" Height="89" Width="89">
<StackPanel Orientation="Vertical">
<TextBlock Text="itt" VerticalAlignment="Center"  TextAlignment="Center" HorizontalAlignment="Center" Style="{DynamicResource logoText}"/>
<TextBlock Text="{DynamicResource SubText}" FontFamily="Arial" TextAlignment="Center" HorizontalAlignment="Center" VerticalAlignment="Center" FontWeight="Normal" FontSize="9" Style="{DynamicResource logoText}" />
</StackPanel>
</Border>
</MenuItem.Icon>
</MenuItem>
<MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
<MenuItem.Header>
<Binding Path="Management" TargetNullValue="Management"/>
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
</MenuItem.Icon>
<MenuItem Name="sysinfo">
<MenuItem.Header>
<Binding Path="System_Info" TargetNullValue="System Info" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="poweroption">
<MenuItem.Header>
<Binding Path="Power_Options" TargetNullValue="Power Options" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="deviceManager">
<MenuItem.Header>
<Binding Path="Device_Manager" TargetNullValue="Device Manager" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="services">
<MenuItem.Header>
<Binding Path="Services" TargetNullValue="Services" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="network">
<MenuItem.Header>
<Binding Path="Networks" TargetNullValue="Networks" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="appsfeatures">
<MenuItem.Header>
<Binding Path="Apps_features" TargetNullValue="Programs and Features" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="taskmgr">
<MenuItem.Header>
<Binding Path="Task_Manager" TargetNullValue="Task Manager" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="diskmgmt">
<MenuItem.Header>
<Binding Path="Disk_Managment" TargetNullValue="Disk Management" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="msconfig">
<MenuItem.Header>
<Binding Path="Msconfig" TargetNullValue="System Configuration" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="ev">
<MenuItem.Header>
<Binding Path="Environment_Variables" TargetNullValue="Environment Variables" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text="&#xE81E;"/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="spp">
<MenuItem.Header>
<Binding Path="System_Protection" TargetNullValue="System Protection" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
</MenuItem>
<MenuItem VerticalAlignment="Center" HorizontalAlignment="Left" BorderBrush="Transparent">
<MenuItem.Header>
<Binding Path="Preferences" TargetNullValue="Preferences"/>
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
</MenuItem.Icon>
<MenuItem Name="restorepoint" InputGestureText="Shift+Q">
<MenuItem.Header>
<Binding Path="Create_restore_point" TargetNullValue="Restore Point" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Header="{Binding Portable_Downloads_Folder}">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
<MenuItem Name="chocoloc" Header="Choco" InputGestureText="Shift+C">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="itt" Header="ITT" InputGestureText="Shift+T">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
</MenuItem>
<MenuItem Name="save" InputGestureText="Shift+S" ToolTip="Save selected apps">
<MenuItem.Header>
<Binding Path="Save" TargetNullValue="Save" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="load" InputGestureText="Shift+D" ToolTip="Restore selected apps">
<MenuItem.Header>
<Binding Path="Restore" TargetNullValue="Restore" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Header="{Binding Theme}">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
<MenuItem Name="systheme">
<MenuItem.Header>
<Binding Path="Use_system_setting" TargetNullValue="System Setting" />
</MenuItem.Header>
</MenuItem>
<MenuItem Name="Dark" Header="Dark"/>
<MenuItem Name="DarkKnight" Header="Dark Knight"/>
<MenuItem Name="Light" Header="Light"/>
<MenuItem Name="Palestine" Header="Palestine"/>
</MenuItem>
<MenuItem Header="{Binding Music}">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
<MenuItem Name="moff">
<MenuItem.Header>
<Binding Path="off" TargetNullValue="Off" />
</MenuItem.Header>
<MenuItem.InputGestureText>
Shift+N
</MenuItem.InputGestureText>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="mon">
<MenuItem.Header>
<Binding Path="on" TargetNullValue="On" />
</MenuItem.Header>
<MenuItem.InputGestureText>
Shift+F
</MenuItem.InputGestureText>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
</MenuItem>
<MenuItem Header="{Binding Language}">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
<MenuItem Name="systemlang">
<MenuItem.Header>
<Binding Path="Use_system_setting" TargetNullValue="System Language" />
</MenuItem.Header>
</MenuItem>
<MenuItem Name="ar" Header="عربي"/>
<MenuItem Name="de" Header="Deutsch"/>
<MenuItem Name="en" Header="English"/>
<MenuItem Name="es" Header="Español"/>
<MenuItem Name="fr" Header="Français"/>
<MenuItem Name="ga" Header="Gaeilge"/>
<MenuItem Name="hi" Header="अंग्रेज़ी"/>
<MenuItem Name="it" Header="Italiano"/>
<MenuItem Name="ko" Header="한국어"/>
<MenuItem Name="ru" Header="Русский"/>
<MenuItem Name="tr" Header="Türkçe"/>
<MenuItem Name="zh" Header="中文"/>
</MenuItem>
<MenuItem Name="ittshortcut">
<MenuItem.Header>
<Binding Path="Create_desktop_shortcut" TargetNullValue="Create Shortcut" />
</MenuItem.Header>
<MenuItem.InputGestureText>
Shift+I
</MenuItem.InputGestureText>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
</MenuItem.Icon>
</MenuItem>
</MenuItem>
<MenuItem VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
<MenuItem.Header>
<Binding Path="Third_party" TargetNullValue="Third Party"/>
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
</MenuItem.Icon>
<MenuItem Name="mas" Header="Windows activation" ToolTip="Windows activation">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="winoffice" Header="Windows/Office ISO" ToolTip="Windows and Office Orginal ISO">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="idm" Header="IDM Trial Reset" ToolTip="Get rid of IDM Active message">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="shelltube" ToolTip="Download youtube video easily" Header="ShellTube">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="spotifydown" Header="Spotify Downloader" ToolTip="SpotifyDown allows you to download tracks, playlists and albums from Spotify instantly.">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Header="{Binding Browsers_extensions}">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
<MenuItem Name="uBlock" Header="uBlockOrigin"/>
<MenuItem Header="Youtube">
<MenuItem Name="Unhook" Header="Unhook Customize youtube"/>
<MenuItem Name="efy" Header="Enhancer for YouTube"/>
</MenuItem>
</MenuItem>
<MenuItem Name="sordum" ToolTip="Collection of free utilities designed to enhance or control various aspects of the Windows operating system" Header="Sordum tools">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="techpowerup" Header="TechPowerUp" ToolTip="Collection of free TechPowerUp utilities.">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="majorgeeks" ToolTip="website that provides trusted, safe, and curated software downloads for Windows users. It focuses on high-quality tools." Header="Major Geeks">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="webtor" ToolTip="Web-based platform that allows users to stream torrent files directly in their browser without needing to download them." Header="Webtor">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="fmhy" ToolTip="The largest collection of free stuff on the internet!" Header="fmhy">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="rapidos" ToolTip="RapidOS is a powerful modification for Windows 10 and 11 that significantly boosts performance." Header="RapidOS">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
<MenuItem Name="asustool" ToolTip="Tool that manages the setup installation for the legacy Aura Sync, LiveDash, AiSuite3" Header="ASUS Setup Tool">
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="16" Text=""/>
</MenuItem.Icon>
</MenuItem>
</MenuItem>
<MenuItem Name="dev" VerticalAlignment="Center" HorizontalAlignment="Center" BorderBrush="Transparent">
<MenuItem.Header>
<Binding Path="About" TargetNullValue="About"/>
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
</MenuItem.Icon>
</MenuItem>
</Menu>
<Grid Grid.Column="1" HorizontalAlignment="Right" Margin="0,0,20,0">
<Grid.ColumnDefinitions>
<ColumnDefinition Width="Auto"/>
<ColumnDefinition Width="Auto"/>
</Grid.ColumnDefinitions>
<ComboBox
SelectedIndex="0"
Name="AppsCategory"
Grid.Column="0"
VirtualizingStackPanel.IsVirtualizing="True"
VirtualizingStackPanel.VirtualizationMode="Recycling"
IsReadOnly="True"
VerticalAlignment="Center"
HorizontalAlignment="Center"
Width="auto">
<ComboBoxItem Content="{Binding all, TargetNullValue=All}"/>
<ComboBoxItem Content="GPU Drivers"/>
<ComboBoxItem Content="Web Browsers"/>
<ComboBoxItem Content="Media"/>
<ComboBoxItem Content="Media Tools"/>
<ComboBoxItem Content="Documents"/>
<ComboBoxItem Content="Compression"/>
<ComboBoxItem Content="Communication"/>
<ComboBoxItem Content="File Sharing"/>
<ComboBoxItem Content="Imaging"/>
<ComboBoxItem Content="Gaming"/>
<ComboBoxItem Content="Utilities"/>
<ComboBoxItem Content="Disk Tools"/>
<ComboBoxItem Content="Development"/>
<ComboBoxItem Content="Security"/>
<ComboBoxItem Content="Portable"/>
<ComboBoxItem Content="Runtimes"/>
<ComboBoxItem Content="Drivers"/>
</ComboBox>
<ComboBox
SelectedIndex="0"
Name="TwaeksCategory"
Grid.Column="0"
IsReadOnly="True"
VirtualizingStackPanel.IsVirtualizing="True"
VirtualizingStackPanel.VirtualizationMode="Recycling"
VerticalAlignment="Center"
HorizontalAlignment="Center"
Visibility="Collapsed"
Width="auto">
<ComboBoxItem Content="{Binding all, TargetNullValue=All}"/>
<ComboBoxItem Content="Privacy"/>
<ComboBoxItem Content="Fixer"/>
<ComboBoxItem Content="Performance"/>
<ComboBoxItem Content="Personalization"/>
<ComboBoxItem Content="Power"/>
<ComboBoxItem Content="Protection"/>
<ComboBoxItem Content="Classic"/>
</ComboBox>
<Grid HorizontalAlignment="Left" Grid.Column="1" VerticalAlignment="Center">
<TextBox Padding="8"
Width="120"
VerticalAlignment="Center"
HorizontalAlignment="Left"
Style="{StaticResource SearchBox}"
Name="searchInput" />
<Grid Name="search_placeholder">
<TextBlock
Name="SearchIcon"
Text=""
FontSize="15"
Foreground="Gray"
VerticalAlignment="Center"
FontFamily="Segoe MDL2 Assets"
HorizontalAlignment="Left"
IsHitTestVisible="False"
Margin="10,0,0,0" />
<TextBlock
Text="Ctrl+F"
Foreground="Gray"
VerticalAlignment="Center"
HorizontalAlignment="Left"
IsHitTestVisible="False"
Margin="30,0,0,0" />
</Grid>
</Grid>
</Grid>
</Grid>
<TabControl Name="taps" TabStripPlacement="Left" Grid.Row="1" BorderBrush="{x:Null}" Foreground="{x:Null}" Background="{x:Null}">
<TabItem Name="apps" Header="📦" ToolTip="{Binding apps, TargetNullValue=Apps}" FontSize="18" BorderBrush="{x:Null}" >
<ListView Name="appslist"
Grid.Row="1"
BorderBrush="{x:Null}"
Background="{x:Null}"
SelectionMode="Single"
SnapsToDevicePixels="True"
VirtualizingStackPanel.IsContainerVirtualizable="True"
VirtualizingStackPanel.IsVirtualizing="True"
VirtualizingStackPanel.VirtualizationMode="Recycling"
AlternationCount="2"
ScrollViewer.CanContentScroll="True">
<ListView.ItemsPanel>
<ItemsPanelTemplate>
<VirtualizingStackPanel />
</ItemsPanelTemplate>
</ListView.ItemsPanel>
<StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Brave" FontSize="15" Tag="brave | Brave.Brave | na | Web Browsers"   ToolTip="A privacy focused web browser that blocks ads and trackers"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mozilla Firefox" FontSize="15" Tag="firefox | Mozilla.Firefox | na | Web Browsers"   ToolTip="A widelyused opensource web browser known for its speed privacy"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thorium AVX" FontSize="15" Tag="thorium --params /AVX | Alex313031.Thorium.AVX2 | na | Web Browsers"   ToolTip="A web browser designed for smooth and secure browsing experiences"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Chrome" FontSize="15" Tag="googlechrome | Google.Chrome | na | Web Browsers"   ToolTip="A popular web browser known for its speed simplicity and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thorium SSE3" FontSize="15" Tag="thorium --params /SSE3 | Alex313031.Thorium | na | Web Browsers"   ToolTip="A web browser designed for smooth and secure browsing experiences"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mozilla Firefox ESR" FontSize="15" Tag="firefoxesr | Mozilla.Firefox.ESR | na | Web Browsers"   ToolTip="A widelyused opensource web browser known for its speed privacy"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Edge" FontSize="15" Tag="microsoft-edge | Microsoft.Edge | na | Web Browsers"   ToolTip="Microsofts web browser built for fast and secure internet surfing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Chromium" FontSize="15" Tag="chromium | eloston.ungoogled-chromium | na | Web Browsers"   ToolTip="An opensource web browser project that serves as the foundation"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Tor Browser" FontSize="15" Tag="tor-browser | TorProject.TorBrowser | na | Web Browsers"   ToolTip="A web browser that prioritizes user privacy by routing internet"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Opera" FontSize="15" Tag="opera | Opera.Opera | na | Web Browsers"   ToolTip="The Opera web browser makes the Web fast and fun"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Internet Download Manager" FontSize="15" Tag="internet-download-manager | Tonec.InternetDownloadManager | na | Web Browsers"   ToolTip="A popular download manager tool that accelerates downloads and allows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="JDownloader" FontSize="15" Tag="jdownloader | AppWork.JDownloader | na | Web Browsers"   ToolTip="JDownloader is an internet download manager"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KLite Mega Codec Full Pack" FontSize="15" Tag="k-litecodecpackfull | na | na | Media"   ToolTip="Comprehensive collection of audio and video codecs filters and tools"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PotPlayer" FontSize="15" Tag="potplayer | Daum.PotPlayer | na | Media"   ToolTip="A multimedia player with a sleek interface and advanced features"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VLC" FontSize="15" Tag="vlc.install | VideoLAN.VLC | na | Media"   ToolTip="A versatile media player capable of playing almost any multimedia"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kodi" FontSize="15" Tag="kodi | 9NBLGGH4T892 | na | Media"   ToolTip="A powerful opensource media center software that allows users to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Jellyfin Server" FontSize="15" Tag="jellyfin | Jellyfin.Server | na | Media"   ToolTip="An opensource media server software that enables users to stream"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winamp" FontSize="15" Tag="winamp | Winamp.Winamp | na | Media"   ToolTip="A classic media player known for its customizable interface and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aimp" FontSize="15" Tag="na | na | aimp | Media"   ToolTip="A lightweight and featurerich audio player with support for various"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Spotify" FontSize="15" Tag="spotify | Spotify.Spotify | na | Media"   ToolTip="Spotify is a new way to listen to music"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FastStone Image Viewer" FontSize="15" Tag="fsviewer | FastStone.Viewer | na | Imaging"   ToolTip="FastStone Image Viewer is a fast stable userfriendly image browser"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OpenOffice" FontSize="15" Tag="openoffice | Apache.OpenOffice | na | Documents"   ToolTip="An opensource office productivity suite offering word processing spreadsheet presentation"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FoxitReader" FontSize="15" Tag="foxitreader | Foxit.FoxitReader | na | Documents"   ToolTip="A lightweight and featurerich PDF reader with annotation form filling"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreOffice" FontSize="15" Tag="libreoffice-fresh | Foxit.FoxitReader | na | Documents"   ToolTip="A powerful opensource office suite providing word processing spreadsheet presentation"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SumatraPDF" FontSize="15" Tag="sumatrapdf.install | SumatraPDF.SumatraPDF | na | Documents"   ToolTip="A lightweight and fast PDF reader with minimalistic design and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinRAR" FontSize="15" Tag="winrar | RARLab.WinRAR | na | Compression"   ToolTip="A popular file compression and archiving utility that supports various"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Compression"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="7Zip" FontSize="15" Tag="7zip | 7zip.7zip | na | Compression"   ToolTip="An opensource file archiver with a high compression ratio supporting"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Compression"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PeaZip" FontSize="15" Tag="peazip | Giorgiotani.Peazip | na | Compression"   ToolTip=" PeaZip is a free crossplatform file archiver"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Compression"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Telegram Desktop" FontSize="15" Tag="telegram | Telegram.TelegramDesktop | na | Communication"   ToolTip="A crossplatform messaging app with a focus on speed and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Signal" FontSize="15" Tag="signal | OpenWhisperSystems.Signal | na | Communication"   ToolTip="Fast simple secure. Privacy that fits in your pocket"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Meta Messenger" FontSize="15" Tag="messenger | 9WZDNCRF0083 | na | Communication"   ToolTip="A messaging app that allows users to connect with friends"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zoom" FontSize="15" Tag="zoom | Zoom.ZoomRooms | na | Communication"   ToolTip="A video conferencing app that facilitates online meetings webinars and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Teams" FontSize="15" Tag="microsoft-teams.install | Microsoft.Teams | na | Communication"   ToolTip="A collaboration platform that combines workplace chat video meetings file"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Discord" FontSize="15" Tag="discord | Discord.Discord | na | Communication"   ToolTip="A VoIP application and digital distribution platform designed for creating"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeamViewer" FontSize="15" Tag="teamviewer | TeamViewer.TeamViewer | na | File Sharing"   ToolTip="A remote access and support software that enables users to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GIMP" FontSize="15" Tag="gimp | GIMP.GIMP | na | Imaging"   ToolTip="A free and opensource raster graphics editor used for image"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ Runtime - all versions" FontSize="15" Tag="vcredist-all | na | na | Runtimes"   ToolTip="Microsoft Visual C Redistributable installs runtime components of Visual C"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DirectX" FontSize="15" Tag="directx | Microsoft.DirectX | na | Runtimes"   ToolTip="DirectX is a collection of APIs for handling tasks related"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2005 (x86) Redistributable" FontSize="15" Tag="vcredist2005 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2005 (x64) Redistributable" FontSize="15" Tag="vcredist2005 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2008 (x86) Redistributable" FontSize="15" Tag="vcredist2008 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2008 (x64) Redistributable" FontSize="15" Tag="vcredist2008 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2010 (x86) Redistributable" FontSize="15" Tag="vcredist2010 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2010 (x64) Redistributable" FontSize="15" Tag="vcredist2010 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2012 (x86) Redistributable" FontSize="15" Tag="vcredist2012 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2012 (x64) Redistributable" FontSize="15" Tag="vcredist2012 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2013 (x86) Redistributable" FontSize="15" Tag="vcredist2013 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2013 (x64) Redistributable" FontSize="15" Tag="vcredist2013 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2015-2022 (x64) Redistributable" FontSize="15" Tag="vcredist2015 | na | na | Runtimes"   ToolTip="A set of runtime components required to run 64bit applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2015-2022  (x86) Redistributable" FontSize="15" Tag="vcredist2015 | na | na | Runtimes"   ToolTip="A set of runtime components required to run applications developed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Framework All Versions" FontSize="15" Tag="dotnet-all | na | na | Runtimes"   ToolTip="A comprehensive and consistent programming model for building applications that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AMD Ryzen Chipset Drivers" FontSize="15" Tag="amd-ryzen-chipset | na | na | Drivers"   ToolTip="Supports AMD Ryzen Threadripper PRO Processor AMD Ryzen 8000/7040/7000 Series"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVidia Display Driver" FontSize="15" Tag="nvidia-display-driver | na | na | Drivers"   ToolTip="The software component that allows the operating system and installed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVIDIA GeForce Experience" FontSize="15" Tag="geforce-experience | Nvidia.GeForceExperience | na | Drivers"   ToolTip="A cloudbased gaming service provided by NVIDIA that allows users"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Msi Afterburner" FontSize="15" Tag="msiafterburner | Guru3D.Afterburner | na | Drivers"   ToolTip="MSI Afterburner is the ultimate graphics card utility codeveloped by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVIDIA PhysX" FontSize="15" Tag="physx.legacy | Nvidia.PhysXLegacy | na | Drivers"   ToolTip="A physics processing unit PPU software development kit SDK offered"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Steam" FontSize="15" Tag="steam | Valve.Steam | na | Gaming"   ToolTip="A digital distribution platform developed by Valve Corporation for purchasing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ubisoft Connect" FontSize="15" Tag="ubisoft-connect | Ubisoft.Connect | na | Gaming"   ToolTip="A digital distribution digital rights management multiplayer and communications service"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Origin" FontSize="15" Tag="origin | ElectronicArts.Origin | na | Gaming"   ToolTip=" Game store launcher"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rockstar Games Launcher" FontSize="15" Tag="rockstar-launcher | na | na | Gaming"   ToolTip="Download and play the latest Rockstar Games PC titles"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GameSave Manager" FontSize="15" Tag="gamesavemanager | InsaneMatt.GameSaveManager | na | Gaming"   ToolTip="A utility tool that allows users to backup restore and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StreamlabsOBS" FontSize="15" Tag="streamlabs-obs | Streamlabs.StreamlabsOBS | na | Gaming"   ToolTip="A free and opensource streaming software built on top of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OBS Studio" FontSize="15" Tag="obs-studio.install | OBSProject.OBSStudio | na | Gaming"   ToolTip="A free and opensource software for video recording and live"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Logitech Gaming Software" FontSize="15" Tag="logitechgaming | Logitech.LGS | na | Gaming"   ToolTip="Logitech Gaming Software lets you customize Logitech G gaming mice"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lively Wallpaper" FontSize="15" Tag="lively | rocksdanister.LivelyWallpaper | na | Gaming"   ToolTip="A software that allows users to set animated and interactive"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Playnite" FontSize="15" Tag="playnite | Playnite.Playnite | na | Gaming"   ToolTip="Open source video game library manager and launcher with support"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Easy" FontSize="15" Tag="drivereasyfree | Easeware.DriverEasy | na | Drivers"   ToolTip="A driver update tool that automatically detects downloads and installs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Graphics Windows DCH" FontSize="15" Tag="intel-graphics-driver | na | na | Drivers"   ToolTip="Intel Graphics Driver for Windows 10"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Driver Support Assistant" FontSize="15" Tag="intel-dsa | Intel.IntelDriverAndSupportAssistant | na | Drivers"   ToolTip="Intel Driver  Support Assistant enables you to scan computing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Network Adapter" FontSize="15" Tag="intel-network-drivers-win10 | Intel.WiFiDrivers | na | Drivers"   ToolTip="Intel Network Adapter Drivers for Windows 10"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Snappy Driver Installer" FontSize="15" Tag="sdio | samlab-ws.SnappyDriverInstaller | na | Drivers"   ToolTip="A free and opensource tool for updating and installing device"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver booster" FontSize="15" Tag="driverbooster | IObit.DriverBooster | na | Drivers"   ToolTip="Scans and identifies outdated drivers automatically and downloads and installs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Genius" FontSize="15" Tag="drivergenius | na | na | Drivers"   ToolTip="Professional driver management tool and hardware diagnostics"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Display Driver Uninstaller" FontSize="15" Tag="ddu | Wagnardsoft.DisplayDriverUninstaller | na | Drivers"   ToolTip="Utility to completely remove system drivers"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Store Explorer" FontSize="15" Tag="rapr | na | na | Drivers"   ToolTip=" Windows driver store utility"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="1Password" FontSize="15" Tag="1password | AgileBits.1Password | na | Utilities"   ToolTip="A password manager that securely stores login credentials credit card"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AOMEI Partition Assistant Standard" FontSize="15" Tag="partition-assistant-standard | AOMEI.PartitionAssistant | na | Disk Tools"   ToolTip="AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AOMEI Backupper Standard" FontSize="15" Tag="backupper-standard | AOMEI.Backupper.Standard | na | Disk Tools"   ToolTip="A backup and recovery software that enables users to create"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Recuva recover" FontSize="15" Tag="recuva | Piriform.Recuva | na | Disk Tools"   ToolTip="A data recovery software that helps users retrieve accidentally deleted"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CCleaner" FontSize="15" Tag="ccleaner | SingularLabs.CCEnhancer | na | Utilities"   ToolTip="A system optimization privacy and cleaning tool that helps users"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="BCUninstaller" FontSize="15" Tag="bulk-crap-uninstaller | Klocman.BulkCrapUninstaller | na | Utilities"   ToolTip="A powerful uninstaller tool for Windows that allows users to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Easy Context Menu" FontSize="15" Tag="ecm | na | na | Utilities"   ToolTip="To install Easy Context Menu run the following command from"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HWiNFO" FontSize="15" Tag="hwinfo.install | REALiX.HWiNFO | na | Utilities"   ToolTip="A hardware information and diagnostic tool that provides detailed information"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Speccy" FontSize="15" Tag="speccy | Piriform.Speccy | na | Utilities"   ToolTip="A system information tool that provides detailed information about the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FurMark" FontSize="15" Tag="furmark | Geeks3D.FurMark | na | Utilities"   ToolTip="A graphics card stress testing and benchmarking utility that helps"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hard Disk Sentinel" FontSize="15" Tag="hdsentinel | JanosMathe.HardDiskSentinelPro | na | Disk Tools"   ToolTip="A hard disk monitoring and analysis software that helps users"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CPU-Z" FontSize="15" Tag="cpu-z | CPUID.CPU-Z | na | Utilities"   ToolTip="A system monitoring utility that provides detailed information about the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mem Reduct" FontSize="15" Tag="memreduct | Henry++.MemReduct | na | Utilities"   ToolTip="Lightweight realtime memory management application to monitor and clean system"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HandBrake" FontSize="15" Tag="handbrake.install | HandBrake.HandBrake | na | Utilities"   ToolTip="A free and opensource video transcoder tool that converts video"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rufus Portable" FontSize="15" Tag="rufus | Rufus.Rufus | na | Portable"   ToolTip="A utility tool for creating bootable USB drives from ISO"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ImgBurn" FontSize="15" Tag="imgburn | LIGHTNINGUK.ImgBurn | na | Development"   ToolTip="Lightweight CD / DVD burning application"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Virtual CloneDrive" FontSize="15" Tag="virtualclonedrive | na | na | Utilities"   ToolTip="A free software that allows users to mount disc images"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ultra ISO" FontSize="15" Tag="ultraiso | EZBSystems.UltraISO | na | Utilities"   ToolTip="A powerful ISO image management tool that enables users to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ventoy" FontSize="15" Tag="ventoy | Ventoy.Ventoy | na | Utilities"   ToolTip="An opensource tool for creating bootable USB drives with multiple"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iVentoy" FontSize="15" Tag="iventoy | na | na | Utilities"   ToolTip="With iVentoy you can boot and install OS on multiple"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AutoHotkey" FontSize="15" Tag="autohotkey | AutoHotkey.AutoHotkey | na | Utilities"   ToolTip="A scripting language for automating repetitive tasks and creating macros"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rainmeter" FontSize="15" Tag="rainmeter | Rainmeter.Rainmeter | na | Utilities"   ToolTip="A customizable desktop customization tool that displays customizable skins widgets"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FxSound" FontSize="15" Tag="fxsound | FxSoundLLC.FxSound | na | Utilities"   ToolTip="An audio enhancer software that improves the sound quality of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vysor" FontSize="15" Tag="vysor | Vysor.Vysor | na | Utilities"   ToolTip="A screen mirroring and remote control software that enables users"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unified Remote" FontSize="15" Tag="unifiedremote | UnifiedIntents.UnifiedRemote | na | Utilities"   ToolTip="A remote control app that turns smartphones into universal remote"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AnyDesk" FontSize="15" Tag="anydesk | AnyDeskSoftwareGmbH.AnyDesk | na | File Sharing"   ToolTip="A remote desktop software that allows users to access and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Airdroid" FontSize="15" Tag="airdroid | AirDroid.AirDroid | na | File Sharing"   ToolTip="AirDroid is a free and fast Android device manager app"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UltraViewer" FontSize="15" Tag="ultraviewer | DucFabulous.UltraViewer | na | File Sharing"   ToolTip="Remote control to support your clients / partners from everywhere"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wireless Network Watcher Portable" FontSize="15" Tag="wnetwatcher.portable | NirSoft.WirelessNetworkWatcher | na | Portable"   ToolTip="Wireless Network Watcher is a small utility that scans your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WifiInfoView" FontSize="15" Tag="wifiinfoview | NirSoft.WifiInfoView | na | Utilities"   ToolTip="Wireless Network Watcher is a small utility that scans your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WirelessNetView" FontSize="15" Tag="wirelessnetview | na | na | Utilities"   ToolTip="Wireless Network Watcher is a small utility that scans your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="qBittorrent" FontSize="15" Tag="qbittorrent | qBittorrent.qBittorrent | na | File Sharing"   ToolTip="A free and opensource BitTorrent client for downloading and uploading"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Earth Pro" FontSize="15" Tag="googleearthpro | Google.EarthPro | na | Imaging"   ToolTip="Google Earth Pro on desktop is free for users with"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="XAMPP" FontSize="15" Tag="xampp-81 | ApacheFriends.Xampp.8.2 | na | Development"   ToolTip="XAMPP is a free and opensource crossplatform web server solution"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Professional 2022" FontSize="15" Tag="visualstudio2022professional | Microsoft.VisualStudio.2022.Professional | na | Development"   ToolTip="Visual Studio Professional 2022 is an integrated development environment IDE"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Community 2022" FontSize="15" Tag="visualstudio2022community | Microsoft.VisualStudio.2022.Community | na | Development"   ToolTip="Visual Studio Community 2022 is a free fullyfeatured and extensible"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unity Hub" FontSize="15" Tag="unity-hub | Unity.UnityHub | na | Development"   ToolTip="Unity is a crossplatform game creation system developed by Unity"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Godot Engine" FontSize="15" Tag="godot | GodotEngine.GodotEngine | na | Development"   ToolTip="Godot is a featurepacked crossplatform game engine for creating 2D"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unity3D Engine" FontSize="15" Tag="unity | Unity.Unity.2020 | na | Development"   ToolTip="Unity is a crossplatform game creation system developed by Unity"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Blender" FontSize="15" Tag="blender | BlenderFoundation.Blender | na | Development"   ToolTip="Blender is a free and opensource professionalgrade 3D computer graphics"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VSCode" FontSize="15" Tag="vscode | Microsoft.VisualStudioCode | na | Development"   ToolTip="Visual Studio Code is a free sourcecode editor developed by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vim" FontSize="15" Tag="vim | vim.vim | na | Development"   ToolTip="Vim is an advanced text editor that seeks to provide"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sublime Text 4" FontSize="15" Tag="sublimetext4 | SublimeHQ.SublimeText.4 | na | Development"   ToolTip="Sublime Text 4  The sophisticated text editor for code"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Atom" FontSize="15" Tag="atom | GitHub.Atom | na | Development"   ToolTip="Atom is a text editor thats modern approachable yet hackable"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="InnoSetup" FontSize="15" Tag="innosetup | JRSoftware.InnoSetup | na | Development"   ToolTip="Inno Setup is a free installer for Windows programs. First"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PyCharm Community Edition" FontSize="15" Tag="pycharm-community | JetBrains.PyCharm.Community | na | Development"   ToolTip="PyCharm Community Edition is a free and opensource IDE for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PyCharm Professional Edition" FontSize="15" Tag="pycharm | JetBrains.PyCharm.Professional | na | Development"   ToolTip="PyCharm Professional Edition is a powerful IDE for professional Python"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Jetbrains Rider" FontSize="15" Tag="jetbrains-rider | JetBrains.Rider | na | Development"   ToolTip="Rider is a crossplatform .NET IDE developed by JetBrains. It"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NodeJs LTS" FontSize="15" Tag="nodejs-lts | OpenJS.NodeJS.LTS | na | Development"   ToolTip="Node.js is a JavaScript runtime built on Chromes V8 JavaScript"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Electron" FontSize="15" Tag="electron | na | na | Development"   ToolTip="Electron framework lets you write crossplatform desktop applications using JavaScript"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Electrum LTS" FontSize="15" Tag="electronim | Electrum.Electrum | na | Development"   ToolTip="Electrum is a lightweight Bitcoin wallet focused on speed and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hugo" FontSize="15" Tag="hugo | Hugo.Hugo | na | Development"   ToolTip="Hugo is one of the most popular opensource static site"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hugo Extended" FontSize="15" Tag="hugo-extended | Hugo.Hugo.Extended | na | Development"   ToolTip="Hugo is one of the most popular opensource static site"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Notepad++" FontSize="15" Tag="notepadplusplus | Notepad++.Notepad++ | na | Development"   ToolTip="Notepad is a free source code editor and Notepad replacement"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Terminal" FontSize="15" Tag="microsoft-windows-terminal | Microsoft.WindowsTerminal | na | Development"   ToolTip="Windows Terminal is a modern terminal application for users of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Powershell 7" FontSize="15" Tag="powershell-core | Microsoft.PowerShell | na | Development"   ToolTip="PowerShell Core is a crossplatform Windows Linux and macOS automation"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="x64dbg Portable" FontSize="15" Tag="x64dbg.portable | na | na | Portable"   ToolTip="An opensource x64/x32 debugger for windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="dnSpy" FontSize="15" Tag="dnspy | dnSpyEx.dnSpy | na | Development"   ToolTip="dnSpy is a tool to reverse engineer .NET assemblies. It"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cheat Engine" FontSize="15" Tag="cheatengine | na | na | Development"   ToolTip="Cheat Engine is an open source tool designed to help"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Python 3.12.6" FontSize="15" Tag="python | Python.Python.3.9 | na | Development"   ToolTip="Python is a popular highlevel programming language known for its"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Git" FontSize="15" Tag="git | Git.Git | na | Development"   ToolTip="Git is a free and opensource distributed version control system"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHub Desktop" FontSize="15" Tag="github-desktop | GitHub.GitHubDesktop | na | Development"   ToolTip="GitHub Desktop is a seamless way to contribute to projects"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Docker Desktop" FontSize="15" Tag="docker-desktop | Docker.DockerDesktop | na | Development"   ToolTip="Docker Desktop is an easytoinstall application for Windows and macOS"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Docker Compose" FontSize="15" Tag="docker-compose | Docker.DockerCompose | na | Development"   ToolTip="Docker Compose is a tool for defining and running multicontainer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PowerToys" FontSize="15" Tag="powertoys | Microsoft.PowerToys | na | Development"   ToolTip="PowerToys is a set of utilities for power users to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Notion" FontSize="15" Tag="notion | Notion.Notion | na | Development"   ToolTip="The allinone workspace for your notes tasks wikis and databases"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FL Studio" FontSize="15" Tag="ImageLine.FLStudio | ImageLine.FLStudio | na | Media Tools"   ToolTip="FL Studio is a digital audio workstation DAW developed by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Android Debug Bridge" FontSize="15" Tag="adb | na | na | Development"   ToolTip="Android Debug Bridge ADB is a commandline tool that allows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Universal ADB Drivers" FontSize="15" Tag="universal-adb-drivers | na | na | Development"   ToolTip="Universal ADB Drivers are drivers that provide compatibility with a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Scrcpy" FontSize="15" Tag="scrcpy | Genymobile.scrcpy | na | Development"   ToolTip="Scrcpy is a free and opensource tool that allows you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VirtualBox" FontSize="15" Tag="virtualbox | Oracle.VirtualBox | na | Development"   ToolTip="VirtualBox is a crossplatform virtualization application. It installs on existing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Oh My Posh" FontSize="15" Tag="oh-my-posh | JanDeDobbeleer.OhMyPosh | na | Development"   ToolTip=" Oh my Posh is a custom prompt engine for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Malwarebytes" FontSize="15" Tag="malwarebytes | Malwarebytes.Malwarebytes | na | Security"   ToolTip="Multiple layers of malwarecrushing tech including virus protection. Thorough malware"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Avast Free Antivirus" FontSize="15" Tag="avastfreeantivirus | XPDNZJFNCR1B07 | na | Security"   ToolTip="Avast Free Antivirus"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Nerd Fonts - CascadiaCode" FontSize="15" Tag="nerd-fonts-cascadiacode | na | na | Development"   ToolTip="Nerd Fonts is a project that patches developer targeted fonts"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Java SE Runtime Environment 8.0.411" FontSize="15" Tag="jre8 | na | na | Runtimes"   ToolTip="Java allows you to play online games chat with people"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Audacity" FontSize="15" Tag="audacity | Audacity.Audacity | na | Media Tools"   ToolTip="Audacity is free open source crossplatform software for recording and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MusicBee" FontSize="15" Tag="musicbee | MusicBee.MusicBee | na | Media"   ToolTip="MusicBee makes it easy to organize find and play music"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Format Factory" FontSize="15" Tag="formatfactory | na | na | Media Tools"   ToolTip="multifunctional media processing tools"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winaero Tweaker" FontSize="15" Tag="winaero-tweaker | na | na | Utilities"   ToolTip="Customize the appearance and behavior of the Windows operating system"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Subsystem for Linux WSL2" FontSize="15" Tag="wsl2 | Microsoft.WSL | na | Development"   ToolTip="To install Windows Subsystem for Linux 2 run the following"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wamp Server 3.3.5" FontSize="15" Tag="wamp-server | na | na | Development"   ToolTip="WampServer is a Windows web development environment. It allows you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB" FontSize="15" Tag="mongodb | MongoDB.Server | na | Development"   ToolTip="MongoDB stores data using a flexible document data model that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MPC-BE" FontSize="15" Tag="mpc-be |  MPC-BE.MPC-BE | na | Media"   ToolTip="Media Player Classic  BE is a free and open"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kdenlive" FontSize="15" Tag="kdenlive | KDE.Kdenlive | na | Media Tools"   ToolTip="A powerful nonlinear video editor"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TablePlus" FontSize="15" Tag="tableplus | TablePlus.TablePlus | na | Development"   ToolTip="Modern native and friendly GUI tool for relational databases MySQL"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hosts File Editor" FontSize="15" Tag="hosts.editor | scottlerch.hosts-file-editor | na | Utilities"   ToolTip="Hosts File Editor makes it easy to change your hosts"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Subtitle Edit" FontSize="15" Tag="subtitleedit | 9NWH51GWJTKN | na | Development"   ToolTip="With SE you can easily adjust a subtitle if it"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Skype" FontSize="15" Tag="skype | Microsoft.Skype | na | Communication"   ToolTip="Skype  Install Skype add your friends as contacts then"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FileZilla" FontSize="15" Tag="filezilla | na | na | Development"   ToolTip="FileZilla Client is a fast and reliable crossplatform FTP FTPS"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Everything" FontSize="15" Tag="everything | voidtools.Everything | na | Utilities"   ToolTip="Everything Search Engine  locate files and folders by name"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Yarn" FontSize="15" Tag="yarn | Yarn.Yarn | na | Development"   ToolTip="Yarn is a package manager for the npm and bower"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VMware Workstation Player" FontSize="15" Tag="vmware-workstation-player | na | na | Development"   ToolTip="VMware Workstation Player is a streamlined desktop virtualization application that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HDD Low Level Format Tool" FontSize="15" Tag="llftool | na | na | Utilities"   ToolTip="Will erase LowLevel Format and recertify a SATA IDE or"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="BlueStacks" FontSize="15" Tag="bluestacks | BlueStack.BlueStacks | na | Gaming"   ToolTip="Play Android Games on PC"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Wireless Bluetooth for Windows 10 and Windows 11" FontSize="15" Tag="intel-bluetooth-drivers | na | na | Drivers"   ToolTip="Bluetooth for Windows 10 and Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Office 365 Business" FontSize="15" Tag="office365business | Microsoft.Office | na | Documents"   ToolTip="Microsoft 365 formerly Office 365 is a line of subscription"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Bandicam" FontSize="15" Tag="na | BandicamCompany.Bandicam | na | Imaging"   ToolTip="Bandicam is a closedsource screen capture and screen recording software"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="QQPlayer" FontSize="15" Tag="na | Tencent.QQPlayer | na | Media"   ToolTip="QQPlayer media player"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="4K Video Downloader" FontSize="15" Tag="4k-video-downloader | OpenMedia.4KVideoDownloader | na | Utilities"   ToolTip="4K Video Downloader allows downloading videos playlists channels and subtitles"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Active@ Partition Recovery" FontSize="15" Tag="na | LSoftTechnologies.ActivePartitionRecovery | na | Disk Tools"   ToolTip="Active Partition Recovery is a freeware toolkit that helps to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HiSuite" FontSize="15" Tag="na | Huawei.HiSuite | na | Utilities"   ToolTip="HUAWEI HiSuite is the official Android Smart Device Manager toolHiSuite"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Android Studio" FontSize="15" Tag="androidstudio | Google.AndroidStudio | na | Development"   ToolTip="Android Studio is the official integrated development environment for Googles"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreWolf" FontSize="15" Tag="librewolf | LibreWolf.LibreWolf | na | Web Browsers"   ToolTip="LibreWolf is designed to increase protection against tracking and fingerprinting"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flow Launcher" FontSize="15" Tag="flow-launcher | Flow-Launcher.Flow-Launcher | na | Utilities"   ToolTip="Dedicated to making your workflow flow more seamless. Search everything"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="IconsExtract" FontSize="15" Tag="iconsext | na | na | Utilities"   ToolTip="The IconsExtract utility scans the files and folders on your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AdGuard Home" FontSize="15" Tag="adguardhome | AdGuard.AdGuardHome | na | Security"   ToolTip="AdGuard Home is a networkwide software for blocking ads and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Burp Suite Community Edition" FontSize="15" Tag="burp-suite-free-edition | PortSwigger.BurpSuite.Community | na | Development"   ToolTip="Burp Suite is an integrated platform for performing security testing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CoreTemp" FontSize="15" Tag="coretemp | ALCPU.CoreTemp | na | Utilities"   ToolTip="Core Temp is a compact no fuss small footprint yet"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ShareX" FontSize="15" Tag="sharex | ShareX.ShareX | na | File Sharing"   ToolTip="Screen capture file sharing and productivity tool"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ONLY OFFICE" FontSize="15" Tag="onlyoffice | ONLYOFFICE.DesktopEditors | na | Documents"   ToolTip="ONLYOFFICE is a project developed by experienced IT experts from"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ESET Internet Security" FontSize="15" Tag="eset-internet-security | ESET.EndpointSecurity | na | Security"   ToolTip="Ideal for modern users concerned about their privacy who actively"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinDirStat" FontSize="15" Tag="windirstat | WinDirStat.WinDirStat | na | Disk Tools"   ToolTip="WinDirStat is a disk usage statistics viewer and cleanup tool"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winmerge" FontSize="15" Tag="winmerge | WinMerge.WinMerge | na | Utilities"   ToolTip="WinMerge is an Open Source differencing and merging tool for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wireshark" FontSize="15" Tag="wireshark | WiresharkFoundation.Wireshark | na | Utilities"   ToolTip="Wireshark is the worlds foremost and widelyused network protocol analyzer."/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeraCopy" FontSize="15" Tag="teracopy | CodeSector.TeraCopy | na | Utilities"   ToolTip="TeraCopy is designed to copy and move files at the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="QuickLook" FontSize="15" Tag="quicklook | QL-Win.QuickLook | na | Utilities"   ToolTip="Quick Look is among the few features I missed from"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RepoZ" FontSize="15" Tag="repoz | AndreasWascher.RepoZ | na | Development"   ToolTip="RepoZ provides a quick overview of the git repositories on"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Graphics Command Center" FontSize="15" Tag="na | 9PLFNLNT3G5G | na | Drivers"   ToolTip="Dont have time to mess around with settings The Intel"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Go Programming Language" FontSize="15" Tag="golang | Language GoLang.Go | na | Development"   ToolTip="Go is expressive concise clean and efficient Its concurrency mechanisms"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rust" FontSize="15" Tag="rust | Rustlang.Rust.GNU | na | Development"   ToolTip="Rust is a curlybrace blockstructured expression language It visually resembles"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Inkscape" FontSize="15" Tag="inkscape | Inkscape.Inkscape | na | Imaging"   ToolTip="Inkscape is an opensource vector graphics editor similar to Adobe"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Youtube Dl" FontSize="15" Tag="yt-dlp | youtube-dl.youtube-dl | na | Utilities"   ToolTip="youtubedl is a small commandline program to download videos from"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Postman" FontSize="15" Tag="postman | Postman.Postman | na | Development"   ToolTip="Postman helps you be more efficient while working with APIs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Azure CLI" FontSize="15" Tag="azure-cli | Microsoft.AzureCLI | na | Development"   ToolTip="The Azure CLI is available across Azure services and is"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GameMaker Studio" FontSize="15" Tag="na | YoYoGames.GameMaker.Studio.2 | na | Development"   ToolTip="GameMaker Studio has everything you need for games development no"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Charles" FontSize="15" Tag="charles | XK72.Charles | na | Development"   ToolTip="Charles is an HTTP proxy HTTP monitor Reverse Proxy that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Media Player" FontSize="15" Tag="na | 9WZDNCRFJ3PT | na | Media"   ToolTip="Media Player is designed to make listening to and watching"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="espanso" FontSize="15" Tag="espanso | Espanso.Espanso | na | Development"   ToolTip="A crossplatform Text Expander written in Rust"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ability Office" FontSize="15" Tag="abilityoffice | Ability.AbilityOffice.8.Standard | na | Documents"   ToolTip="Ability Office Standard offers 3 core applications essential for home"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winbox" FontSize="15" Tag="na | Mikrotik.Winbox | na | Utilities"   ToolTip="Small utility that allows administration of MikroTik RouterOS using a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SearchMyFiles" FontSize="15" Tag="searchmyfiles | NirSoft.SearchMyFiles | na | Utilities"   ToolTip="SearchMyFiles allows you to make a very accurate search that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iTunes" FontSize="15" Tag="itunes | Apple.iTunes | na | Media"   ToolTip="iTunes is the best way to organize and enjoy the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StartIsBack++" FontSize="15" Tag="startisback | StartIsBack.StartIsBack | na | Utilities"   ToolTip="StartIsBack returns Windows 10 and Windows 8 a real fully"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Advanced SystemCare Free" FontSize="15" Tag="afedteated | XPFFGSS4Z9M2TX | na | Utilities"   ToolTip="Over time your computer may accumulate with large quantities of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Send Anywhere" FontSize="15" Tag="na | Estmob.SendAnywhere | na | File Sharing"   ToolTip="Send Anywhere is a multiplatform file sharing service where users"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="YUMI Legacy" FontSize="15" Tag="yumi | YumiUsb.Legacy | na | Utilities"   ToolTip="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="YUMI UEFI" FontSize="15" Tag="yumi-uefi | YumiUsb.UEFI | na | Utilities"   ToolTip="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OP Auto Clicker" FontSize="15" Tag="autoclicker | OPAutoClicker.OPAutoClicker | na | Utilities"   ToolTip="A fullfledged autoclicker with two modes of autoclicking at your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Spotube" FontSize="15" Tag="spotube | KRTirtho.Spotube | na | Media"   ToolTip="Spotube is a Flutter based lightweight spotify client It utilizes"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Audio Switcher" FontSize="15" Tag="audioswitcher | FortyOneLtd.AudioSwitcher | na | Media"   ToolTip="Easily switch the default audio device input or output on"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Teams Classic Desktop" FontSize="15" Tag="microsoft-teams.install | na | na | Communication"   ToolTip="Microsoft Teams is a messaging app for teams where all"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Windows SDK" FontSize="15" Tag="windows-sdk-10.1 | na | na | Runtimes"   ToolTip="The Windows 10 SDK for Windows 10 version 1809 provides"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RunAsDate Portable" FontSize="15" Tag="runasdate | na | na | Portable"   ToolTip="RunAsDate is a small utility that allows you to run"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio 2017 Build " FontSize="15" Tag="visualstudio2017buildtools | na | na | Development"   ToolTip="These Build Tools allow you to build native and managed"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MSEdgeRedirect" FontSize="15" Tag="msedgeredirect | rcmaehl.MSEdgeRedirect | na | Utilities"   ToolTip="This tool filters and passes the command line arguments of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 5" FontSize="15" Tag="dotnet-5.0-desktopruntime | Microsoft.DotNet.HostingBundle.5 | na | Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 3" FontSize="15" Tag="Microsoft.DotNet.HostingBundle.3_1 | dotnetcore-3.0-desktopruntime | na | Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 6" FontSize="15" Tag="dotnet-6.0-desktopruntime | Microsoft.DotNet.HostingBundle.6 | na | Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 7" FontSize="15" Tag="dotnet-7.0-desktopruntime | Microsoft.DotNet.AspNetCore.7 | na | Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 8" FontSize="15" Tag="dotnet-desktopruntime | Microsoft.DotNet.DesktopRuntime.8 | na | Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Viber" FontSize="15" Tag="viber | XPFM5P5KDWF0JP | na | Communication"   ToolTip="Viber is a mobile application that lets you make free"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StartAllBack" FontSize="15" Tag="startallback | StartIsBack.StartAllBack | na | Utilities"   ToolTip="Introducing StartAllBack Windows 11 from a better timeline Embrace enhance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DiskGenius Free" FontSize="15" Tag="diskgenius | Eassos.DiskGenius | na | Disk Tools"   ToolTip="With powerful capabilities and userfriendly interface DiskGenius Free Edition provides"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UNFORMAT" FontSize="15" Tag="na | LSoftTechnologies.UNFORMAT | na | Disk Tools"   ToolTip="UNFORMAT is a software utility created to solve almost all"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Active@ UNDELETE" FontSize="15" Tag="na | LSoftTechnologies.ActiveUNDELETE | na | Disk Tools"   ToolTip="Active UNDELETE helps you to recover deleted files and restore"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HxD Hex Editor" FontSize="15" Tag="hxd | MHNexus.HxD | na | Disk Tools"   ToolTip="HxD is a carefully designed and fast hex editor which"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Disk Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Epic Games Launcher" FontSize="15" Tag="epicgameslauncher | EpicGames.EpicGamesLauncher | na | Gaming"   ToolTip="The Epic Games Launcher is how you obtain the Unreal"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vivaldi" FontSize="15" Tag="vivaldi | VivaldiTechnologies.Vivaldi | na | Web Browsers"   ToolTip="The new Vivaldi browser protects you from trackers blocks unwanted"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft PC Manager" FontSize="15" Tag="na | 9PM860492SZD | na | Utilities"   ToolTip="Microsoft PC manager a good way to protect your personal"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Openshot" FontSize="15" Tag="openshot | OpenShot.OpenShot | na | Media Tools"   ToolTip="OpenShot Video Editor is an awardwinning opensource video editor available"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WhatsApp" FontSize="15" Tag="na | 9NKSQGP7F2NH | na | Communication"   ToolTip="WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Paint.NET" FontSize="15" Tag="paint.net | dotPDNLLC.paintdotnet | na | Imaging"   ToolTip="PaintNET is image and photo editing software for PCs that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Stretchly" FontSize="15" Tag="stretchly | Stretchly.Stretchly | na | Utilities"   ToolTip="stretchly is a crossplatform electron app that reminds you to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Silverlight" FontSize="15" Tag="silverlight | na | na | Runtimes"   ToolTip="Silverlight is a powerful development tool for creating engaging interactive"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TreeSize" FontSize="15" Tag="treesizefree | JAMSoftware.TreeSize.Free | na | Utilities"   ToolTip="Every hard disk is too small if you just wait"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dot Net 3.5" FontSize="15" Tag="dotnet3.5 | Microsoft.DotNet.DesktopRuntime.3_1 | na | Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flash Player ActiveX" FontSize="15" Tag="flashplayeractivex | na | na | Runtimes"   ToolTip="The Adobe Flash Player is freeware software for viewing multimedia"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Drive" FontSize="15" Tag="googledrive | na | na | File Sharing"   ToolTip="Google Drive All your files everywhere Safely store your files"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dot Net 4.5.2" FontSize="15" Tag="dotnet4.5.2 | na | na | Runtimes"   ToolTip="The Microsoft NET Framework 452 is a highly compatible inplace"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dropbox" FontSize="15" Tag="dropbox | Dropbox.Dropbox | na | File Sharing"   ToolTip="Organize all your teams content tune out distractions and get"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="cURL" FontSize="15" Tag="curl | cURL.cURL | na | Development"   ToolTip="Command line tool and library for transferring data with URLs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PDF Creator" FontSize="15" Tag="pdfcreator | pdfforge.PDFCreator | na | Documents"   ToolTip="PDFCreator lets you convert any printable document to PDF"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Autoruns" FontSize="15" Tag="autoruns | Microsoft.Sysinternals.Autoruns | na | Utilities"   ToolTip="This utility shows you what programs are configured to run"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft OneDrive" FontSize="15" Tag="onedrive | Microsoft.OneDrive | na | File Sharing"   ToolTip="Save your files and photos to OneDrive and access them"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Process Explorer" FontSize="15" Tag="procexp | Microsoft.Sysinternals.ProcessExplorer | na | Utilities"   ToolTip="Process Explorer shows you information about which handles and DLLs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FFmpeg" FontSize="15" Tag="ffmpeg | Gyan.FFmpeg | na | Media Tools"   ToolTip="FFmpeg is a widelyused crossplatform multimedia framework which can process"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OpenVPN Connect" FontSize="15" Tag="openvpn-connect | OpenVPNTechnologies.OpenVPNConnect | na | Utilities"   ToolTip="The official OpenVPN Connect client software developed and maintained by"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Git Large File Storage" FontSize="15" Tag="git-lfs | na | na | Development"   ToolTip="Git Large File Storage LFS replaces large files such as"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Nmap" FontSize="15" Tag="nmap | Insecure.Nmap | na | Utilities"   ToolTip="Nmap Network Mapper is a free and open source utility"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UltraVNC" FontSize="15" Tag="ultravnc | uvncbvba.UltraVnc | na | File Sharing"   ToolTip="UltraVNC is an open source application that uses the VNC"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Plex" FontSize="15" Tag="plex | Plex.Plex | na | Media Tools"   ToolTip="Plex is a global streaming media service and a clientserver"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Plex Media Server" FontSize="15" Tag="plexmediaserver | Plex.PlexMediaServer | na | Media Tools"   ToolTip="Plex Media Server helps you organise your media and stream"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visio Viewer" FontSize="15" Tag="visioviewer | Microsoft.VisioViewer | na | Documents"   ToolTip="Visio 2016 Viewer Visio users can freely distribute Visio drawings"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Keyn Stroke" FontSize="15" Tag="key-n-stroke | na | na | Utilities"   ToolTip="KeynStroke makes it easy for your audience to follow your"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fing" FontSize="15" Tag="fing | na | na | Utilities"   ToolTip="Fing App is a free network scanner that makes you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ryujinx" FontSize="15" Tag="ryujinx --params | na | na | Gaming"   ToolTip="Ryujinx is an opensource Nintendo Switch emulator created by gdkchan"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Omnify Hotspot" FontSize="15" Tag="omnifyhotspot | na | na | File Sharing"   ToolTip="The best virtual router to turn your PC into a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MKVToolNix" FontSize="15" Tag="mkvtoolnix | MoritzBunkus.MKVToolNix | na | Media Tools"   ToolTip="MKVToolNix is a set of tools to create alter and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Neat Download Manager" FontSize="15" Tag="na | na | neat | Web Browsers"   ToolTip="Neat Download Manager is a free Internet Download Manager for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="x630ce for all games" FontSize="15" Tag="na | na | x360ce | Gaming"   ToolTip="Xbox 360 Controller Emulator allows your controller gamepad joystick steering"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft .NET SDK 7" FontSize="15" Tag="dotnet-7.0-sdk | Microsoft.DotNet.SDK.7 | na | Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft .NET SDK 8" FontSize="15" Tag="dotnet-sdk | Microsoft.DotNet.SDK.Preview | na | Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft ASP.NET Core Runtime 7.0" FontSize="15" Tag="dotnet-aspnetruntime | Microsoft.DotNet.AspNetCore.7 | na | Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HFS HTTP File Server" FontSize="15" Tag="hfs | na | na | File Sharing"   ToolTip="You can use HFS HTTP File Server to send and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cemu" FontSize="15" Tag="cemu | Cemu.Cemu | na | Gaming"   ToolTip="Cemu is a highly experimental software to emulate Wii U"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Chatterino" FontSize="15" Tag="chatterino | ChatterinoTeam.Chatterino | na | Communication"   ToolTip="Chatterino is a chat client for Twitch chat that offers"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clementine" FontSize="15" Tag="clementine | Clementine.Clementine | na | Media Tools"   ToolTip="Clementine is a modern music player and library organizer supporting"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clink" FontSize="15" Tag="clink | chrisant996.Clink | na | Development"   ToolTip="Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CMake" FontSize="15" Tag="cmake | Kitware.CMake | na | Development"   ToolTip="CMake is an opensource crossplatform family of tools designed to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CopyQ Clipboard Manager" FontSize="15" Tag="copyq | hluk.CopyQ | na | Utilities"   ToolTip="CopyQ is a clipboard manager with advanced features allowing you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Crystal Disk Info" FontSize="15" Tag="crystaldiskinfo | CrystalDewWorld.CrystalDiskInfo | na | Utilities"   ToolTip="Crystal Disk Info is a disk health monitoring tool that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Crystal Disk Mark" FontSize="15" Tag="crystaldiskmark | CrystalDewWorld.CrystalDiskMark | na | Utilities"   ToolTip="Crystal Disk Mark is a disk benchmarking tool that measures"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Darktable" FontSize="15" Tag="darktable | darktable.darktable | na | Media Tools"   ToolTip="Opensource photo editing tool offering an intuitive interface advanced editing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EA App" FontSize="15" Tag="ea-app | ElectronicArts.EADesktop | na | Gaming"   ToolTip="EA App is a platform for accessing and playing Electronic"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Falkon" FontSize="15" Tag="falkon | KDE.Falkon | na | Web Browsers"   ToolTip="Falkon is a lightweight and fast web browser with a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="File Converter" FontSize="15" Tag="file-converter | AdrienAllard.FileConverter | na | Utilities"   ToolTip="File Converter is a very simple tool which allows you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Files" FontSize="15" Tag="files | na | na | Utilities"   ToolTip="Alternative file explorer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flameshot" FontSize="15" Tag="flameshot | Flameshot.Flameshot | na | Media Tools"   ToolTip="Flameshot is a powerful yet simple to use screenshot software"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lightshot" FontSize="15" Tag="lightshot | Skillbrains.Lightshot | na | Media Tools"   ToolTip="Ligthshot is an Easytouse lightweight screenshot software tool where you"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="F.lux" FontSize="15" Tag="flux | flux.flux | na | Utilities"   ToolTip="flux adjusts the color temperature of your screen to reduce"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHub CLI" FontSize="15" Tag="gh | GitHub.cli | na | Development"   ToolTip="GitHub CLI is a commandline tool that simplifies working with"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GOG Galaxy" FontSize="15" Tag="goggalaxy | GOG.Galaxy | na | Gaming"   ToolTip="GOG Galaxy is a gaming client that offers DRMfree games"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Greenshot" FontSize="15" Tag="greenshot | Greenshot.Greenshot | na | Media Tools"   ToolTip="Greenshot is a lightweight screenshot software tool with builtin image"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hexchat" FontSize="15" Tag="hexchat | HexChat.HexChat | na | Communication"   ToolTip="HexChat is a free opensource IRC Internet Relay Chat client"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HWMonitor" FontSize="15" Tag="hwmonitor | CPUID.HWMonitor | na | Utilities"   ToolTip="HWMonitor is a hardware monitoring program that reads PC systems"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ImageGlass" FontSize="15" Tag="imageglass | DuongDieuPhap.ImageGlass | na | Media Tools"   ToolTip="ImageGlass is a versatile image viewer with support for various"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Itch.io" FontSize="15" Tag="itch | ItchIo.Itch | na | Gaming"   ToolTip="Itchio is a digital distribution platform for indie games and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KDE Connect" FontSize="15" Tag="kdeconnect-kde | KDE.KDEConnect | na | File Sharing"   ToolTip="KDE Connect allows seamless integration between your KDE desktop and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KeePassXC" FontSize="15" Tag="keepassxc | KeePassXCTeam.KeePassXC | na | Utilities"   ToolTip="KeePassXC is a crossplatform opensource password manager with strong encryption"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lazygit" FontSize="15" Tag="lazygit | JesseDuffield.lazygit | na | Development"   ToolTip="Simple terminal UI for git commands"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LocalSend" FontSize="15" Tag="localsend.install | LocalSend.LocalSend | na | Utilities"   ToolTip="An open source crossplatform alternative to AirDrop"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fork" FontSize="15" Tag="git-fork | Fork.Fork | na | Development"   ToolTip="Fork a fast and friendly git client"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PulsarEdit" FontSize="15" Tag="pulsar | Pulsar-Edit.Pulsar | na | Development"   ToolTip="A Communityled HyperHackable Text Editor"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Shotcut" FontSize="15" Tag="Shotcut | Meltytech.Shotcut | na | Media Tools"   ToolTip="Shotcut is a free open source crossplatform video editor"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PaleMoon" FontSize="15" Tag="paleMoon | MoonchildProductions.PaleMoon | na | Web Browsers"   ToolTip="Pale Moon is an Open Source Goannabased web browser available"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="JoyToKey" FontSize="15" Tag="joytokey | JTKsoftware.JoyToKey | na | Gaming"   ToolTip="enables PC game controllers to emulate the keyboard and mouse"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Auto Dark Mode" FontSize="15" Tag="auto-dark-mode | Armin2208.WindowsAutoNightMode | na | Utilities"   ToolTip="Automatically switches between the dark and light theme of Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Firewall Control" FontSize="15" Tag="windowsfirewallcontrol | BiniSoft.WindowsFirewallControl | na | Utilities"   ToolTip="Windows Firewall Control is a powerful tool which extends the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TightVNC" FontSize="15" Tag="TightVNC | GlavSoft.TightVNC | na | Utilities"   ToolTip="TightVNC is a free and Open Source remote desktop software"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Python Version Manager" FontSize="15" Tag="pyenv-win | na | na | Development"   ToolTip="pyenv for Windows is a simple python version management tool"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Pixi" FontSize="15" Tag="pixi | prefix-dev.pixi | na | Development"   ToolTip="Pixi is a fast software package manager built on top"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VSCodium" FontSize="15" Tag="vscodium | VSCodium.VSCodium | na | Development"   ToolTip="VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thonny Python IDE" FontSize="15" Tag="thonny | AivarAnnamaa.Thonny | na | Development"   ToolTip="Python IDE for beginners"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Poedit" FontSize="15" Tag="na | na | na | Development"   ToolTip="Poedit translations editor The best way to translate apps and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Adobe Acrobat Reader" FontSize="15" Tag="adobereader | Adobe.Acrobat.Reader.32-bit | na | Documents"   ToolTip="Adobe Acrobat Reader DC software is the free trusted global"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flash Player Plugin" FontSize="15" Tag="flashplayerplugin | na | na | Documents"   ToolTip="The Adobe Flash Player is freeware software for viewing multimedia"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sysinternals" FontSize="15" Tag="sysinternals | na | na | Documents"   ToolTip="The Sysinternals Troubleshooting Utilities have been rolled up into a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SelfishNet" FontSize="15" Tag="na | na | selfishnet | Utilities"   ToolTip="Control your internet bandwidth with SelfishNet V3 ARP Spoofing application."/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NTLite" FontSize="15" Tag="ntlite-free | Nlitesoft.NTLite | na | Drivers"   ToolTip="Integrate updates drivers automate Windows and application setup speedup Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Olive Video Editor" FontSize="15" Tag="olive | OliveTeam.OliveVideoEditor | na | Media Tools"   ToolTip="Olive is a free nonlinear video editor for Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mark Text" FontSize="15" Tag="marktext.portable | MarkText.MarkText | na | Portable"   ToolTip="A simple and elegant opensource markdown editor that focused on"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="pCloud Drive" FontSize="15" Tag="pcloud | pCloudAG.pCloudDrive | na | File Sharing"   ToolTip="pCloud is a file hosting service also called cloud storage"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hurl" FontSize="15" Tag="hurl | Orange-OpenSource.Hurl | na | Utilities"   ToolTip="Hurl is a command line tool that runs HTTP requests"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="File Hash Generator" FontSize="15" Tag="file-hash-generator | BinaryMark.FileHashGenerator | na | Utilities"   ToolTip="Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Multimark down" FontSize="15" Tag="multimarkdown | na | na | Utilities"   ToolTip="MultiMarkdown or MMD is a tool to help turn minimally"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PCSX2 Emulator" FontSize="15" Tag="pcsx2.portable | na | na | Portable"   ToolTip="PCSX2 is a free and opensource PlayStation 2 PS2 emulator"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RetroArch" FontSize="15" Tag="retroarch | Libretro.RetroArch | na | Gaming"   ToolTip="RetroArch is a frontend for emulators game engines and media"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Free Virtual Keyboard" FontSize="15" Tag="free-virtual-keyboard | na | na | Utilities"   ToolTip="Free Virtual Keyboard works on any Windows based UMPC with"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TypeScript for Visual Studio 2017 and 2019" FontSize="15" Tag="typescript-vs2017-vs2019 | na | na | Development"   ToolTip="This is a standalone power tool release of TypeScript for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Caret" FontSize="15" Tag="caret | Caret.Caret | na | Development"   ToolTip="Beautiful Clever Markdown Editor Download trial"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iSpy" FontSize="15" Tag="ispy | na | na | Imaging"   ToolTip="iSpy is the worlds most popular open source video surveillance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WavPack" FontSize="15" Tag="wavpack | na | na | Utilities"   ToolTip="WavPack is a completely open audio compression format providing lossless"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ProcessThreadsView" FontSize="15" Tag="processthreadsview | na | na | Utilities"   ToolTip="ProcessThreadsView is a small utility that displays extensive information about"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zulu" FontSize="15" Tag="zulu12 | Azul.Zulu.11.JRE | na | Development"   ToolTip="Zulu is a certified build of OpenJDK that is fully"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHubReleaseNotesv1" FontSize="15" Tag="githubreleasenotes | StefHeyenrath.GitHubReleaseNotes | na | Development"   ToolTip="Generate Release Notes in MarkDown format from a GitHub project"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Tome" FontSize="15" Tag="tome-editor | na | na | Development"   ToolTip="Developing games is all about data With game systems for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Win32 OpenSSH" FontSize="15" Tag="openssh | Microsoft.OpenSSH.Beta | na | Utilities"   ToolTip="OpenSSH is a complete implementation of the SSH protocol version"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Komodo Edit" FontSize="15" Tag="komodo-edit | ActiveState.KomodoEdit | na | Development"   ToolTip="Komodo Edit is a free and open source text editor"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FreeCAD" FontSize="15" Tag="freecad | FreeCAD.FreeCAD | na | Imaging"   ToolTip="A free and opensource multiplatform 3D parametric modeler"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SQLite" FontSize="15" Tag="sqlite | SQLite.SQLite | na | Development"   ToolTip="SQLite is an inprocess library that implements a selfcontained serverless"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MkDocs" FontSize="15" Tag="mkdocs | na | na | Development"   ToolTip="MkDocs is a fast simple and downright gorgeous static site"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MkDocs Material Theme" FontSize="15" Tag="mkdocs-material | na | na | Development"   ToolTip="MkDocs is a fast simple and downright gorgeous static site"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PuTTY" FontSize="15" Tag="putty | PuTTY.PuTTY | na | Utilities"   ToolTip="A free implementation of SSH and Telnet along with an"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinSCP" FontSize="15" Tag="winscp | WinSCP.WinSCP | na | Utilities"   ToolTip="WinSCP is an open source free SFTP client FTP client"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreOffice Still" FontSize="15" Tag="libreoffice-still | na | na | Documents"   ToolTip="LibreOffice is the free powerpacked Open Source personal productivity suite"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aio Runtimes" FontSize="15" Tag="na | na | aio-runtimes | Runtimes"   ToolTip="All in One Runtimes also known as AIO Runtimes is"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual-C-Runtimes All in One Oct 2024" FontSize="15" Tag="na | na | vsall | Runtimes"   ToolTip="This archive contains the latest version Oct 2024 of all"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GPU-Z" FontSize="15" Tag="gpu-z | TechPowerUp.GPU-Z | na | Utilities"   ToolTip="GPUZ is a lightweight system utility designed to provide vital"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MemTest86" FontSize="15" Tag="na | na | memtest86 | Utilities"   ToolTip="MemTest86 boots from a USB flash drive and tests the"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Memtest86 Plus" FontSize="15" Tag="na | na | memtest86plus | Utilities"   ToolTip="Memtest86 Plus v6 is a unified free opensource memory testing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VLC Skins" FontSize="15" Tag="vlc-skins | na | na | Media Tools"   ToolTip="Put the downloaded VLT files in the following folder On"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GrepWin" FontSize="15" Tag="grepwin | StefansTools.grepWin | na | Utilities"   ToolTip="Regular expression search and replace for Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NICE DCV Server" FontSize="15" Tag="nice-dcv-server | na | na | Utilities"   ToolTip="NICE DCV is a remote display protocol that securely streams"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NTag" FontSize="15" Tag="ntag | nrittsti.NTag | na | Media Tools"   ToolTip="NTag is a cross platformgraphical tag editor focused on everyday"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Volume2" FontSize="15" Tag="volume2 | irzyxa.Volume2Portable | na | Media Tools"   ToolTip="Advanced Windows volume control"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="qBittorrent Enhanced Edition" FontSize="15" Tag="qbittorrent-enhanced | wingetinstallc0re100.qBittorrent-Enhanced-Edition | na | File Sharing"   ToolTip="Unofficial qBittorrent Enhanced based on qBittorrent"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aspia" FontSize="15" Tag="na | na | Aspia | File Sharing"   ToolTip="Remote desktop and file transfer tool"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SimpleTransfer Desktop" FontSize="15" Tag="simpletransfer | Rambax.SimpleTransfer | na | File Sharing"   ToolTip="Simple Transfer is the easiest way of transferring your Photos"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Twitch Desktop App" FontSize="15" Tag="twitch | na | na | Gaming"   ToolTip="Servers  A virtual home for your community to chat"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remote Desktop Manager" FontSize="15" Tag="rdm | Devolutions.RemoteDesktopManager | na | File Sharing"   ToolTip="Remote Connections  Passwords. Everywhere"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Torrid" FontSize="15" Tag="torrid | na | na | Utilities"   ToolTip="Torrid is a multiserver multiclient multitracker Remote Torrent Client which"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mediamonkey" FontSize="15" Tag="mediamonkey | VentisMedia.MediaMonkey | na | Media"   ToolTip="Manage small to large collections of audio files videos and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MediaInfo" FontSize="15" Tag="mediainfo | MediaArea.MediaInfo.GUI | na | Media Tools"   ToolTip="Convenient unified display of the most relevent technical and tag"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Universal Media Server" FontSize="15" Tag="ums | UniversalMediaServer.UniversalMediaServer | na | Media"   ToolTip="Universal Media Server is a DLNAcompliant UPnP Media Server. It"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="K-Lite Codec Pack Standard" FontSize="15" Tag="k-litecodecpack-standard | CodecGuide.K-LiteCodecPack.Standard | na | Media"   ToolTip="The KLite Codec Pack is a collection of DirectShow filters"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PowerISO" FontSize="15" Tag="poweriso | PowerSoftware.PowerISO | na | Compression"   ToolTip="PowerISO provides an allinone solution. You can do every thing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Compression"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Screen To Gif" FontSize="15" Tag="screentogif.portable | NickeManarin.ScreenToGif | na | Utilities"   ToolTip="This tool allows you to record a selected area of"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Figma" FontSize="15" Tag="figma | Figma.Figma | na | Development"   ToolTip="The collaborative interface design tool Build better products as a"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EarTrumpet" FontSize="15" Tag="eartrumpet | File-New-Project.EarTrumpet | na | Utilities"   ToolTip="EarTrumpet is a powerful volume control app for Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Code Insiders" FontSize="15" Tag="vscode-insiders | Microsoft.VisualStudioCode.Insiders | na | Development"   ToolTip="Microsoft Visual Studio Code is a code editor redefined and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AyuGramDesktop" FontSize="15" Tag="na | na | ayugramdesktop | Communication"   ToolTip=" Desktop Telegram client with good customization and Ghost mode"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zettlr" FontSize="15" Tag="zettlr | Zettlr.Zettlr | na | Documents"   ToolTip="Zettlr is a supercharged markdown editor that combines many writing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RustDesk" FontSize="15" Tag="rustdesk | RustDesk.RustDesk | na | File Sharing"   ToolTip="An opensource remote desktop software works out of the box"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 File Sharing"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ente Auth" FontSize="15" Tag="ente-auth | na | na | Security"   ToolTip="An endtoend encrypted cross platform and free app for storing"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SQLiteStudio" FontSize="15" Tag="sqlitestudio | sqlitestudio.pl.SQLiteStudio | na | Development"   ToolTip="SQLiteStudio is desktop application for browsing and editing SQLite database"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DuckStation" FontSize="15" Tag="na | na | duckstation | Portable"   ToolTip=" Fast PlayStation 1 emulator for x8664/AArch32/AArch64/RV64"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Authme - Simple 2FA" FontSize="15" Tag="authme.portable | na | na | Security"   ToolTip="Simple 2FA desktop application"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SuperCopier2" FontSize="15" Tag="na | na | supercopier2 | Utilities"   ToolTip="SuperCopier2 SuperCopier replaces Windows explorer file copy and adds many"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Octopus Deploy" FontSize="15" Tag="octopusdeploy.tentacle | OctopusDeploy.Tentacle | na | Development"   ToolTip="Octopus Deploy is a Continuous Delivery platform for complex deployments"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kindle Previewer" FontSize="15" Tag="kindlepreviewer | na | na | Documents"   ToolTip="Kindle Previewer is a graphical user interface tool that emulates"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Interior Design 3D" FontSize="15" Tag="na | AMSSoftware.InteriorDesign3D-e | na | Imaging"   ToolTip="Interior Design 3D is an expert program for home design"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MeshLab" FontSize="15" Tag="meshlab | CNRISTI.MeshLab | na | Imaging"   ToolTip="MeshLab is an open source portable and extensible system for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Imaging"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitKraken" FontSize="15" Tag="gitkraken | Axosoft.GitKraken | na | Development"   ToolTip="Legendary Git GUI client for Windows Mac  Linux"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Slack" FontSize="15" Tag="slack | SlackTechnologies.Slack | na | Communication"   ToolTip="Slack is a collaboration hub for work no matter what"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rocket Chat" FontSize="15" Tag="rocketchat | RocketChat.RocketChat | na | Communication"   ToolTip="Rocket.Chat is the leading open source team chat software solution."/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeamSpeak" FontSize="15" Tag="teamspeak | TeamSpeakSystems.TeamSpeakClient | na | Communication"   ToolTip="Use crystal clear sound to communicate with your team mates"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Communication"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FFFTP" FontSize="15" Tag="ffftp | Sayuri.FFFTP | na | Development"   ToolTip="FFFTP is lightweight FTP client software. FFFTP has many useful"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SmartFTP" FontSize="15" Tag="smartftp | SmartSoft.SmartFTP | na | Development"   ToolTip="SmartFTP is a fast and reliable FTP FTPS SFTP HTTP"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rclone" FontSize="15" Tag="rclone | Rclone.Rclone | na | Development"   ToolTip="Rclone rsync for cloud storage is a commandline program to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cyberduck" FontSize="15" Tag="cyberduck | Iterate.Cyberduck | na | Development"   ToolTip="Cyberduck is a libre server and cloud storage browser for"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dolphin" FontSize="15" Tag="dolphin | DolphinEmulator.Dolphin | na | Gaming"   ToolTip="Dolphin is an emulator for two recent Nintendo video game"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="mGBA" FontSize="15" Tag="mgba | JeffreyPfau.mGBA | na | Gaming"   ToolTip="mGBA is an opensource Game Boy Advance emulator"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EmulationStation" FontSize="15" Tag="emulationstation | Emulationstation.Emulationstation | na | Gaming"   ToolTip="A graphical and themeable emulator frontend that allows you to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ScummVM" FontSize="15" Tag="scummvm | ScummVM.ScummVM | na | Gaming"   ToolTip="ScummVM is a program which allows you to run certain"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Project64" FontSize="15" Tag="project64 | Project64.Project64 | na | Gaming"   ToolTip="Project64 is a free and opensource emulator for the Nintendo"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DOSBox" FontSize="15" Tag="na | DOSBox.DOSBox | na | Gaming"   ToolTip="DOSBox is an emulator program which emulates an IBM PC"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Gaming"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kodu Game Lab" FontSize="15" Tag="na | InfiniteInstant.KoduGameLab | na | Development"   ToolTip="Kodu Game Lab is a 3D game development environment that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GDevelop" FontSize="15" Tag="gdevelop | GDevelop.GDevelop | na | Development"   ToolTip="A free and open source nocode game engine designed to"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Tools" FontSize="15" Tag="mongodb-database-tools | MongoDB.DatabaseTools | na | Development"   ToolTip="The MongoDB Database Tools are a collection of commandline utilities"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DB Browser for SQLite" FontSize="15" Tag="sqlitebrowser | DBBrowserForSQLite.DBBrowserForSQLite | na | Development"   ToolTip="DB Browser for SQLite DB4S is a high quality visual"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MySQL" FontSize="15" Tag="mysql | Oracle.MySQL | na | Development"   ToolTip="The MySQL software delivers a very fast multithreaded multiuser and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Compass" FontSize="15" Tag="mongodb-compass | MongoDB.Compass.Full | na | Development"   ToolTip="Compass is a free interactive tool for querying optimizing and"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Compass readonly" FontSize="15" Tag="mongodb-compass-readonly | MongoDB.Compass.Readonly | na | Development"   ToolTip="Compass is a free interactive tool for analyzing your MongoDB"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Development"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="IDA free" FontSize="15" Tag="ida-free | na | na | Utilities"   ToolTip="DA is a Windows Linux or Mac OS X hosted"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Binary Ninja" FontSize="15" Tag="na | na | binaryninja | Utilities"   ToolTip="reverse engineering tool. It supports a number of great features"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Utilities"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Resource Hacker" FontSize="15" Tag="na | na | resourcehacker | Portable"   ToolTip="freeware resource compiler  decompiler for Windows applications"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Portable"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ Redistributable for Visual Studio 2015-2022" FontSize="15" Tag="vcredist140 | Microsoft.VCRedist.2015+.x86 | na | Runtimes"   ToolTip="Runtime components that are required to run C applications that"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Runtimes"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MPV" FontSize="15" Tag="mpvio | na | na | Media"   ToolTip="a free open source and crossplatform media player"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ZenBrowser" FontSize="15" Tag="na | Zen-Team.Zen-Browser | na | Web Browsers"   ToolTip="The modern privacyfocused performancedriven browser built on Firefox"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Web Browsers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aegisub" FontSize="15" Tag="aegisub | Aegisub.Aegisub | na | Media Tools"   ToolTip="Aegisub is a free crossplatform open source tool for creating"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Media Tools"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AppGroup" FontSize="15" Tag="na | na | iandiv-appgroup | Documents"   ToolTip="App Group lets you organize customize and launch your apps"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Quran Companion" FontSize="15" Tag="na | na | yf-qc | Documents"   ToolTip="Free and opensource desktop Quran reader and player"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Documents"/>
</StackPanel>
</StackPanel>
</ListView>
</TabItem>
<TabItem x:Name="tweeksTab" Header="🛠" ToolTip="{Binding tweaks, TargetNullValue=Tweaks}"  FontSize="18" BorderBrush="{x:Null}" Background="{x:Null}">
<ListView Name="tweakslist"
BorderBrush="{x:Null}"
Background="{x:Null}"
SelectionMode="Single"
SnapsToDevicePixels="True"
VirtualizingStackPanel.IsVirtualizing="True"
VirtualizingStackPanel.IsContainerVirtualizable="True"
VirtualizingStackPanel.VirtualizationMode="Recycling"
AlternationCount="2"
ScrollViewer.CanContentScroll="True">
<ListView.ItemsPanel>
<ItemsPanelTemplate>
<VirtualizingStackPanel />
</ItemsPanelTemplate>
</ListView.ItemsPanel>
<StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disk cleanup" FontSize="15" Tag=" |  |  | Storage"   ToolTip="Clean temporary files that are not necessary"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Storage"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="System File Checker" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="sfc /scannow Use the System File Checker tool to repair missing or corrupted system files"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore Classic Context Menu Windows 11" FontSize="15" Tag=" |  |  | Classic"   ToolTip="Restore the old context menu for Windows 11"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Classic"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore All Windows Services to Default" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="if you face issues with services try Restore All Windows Services to Default"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Super Privacy Disable all Privacy Settings" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Disable WifiSense  Activity History  ActivityFeed All Telemetry  DataCollection  disable various telemetry and annoyances in Edge"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clean Taskbar" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disable icons"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Microsoft Apps" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Uninstalls preinstalled Microsoft apps like Clipchamp People etc"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Xbox Apps" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Uninstalls preinstalled Xbox apps"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fix Stutter in games" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Fix Stutter in Games Disable GameBarPresenceWriter. Windows 10/11"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable the Ultimate Performance Power Plan" FontSize="15" Tag=" |  |  | Power"   ToolTip="This will add the Ultimate Performance power plan to enable it go to the power options"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Power"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Reset the TCP/IP Stack" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="If you have an internet issue reset the network configuration"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Setup Auto login" FontSize="15" Tag=" |  |  | Other"   ToolTip="Setup auto login Windows username"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Other"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Xbox Services" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disables all Xbox Services Game Mode"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Start Menu Ads" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Start menu Ads and web search"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Turn off background Apps" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Turn off background apps"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable suggestions on Start Menu" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Suggestions on start menu"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Folder Shortcuts From File Explorer" FontSize="15" Tag=" |  |  | Other"   ToolTip="Documents Videos Pictures Desktop. Shortcuts from File Explorer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Other"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimize Windows Services" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Print Spooler Fax Diagnostic Policy Downloaded Maps Manager Windows Error Reporting Service Remote Registry  Internet Connection Sharing Disables Telemetry and Data"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Hibernate" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Allows the system to save the current state of your computer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable OneDrive" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disabling OneDrive"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove OneDrive" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Removes OneDrive from the system"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Activate Windows Classic Photo Viewer" FontSize="15" Tag=" |  |  | Classic"   ToolTip="Classic Photo Viewer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Classic"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Copilot in Windows 11" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="AI assistance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Recall Snapshots in Windows 11 24H" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Recall is an upcoming preview experience exclusive to Copilot"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Delete Thumbnail Cache" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Removing the stored image thumbnails"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Classic Volume Control" FontSize="15" Tag=" |  |  | Classic"   ToolTip="The old volume control"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Classic"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Toggle Key Sounds" FontSize="15" Tag=" |  |  | Classic"   ToolTip="Toggle key sounds are audio cues that play when you press the Caps Lock Num Lock or Scroll Lock keys"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Classic"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Homegroup" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Home and Gallery from explorer in Windows 11" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Home and Gallery from explorer and sets This PC as default"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Wifi Sense" FontSize="15" Tag=" |  |  | Protection"   ToolTip="Service that phones home all nearby scanned wifi networks and your location"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Autoplay and Autorun" FontSize="15" Tag=" |  |  | Protection"   ToolTip="Autoplay in prevents the automatic launch of media or applications when a removable device such as a USB drive or CD"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable SMB Server" FontSize="15" Tag=" |  |  | Protection"   ToolTip="SMB Server enables file and printer sharing over a network allowing access to resources on remote computers"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Set current network profile to public" FontSize="15" Tag=" |  |  | "   ToolTip="Deny file sharing device discovery"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 "/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable F8 boot menu options" FontSize="15" Tag=" |  |  | BIOS"   ToolTip="Enable F8 boot menu options"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 BIOS"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable display and sleep mode timeouts" FontSize="15" Tag=" |  |  | Power"   ToolTip="If you frequently use your device disable this"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Power"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Set Wallpaper desktop Quality to 100%" FontSize="15" Tag=" |  |  | Personalization"   ToolTip="Set Wallpaper desktop Quality"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Personalization"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Windows Transparency" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disableing improve performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable scheduled defragmentation task" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Optimizes disk performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable NET 3.5" FontSize="15" Tag=" |  |  | Classic"   ToolTip="Some old games and applications require .NET Framework 3.5"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Classic"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Super Performance" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disabled all windows effects. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Widgets from Taskbar in Windows 11" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Widgets are one of the new user interface elements in Windows 11"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Set Username to Unknown" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fix Arabic encoding" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="Fix issues related to strange symbols appearing in Arabic text"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore Default File Type Associations" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="Restoring default apps for file type associations resets Windows settings allowing the system to select the appropriate programs by default"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Limit Defender CPU Usage" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Limits Defender CPU maximum usage at 25 instead of default 50"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimizing GPU scheduling" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Disables HardwareAccelerated GPU Scheduling which may improve performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Fullscreen Optimizations" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Fullscreen Optimizations which may improve performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimize Network" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Optimize network performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable system cache" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Enabling large system cache can improve performance for certain workloads but may affect system stability"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimizing NVIDIA GPU settings" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Optimize NVIDIA GPU settings "/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable Faster Shutdown" FontSize="15" Tag=" |  |  | Performance"   ToolTip="Optimize NVIDIA GPU settings "/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Super Control Panel" FontSize="15" Tag=" |  |  | Personalization"   ToolTip="Create Super Control Panel shortcut on Desktop"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Personalization"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Detailed BSoD" FontSize="15" Tag=" |  |  | Fixer"   ToolTip="You will see a detailed Blue Screen of Death BSOD with more information"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Fixer"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Powershell 7 Telemetry" FontSize="15" Tag=" |  |  | Privacy"   ToolTip="Tell Powershell 7 to not send Telemetry Data"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Privacy"/>
</StackPanel>
</StackPanel>
</ListView>
</TabItem>
<TabItem x:Name="SettingsTab" Header="⚙" ToolTip="{Binding settings, TargetNullValue=Settings}" FontSize="18" BorderBrush="{x:Null}" Background="{x:Null}">
<ListView Name="SettingsList"
BorderBrush="{x:Null}"
Background="{x:Null}"
SelectionMode="Single"
SnapsToDevicePixels="True"
VirtualizingStackPanel.IsVirtualizing="True"
VirtualizingStackPanel.IsContainerVirtualizable="True"
VirtualizingStackPanel.VirtualizationMode="Recycling"
AlternationCount="2"
ScrollViewer.CanContentScroll="True">
<ListView.ItemsPanel>
<ItemsPanelTemplate>
<VirtualizingStackPanel />
</ItemsPanelTemplate>
</ListView.ItemsPanel>
<StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Show file extensions" FontSize="15" Tag=" |  |  | Protection" Style="{StaticResource ToggleSwitchStyle}" Name="Showfileextensions" ToolTip="Show file extensions in Windows displays the suffix at the end of file names like .txt .jpg .exe etc"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Show Super Hidden" FontSize="15" Tag=" |  |  | Protection" Style="{StaticResource ToggleSwitchStyle}" Name="ShowSuperHidden" ToolTip="Show Super Hidden displays files and folders"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dark Mode" FontSize="15" Tag=" |  |  | Personalize" Style="{StaticResource ToggleSwitchStyle}" Name="DarkMode" ToolTip="Dark Mode is a setting that changes the screen to darker colors reducing eye strain and saving battery life on OLED screens"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Personalize"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NumLook" FontSize="15" Tag=" |  |  | Protection" Style="{StaticResource ToggleSwitchStyle}" Name="NumLook" ToolTip="Toggle the Num Lock key state when your computer starts"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Protection"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sticky Keys" FontSize="15" Tag=" |  |  | Accessibility" Style="{StaticResource ToggleSwitchStyle}" Name="StickyKeys" ToolTip="Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Accessibility"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mouse Acceleration" FontSize="15" Tag=" |  |  | Accessibility" Style="{StaticResource ToggleSwitchStyle}" Name="MouseAcceleration" ToolTip="Cursor movement is affected by the speed of your physical mouse movements"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Accessibility"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="End Task On Taskbar Windows 11" FontSize="15" Tag=" |  |  | Accessibility" Style="{StaticResource ToggleSwitchStyle}" Name="EndTaskOnTaskbarWindows11" ToolTip="End task when right clicking a program in the taskbar"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Accessibility"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clear Page File At Shutdown" FontSize="15" Tag=" |  |  | Storage " Style="{StaticResource ToggleSwitchStyle}" Name="ClearPageFileAtShutdown" ToolTip="Removes sensitive data stored in virtual memory when the system shuts down"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Storage "/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Auto End Tasks" FontSize="15" Tag=" |  |  | Performance" Style="{StaticResource ToggleSwitchStyle}" Name="AutoEndTasks" ToolTip="Automatically end tasks that are not responding"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Performance Options" FontSize="15" Tag=" |  |  | Performance" Style="{StaticResource ToggleSwitchStyle}" Name="PerformanceOptions" ToolTip="Adjust for best performance"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Launch To This PC" FontSize="15" Tag=" |  |  | Accessibility" Style="{StaticResource ToggleSwitchStyle}" Name="LaunchToThisPC" ToolTip="File Explorer open directly to This PC"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Accessibility"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Automatic Driver Installation" FontSize="15" Tag=" |  |  | Drivers" Style="{StaticResource ToggleSwitchStyle}" Name="DisableAutomaticDriverInstallation" ToolTip="Automatically downloading and installing drivers"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Drivers"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Always show icons never Thumbnail" FontSize="15" Tag=" |  |  | Performance" Style="{StaticResource ToggleSwitchStyle}" Name="AlwaysshowiconsneverThumbnail" ToolTip="Show icons in the file explorer instead of thumbnails"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Performance"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Core Isolation Memory Integrity" FontSize="15" Tag=" |  |  | Security" Style="{StaticResource ToggleSwitchStyle}" Name="CoreIsolationMemoryIntegrity" ToolTip="Core Isolation Memory Integrity"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Security"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Sandbox" FontSize="15" Tag=" |  |  | Features" Style="{StaticResource ToggleSwitchStyle}" Name="WindowsSandbox" ToolTip="Windows Sandbox is a feature that allows you to run a sandboxed version of Windows"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Features"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Subsystem for Linux" FontSize="15" Tag=" |  |  | Features" Style="{StaticResource ToggleSwitchStyle}" Name="WindowsSubsystemforLinux" ToolTip="Windows Subsystem for Linux is an optional feature of Windows that allows Linux programs to run natively on Windows without the need for a separate virtual machine or dual booting"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Features"/>
</StackPanel>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HyperV Virtualization" FontSize="15" Tag=" |  |  | Features" Style="{StaticResource ToggleSwitchStyle}" Name="HyperVVirtualization" ToolTip="HyperV is a hardware virtualization product developed by Microsoft that allows users to create and manage virtual machines"/>
<TextBlock Margin="15 0 0 0" FontSize="13" Text="🏷 Features"/>
</StackPanel>
</StackPanel>
</ListView>
</TabItem>
</TabControl>
<Grid Row="2">
<Grid.ColumnDefinitions>
<ColumnDefinition Width="*"/>
<ColumnDefinition Width="auto"/>
</Grid.ColumnDefinitions>
<Grid Column="1" Background="Transparent">
<Button
Name="installBtn"
Content="{Binding Install, TargetNullValue=Install}"
FontSize="18"
Background="Transparent"
HorizontalAlignment="Center"
VerticalAlignment="Center"
HorizontalContentAlignment="Center"
VerticalContentAlignment="Center"
Cursor="Hand"
Width="140"
Height="45"
Margin="20">
</Button>
<Button
Name="applyBtn"
Content="{Binding Apply, TargetNullValue=Apply}"
FontSize="18"
Background="Transparent"
Visibility="Collapsed"
HorizontalAlignment="Center"
VerticalAlignment="Center"
HorizontalContentAlignment="Center"
VerticalContentAlignment="Center"
Cursor="Hand"
Width="140"
Height="45"
Margin="20">
</Button>
</Grid>
<Grid Column="0">
<TextBlock Name="statusbar"
Text="✊ #StandWithPalestine"
HorizontalAlignment="Left"
VerticalAlignment="Center"
TextWrapping="Wrap"
FontWeight="SemiBold"
Padding="10 0 0 0"
Width="auto"
/>
</Grid>
</Grid>
</Grid>
</Window>
'
$AboutWindowXaml = '<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
Title="{Binding About, TargetNullValue=About}"
WindowStartupLocation="CenterScreen"
Background="{DynamicResource PrimaryBackgroundColor}"
WindowStyle="ToolWindow"
Height="555" Width="455"
ShowInTaskbar="True"
MinHeight="555"
MinWidth="455"
ResizeMode="NoResize"
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
<Window.Resources>
<Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type Thumb}">
<Grid x:Name="Grid">
<Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
<Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
</Grid>
<ControlTemplate.Triggers>
<Trigger Property="Tag" Value="Horizontal">
<Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
<Setter TargetName="Rectangle1" Property="Height" Value="7" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
<Setter Property="Stylus.IsFlicksEnabled" Value="false" />
<Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
<Setter Property="Width" Value="8" />
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type ScrollBar}">
<Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
<Grid.RowDefinitions>
<RowDefinition Height="0.00001*" />
</Grid.RowDefinitions>
<Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
<Track.Thumb>
<Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
</Track.Thumb>
<Track.IncreaseRepeatButton>
<RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
</Track.IncreaseRepeatButton>
<Track.DecreaseRepeatButton>
<RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
</Track.DecreaseRepeatButton>
</Track>
</Grid>
<ControlTemplate.Triggers>
<Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
<Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger SourceName="Thumb" Property="IsDragging" Value="true">
<Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger Property="IsEnabled" Value="false">
<Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
</Trigger>
<Trigger Property="Orientation" Value="Horizontal">
<Setter TargetName="GridRoot" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter TargetName="PART_Track" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter Property="Width" Value="Auto" />
<Setter Property="Height" Value="8" />
<Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
<Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
<Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style TargetType="Button">
<Setter Property="Background" Value="{DynamicResource PrimaryButtonForeground}"/>
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor2}"/>
<Setter Property="BorderBrush" Value="Transparent"/>
<Setter Property="BorderThickness" Value="1"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="Button">
<Border CornerRadius="20" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
<ContentPresenter HorizontalAlignment="Center"
VerticalAlignment="Center"/>
</Border>
</ControlTemplate>
</Setter.Value>
</Setter>
<Style.Triggers>
<Trigger Property="IsMouseOver" Value="True">
<Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter Property="Foreground" Value="{DynamicResource PrimaryButtonHighlight}"/>
</Trigger>
</Style.Triggers>
</Style>
</Window.Resources>
<Grid Margin="8">
<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="Auto"/>
<RowDefinition Height="Auto"/>
</Grid.RowDefinitions>
<Grid Grid.Row="0">
<StackPanel Orientation="Vertical">
<Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Images/logo.png"
Height="90" Width="Auto" HorizontalAlignment="Center" Margin="0"/>
<TextBlock
Text="Made with ♥ by Emad Adel"
TextWrapping="Wrap"
HorizontalAlignment="Center"
Margin="0,5,0,5"
Width="355"
Padding="8"
Foreground="{DynamicResource TextColorSecondaryColor2}"
FontSize="14"
TextAlignment="Center"
/>
<TextBlock
Name="ver"
Text="9/1/1998"
FontSize="14"
TextAlignment="Center"
Foreground="{DynamicResource TextColorSecondaryColor2}"
/>
<TextBlock
Text="ITT created to simplify software installation and Windows tweaks, making it easier for others to use their computers. It is an open-source project, and you can contribute to make it better by adding your favorite apps and more."
TextWrapping="Wrap"
HorizontalAlignment="Center"
Margin="0,2,0,2"
Width="355" Padding="8"
Foreground="{DynamicResource TextColorSecondaryColor2}"
FontSize="14"
TextAlignment="Center"
/>
</StackPanel>
</Grid>
<Grid Grid.Row="1">
<StackPanel Orientation="Vertical">
<TextBlock Text="Contributors"
TextWrapping="Wrap" HorizontalAlignment="Center" Foreground="{DynamicResource TextColorSecondaryColor2}" Margin="0,5,0,5" FontSize="12" FontStyle="Italic" TextAlignment="Center"/>
<ScrollViewer Grid.Row="2" VerticalScrollBarVisibility="Auto" Height="103">
<StackPanel Margin="20,0,0,0">
<TextBlock Text="emadadel4" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
<TextBlock Text="yousefmhmd" Margin="1" Foreground="{DynamicResource TextColorSecondaryColor2}" />
</StackPanel>
</ScrollViewer>
</StackPanel>
</Grid>
<StackPanel Grid.Row="2" Orientation="Horizontal" VerticalAlignment="Bottom" HorizontalAlignment="Center" Margin="0,20,0,0">
<Button Width="38" Height="38" Name="github" Cursor="Hand" Margin="5">
<Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/github.png"/>
</Button>
<Button Width="38" Height="38" Name="telegram" Cursor="Hand" Margin="5">
<Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/telegram.png"/>
</Button>
<Button Width="38" Height="38"  Cursor="Hand" Name="yt" Margin="5">
<Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/youtube.png"/>
</Button>
<Button Width="38" Height="38" Name="blog" Cursor="Hand" Margin="5">
<Image Source="https://raw.githubusercontent.com/emadadel4/ITT/main/static/Icons/blog.png"/>
</Button>
<Button Width="38" Height="38" Name="coffee" Cursor="Hand" Margin="5">
<Image Source="https://cdn.buymeacoffee.com/assets/homepage/meta/apple-icon-120x120.png"/>
</Button>
</StackPanel>
</Grid>
</Window>
'
function Show-Event {
[xml]$event = $EventWindowXaml
$itt.event = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $event))
$itt.event.Resources.MergedDictionaries.Add($itt["window"].FindResource($itt.Theme))
$itt.event.FindName('closebtn').add_MouseLeftButtonDown({ $itt.event.Close() })
$itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force; $itt.event.Close() })
$itt.event.FindName('title').text = 'Changelog'.Trim()
$itt.event.FindName('date').text = '04/01/2025'.Trim()
$itt.event.FindName('preview2').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$itt.event.FindName('shell').add_MouseLeftButtonDown({
Start-Process('https://www.youtube.com/watch?v=nI7rUhWeOrA')
})
$itt.event.FindName('esg').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$itt.event.FindName('preview').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$itt.event.FindName('ytv').add_MouseLeftButtonDown({
Start-Process('https://www.youtube.com/watch?v=QmO82OTsU5c')
})
$storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
$daysElapsed = (Get-Date) - $storedDate
if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) {return}
$itt.event.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.event.Close() } })
if ($daysElapsed.Days -lt 1){$itt.event.FindName('DisablePopup').Visibility = 'Hidden'}
$itt.event.ShowDialog() | Out-Null
}
$EventWindowXaml = '<Window
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
x:Name="Window" Title="ITT | Event"
WindowStartupLocation = "CenterScreen"
Background="Transparent"
WindowStyle="None"
AllowsTransparency="True"
Height="600" Width="486"
ShowInTaskbar = "False"
Topmost="True"
Icon="https://raw.githubusercontent.com/emadadel4/ITT/main/icon.ico">
<Window.Resources>
<Style x:Key="ScrollThumbs" TargetType="{x:Type Thumb}">
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type Thumb}">
<Grid x:Name="Grid">
<Rectangle HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Fill="Transparent" />
<Border x:Name="Rectangle1" CornerRadius="5" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Width="Auto" Height="Auto" Background="{TemplateBinding Background}" />
</Grid>
<ControlTemplate.Triggers>
<Trigger Property="Tag" Value="Horizontal">
<Setter TargetName="Rectangle1" Property="Width" Value="Auto" />
<Setter TargetName="Rectangle1" Property="Height" Value="7" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
<Style x:Key="{x:Type ScrollBar}" TargetType="{x:Type ScrollBar}">
<Setter Property="Stylus.IsFlicksEnabled" Value="false" />
<Setter Property="Foreground" Value="{DynamicResource PrimaryButtonForeground}" />
<Setter Property="Background" Value="{DynamicResource SecondaryPrimaryBackgroundColor}" />
<Setter Property="Width" Value="8" />
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="{x:Type ScrollBar}">
<Grid x:Name="GridRoot" Width="8" Background="{TemplateBinding Background}">
<Grid.RowDefinitions>
<RowDefinition Height="0.00001*" />
</Grid.RowDefinitions>
<Track x:Name="PART_Track" Grid.Row="0" IsDirectionReversed="true" Focusable="false">
<Track.Thumb>
<Thumb x:Name="Thumb" Background="{TemplateBinding Foreground}" Style="{DynamicResource ScrollThumbs}" />
</Track.Thumb>
<Track.IncreaseRepeatButton>
<RepeatButton x:Name="PageUp" Command="ScrollBar.PageDownCommand" Opacity="0" Focusable="false" />
</Track.IncreaseRepeatButton>
<Track.DecreaseRepeatButton>
<RepeatButton x:Name="PageDown" Command="ScrollBar.PageUpCommand" Opacity="0" Focusable="false" />
</Track.DecreaseRepeatButton>
</Track>
</Grid>
<ControlTemplate.Triggers>
<Trigger SourceName="Thumb" Property="IsMouseOver" Value="true">
<Setter Value="{DynamicResource ButtonSelectBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger SourceName="Thumb" Property="IsDragging" Value="true">
<Setter Value="{DynamicResource DarkBrush}" TargetName="Thumb" Property="Background" />
</Trigger>
<Trigger Property="IsEnabled" Value="false">
<Setter TargetName="Thumb" Property="Visibility" Value="Collapsed" />
</Trigger>
<Trigger Property="Orientation" Value="Horizontal">
<Setter TargetName="GridRoot" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter TargetName="PART_Track" Property="LayoutTransform">
<Setter.Value>
<RotateTransform Angle="-90" />
</Setter.Value>
</Setter>
<Setter Property="Width" Value="Auto" />
<Setter Property="Height" Value="8" />
<Setter TargetName="Thumb" Property="Tag" Value="Horizontal" />
<Setter TargetName="PageDown" Property="Command" Value="ScrollBar.PageLeftCommand" />
<Setter TargetName="PageUp" Property="Command" Value="ScrollBar.PageRightCommand" />
</Trigger>
</ControlTemplate.Triggers>
</ControlTemplate>
</Setter.Value>
</Setter>
</Style>
</Window.Resources>
<Window.Triggers>
<EventTrigger RoutedEvent="Window.Loaded">
<BeginStoryboard>
<Storyboard>
<DoubleAnimation Storyboard.TargetProperty="Opacity" From="0" To="1" Duration="0:0:0.5"/>
</Storyboard>
</BeginStoryboard>
</EventTrigger>
</Window.Triggers>
<Border Background="{DynamicResource PrimaryBackgroundColor}" BorderBrush="{DynamicResource SecondaryPrimaryBackgroundColor}" BorderThickness="4" CornerRadius="10">
<Grid>
<Grid.RowDefinitions>
<RowDefinition Height="Auto"/>
<RowDefinition Height="*"/>
<RowDefinition Height="auto"/>
</Grid.RowDefinitions>
<StackPanel x:Name="MainStackPanel" Height="Auto" Background="Transparent" Orientation="Vertical" Margin="20">
<Grid Row="0" Background="Transparent">
<TextBlock Text="&#10006;"
Name="closebtn"
HorizontalAlignment="Right"
VerticalAlignment="Top"
Margin="0"
Cursor="Hand"
Foreground="red" />
<StackPanel Orientation="Vertical" Margin="0">
<TextBlock
Name="title"
Height="Auto"
Width="Auto"
FontSize="20"
Text="What''s New"
Foreground="{DynamicResource TextColorSecondaryColor}"
FontWeight="SemiBold"
TextWrapping="Wrap"
VerticalAlignment="Center"
HorizontalAlignment="Left" />
<TextBlock
Name="date"
Height="Auto"
Width="Auto"
Margin="5,0,0,0"
Text="8/29/2024"
Foreground="{DynamicResource TextColorSecondaryColor2}"
TextWrapping="Wrap"
VerticalAlignment="Center"
HorizontalAlignment="Left" />
</StackPanel>
</Grid>
</StackPanel>
<Grid Row="1" Background="Transparent" Margin="20">
<ScrollViewer Name="ScrollViewer" VerticalScrollBarVisibility="Auto" Height="Auto">
<StackPanel Orientation="Vertical">
<TextBlock Text=''🎬 Watch demo'' FontSize=''20'' Margin=''0,18,0,30'' FontWeight=''Bold'' Foreground=''{DynamicResource PrimaryButtonForeground}'' TextWrapping=''Wrap''/>
<Image x:Name=''ytv'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
<Image.Source>
<BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ITT/refs/heads/main/static/Images/thumbnail.jpg''/>
</Image.Source>
</Image>
<TextBlock Text='' • Keyboard Shortcuts'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+A: Clear category filter.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+F: Enter search mode.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+Q: Switch to Apps.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+W: Switch to Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+E: Switch to Settings.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+S: Install selected Apps/Tweaks.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+S: Save selected.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+D: Load save file.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+M: Toggle music.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+P: Open Choco folder.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+Q: Restore point.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Shift+I: ITT Shortcut.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<StackPanel Orientation=''Vertical''>
<TextBlock Text=''• Ctrl+G: Close application.'' Margin=''35,0,0,0'' FontSize=''16'' Foreground=''{DynamicResource TextColorSecondaryColor2}'' TextWrapping=''Wrap''/>
</StackPanel>
<TextBlock Text='' • ⚡ Quick Install Your Saved Apps'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''preview'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
<Image.Source>
<BitmapImage UriSource=''https://github.com/user-attachments/assets/47a321fb-6a8f-4d29-a9a4-bf69d82763a7''/>
</Image.Source>
</Image>
<TextBlock Text=''You can install your saved apps at any time using the command (Run as Admin is recommended)'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<Image x:Name=''preview2'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
<Image.Source>
<BitmapImage UriSource=''https://github.com/user-attachments/assets/2a4fedc7-1d0e-419d-940c-b784edc7d1d1''/>
</Image.Source>
</Image>
<TextBlock Text='' • 📥 Download any Youtube video'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''shell'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
<Image.Source>
<BitmapImage UriSource=''https://raw.githubusercontent.com/emadadel4/ShellTube/main/demo.jpg''/>
</Image.Source>
</Image>
<TextBlock Text=''Shelltube is simple way to downnload videos and playlist from youtube just Launch it and start download your video you can Launch it from Third-party section.'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
<TextBlock Text='' • 💡 A Secret Feature Awaits – Unlock It'' FontSize=''20'' Margin=''0,44,0,30'' Foreground=''{DynamicResource PrimaryButtonForeground}'' FontWeight=''bold'' TextWrapping=''Wrap''/>
<Image x:Name=''esg'' Cursor=''Hand'' Margin=''8'' Height=''Auto'' Width=''400''>
<Image.Source>
<BitmapImage UriSource=''https://github.com/user-attachments/assets/edb67270-d9d2-4e94-8873-1c822c3afe2f''/>
</Image.Source>
</Image>
<TextBlock Text=''Can You Find the Hidden Easter Egg? Open the source code and uncover the secret features waiting for you!'' FontSize=''16'' Margin=''25,25,35,0''  Foreground=''{DynamicResource TextColorSecondaryColor2}''  TextWrapping=''Wrap''/>
</StackPanel>
</ScrollViewer>
</Grid>
<Grid Row="2" Background="Transparent">
<TextBlock
Name="DisablePopup"
Foreground="{DynamicResource TextColorSecondaryColor2}"
Text="Show on update"
Background="Transparent"
TextAlignment="Center"
Cursor="Hand"
Padding="15"
Visibility="Visible"
HorizontalAlignment="Center"
VerticalAlignment="Center"
/>
</Grid>
</Grid>
</Border>
</Window>
'
$maxthreads = [int]$env:NUMBER_OF_PROCESSORS
$hashVars = New-object System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList 'itt', $itt, $Null
$InitialSessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
$InitialSessionState.Variables.Add($hashVars)
$functions = @(
'Install-App', 'Install-Winget', 'InvokeCommand', 'Add-Log',
'Disable-Service', 'Uninstall-AppxPackage', 'Finish', 'Message',
'Notify', 'UpdateUI', 'Install-ITTAChoco',
'ExecuteCommand', 'Set-Registry', 'Set-Taskbar',
'Refresh-Explorer', 'Remove-ScheduledTasks','CreateRestorePoint','Set-Statusbar'
)
foreach ($func in $functions) {
$command = Get-Command $func -ErrorAction SilentlyContinue
if ($command) {
$InitialSessionState.Commands.Add(
(New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry $command.Name, $command.ScriptBlock.ToString())
)
}
}
$itt.runspace = [runspacefactory]::CreateRunspacePool(1, $maxthreads, $InitialSessionState, $Host)
$itt.runspace.Open()
try {
[xml]$MainXaml = $MainWindowXaml
$itt["window"] = [Windows.Markup.XamlReader]::Load([System.Xml.XmlNodeReader]$MainXaml)
}
catch {
Write-Output "Error: $($_.Exception.Message)"
}
try {
$appsTheme = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme"
$fullCulture = Get-ItemPropertyValue -Path "HKCU:\Control Panel\International" -Name "LocaleName"
$shortCulture = $fullCulture.Split('-')[0]
if (-not (Test-Path $itt.registryPath)) {
New-Item -Path $itt.registryPath -Force | Out-Null
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -Force
Set-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -Force
Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -Force
Set-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -Force
}
try {
$itt.Theme = (Get-ItemProperty -Path $itt.registryPath -Name "Theme" -ErrorAction Stop).Theme
$itt.Locales = (Get-ItemProperty -Path $itt.registryPath -Name "locales" -ErrorAction Stop).locales
$itt.Music = (Get-ItemProperty -Path $itt.registryPath -Name "Music" -ErrorAction Stop).Music
$itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -ErrorAction Stop).PopupWindow
$itt.backup = (Get-ItemProperty -Path $itt.registryPath -Name "backup" -ErrorAction Stop).backup
}
catch {
New-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -PropertyType String -Force *> $Null
New-ItemProperty -Path $itt.registryPath -Name "locales" -Value "default" -PropertyType String -Force *> $Null
New-ItemProperty -Path $itt.registryPath -Name "Music" -Value 0 -PropertyType DWORD -Force *> $Null
New-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 0 -PropertyType DWORD -Force *> $Null
New-ItemProperty -Path $itt.registryPath -Name "backup" -Value 0 -PropertyType DWORD -Force *> $Null
}
try {
$Locales = switch ($itt.Locales) {
"default" {
switch ($shortCulture) {
"ar" {"ar"}
"de" {"de"}
"en" {"en"}
"es" {"es"}
"fr" {"fr"}
"ga" {"ga"}
"hi" {"hi"}
"it" {"it"}
"ko" {"ko"}
"ru" {"ru"}
"tr" {"tr"}
"zh" {"zh"}
default { "en" }
}
}
"ar" {"ar"}
"de" {"de"}
"en" {"en"}
"es" {"es"}
"fr" {"fr"}
"ga" {"ga"}
"hi" {"hi"}
"it" {"it"}
"ko" {"ko"}
"ru" {"ru"}
"tr" {"tr"}
"zh" {"zh"}
default { "en" }
}
$itt["window"].DataContext = $itt.database.locales.Controls.$Locales
$itt.Language = $Locales
}
catch {
$itt["window"].DataContext = $itt.database.locales.Controls.en
}
try {
$Themes = switch ($itt.Theme) {
"Dark" {"Dark"}
"DarkKnight" {"DarkKnight"}
"Light" {"Light"}
"Palestine" {"Palestine"}
default {
switch ($appsTheme) {
"0" {
"Dark"
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
}
"1" {
"Light"
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
}
}
}
}
$itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($Themes))
$itt.Theme = $Themes
}
catch {
$fallback = switch ($appsTheme) {
"0" { "Dark" }
"1" { "Light" }
}
Set-ItemProperty -Path $itt.registryPath -Name "Theme" -Value "default" -Force
$itt["window"].Resources.MergedDictionaries.Add($itt["window"].FindResource($fallback))
$itt.Theme = $fallback
}
$itt.mediaPlayer.settings.volume = "$($itt.Music)"
if ($itt.Music -eq 0) {
$global:toggleState = $false
}
else {
$global:toggleState = $true
}
$itt["window"].title = "Install Tweaks Tool " + @("🔈", "🔊")[$itt.Music -eq 100]
$itt.PopupWindow = (Get-ItemProperty -Path $itt.registryPath -Name "PopupWindow").PopupWindow
$itt["window"].TaskbarItemInfo = New-Object System.Windows.Shell.TaskbarItemInfo
if (-not $Debug) { Set-Taskbar -progress "None" -icon "logo" }
}
catch {
Write-Output "Error: $_"
}
$itt.CurrentList
$itt.CurrentCategory
$itt.Search_placeholder = $itt["window"].FindName("search_placeholder")
$itt.TabControl = $itt["window"].FindName("taps")
$itt.AppsListView = $itt["window"].FindName("appslist")
$itt.TweaksListView = $itt["window"].FindName("tweakslist")
$itt.SettingsListView = $itt["window"].FindName("SettingsList")
$itt.Description = $itt["window"].FindName("description")
$itt.Statusbar = $itt["window"].FindName("statusbar")
$itt.InstallBtn = $itt["window"].FindName("installBtn")
$itt.ApplyBtn = $itt["window"].FindName("applyBtn")
$itt.SearchInput = $itt["window"].FindName("searchInput")
$itt.installText = $itt["window"].FindName("installText")
$itt.installIcon = $itt["window"].FindName("installIcon")
$itt.applyText = $itt["window"].FindName("applyText")
$itt.applyIcon = $itt["window"].FindName("applyIcon")
$itt.QuoteIcon = $itt["window"].FindName("QuoteIcon")
$tweaksDict = @{}
foreach ($tweak in $itt.database.Tweaks) {
$tweaksDict[$tweak.Name] = $tweak
}
$MainXaml.SelectNodes("//*[@Name]") | ForEach-Object {
$name = $_.Name
$element = $itt["window"].FindName($name)
if ($element) {
$itt[$name] = $element
$type = $element.GetType().Name
switch ($type) {
"Button" { $element.Add_Click({ Invoke-Button $this.Name $this.Content }) }
"MenuItem" { $element.Add_Click({ Invoke-Button $this.Name -Content $this.Header }) }
"TextBox" { $element.Add_TextChanged({ Invoke-Button $this.Name $this.Text }) }
"ComboBox" { $element.add_SelectionChanged({ Invoke-Button $this.Name $this.SelectedItem.Content }) }
"TabControl" { $element.add_SelectionChanged({ Invoke-Button $this.Name $this.SelectedItem.Name }) }
"CheckBox" {
$element.IsChecked = Get-ToggleStatus -ToggleSwitch $name
$element.Add_Click({ Invoke-Toggle $this.Name })
}
}
}
}
$onClosingEvent = {
param($s, $c)
$result = Message -key "Exit_msg" -icon "ask" -action "YesNo"
if ($result -eq "Yes") {
Manage-Music -action "StopAll"
}
else {
$c.Cancel = $true
}
}
$itt["window"].Add_ContentRendered({
Startup
Show-Event
})
$itt.SearchInput.Add_GotFocus({
$itt.Search_placeholder.Visibility = "Hidden"
})
$itt.SearchInput.Add_LostFocus({
if ([string]::IsNullOrEmpty($itt.SearchInput.Text)) {
$itt.Search_placeholder.Visibility = "Visible"
}
})
if ($i) {
Quick-Install -file $i *> $null
}
$itt["window"].add_Closing($onClosingEvent)
$itt["window"].Add_PreViewKeyDown($KeyEvents)
$itt["window"].ShowDialog() | Out-Null
$itt.runspace.Dispose()
$itt.runspace.Close()
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
$script:powershell.Dispose()
$script:powershell.Stop()
Stop-Transcript *> $null