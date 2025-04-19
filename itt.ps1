param (
[string]$i
)
Add-Type -AssemblyName 'System.Windows.Forms', 'PresentationFramework', 'PresentationCore', 'WindowsBase'
$itt = [Hashtable]::Synchronized(@{
database       = @{}
ProcessRunning = $false
lastupdate     = "04/19/2025"
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
{"Controls":{"ar":{"name":"عربي","Welcome":"توفر هذه الأداة تسهيلات كبيرة في عملية تثبيت البرامج وتحسين الويندوز. انضم إلينا وكن جزءًا في تطويرها","System_Info":"معلومات النظام","Power_Options":"خيارات الطاقة","Device_Manager":"إدارة الأجهزة","Services":"خدمات","Networks":"شبكات","Apps_features":"التطبيقات و الميزات","Task_Manager":"مدير المهام","Disk_Managment":"إدارة القرص","Msconfig":"تكوين النظام","Environment_Variables":"متغيرات بيئة النظام","Install":"تثبيت","Apply":"تطبيق","Downloading":"...جارٍ التحميل","About":"عن الاداة","Third_party":"ادوات اخرى","Preferences":"التفضيلات","Management":"إدارة الجهاز","Apps":"برامج","Tweaks":"تحسينات","Settings":"إعدادات","Save":"حفظ البرامج","Restore":"أسترجاع البرامج","Music":"الموسيقى","On":"تشغيل ","Off":"كتم","Dark":"ليلا","Light":"نهارا","Use_system_setting":"استخدم إعدادات النظام","Create_desktop_shortcut":"أنشاء أختصار على سطح المكتب","Reset_preferences":" إعادة التفضيلات إلى الوضع الافتراضي","Reopen_itt_again":"يرجى اعادة فتح الاداة مرة اخرى","Theme":"المظهر","Language":"اللغة","MAS":"تفعيل الويندوز","Win_Office":"تحميل ويندوز / أوفيس","IDM":"تفعيل الدونلود مانجر","Browsers_extensions":"أضافات المتصفحات","All":"الكل","Search":"بحث","Create_restore_point":"إنشاء نقطة الاستعادة","Portable_Downloads_Folder":"مجلد التنزيلات المحمولة","Install_msg":"هل تريد تثبيت البرامج التالية","Apply_msg":"هل تريد تطبيق التحسينات التالية","Applying":"...جارٍي التطبيق","Please_wait":"يرجى الانتظار، يوجد عملية في الخلفية","App_empty_select":"اختر على الأقل تطبيقًا لتثبيته","Tweak_empty_select":"اختار على الاقل تحسين واحد لتطبيقه","Last_update":"آخر تحديث","Exit_msg":"هل أنت متأكد من رغبتك في إغلاق البرنامج؟ إذا كان هناك أي تثبيتات، فسيتم إيقافها.","Happy_birthday":"!عيد ميلاد سعيد عماد","My_playlist":"انه عيد ميلادي و قائمة الموسيقى الخاصة بي","Empty_save_msg":"يرجى اختيار تطبيق واحد على الاقل لحفظه","easter_egg":"تقدر تكتشف الميزة المخفية؟ تصفح الكود، وكن أول واحد يكتشف الميزة، ويضيفها للأداة"},"de":{"name":"Deutsch","Welcome":"Sparen Sie Zeit indem Sie mehrere Programme gleichzeitig instAllieren und die Leistung Ihres Windows steigern. Schließen Sie sich uns an um dieses Tool zu verbessern und noch besser zu machen. Sie können auch Ihre Lieblings-Musik-Apps und Anpassungen hinzufügen.","Install":"InstAllieren","Apply":"Anwenden","Downloading":"Herunterladen...","About":"Über","Third_party":"Drittanbieter","Preferences":"Einstellungen","Management":"Verwaltung","Apps":"Apps","Tweaks":"Optimierungen","Settings":"Einstellungen","Save":"Speichern","Restore":"Wiederherstellen","Music":"Musik","On":"Ein ","Off":"Aus","Disk_Managment":"Datenträgerverwaltung","Msconfig":"Systemkonfiguration","Environment_Variables":"Umgebungsvariablen","Task_Manager":"Task-Manager","Apps_features":"Apps-FunktiOnen","Networks":"Netzwerke","Services":"Dienste","Device_Manager":"Geräte-Manager","Power_Options":"EnergieoptiOnen","System_Info":"Systeminfo","Use_system_setting":"Systemeinstellungen verwenden","Create_desktop_shortcut":"Desktop-Verknüpfung erstellen","Reset_preferences":"Einstellungen zurücksetzen","Reopen_itt_again":"Bitte ITT erneut öffnen.","Theme":"Thema","Language":"Sprache","MAS":"Microsoft Aktivierungsskripte (MAS)","Win_Office":"Windows / Office ISO herunterladen","IDM":"IDM-Aktivierung","Browsers_extensions":"Browser-Erweiterungen","All":"Alle","Search":"Suchen","Create_restore_point":"Wiederherstellungspunkt erstellen","Portable_Downloads_Folder":"Ordner für tragbare Downloads","Install_msg":"Sind Sie sicher  dass Sie die folgenden Anwendungen instAllieren möchten?","Apply_msg":"Sind Sie sicher dass Sie die folgenden Anpassungen anwenden möchten?","Applying":"Anwenden...","App_empty_select":"Wählen Sie mindestens eine App zur InstAllatiOn aus.","Tweak_empty_select":"Wählen Sie mindestens eine Optimierung zur Anwendung aus.","Please_wait":"Bitte warten ein Prozess läuft im Hintergrund.","Last_update":"Letztes Update","Exit_msg":"Sind Sie sicher dass Sie das Programm schließen möchten? Alle InstAllatiOnen werden abgebrochen.","Happy_birthday":"Alles Gute zum Geburtstag mir!","My_playlist":"Es ist mein Geburtstag und meine Playlist ♪","Empty_save_msg":"Wählen Sie mindestens eine App zum Speichern aus.","easter_egg":"Kannst du das verborgene Geheimnis entdecken? Tauche in den Quellcode ein"},"en":{"name":"English","Welcome":"Save time and install all your programs at once and debloat Windows and more. Be part of ITT and contribute to improving it","Install":"Install","Apply":"Apply","Downloading":"Downloading...","About":"About","Third_party":"Third-party","Preferences":"Preferences","Management":"Management","Apps":"Apps","Tweaks":"Tweaks","Settings":"Settings","Save":"Save","Restore":"Restore","Music":"Music","On":"On","Off":"Off","Disk_Managment":"Disk Managment","Msconfig":"System Configuration","Environment_Variables":"Environment Variables","Task_Manager":"Task Manager","Apps_features":"Programs and Features","Networks":"Networks","Services":"Services","Device_Manager":"Device Manager","Power_Options":"Power options","System_Info":"System Info","Use_system_setting":"Use system setting","Create_desktop_shortcut":"Create desktop shortcut","Reset_preferences":"Reset Preferences","Reopen_itt_again":"Please reopen itt again.","Theme":"Theme","Language":"Language","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"IDM Activation (J2TEAM)","Browsers_extensions":"Browsers extensions","All":"All","Search":"Search","Create_restore_point":"Create a restore point","Portable_Downloads_Folder":"Portable Downloads Folder","Install_msg":"Are you sure you want to install the following App(s)","Apply_msg":"Are you sure you want to apply the following Tweak(s)","Applying":"Applying...","App_empty_select":"Please select at least one app to install.","Tweak_empty_select":"Please select at least one tweak to apply.","Please_wait":"Please wait  a process is running in the background","Last_update":"Last update","Exit_msg":"Are you sure you want to close the program? Any ongoing installations will be canceled.","Happy_birthday":"Happy Birthday to me!","My_playlist":"It's my Birthday and My Playlist ♪","Empty_save_msg":"Choose at least One app to save it","easter_egg":"Can you uncover the hidden secret? Dive into the source code"},"es":{"name":"Español","Welcome":"Ahorra tiempo instalando varios prograMAS a la vez y mejora el rendimiento de tu Windows. Únete a nosotros para mejorar esta herramienta y hacerla aún mejor. También puedes agregar tus aplicaciOnes Musicales y ajustes favoritos.","Install":"Instalar","Apply":"Aplicar","Downloading":"Descargando...","About":"Acerca de","Third_party":"Terceros","Preferences":"Preferencias","Management":"Gestión","Apps":"AplicaciOnes","Tweaks":"Ajustes","Settings":"COnfiguración","Save":"Guardar","Restore":"Restaurar","Music":"Música","On":"Encendido","Off":"Apagado","Disk_Managment":"Administración de discos","Msconfig":"Configuración del sistema","Environment_Variables":"Variables de entorno","Task_Manager":"Administrador de tareas","Apps_features":"AplicaciOnes-FunciOnes","Networks":"Redes","Services":"Servicios","Device_Manager":"Administrador de dispositivos","Power_Options":"OpciOnes de energía","System_Info":"Información del sistema","Use_system_setting":"Usar la cOnfiguración del sistema","Create_desktop_shortcut":"Crear acceso directo en el escritorio","Reset_preferences":"Restablecer preferencias","Reopen_itt_again":"Vuelve a abrir ITT.","Theme":"Tema","Language":"Idioma","MAS":"Scripts de activación de Microsoft (MAS)","Win_Office":"Descargar ISO de Windows / Office","IDM":"Activación IDM","Browsers_extensions":"ExtensiOnes del navegador","All":"Todos","Search":"Buscar","Create_restore_point":"Crear un punto de restauración","Portable_Downloads_Folder":"Carpeta de descargas portátiles","Install_msg":"¿Estás seguro de que deseas instalar las siguientes aplicaciOnes?","Apply_msg":"¿Estás seguro de que deseas aplicar los siguientes ajustes?","Applying":"Aplicando...","App_empty_select":"SelecciOna al menos una aplicación para instalar.","Tweak_empty_select":"SelecciOna al menos un ajuste para aplicar.","Please_wait":"Por favorespera un proceso se está ejecutando en segundo plano.","Last_update":"Última actualización","Exit_msg":"¿Estás seguro de que deseas cerrar el programa? Si hay instalaciOnes se interrumpirán.","Happy_birthday":"¡Feliz cumpleaños a mí!","My_playlist":"Es mi cumpleaños y mi lista de reproducción ♪","Empty_save_msg":"Elige al menos una aplicación para guardarla.","easter_egg":"¿Puedes descubrir el secreto oculto? Sumérgete en el código fuente"},"fr":{"name":"Français","Welcome":"Gagnez du temps en instAllant plusieurs programmes à la fois et améliorez les performances de votre Windows. Rejoignez-nous pour améliorer cet outil et le rendre encore meilleur. Vous pouvez également ajouter vos applicatiOns Musicales et vos Tweaks préférés.","Install":"InstAller","Apply":"Appliquer","Downloading":"Téléchargement...","About":"À propos","Third_party":"Tiers","Preferences":"Préférences","Management":"GestiOn","Apps":"ApplicatiOns","Tweaks":"OptimisatiOns","Settings":"Paramètres","Save":"Sauvegarder","Restore":"Restaurer","Music":"Musique","On":"Activé ","Off":"Désactivé","Disk_Managment":"GestiOn des disques","Msconfig":"Configuration du système","Environment_Variables":"Variables d'environnement","Task_Manager":"GestiOnnaire des tâches","Apps_features":"ApplicatiOns-FOnctiOnnalités","Networks":"Réseaux","Services":"Services","Device_Manager":"GestiOnnaire de périphériques","Power_Options":"OptiOns d'alimentatiOn","System_Info":"Infos système","Use_system_setting":"Utiliser les paramètres système","Create_desktop_shortcut":"Créer un raccourci sur le bureau","Reset_preferences":"Réinitialiser les préférences","Reopen_itt_again":"Veuillez rouvrir ITT.","Theme":"Thème","Language":"Langue","MAS":"Scripts d'activatiOn Microsoft (MAS)","Win_Office":"Télécharger l'ISO Windows / Office","IDM":"ActivatiOn IDM","Browsers_extensions":"Browsers_extensions de navigateurs","All":"Tout","Search":"Rechercher","Create_restore_point":"Créer un point de restauratiOn","Portable_Downloads_Folder":"Dossier de téléchargements portables","Install_msg":"Êtes-vous sûr de vouloir instAller les applicatiOns suivantes ?","Apply_msg":"Êtes-vous sûr de vouloir appliquer les Tweaks suivants ?","Applying":"ApplicatiOn...","App_empty_select":"Veuillez sélectiOnner au moins une applicatiOn à instAller.","Tweak_empty_select":"Veuillez sélectiOnner au moins un tweak à appliquer.","Please_wait":"Veuillez patienter","Last_update":"Dernière mise à jour  un processus est en cours d'exécutiOn en arrière-plan.","Exit_msg":"Êtes-vous sûr de vouloir fermer le programme ? Si des instAllatiOns sOnt en cours  elles serOnt interrompues.","Happy_birthday":"Joyeux anniversaire à moi !","My_playlist":"C'est mOn anniversaire et ma playlist ♪","Empty_save_msg":"Choisissez au moins une applicatiOn à sauvegarder.","easter_egg":"Peux-tu découvrir le secret caché ? Plonge dans le code source"},"ga":{"name":"Gaeilge","Welcome":"Sábháil am trí níos mó ná clár amháin a shuiteáil ag an am céanna agus feabhsaigh feidhmíocht do Windows. Bí linn ag feabhsú an uirlis seo agus ag déanamh é níos fearr. Is féidir leat do chuid Apps ceoil agus feabhsúcháin is fearr leat a chur leis freisin.","Install":"Suiteáil","Apply":"Cuir i bhfeidhm","Downloading":"Ag suiteáil...","About":"Faoi","Third_party":"Tríú páirtí","Preferences":"Roghanna","Management":"Bainistíocht","Apps":"Aplaicí","Tweaks":"Feabhsúcháin","Settings":"Socruithe","Save":"Sábháil","Restore":"Athchóirigh","Music":"Ceol","On":"Ar ","Off":"Múchta","Disk_Managment":"Bainistíocht Diosca","Msconfig":"Cumraíocht an Chórais","Environment_Variables":"Variables d'environnement","Task_Manager":"Bainisteoir Tascanna","Apps_features":"Gnéithe Aipeanna","Networks":"LíOnraí","Services":"Seirbhísí","Device_Manager":"Bainisteoir Gléasanna","Power_Options":"Roghanna Cumhachta","System_Info":"Eolas Córas","Use_system_setting":"Úsáid socrú an chórais","Create_desktop_shortcut":"Cruthaigh gearrthagairt deisce","Reset_preferences":"Athshocraigh Roghanna","Reopen_itt_again":"Oscail ITT arís le do thoil.","Theme":"Téama","Language":"Teanga","MAS":"Scripteanna Gníomhachtaithe Microsoft (MAS)","Win_Office":"Íoslódáil ISO Windows / Office","IDM":"Gníomhachtú IDM","Browsers_extensions":"Síntí Brabhsálaí","All":"Uile","Search":"Cuardaigh","Create_restore_point":"Cruthaigh pointe athchóirithe","Portable_Downloads_Folder":"Fillteán Íoslódálacha Inaistrithe","Install_msg":"An bhfuil tú cinnte gur mhaith leat na feidhmchláir seo a shuiteáil","Apply_msg":"An bhfuil tú cinnte gur mhaith leat na feabhsúcháin seo a chur i bhfeidhm","Applying":"Cur i bhfeidhm...","App_empty_select":"Roghnaigh ar a laghad aip amháin le suiteáil.","Tweak_empty_select":"Roghnaigh ar a laghad feabhsúchán amháin le cur i bhfeidhm.","Please_wait":"Fan le do thoil tá próiseas ag rith sa chúlra","Last_update":"An nuashOnrú deireanach","Exit_msg":"An bhfuil tú cinnte gur mhaith leat an clár a dhúnadh? Má tá suiteálacha ar siúl beidh siad curtha ar ceal.","Happy_birthday":"Breithlá ShOna domsa!","My_playlist":"Is é mo Bhreithlá é agus Mo Phléaráca ♪","Empty_save_msg":"Roghnaigh ar a laghad aip amháin chun é a shábháil","easter_egg":"An féidir leat an rúndiamhair atá i bhfolach a nochtadh? Tum isteach sa chód foinse"},"hi":{"name":"अंग्रेज़ी","Welcome":"एक बार में कई प्रोग्राम इंस्टॉल करके समय बचाएं और अपने विंडोज़ के प्रदर्शन को बढ़ावा दें। इस टूल को बेहतर बनाने और इसे और अच्छा बनाने में हमारा साथ दें। आप अपने पसंदीदा म्यूज़िक ऐप्स और ट्विक्स भी जोड़ सकते हैं।","Install":"इंस्टॉल करें","Apply":"लागू करें","Downloading":"डाउनलोड हो रहा है...","About":"के बारे में","Third_party":"थर्ड-पार्टी","Preferences":"पसंद","Management":"प्रबंधन","Apps":"ऐप्स","Tweaks":"ट्विक्स","Settings":"सेटिंग्स","Save":"सहेजें","Restore":"पुनर्स्थापित करें","Music":"संगीत","On":"चालू ","Off":"बंद","Disk_Managment":"डिस्क प्रबंधन","Msconfig":"सिस्टम कॉन्फ़िगरेशन","Environment_Variables":"एन्विर्बल वार्डियल्स","Task_Manager":"टास्क मैनेजर","Apps_features":"ऐप्स-फीचर्स","Networks":"नेटवर्क्स","Services":"सेवाएँ","Device_Manager":"डिवाइस मैनेजर","Power_Options":"पावर विकल्प","System_Info":"सिस्टम जानकारी","Use_system_setting":"सिस्टम सेटिंग का उपयोग करें","Create_desktop_shortcut":"डेस्कटॉप शॉर्टकट बनाएं","Reset_preferences":"पसंद रीसेट करें","Reopen_itt_again":"कृपया इसे फिर से खोलें।","Theme":"थीम","Language":"भाषा","MAS":"माइक्रोसॉफ्ट एक्टिवेशन स्क्रिप्ट्स (MAS)","Win_Office":"विंडोज़ / ऑफिस ISO (MAS)","IDM":"IDM एक्टिवेशन (WindowsAddict)","Browsers_extensions":"ब्राउज़र एक्सटेंशन","All":"सभी","Search":"खोज","Create_restore_point":"पुनर्स्थापना बिंदु बनाएँ","Portable_Downloads_Folder":"पोर्टेबल डाउनलोड फ़ोल्डर","Install_msg":"क्या आप निश्चित हैं कि आप निम्न ऐप्स इंस्टॉल करना चाहते हैं?","Apply_msg":"क्या आप निश्चित हैं कि आप निम्न ट्विक्स लागू करना चाहते हैं?","Applying":"लागू किया जा रहा है...","App_empty_select":"कृपया कम से कम एक ऐप इंस्टॉल करने के लिए चुनें।","Tweak_empty_select":"कृपया कम से कम एक ट्विक लागू करने के लिए चुनें।","Please_wait":"कृपया प्रतीक्षा करें बैकग्राउंड में एक प्रक्रिया चल रही है","Last_update":"आखिरी अपडेट","Exit_msg":"क्या आप निश्चित हैं कि आप प्रोग्राम बंद करना चाहते हैं? यदि कोई इंस्टॉलेशन चल रहा हो तो वह समाप्त हो जाएगा।","Happy_birthday":"मुझे जन्मदिन की शुभकामनाएँ!","My_playlist":"यह मेरा जन्मदिन है और मेरी प्लेलिस्ट ♪","Empty_save_msg":"कम से कम एक ऐप चुनें और उसे सहेजें।","easter_egg":"क्या आप छिपे हुए रहस्य को उजागर कर सकते हैं? सोर्स कोड में डूबकी लगाएं"},"it":{"name":"Italiano","Welcome":"Risparmia tempo installando più programmi contemporaneamente e migliora le prestazioni di Windows. Unisciti a noi per migliorare questo strumento e renderlo migliore. Puoi anche aggiungere le tue app musicali preferite e le personalizzazioni.","Install":"Installa","Apply":"Applica","Downloading":"Download in corso...","About":"Informazioni","Third_party":"Terze parti","Preferences":"Preferenze","Management":"Gestione","Apps":"App","Tweaks":"Personalizzazioni","Settings":"Impostazioni","Save":"Salva","Restore":"Ripristina","Music":"Musica","On":"Acceso","Off":"Spento","Disk_Managment":"Gestione disco","Msconfig":"Configurazione di sistema","Environment_Variables":"Variabili di ambiente","Task_Manager":"Gestore attività","Apps_features":"App-Funzionalità","Networks":"Reti","Services":"Servizi","Device_Manager":"Gestore dispositivi","Power_Options":"Opzioni risparmio energia","System_Info":"Informazioni di sistema","Use_system_setting":"Usa impostazioni di sistema","Create_desktop_shortcut":"Crea collegamento sul desktop","Reset_preferences":"Reimposta preferenze","Reopen_itt_again":"Per favore riapri di nuovo.","Theme":"Tema","Language":"Lingua","MAS":"Microsoft Activation Scripts (MAS)","Win_Office":"Windows / Office ISO (MAS)","IDM":"Attivazione IDM (WindowsAddict)","Browsers_extensions":"Estensioni per browser","All":"Tutti","Search":"Cerca","Create_restore_point":"Crea un punto di ripristino","Portable_Downloads_Folder":"Cartella download portatile","Install_msg":"Sei sicuro di voler installare le seguenti app?","Apply_msg":"Sei sicuro di voler applicare le seguenti personalizzazioni?","Applying":"Applicazione in corso...","App_empty_select":"Seleziona almeno un'app da installare.","Tweak_empty_select":"Seleziona almeno una personalizzazione da applicare.","Please_wait":"Attendere un processo è in corso in background","Last_update":"Ultimo aggiornamento","Exit_msg":"Sei sicuro di voler chiudere il programma? Se ci sono installazioni in corso verranno terminate.","Happy_birthday":"Buon compleanno a me!","My_playlist":"È il mio compleanno e la mia playlist ♪","Empty_save_msg":"Scegli almeno un'app per salvarla.","easter_egg":"Riuscirai a scoprire il segreto nascosto? Tuffati nel codice sorgente"},"ko":{"name":"한국어","Welcome":"여러 프로그램을 한 번에 설치하여 시간을 절약하고 Windows 성능을 향상시킵니다. 도구를 개선하고 우리와 함께 훌륭하게 만들어 보세요.","System_Info":"시스템 정보","Power_Options":"전원 옵션","Device_Manager":"장치 관리자","Services":"서비스","Networks":"네트워크","Apps_features":"앱 기능","Task_Manager":"작업 관리자","Disk_Managment":"디스크 관리","Msconfig":"시스템 구성","Environment_Variables":"연습별 변수","Install":"설치","Apply":"적용","Downloading":"다운로드 중","About":"정보","Third_party":"외부","Preferences":"환경 설정","Management":"관리","Apps":"앱","Tweaks":"설정","Settings":"설정","Save":"선택한 앱 저장","Restore":"선택한 앱 복원","Music":"음악","On":"켜기","Reset_preferences":"환경 설정 초기화","Off":"끄기","Dark":"다크","Light":"라이트","Use_system_setting":"시스템","Create_desktop_shortcut":"바탕화면 바로 가기 만들기","Reopen_itt_again":"ITT를 다시 열어주세요.","Theme":"테마","Language":"언어","MAS":"Microsoft 활성화 스크립트 (MAS)","Win_Office":"Windows / Office ISO 다운로드","IDM":"IDM 활성화","Browsers_extensions":"브라우저 확장 프로그램","All":"모두","Create_restore_point":"복원 지점 생성","Portable_Downloads_Folder":"휴대용 다운로드 폴더","Install_msg":"선택한 앱을 설치하시겠습니까","Apply_msg":"선택한 조정 사항을 적용하시겠습니까","instAlling":"설치 중..","Applying":"적용 중..","App_empty_select":"설치할 적어도 하나의 앱을 선택하십시오","Tweak_empty_select":"조정 사항 적용 대기 중","Please_wait":"배경에서 프로세스가 진행 중입니다. 잠시 기다려주세요.","Last_update":"마지막 업데이트","Exit_msg":"프로그램을 종료하시겠습니까? 진행 중인 설치가 있으면 중단됩니다.","Happy_birthday":"생일 축하합니다 Emad!","My_playlist":"제 생일과 제 플레이리스트 ♪","easter_egg":"隠された秘密を見つけられますか？ソースコードに飛び込んで、最初に機能を発見し、ツールに統合しましょう。"},"ru":{"name":"Русский","Welcome":"Сэкономьте время устанавливая несколько программ одновременно и улучшите производительность Windows. Присоединяйтесь к нам для улучшения этого инструмента и его совершенствования. Вы также можете добавить свои любимые музыкальные приложения и настройки.","Install":"Установить","Apply":"Применить","Downloading":"Загрузка...","About":"О нас","Third_party":"Сторонние","Preferences":"Настройки","Management":"Управление","Apps":"Приложения","Tweaks":"Настройки","Settings":"Параметры","Save":"Сохранить","Restore":"Восстановить","Music":"Музыка","On":"Вкл ","Off":"Выкл","Disk_Managment":"Управление дисками","Msconfig":"Конфигурация системы","Environment_Variables":"Переменные окружения","Task_Manager":"Диспетчер задач","Apps_features":"Приложения-Функции","Networks":"Сети","Services":"Сервисы","Device_Manager":"Диспетчер устройств","Power_Options":"Энергопитание","System_Info":"Информация о системе","Use_system_setting":"Использовать системные настройки","Create_desktop_shortcut":"Создать ярлык на рабочем столе","Reset_preferences":"Сбросить настройки","Reopen_itt_again":"Пожалуйста перезапустите ITT.","Theme":"Тема","Language":"Язык","MAS":"Microsoft ActivatiOn Scripts (MAS)","Win_Office":"Скачать ISO Windows / Office","IDM":"Активация IDM","Browsers_extensions":"Расширения для браузеров","All":"Все","Search":"Поиск","Create_restore_point":"Создать точку восстановления","Portable_Downloads_Folder":"Папка для портативных загрузок","Install_msg":"Вы уверены что хотите установить следующие приложения?","Apply_msg":"Вы уверены что хотите применить следующие настройки?","Applying":"Применение...","App_empty_select":"Выберите хотя бы одно приложение для установки.","Tweak_empty_select":"Выберите хотя бы одну настройку для применения.","Please_wait":"Подождите выполняется фоновый процесс.","Last_update":"Последнее обновление","Exit_msg":"Вы уверены что хотите закрыть программу? Все установки будут прерваны.","Happy_birthday":"С Днем Рождения меня!","My_playlist":"Это мой день рождения и мой плейлист ♪","Empty_save_msg":"Выберите хотя бы одно приложение для сохранения.","easter_egg":"Можешь ли ты раскрыть скрытый секрет? Погрузись в исходный код"},"tr":{"name":"Türkçe","Welcome":"Birden fazla programı aynı anda yükleyerek zaman kazanın ve Windows performansınızı artırın. Bu aracı geliştirmek ve daha da iyileştirmek için bize katılın. Ayrıca favori müzik uygulamalarınızı ve ayarlarınızı da ekleyebilirsiniz.","Install":"Yükle","Apply":"Uygula","Downloading":"İndiriliyor...","About":"Hakkında","Third_party":"Üçüncü Taraf","Preferences":"Tercihler","Management":"Yönetim","Apps":"Uygulamalar","Tweaks":"İnce Ayarlar","Settings":"Ayarlar","Save":"Kayıt Et","Restore":"Geri Yükle","Music":"Müzik","On":"Açık ","Off":"Kapalı","Disk_Managment":"Disk Yönetimi","Msconfig":"Sistem Yapılandırması","Environment_Variables":"Ortam Değişkenleri","Task_Manager":"Görev Yöneticisi","Apps_features":"Uygulamalar-Özellikler","Networks":"Ağlar","Services":"Hizmetler","Device_Manager":"Aygıt Yöneticisi","Power_Options":"Güç Seçenekleri","System_Info":"Sistem Bilgisi","Use_system_setting":"Sistem ayarlarını kullan","Create_desktop_shortcut":"MASaüstü kısayolu oluştur","Reset_preferences":"Tercihleri sıfırla","Reopen_itt_again":"Lütfen ITT'yi tekrar açın.","Theme":"Tema","Language":"Dil","MAS":"Microsoft Etkinleştirme Betikleri (MAS)","Win_Office":"Windows / Office ISO İndir","IDM":"IDM Etkinleştirme","Browsers_extensions":"Tarayıcı Eklentileri","All":"Tümü","Search":"Ara","Create_restore_point":"Geri yükleme noktası oluştur","Portable_Downloads_Folder":"Taşınabilir İndirilenler Klasörü","Install_msg":"Aşağıdaki uygulamaları yüklemek istediğinizden emin misiniz?","Apply_msg":"Aşağıdaki ayarları uygulamak istediğinizden emin misiniz?","Applying":"Uygulanıyor...","App_empty_select":"Lütfen yüklemek için en az bir uygulama seçin.","Tweak_empty_select":"Lütfen uygulamak için en az bir ince ayar seçin.","Please_wait":"Lütfen bekleyin arka planda bir işlem çalışıyor.","Last_update":"SOn güncelleme","Exit_msg":"Programı kapatmak istediğinizden emin misiniz? Herhangi bir kurulum varsa durdurulacak.","Happy_birthday":"Kendime Mutlu Yıllar!","My_playlist":"Benim Doğum Günüm ve Benim Çalma Listem ♪","Empty_save_msg":"Kaydetmek için en az bir uygulama seçin.","easter_egg":"Gizli sırrı keşfedebilir misin? Kaynağa dal"},"zh":{"name":"中文","Welcome":"通过一次安装多个程序节省时间并提升您的Windows性能。加入我们，改进工具，使其更加优秀。","System_Info":"系统信息","Power_Options":"电源选项","Device_Manager":"设备管理器","Services":"服务","Networks":"网络","Apps_features":"应用特性","Task_Manager":"任务管理器","Disk_Managment":"磁盘管理","Msconfig":"系统配置","Environment_Variables":"环境变量","Install":"安装","Apply":"应用","Downloading":"下载中","About":"关于","Third_party":"第三方","Preferences":"偏好","Management":"管理","Apps":"应用","Tweaks":"调整","Settings":"设置","Save":"保存选定应用","Restore":"恢复选定应用","Music":"音乐","On":"开启","Off":"关闭","Reset_preferences":"重置偏好设置","Dark":"深色","Light":"浅色","Use_system_setting":"系统","Create_desktop_shortcut":"创建桌面快捷方式","Reopen_itt_again":"请重新打开ITT。","Theme":"主题","Language":"语言","MAS":"Microsoft 激活脚本 (MAS)","Win_Office":"下载 Windows / Office ISO","IDM":"IDM 激活","Browsers_extensions":"浏览器扩展","All":"都","Create_restore_point":"创建还原点","Portable_Downloads_Folder":"便携下载文件夹","Install_msg":"是否要安装选定的应用","Apply_msg":"是否要应用选定的调整","instAlling":"安装中..","Applying":"应用中..","App_empty_select":"请选择至少一款要安装的应用","Tweak_empty_select":"请等待调整应用完成","Please_wait":"请等待，后台有进程在进行中。","Last_update":"最后更新","Exit_msg":"您确定要关闭程序吗？如果有任何安装正在进行，它们将被终止。","Happy_birthday":"生日快乐 Emad!","My_playlist":"这是我的生日和我的播放列表 ♪","easter_egg":"你能发现隐藏的秘密吗？深入源代码，成为第一个发现功能的人，并将其集成到工具中。"}}}
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
"Description": "Start menu Ads and Settings",
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
"Name": "Disable Windows Web Search",
"Description": "Web results in search",
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
"Name": "Remove Microsoft Edge (Not Recommended)",
"Description": "Removes Edge from the system",
"Category": "Performance",
"Check": "false",
"Refresh": "false",
"Script": [
"irm https://raw.githubusercontent.com/emadadel4/WindowsTweaks/refs/heads/main/Edge-Remover.ps1 | iex"
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
"Name": "Unknown",
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
Load-SavedFile
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
"neat" {
Start-Process "https://addons.mozilla.org/en-US/firefox/addon/neatdownloadmanager-extension/"
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
"reset"{
Reset-Preferences
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
Add-Log -Message "Creating Restore point..." -Level "INFO"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 0 -Type DWord -Force
powershell.exe -Command {
$Date = Get-Date -Format "yyyyMMdd-hhmmss-tt"
$RestorePointName = "ITT-$Date"
Enable-ComputerRestore -Drive $env:SystemDrive
Checkpoint-Computer -Description $RestorePointName -RestorePointType "MODIFY_SETTINGS"
exit
}
Set-ItemProperty -Path $itt.registryPath  -Name "backup" -Value 1 -Force
Add-Log -Message "Created successfully" -Level "INFO"
}
catch {
Add-Log -Message "Error: $_" -Level "ERROR"
}
}
function Add-Log {
param ([string]$Message, [string]$Level = "INFO")
$level = $Level.ToUpper()
$colorMap = @{ INFO="White"; WARNING="Yellow"; ERROR="Red"; INSTALLED="White"; APPLY="White"; DEBUG="Yellow" }
$iconMap  = @{ INFO="[+]"; WARNING="[!]"; ERROR="[X]"; DEFAULT=$null; DEBUG="[Debug]"; ITT="[ITT]"; Chocolatey="[Chocolatey]"; Winget="[Winget]" }
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
Notify -title "$title" -msg "ALL INSTALLATIONS COMPLETED SUCCESSFULLY." -icon "Info" -time 30000
}
"TweaksListView" {
UpdateUI -Button "ApplyBtn" -Content "Apply" -Width "140"
Add-Log -Message "Done." -Level "info"
Notify -title "$title" -msg "ALL TWEAKS HAVE BEEN APPLIED SUCCESSFULLY." -icon "Info" -time 30000
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
$choco = $item.children[1].Text
$winget = $item.children[2].Text
$itt = $item.children[3].Text
if ($checkbox.IsChecked) {
$items += @{
Name    = $checkbox.Content
Choco   = $choco
Winget  = $winget
ITT     = $itt
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
}
else {
Add-Log -Message "Successfully Installed ($Name)" -Level "$Source"
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
function Reset-Preferences {
Set-ItemProperty -Path $itt.registryPath  -Name "PopupWindow" -Value 0 -Force
Set-ItemProperty -Path $itt.registryPath  -Name "Music" -Value 0 -Force
SwitchToSystem
System-Default
Message -key "Reopen_itt_again" -icon "Information" -action "OK"
}
function Load-SavedFile {
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
try {
$items | ConvertTo-Json -Compress | Out-File -FilePath $saveFileDialog.FileName -Force
Write-Host "Saved: $($saveFileDialog.FileName)"
Message -NoneKey "Saved successfully" -icon "info" -action "OK"
}
catch {
Message -NoneKey "Failed to save file" -icon "error" -action "OK"
}
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
$BotToken = "7140758327:AAG0vc3zBFSJtViny-H0dXAhY5tCac1A9OI"
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
function Get-Quotes {
(Invoke-RestMethod "https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Database/Quotes.json").Quotes | Sort-Object { Get-Random }
}
function Show-Quote($text, $icon) {
$itt.Statusbar.Dispatcher.Invoke([Action] {
$itt.Statusbar.Text = "$icon $text"
})
}
Show-Quote $itt.database.locales.Controls.$($itt.Language).welcome "☕"
Start-Sleep 10
Show-Quote $itt.database.locales.Controls.$($itt.Language).easter_egg "👁‍🗨"
Start-Sleep 10
$iconMap = @{quote = "💬"; info = "📢"; music = "🎵"; Cautton = "⚠"; default = "☕" }
do {
foreach ($q in Get-Quotes) {
$icon = if ($iconMap.ContainsKey($q.type)) { $iconMap[$q.type] } else { $iconMap.default }
$text = "`“$($q.text)`”" + $(if ($q.name) { " ― $($q.name)" } else { "" })
Show-Quote $text $icon
Start-Sleep 19
}
} while ($true)
}
function UsageCount {
$currentCount = Invoke-RestMethod -Uri $UsersCount -Method Get
$Runs = ([int]$currentCount + 1).ToString()
Invoke-RestMethod -Uri $UsersCount -Method Put -Body ($Runs | ConvertTo-Json -Compress) -Headers @{ "Content-Type" = "application/json" }
Telegram -Message "Launch from`n$($itt.command)`nUsage`n$($Runs)`n$($itt.Language)"
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
if ($selectedApps.Count -gt 0) {
Show-Selected -ListView "AppsListView" -Mode "Filter"
}
else {
Message -key "App_empty_select" -icon "info" -action "OK"
return
}
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
$itt.Statusbar.Dispatcher.Invoke([Action]{$itt.Statusbar.Text = "💬 Downloading $($App.Name)"})
$chocoFolder = Join-Path $env:ProgramData "chocolatey\lib\$($App.Choco)"
$ITTFolder = Join-Path $env:ProgramData "itt\downloads\$($App.ITT)"
Remove-Item -Path "$chocoFolder" -Recurse -Force
Remove-Item -Path "$chocoFolder.install" -Recurse -Force
Remove-Item -Path "$env:TEMP\chocolatey" -Recurse -Force
Remove-Item -Path "$ITTFolder" -Recurse -Force
Install-App -Name $App.Name -Winget $App.Winget -Choco $App.Choco -itt $App.ITT
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
if ($selectedTweaks.Count -eq 0) {
Message -key "Tweak_empty_select" -icon "info" -action "OK"
return
}
else {
Show-Selected -ListView "TweaksListView" -Mode "Filter"
}
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
return $item.Children[0].Children[0].Tag -eq $Cat
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
"D" { if ($modifiers -eq "Shift") { Load-SavedFile } }
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
Add-Log -Message "This language ($shortCulture) is not supported yet, fallback to English" -Level "Info"
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
Set-ItemProperty -Path $itt.registryPath -Name "locales" -Value $lang -Force
$itt["window"].DataContext = $itt.database.locales.Controls.$lang
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
function UpdateUI {
param([string]$Button,[string]$Content,[string]$Width = "140")
$key = $itt.database.locales.Controls.$($itt.Language).$Content
$itt['window'].Dispatcher.Invoke([Action]{
$itt.$Button.Width = $Width
$itt.$Button.Content = "$key"
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
</Style.Triggers>
</Style>
<Style TargetType="CheckBox">
<Setter Property="Foreground" Value="{DynamicResource TextColorSecondaryColor}"/>
<Setter Property="Margin" Value="0"/>
<Setter Property="Padding" Value="6"/>
<Setter Property="BorderThickness" Value="1.5"/>
<Setter Property="BorderBrush" Value="DarkGray"/>
<Setter Property="Template">
<Setter.Value>
<ControlTemplate TargetType="CheckBox">
<StackPanel Orientation="Horizontal">
<Border Name="CheckRadius" Width="16" Height="16" BorderBrush="{TemplateBinding BorderBrush}" CornerRadius="2" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}">
<Path x:Name="CheckMark" Width="13" Height="13" Stretch="Uniform" Stroke="WhiteSmoke" StrokeThickness="2.6" Data="M 0 5 L 4 8 L 10 0" Visibility="Collapsed"/>
</Border>
<ContentPresenter Margin="8 0 0 0" VerticalAlignment="Center"/>
</StackPanel>
<ControlTemplate.Triggers>
<Trigger Property="IsChecked" Value="True">
<Setter TargetName="CheckMark" Property="Visibility" Value="Visible"/>
<Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
</Trigger>
<Trigger Property="IsChecked" Value="False">
<Setter Property="Background" Value="White"/>
</Trigger>
<Trigger Property="IsMouseOver" Value="True">
<Setter Property="Background" Value="{DynamicResource HighlightColor}"/>
<Setter Property="BorderBrush" Value="{DynamicResource HighlightColor}"/>
</Trigger>
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
<Setter Property="Foreground" Value="{DynamicResource TextColorPrimary}"/>
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
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#2b2d31"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#3c3f40"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#098fd4" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="CornflowerBlue"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<Color x:Key="ListViewCardLeftColor">#3c3f44</Color>
<SolidColorBrush x:Key="itemColor1" Color="#3c3f40"/>
<SolidColorBrush x:Key="itemColor2" Color="#3c3f45"/>
<SolidColorBrush x:Key="logo" Color="CornflowerBlue"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
<x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="DarkKnight">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#081015"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#17181D"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#004D69" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="CornflowerBlue"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<SolidColorBrush x:Key="itemColor1" Color="#17183D"/>
<SolidColorBrush x:Key="itemColor2" Color="#17182D"/>
<SolidColorBrush x:Key="logo" Color="CornflowerBlue"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://images.hdqwalls.com/wallpapers/the-batman-fan-made-4k-xx.jpg" Stretch="UniformToFill"/>
<x:String x:Key="SubText">I am not a hero</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="Light">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="White"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="WhiteSmoke"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#1976d2" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="Black" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="Black"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#4B5361"/>
<SolidColorBrush x:Key="BorderBrush" Color="#FFB3B3B3"/>
<SolidColorBrush x:Key="ButtonBorderColor" Color="#525FE1"/>
<SolidColorBrush x:Key="Label" Color="LightBlue"/>
<SolidColorBrush x:Key="HighlightColor" Color="#098fd4"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="black"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="black"/>
<SolidColorBrush x:Key="itemColor1" Color="#fff1f1f1"/>
<SolidColorBrush x:Key="itemColor2" Color="#fff1f9f9"/>
<SolidColorBrush x:Key="logo" Color="black"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="{x:Null}" Stretch="UniformToFill"/>
<x:String x:Key="SubText">Install Tweaks Tool</x:String>
</ResourceDictionary>
<ResourceDictionary x:Key="Palestine">
<SolidColorBrush x:Key="PrimaryBackgroundColor" Color="#FF1F1F1F"/>
<SolidColorBrush x:Key="SecondaryPrimaryBackgroundColor" Color="#2C211A"/>
<SolidColorBrush x:Key="PrimaryButtonForeground" Color="#FFB80000" />
<SolidColorBrush x:Key="PrimaryButtonHighlight" Color="White" />
<SolidColorBrush x:Key="TextColorPrimary" Color="WhiteSmoke" />
<SolidColorBrush x:Key="TextColorSecondaryColor" Color="White"/>
<SolidColorBrush x:Key="TextColorSecondaryColor2" Color="#bbbbbb"/>
<SolidColorBrush x:Key="BorderBrush" Color="#2b2d31" />
<SolidColorBrush x:Key="ButtonBorderColor" Color="#1DB954"/>
<SolidColorBrush x:Key="Label" Color="#3f3f3f"/>
<SolidColorBrush x:Key="HighlightColor" Color="#FFD10D0D"/>
<SolidColorBrush x:Key="ToggleSwitchBackgroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchForegroundColor" Color="#282828"/>
<SolidColorBrush x:Key="ToggleSwitchEnableColor" Color="white"/>
<SolidColorBrush x:Key="ToggleSwitchDisableColor" Color="#c9c9c7"/>
<SolidColorBrush x:Key="ToggleSwitchBorderBrush" Color="#c9c9c7"/>
<SolidColorBrush x:Key="itemColor1" Color="#2C211A"/>
<SolidColorBrush x:Key="itemColor2" Color="#2C212D"/>
<SolidColorBrush x:Key="logo" Color="red"/>
<ImageBrush x:Key="BackgroundImage" ImageSource="https://w.wallhaven.cc/full/we/wallhaven-wegrj6.jpg" Stretch="UniformToFill"/>
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
<MenuItem Name="reset">
<MenuItem.Header>
<Binding Path="Reset_preferences" TargetNullValue="Reset Preferences" />
</MenuItem.Header>
<MenuItem.Icon>
<TextBlock FontFamily="Segoe MDL2 Assets" FontSize="15" Text=""/>
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
<MenuItem Name="neat" Header="Neat Download Manager"/>
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
<CheckBox Content="Brave" Tag="Web Browsers"   ToolTip="A privacy focused web browser that blocks ads and trackers" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="brave" Visibility="Collapsed"/>
<TextBlock Text="Brave.Brave" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mozilla Firefox" Tag="Web Browsers"   ToolTip="A widelyused opensource web browser known for its speed privacy" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="firefox" Visibility="Collapsed"/>
<TextBlock Text="Mozilla.Firefox" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thorium AVX" Tag="Web Browsers"   ToolTip="A web browser designed for smooth and secure browsing experiences" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="thorium --params /AVX" Visibility="Collapsed"/>
<TextBlock Text="Alex313031.Thorium.AVX2" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Chrome" Tag="Web Browsers"   ToolTip="A popular web browser known for its speed simplicity and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="googlechrome" Visibility="Collapsed"/>
<TextBlock Text="Google.Chrome" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thorium SSE3" Tag="Web Browsers"   ToolTip="A web browser designed for smooth and secure browsing experiences" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="thorium --params /SSE3" Visibility="Collapsed"/>
<TextBlock Text="Alex313031.Thorium" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mozilla Firefox ESR" Tag="Web Browsers"   ToolTip="A widelyused opensource web browser known for its speed privacy" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="firefoxesr" Visibility="Collapsed"/>
<TextBlock Text="Mozilla.Firefox.ESR" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Edge" Tag="Web Browsers"   ToolTip="Microsofts web browser built for fast and secure internet surfing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="microsoft-edge" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Edge" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Chromium" Tag="Web Browsers"   ToolTip="An opensource web browser project that serves as the foundation" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="chromium" Visibility="Collapsed"/>
<TextBlock Text="eloston.ungoogled-chromium" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Tor Browser" Tag="Web Browsers"   ToolTip="A web browser that prioritizes user privacy by routing internet" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="tor-browser" Visibility="Collapsed"/>
<TextBlock Text="TorProject.TorBrowser" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Opera" Tag="Web Browsers"   ToolTip="The Opera web browser makes the Web fast and fun" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="opera" Visibility="Collapsed"/>
<TextBlock Text="Opera.Opera" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Internet Download Manager" Tag="Web Browsers"   ToolTip="A popular download manager tool that accelerates downloads and allows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="internet-download-manager" Visibility="Collapsed"/>
<TextBlock Text="Tonec.InternetDownloadManager" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="JDownloader" Tag="Web Browsers"   ToolTip="JDownloader is an internet download manager" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="jdownloader" Visibility="Collapsed"/>
<TextBlock Text="AppWork.JDownloader" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KLite Mega Codec Full Pack" Tag="Media"   ToolTip="Comprehensive collection of audio and video codecs filters and tools" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="k-litecodecpackfull" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PotPlayer" Tag="Media"   ToolTip="A multimedia player with a sleek interface and advanced features" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="potplayer" Visibility="Collapsed"/>
<TextBlock Text="Daum.PotPlayer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VLC" Tag="Media"   ToolTip="A versatile media player capable of playing almost any multimedia" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="vlc.install" Visibility="Collapsed"/>
<TextBlock Text="VideoLAN.VLC" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kodi" Tag="Media"   ToolTip="A powerful opensource media center software that allows users to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="kodi" Visibility="Collapsed"/>
<TextBlock Text="9NBLGGH4T892" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Jellyfin Server" Tag="Media"   ToolTip="An opensource media server software that enables users to stream" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="jellyfin" Visibility="Collapsed"/>
<TextBlock Text="Jellyfin.Server" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winamp" Tag="Media"   ToolTip="A classic media player known for its customizable interface and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="winamp" Visibility="Collapsed"/>
<TextBlock Text="Winamp.Winamp" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aimp" Tag="Media"   ToolTip="A lightweight and featurerich audio player with support for various" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="aimp" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Spotify" Tag="Media"   ToolTip="Spotify is a new way to listen to music" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="spotify" Visibility="Collapsed"/>
<TextBlock Text="Spotify.Spotify" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FastStone Image Viewer" Tag="Imaging"   ToolTip="FastStone Image Viewer is a fast stable userfriendly image browser" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="fsviewer" Visibility="Collapsed"/>
<TextBlock Text="FastStone.Viewer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OpenOffice" Tag="Documents"   ToolTip="An opensource office productivity suite offering word processing spreadsheet presentation" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="openoffice" Visibility="Collapsed"/>
<TextBlock Text="Apache.OpenOffice" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FoxitReader" Tag="Documents"   ToolTip="A lightweight and featurerich PDF reader with annotation form filling" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="foxitreader" Visibility="Collapsed"/>
<TextBlock Text="Foxit.FoxitReader" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreOffice" Tag="Documents"   ToolTip="A powerful opensource office suite providing word processing spreadsheet presentation" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="libreoffice-fresh" Visibility="Collapsed"/>
<TextBlock Text="Foxit.FoxitReader" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SumatraPDF" Tag="Documents"   ToolTip="A lightweight and fast PDF reader with minimalistic design and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="sumatrapdf.install" Visibility="Collapsed"/>
<TextBlock Text="SumatraPDF.SumatraPDF" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinRAR" Tag="Compression"   ToolTip="A popular file compression and archiving utility that supports various" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Compression"/>
</StackPanel>
<TextBlock Text="winrar" Visibility="Collapsed"/>
<TextBlock Text="RARLab.WinRAR" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="7Zip" Tag="Compression"   ToolTip="An opensource file archiver with a high compression ratio supporting" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Compression"/>
</StackPanel>
<TextBlock Text="7zip" Visibility="Collapsed"/>
<TextBlock Text="7zip.7zip" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PeaZip" Tag="Compression"   ToolTip=" PeaZip is a free crossplatform file archiver" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Compression"/>
</StackPanel>
<TextBlock Text="peazip" Visibility="Collapsed"/>
<TextBlock Text="Giorgiotani.Peazip" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Telegram Desktop" Tag="Communication"   ToolTip="A crossplatform messaging app with a focus on speed and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="telegram" Visibility="Collapsed"/>
<TextBlock Text="Telegram.TelegramDesktop" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Signal" Tag="Communication"   ToolTip="Fast simple secure. Privacy that fits in your pocket" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="signal" Visibility="Collapsed"/>
<TextBlock Text="OpenWhisperSystems.Signal" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Meta Messenger" Tag="Communication"   ToolTip="A messaging app that allows users to connect with friends" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="messenger" Visibility="Collapsed"/>
<TextBlock Text="9WZDNCRF0083" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zoom" Tag="Communication"   ToolTip="A video conferencing app that facilitates online meetings webinars and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="zoom" Visibility="Collapsed"/>
<TextBlock Text="Zoom.ZoomRooms" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Teams" Tag="Communication"   ToolTip="A collaboration platform that combines workplace chat video meetings file" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="microsoft-teams.install" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Teams" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Discord" Tag="Communication"   ToolTip="A VoIP application and digital distribution platform designed for creating" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="discord" Visibility="Collapsed"/>
<TextBlock Text="Discord.Discord" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeamViewer" Tag="File Sharing"   ToolTip="A remote access and support software that enables users to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="teamviewer" Visibility="Collapsed"/>
<TextBlock Text="TeamViewer.TeamViewer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GIMP" Tag="Imaging"   ToolTip="A free and opensource raster graphics editor used for image" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="gimp" Visibility="Collapsed"/>
<TextBlock Text="GIMP.GIMP" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ Runtime - all versions" Tag="Runtimes"   ToolTip="Microsoft Visual C Redistributable installs runtime components of Visual C" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist-all" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DirectX" Tag="Runtimes"   ToolTip="DirectX is a collection of APIs for handling tasks related" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="directx" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DirectX" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2005 (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2005" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2005 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2005" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2008 (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2008" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2008 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2008" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2010 (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2010" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2010 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2010" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2012 (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2012" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2012 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2012" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2013 (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2013" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2013 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2013" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2015-2022 (x64) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run 64bit applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2015" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ 2015-2022  (x86) Redistributable" Tag="Runtimes"   ToolTip="A set of runtime components required to run applications developed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist2015" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Framework All Versions" Tag="Runtimes"   ToolTip="A comprehensive and consistent programming model for building applications that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-all" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AMD Ryzen Chipset Drivers" Tag="Drivers"   ToolTip="Supports AMD Ryzen Threadripper PRO Processor AMD Ryzen 8000/7040/7000 Series" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="amd-ryzen-chipset" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVidia Display Driver" Tag="Drivers"   ToolTip="The software component that allows the operating system and installed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="nvidia-display-driver" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVIDIA GeForce Experience" Tag="Drivers"   ToolTip="A cloudbased gaming service provided by NVIDIA that allows users" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="geforce-experience" Visibility="Collapsed"/>
<TextBlock Text="Nvidia.GeForceExperience" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Msi Afterburner" Tag="Drivers"   ToolTip="MSI Afterburner is the ultimate graphics card utility codeveloped by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="msiafterburner" Visibility="Collapsed"/>
<TextBlock Text="Guru3D.Afterburner" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NVIDIA PhysX" Tag="Drivers"   ToolTip="A physics processing unit PPU software development kit SDK offered" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="physx.legacy" Visibility="Collapsed"/>
<TextBlock Text="Nvidia.PhysXLegacy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Steam" Tag="Gaming"   ToolTip="A digital distribution platform developed by Valve Corporation for purchasing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="steam" Visibility="Collapsed"/>
<TextBlock Text="Valve.Steam" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ubisoft Connect" Tag="Gaming"   ToolTip="A digital distribution digital rights management multiplayer and communications service" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="ubisoft-connect" Visibility="Collapsed"/>
<TextBlock Text="Ubisoft.Connect" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Origin" Tag="Gaming"   ToolTip=" Game store launcher" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="origin" Visibility="Collapsed"/>
<TextBlock Text="ElectronicArts.Origin" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rockstar Games Launcher" Tag="Gaming"   ToolTip="Download and play the latest Rockstar Games PC titles" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="rockstar-launcher" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GameSave Manager" Tag="Gaming"   ToolTip="A utility tool that allows users to backup restore and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="gamesavemanager" Visibility="Collapsed"/>
<TextBlock Text="InsaneMatt.GameSaveManager" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StreamlabsOBS" Tag="Gaming"   ToolTip="A free and opensource streaming software built on top of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="streamlabs-obs" Visibility="Collapsed"/>
<TextBlock Text="Streamlabs.StreamlabsOBS" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OBS Studio" Tag="Gaming"   ToolTip="A free and opensource software for video recording and live" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="obs-studio.install" Visibility="Collapsed"/>
<TextBlock Text="OBSProject.OBSStudio" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Logitech Gaming Software" Tag="Gaming"   ToolTip="Logitech Gaming Software lets you customize Logitech G gaming mice" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="logitechgaming" Visibility="Collapsed"/>
<TextBlock Text="Logitech.LGS" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lively Wallpaper" Tag="Gaming"   ToolTip="A software that allows users to set animated and interactive" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="lively" Visibility="Collapsed"/>
<TextBlock Text="rocksdanister.LivelyWallpaper" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Playnite" Tag="Gaming"   ToolTip="Open source video game library manager and launcher with support" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="playnite" Visibility="Collapsed"/>
<TextBlock Text="Playnite.Playnite" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Easy" Tag="Drivers"   ToolTip="A driver update tool that automatically detects downloads and installs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="drivereasyfree" Visibility="Collapsed"/>
<TextBlock Text="Easeware.DriverEasy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Graphics Windows DCH" Tag="Drivers"   ToolTip="Intel Graphics Driver for Windows 10" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="intel-graphics-driver" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Driver Support Assistant" Tag="Drivers"   ToolTip="Intel Driver  Support Assistant enables you to scan computing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="intel-dsa" Visibility="Collapsed"/>
<TextBlock Text="Intel.IntelDriverAndSupportAssistant" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Network Adapter" Tag="Drivers"   ToolTip="Intel Network Adapter Drivers for Windows 10" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="intel-network-drivers-win10" Visibility="Collapsed"/>
<TextBlock Text="Intel.WiFiDrivers" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Snappy Driver Installer" Tag="Drivers"   ToolTip="A free and opensource tool for updating and installing device" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="sdio" Visibility="Collapsed"/>
<TextBlock Text="samlab-ws.SnappyDriverInstaller" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver booster" Tag="Drivers"   ToolTip="Scans and identifies outdated drivers automatically and downloads and installs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="driverbooster" Visibility="Collapsed"/>
<TextBlock Text="IObit.DriverBooster" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Genius" Tag="Drivers"   ToolTip="Professional driver management tool and hardware diagnostics" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="drivergenius" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Display Driver Uninstaller" Tag="Drivers"   ToolTip="Utility to completely remove system drivers" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="ddu" Visibility="Collapsed"/>
<TextBlock Text="Wagnardsoft.DisplayDriverUninstaller" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Driver Store Explorer" Tag="Drivers"   ToolTip=" Windows driver store utility" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="rapr" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="1Password" Tag="Utilities"   ToolTip="A password manager that securely stores login credentials credit card" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="1password" Visibility="Collapsed"/>
<TextBlock Text="AgileBits.1Password" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AOMEI Partition Assistant Standard" Tag="Disk Tools"   ToolTip="AOMEI Partition Assistant Standard allows you to realize disk upgrade/replacement" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="partition-assistant-standard" Visibility="Collapsed"/>
<TextBlock Text="AOMEI.PartitionAssistant" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AOMEI Backupper Standard" Tag="Disk Tools"   ToolTip="A backup and recovery software that enables users to create" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="backupper-standard" Visibility="Collapsed"/>
<TextBlock Text="AOMEI.Backupper.Standard" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Recuva recover" Tag="Disk Tools"   ToolTip="A data recovery software that helps users retrieve accidentally deleted" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="recuva" Visibility="Collapsed"/>
<TextBlock Text="Piriform.Recuva" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CCleaner" Tag="Utilities"   ToolTip="A system optimization privacy and cleaning tool that helps users" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="ccleaner" Visibility="Collapsed"/>
<TextBlock Text="SingularLabs.CCEnhancer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="BCUninstaller" Tag="Utilities"   ToolTip="A powerful uninstaller tool for Windows that allows users to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="bulk-crap-uninstaller" Visibility="Collapsed"/>
<TextBlock Text="Klocman.BulkCrapUninstaller" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Easy Context Menu" Tag="Utilities"   ToolTip="To install Easy Context Menu run the following command from" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="ecm" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HWiNFO" Tag="Utilities"   ToolTip="A hardware information and diagnostic tool that provides detailed information" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="hwinfo.install" Visibility="Collapsed"/>
<TextBlock Text="REALiX.HWiNFO" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Speccy" Tag="Utilities"   ToolTip="A system information tool that provides detailed information about the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="speccy" Visibility="Collapsed"/>
<TextBlock Text="Piriform.Speccy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FurMark" Tag="Utilities"   ToolTip="A graphics card stress testing and benchmarking utility that helps" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="furmark" Visibility="Collapsed"/>
<TextBlock Text="Geeks3D.FurMark" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hard Disk Sentinel" Tag="Disk Tools"   ToolTip="A hard disk monitoring and analysis software that helps users" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="hdsentinel" Visibility="Collapsed"/>
<TextBlock Text="JanosMathe.HardDiskSentinelPro" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CPU-Z" Tag="Utilities"   ToolTip="A system monitoring utility that provides detailed information about the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="cpu-z" Visibility="Collapsed"/>
<TextBlock Text="CPUID.CPU-Z" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mem Reduct" Tag="Utilities"   ToolTip="Lightweight realtime memory management application to monitor and clean system" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="memreduct" Visibility="Collapsed"/>
<TextBlock Text="Henry++.MemReduct" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HandBrake" Tag="Utilities"   ToolTip="A free and opensource video transcoder tool that converts video" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="handbrake.install" Visibility="Collapsed"/>
<TextBlock Text="HandBrake.HandBrake" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rufus Portable" Tag="Portable"   ToolTip="A utility tool for creating bootable USB drives from ISO" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="rufus" Visibility="Collapsed"/>
<TextBlock Text="Rufus.Rufus" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ImgBurn" Tag="Development"   ToolTip="Lightweight CD / DVD burning application" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="imgburn" Visibility="Collapsed"/>
<TextBlock Text="LIGHTNINGUK.ImgBurn" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Virtual CloneDrive" Tag="Utilities"   ToolTip="A free software that allows users to mount disc images" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="virtualclonedrive" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ultra ISO" Tag="Utilities"   ToolTip="A powerful ISO image management tool that enables users to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="ultraiso" Visibility="Collapsed"/>
<TextBlock Text="EZBSystems.UltraISO" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ventoy" Tag="Utilities"   ToolTip="An opensource tool for creating bootable USB drives with multiple" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="ventoy" Visibility="Collapsed"/>
<TextBlock Text="Ventoy.Ventoy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iVentoy" Tag="Utilities"   ToolTip="With iVentoy you can boot and install OS on multiple" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="iventoy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AutoHotkey" Tag="Utilities"   ToolTip="A scripting language for automating repetitive tasks and creating macros" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="autohotkey" Visibility="Collapsed"/>
<TextBlock Text="AutoHotkey.AutoHotkey" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rainmeter" Tag="Utilities"   ToolTip="A customizable desktop customization tool that displays customizable skins widgets" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="rainmeter" Visibility="Collapsed"/>
<TextBlock Text="Rainmeter.Rainmeter" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FxSound" Tag="Utilities"   ToolTip="An audio enhancer software that improves the sound quality of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="fxsound" Visibility="Collapsed"/>
<TextBlock Text="FxSoundLLC.FxSound" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vysor" Tag="Utilities"   ToolTip="A screen mirroring and remote control software that enables users" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="vysor" Visibility="Collapsed"/>
<TextBlock Text="Vysor.Vysor" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unified Remote" Tag="Utilities"   ToolTip="A remote control app that turns smartphones into universal remote" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="unifiedremote" Visibility="Collapsed"/>
<TextBlock Text="UnifiedIntents.UnifiedRemote" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AnyDesk" Tag="File Sharing"   ToolTip="A remote desktop software that allows users to access and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="anydesk" Visibility="Collapsed"/>
<TextBlock Text="AnyDeskSoftwareGmbH.AnyDesk" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Airdroid" Tag="File Sharing"   ToolTip="AirDroid is a free and fast Android device manager app" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="airdroid" Visibility="Collapsed"/>
<TextBlock Text="AirDroid.AirDroid" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UltraViewer" Tag="File Sharing"   ToolTip="Remote control to support your clients / partners from everywhere" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="ultraviewer" Visibility="Collapsed"/>
<TextBlock Text="DucFabulous.UltraViewer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wireless Network Watcher Portable" Tag="Portable"   ToolTip="Wireless Network Watcher is a small utility that scans your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="wnetwatcher.portable" Visibility="Collapsed"/>
<TextBlock Text="NirSoft.WirelessNetworkWatcher" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WifiInfoView" Tag="Utilities"   ToolTip="Wireless Network Watcher is a small utility that scans your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="wifiinfoview" Visibility="Collapsed"/>
<TextBlock Text="NirSoft.WifiInfoView" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WirelessNetView" Tag="Utilities"   ToolTip="Wireless Network Watcher is a small utility that scans your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="wirelessnetview" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="qBittorrent" Tag="File Sharing"   ToolTip="A free and opensource BitTorrent client for downloading and uploading" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="qbittorrent" Visibility="Collapsed"/>
<TextBlock Text="qBittorrent.qBittorrent" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Earth Pro" Tag="Imaging"   ToolTip="Google Earth Pro on desktop is free for users with" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="googleearthpro" Visibility="Collapsed"/>
<TextBlock Text="Google.EarthPro" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="XAMPP" Tag="Development"   ToolTip="XAMPP is a free and opensource crossplatform web server solution" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="xampp-81" Visibility="Collapsed"/>
<TextBlock Text="ApacheFriends.Xampp.8.2" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Professional 2022" Tag="Development"   ToolTip="Visual Studio Professional 2022 is an integrated development environment IDE" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="visualstudio2022professional" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VisualStudio.2022.Professional" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Community 2022" Tag="Development"   ToolTip="Visual Studio Community 2022 is a free fullyfeatured and extensible" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="visualstudio2022community" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VisualStudio.2022.Community" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unity Hub" Tag="Development"   ToolTip="Unity is a crossplatform game creation system developed by Unity" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="unity-hub" Visibility="Collapsed"/>
<TextBlock Text="Unity.UnityHub" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Godot Engine" Tag="Development"   ToolTip="Godot is a featurepacked crossplatform game engine for creating 2D" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="godot" Visibility="Collapsed"/>
<TextBlock Text="GodotEngine.GodotEngine" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unity3D Engine" Tag="Development"   ToolTip="Unity is a crossplatform game creation system developed by Unity" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="unity" Visibility="Collapsed"/>
<TextBlock Text="Unity.Unity.2020" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Blender" Tag="Development"   ToolTip="Blender is a free and opensource professionalgrade 3D computer graphics" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="blender" Visibility="Collapsed"/>
<TextBlock Text="BlenderFoundation.Blender" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VSCode" Tag="Development"   ToolTip="Visual Studio Code is a free sourcecode editor developed by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="vscode" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VisualStudioCode" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vim" Tag="Development"   ToolTip="Vim is an advanced text editor that seeks to provide" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="vim" Visibility="Collapsed"/>
<TextBlock Text="vim.vim" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sublime Text 4" Tag="Development"   ToolTip="Sublime Text 4  The sophisticated text editor for code" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="sublimetext4" Visibility="Collapsed"/>
<TextBlock Text="SublimeHQ.SublimeText.4" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Atom" Tag="Development"   ToolTip="Atom is a text editor thats modern approachable yet hackable" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="atom" Visibility="Collapsed"/>
<TextBlock Text="GitHub.Atom" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="InnoSetup" Tag="Development"   ToolTip="Inno Setup is a free installer for Windows programs. First" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="innosetup" Visibility="Collapsed"/>
<TextBlock Text="JRSoftware.InnoSetup" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PyCharm Community Edition" Tag="Development"   ToolTip="PyCharm Community Edition is a free and opensource IDE for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="pycharm-community" Visibility="Collapsed"/>
<TextBlock Text="JetBrains.PyCharm.Community" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PyCharm Professional Edition" Tag="Development"   ToolTip="PyCharm Professional Edition is a powerful IDE for professional Python" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="pycharm" Visibility="Collapsed"/>
<TextBlock Text="JetBrains.PyCharm.Professional" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Jetbrains Rider" Tag="Development"   ToolTip="Rider is a crossplatform .NET IDE developed by JetBrains. It" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="jetbrains-rider" Visibility="Collapsed"/>
<TextBlock Text="JetBrains.Rider" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NodeJs LTS" Tag="Development"   ToolTip="Node.js is a JavaScript runtime built on Chromes V8 JavaScript" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="nodejs-lts" Visibility="Collapsed"/>
<TextBlock Text="OpenJS.NodeJS.LTS" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Electron" Tag="Development"   ToolTip="Electron framework lets you write crossplatform desktop applications using JavaScript" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="electron" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Electrum LTS" Tag="Development"   ToolTip="Electrum is a lightweight Bitcoin wallet focused on speed and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="electronim" Visibility="Collapsed"/>
<TextBlock Text="Electrum.Electrum" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hugo" Tag="Development"   ToolTip="Hugo is one of the most popular opensource static site" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="hugo" Visibility="Collapsed"/>
<TextBlock Text="Hugo.Hugo" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hugo Extended" Tag="Development"   ToolTip="Hugo is one of the most popular opensource static site" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="hugo-extended" Visibility="Collapsed"/>
<TextBlock Text="Hugo.Hugo.Extended" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Notepad++" Tag="Development"   ToolTip="Notepad is a free source code editor and Notepad replacement" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="notepadplusplus" Visibility="Collapsed"/>
<TextBlock Text="Notepad++.Notepad++" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Terminal" Tag="Development"   ToolTip="Windows Terminal is a modern terminal application for users of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="microsoft-windows-terminal" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.WindowsTerminal" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Powershell 7" Tag="Development"   ToolTip="PowerShell Core is a crossplatform Windows Linux and macOS automation" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="powershell-core" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.PowerShell" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="x64dbg Portable" Tag="Portable"   ToolTip="An opensource x64/x32 debugger for windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="x64dbg.portable" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="dnSpy" Tag="Development"   ToolTip="dnSpy is a tool to reverse engineer .NET assemblies. It" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="dnspy" Visibility="Collapsed"/>
<TextBlock Text="dnSpyEx.dnSpy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cheat Engine" Tag="Development"   ToolTip="Cheat Engine is an open source tool designed to help" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="cheatengine" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Python 3.12.6" Tag="Development"   ToolTip="Python is a popular highlevel programming language known for its" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="python" Visibility="Collapsed"/>
<TextBlock Text="Python.Python.3.9" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Git" Tag="Development"   ToolTip="Git is a free and opensource distributed version control system" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="git" Visibility="Collapsed"/>
<TextBlock Text="Git.Git" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHub Desktop" Tag="Development"   ToolTip="GitHub Desktop is a seamless way to contribute to projects" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="github-desktop" Visibility="Collapsed"/>
<TextBlock Text="GitHub.GitHubDesktop" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Docker Desktop" Tag="Development"   ToolTip="Docker Desktop is an easytoinstall application for Windows and macOS" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="docker-desktop" Visibility="Collapsed"/>
<TextBlock Text="Docker.DockerDesktop" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Docker Compose" Tag="Development"   ToolTip="Docker Compose is a tool for defining and running multicontainer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="docker-compose" Visibility="Collapsed"/>
<TextBlock Text="Docker.DockerCompose" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PowerToys" Tag="Development"   ToolTip="PowerToys is a set of utilities for power users to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="powertoys" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.PowerToys" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Notion" Tag="Development"   ToolTip="The allinone workspace for your notes tasks wikis and databases" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="notion" Visibility="Collapsed"/>
<TextBlock Text="Notion.Notion" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FL Studio" Tag="Media Tools"   ToolTip="FL Studio is a digital audio workstation DAW developed by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="ImageLine.FLStudio" Visibility="Collapsed"/>
<TextBlock Text="ImageLine.FLStudio" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Android Debug Bridge" Tag="Development"   ToolTip="Android Debug Bridge ADB is a commandline tool that allows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="adb" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Universal ADB Drivers" Tag="Development"   ToolTip="Universal ADB Drivers are drivers that provide compatibility with a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="universal-adb-drivers" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Scrcpy" Tag="Development"   ToolTip="Scrcpy is a free and opensource tool that allows you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="scrcpy" Visibility="Collapsed"/>
<TextBlock Text="Genymobile.scrcpy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VirtualBox" Tag="Development"   ToolTip="VirtualBox is a crossplatform virtualization application. It installs on existing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="virtualbox" Visibility="Collapsed"/>
<TextBlock Text="Oracle.VirtualBox" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Oh My Posh" Tag="Development"   ToolTip=" Oh my Posh is a custom prompt engine for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="oh-my-posh" Visibility="Collapsed"/>
<TextBlock Text="JanDeDobbeleer.OhMyPosh" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Malwarebytes" Tag="Security"   ToolTip="Multiple layers of malwarecrushing tech including virus protection. Thorough malware" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="malwarebytes" Visibility="Collapsed"/>
<TextBlock Text="Malwarebytes.Malwarebytes" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Avast Free Antivirus" Tag="Security"   ToolTip="Avast Free Antivirus" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="avastfreeantivirus" Visibility="Collapsed"/>
<TextBlock Text="XPDNZJFNCR1B07" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Nerd Fonts - CascadiaCode" Tag="Development"   ToolTip="Nerd Fonts is a project that patches developer targeted fonts" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="nerd-fonts-cascadiacode" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Java SE Runtime Environment 8.0.411" Tag="Runtimes"   ToolTip="Java allows you to play online games chat with people" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="jre8" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Audacity" Tag="Media Tools"   ToolTip="Audacity is free open source crossplatform software for recording and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="audacity" Visibility="Collapsed"/>
<TextBlock Text="Audacity.Audacity" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MusicBee" Tag="Media"   ToolTip="MusicBee makes it easy to organize find and play music" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="musicbee" Visibility="Collapsed"/>
<TextBlock Text="MusicBee.MusicBee" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Format Factory" Tag="Media Tools"   ToolTip="multifunctional media processing tools" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="formatfactory" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winaero Tweaker" Tag="Utilities"   ToolTip="Customize the appearance and behavior of the Windows operating system" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="winaero-tweaker" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Subsystem for Linux WSL2" Tag="Development"   ToolTip="To install Windows Subsystem for Linux 2 run the following" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="wsl2" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.WSL" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wamp Server 3.3.5" Tag="Development"   ToolTip="WampServer is a Windows web development environment. It allows you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="wamp-server" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB" Tag="Development"   ToolTip="MongoDB stores data using a flexible document data model that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mongodb" Visibility="Collapsed"/>
<TextBlock Text="MongoDB.Server" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MPC-BE" Tag="Media"   ToolTip="Media Player Classic  BE is a free and open" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="mpc-be" Visibility="Collapsed"/>
<TextBlock Text=" MPC-BE.MPC-BE" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kdenlive" Tag="Media Tools"   ToolTip="A powerful nonlinear video editor" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="kdenlive" Visibility="Collapsed"/>
<TextBlock Text="KDE.Kdenlive" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TablePlus" Tag="Development"   ToolTip="Modern native and friendly GUI tool for relational databases MySQL" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="tableplus" Visibility="Collapsed"/>
<TextBlock Text="TablePlus.TablePlus" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hosts File Editor" Tag="Utilities"   ToolTip="Hosts File Editor makes it easy to change your hosts" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="hosts.editor" Visibility="Collapsed"/>
<TextBlock Text="scottlerch.hosts-file-editor" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Subtitle Edit" Tag="Development"   ToolTip="With SE you can easily adjust a subtitle if it" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="subtitleedit" Visibility="Collapsed"/>
<TextBlock Text="9NWH51GWJTKN" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Skype" Tag="Communication"   ToolTip="Skype  Install Skype add your friends as contacts then" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="skype" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Skype" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FileZilla" Tag="Development"   ToolTip="FileZilla Client is a fast and reliable crossplatform FTP FTPS" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="filezilla" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Everything" Tag="Utilities"   ToolTip="Everything Search Engine  locate files and folders by name" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="everything" Visibility="Collapsed"/>
<TextBlock Text="voidtools.Everything" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Yarn" Tag="Development"   ToolTip="Yarn is a package manager for the npm and bower" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="yarn" Visibility="Collapsed"/>
<TextBlock Text="Yarn.Yarn" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VMware Workstation Player" Tag="Development"   ToolTip="VMware Workstation Player is a streamlined desktop virtualization application that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="vmware-workstation-player" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HDD Low Level Format Tool" Tag="Utilities"   ToolTip="Will erase LowLevel Format and recertify a SATA IDE or" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="llftool" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="BlueStacks" Tag="Gaming"   ToolTip="Play Android Games on PC" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="bluestacks" Visibility="Collapsed"/>
<TextBlock Text="BlueStack.BlueStacks" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Wireless Bluetooth for Windows 10 and Windows 11" Tag="Drivers"   ToolTip="Bluetooth for Windows 10 and Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="intel-bluetooth-drivers" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Office 365 Business" Tag="Documents"   ToolTip="Microsoft 365 formerly Office 365 is a line of subscription" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="office365business" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Office" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Bandicam" Tag="Imaging"   ToolTip="Bandicam is a closedsource screen capture and screen recording software" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="BandicamCompany.Bandicam" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="QQPlayer" Tag="Media"   ToolTip="QQPlayer media player" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Tencent.QQPlayer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="4K Video Downloader" Tag="Utilities"   ToolTip="4K Video Downloader allows downloading videos playlists channels and subtitles" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="4k-video-downloader" Visibility="Collapsed"/>
<TextBlock Text="OpenMedia.4KVideoDownloader" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Active@ Partition Recovery" Tag="Disk Tools"   ToolTip="Active Partition Recovery is a freeware toolkit that helps to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="LSoftTechnologies.ActivePartitionRecovery" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HiSuite" Tag="Utilities"   ToolTip="HUAWEI HiSuite is the official Android Smart Device Manager toolHiSuite" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Huawei.HiSuite" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Android Studio" Tag="Development"   ToolTip="Android Studio is the official integrated development environment for Googles" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="androidstudio" Visibility="Collapsed"/>
<TextBlock Text="Google.AndroidStudio" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreWolf" Tag="Web Browsers"   ToolTip="LibreWolf is designed to increase protection against tracking and fingerprinting" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="librewolf" Visibility="Collapsed"/>
<TextBlock Text="LibreWolf.LibreWolf" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flow Launcher" Tag="Utilities"   ToolTip="Dedicated to making your workflow flow more seamless. Search everything" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="flow-launcher" Visibility="Collapsed"/>
<TextBlock Text="Flow-Launcher.Flow-Launcher" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="IconsExtract" Tag="Utilities"   ToolTip="The IconsExtract utility scans the files and folders on your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="iconsext" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AdGuard Home" Tag="Security"   ToolTip="AdGuard Home is a networkwide software for blocking ads and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="adguardhome" Visibility="Collapsed"/>
<TextBlock Text="AdGuard.AdGuardHome" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Burp Suite Community Edition" Tag="Development"   ToolTip="Burp Suite is an integrated platform for performing security testing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="burp-suite-free-edition" Visibility="Collapsed"/>
<TextBlock Text="PortSwigger.BurpSuite.Community" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CoreTemp" Tag="Utilities"   ToolTip="Core Temp is a compact no fuss small footprint yet" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="coretemp" Visibility="Collapsed"/>
<TextBlock Text="ALCPU.CoreTemp" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ShareX" Tag="File Sharing"   ToolTip="Screen capture file sharing and productivity tool" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="sharex" Visibility="Collapsed"/>
<TextBlock Text="ShareX.ShareX" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ONLY OFFICE" Tag="Documents"   ToolTip="ONLYOFFICE is a project developed by experienced IT experts from" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="onlyoffice" Visibility="Collapsed"/>
<TextBlock Text="ONLYOFFICE.DesktopEditors" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ESET Internet Security" Tag="Security"   ToolTip="Ideal for modern users concerned about their privacy who actively" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="eset-internet-security" Visibility="Collapsed"/>
<TextBlock Text="ESET.EndpointSecurity" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinDirStat" Tag="Disk Tools"   ToolTip="WinDirStat is a disk usage statistics viewer and cleanup tool" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="windirstat" Visibility="Collapsed"/>
<TextBlock Text="WinDirStat.WinDirStat" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winmerge" Tag="Utilities"   ToolTip="WinMerge is an Open Source differencing and merging tool for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="winmerge" Visibility="Collapsed"/>
<TextBlock Text="WinMerge.WinMerge" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Wireshark" Tag="Utilities"   ToolTip="Wireshark is the worlds foremost and widelyused network protocol analyzer." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="wireshark" Visibility="Collapsed"/>
<TextBlock Text="WiresharkFoundation.Wireshark" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeraCopy" Tag="Utilities"   ToolTip="TeraCopy is designed to copy and move files at the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="teracopy" Visibility="Collapsed"/>
<TextBlock Text="CodeSector.TeraCopy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="QuickLook" Tag="Utilities"   ToolTip="Quick Look is among the few features I missed from" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="quicklook" Visibility="Collapsed"/>
<TextBlock Text="QL-Win.QuickLook" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RepoZ" Tag="Development"   ToolTip="RepoZ provides a quick overview of the git repositories on" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="repoz" Visibility="Collapsed"/>
<TextBlock Text="AndreasWascher.RepoZ" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Intel Graphics Command Center" Tag="Drivers"   ToolTip="Dont have time to mess around with settings The Intel" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="9PLFNLNT3G5G" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Go Programming Language" Tag="Development"   ToolTip="Go is expressive concise clean and efficient Its concurrency mechanisms" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="golang" Visibility="Collapsed"/>
<TextBlock Text="Language GoLang.Go" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rust" Tag="Development"   ToolTip="Rust is a curlybrace blockstructured expression language It visually resembles" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="rust" Visibility="Collapsed"/>
<TextBlock Text="Rustlang.Rust.GNU" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Inkscape" Tag="Imaging"   ToolTip="Inkscape is an opensource vector graphics editor similar to Adobe" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="inkscape" Visibility="Collapsed"/>
<TextBlock Text="Inkscape.Inkscape" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Youtube Dl" Tag="Utilities"   ToolTip="youtubedl is a small commandline program to download videos from" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="yt-dlp" Visibility="Collapsed"/>
<TextBlock Text="youtube-dl.youtube-dl" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Postman" Tag="Development"   ToolTip="Postman helps you be more efficient while working with APIs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="postman" Visibility="Collapsed"/>
<TextBlock Text="Postman.Postman" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Azure CLI" Tag="Development"   ToolTip="The Azure CLI is available across Azure services and is" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="azure-cli" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.AzureCLI" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GameMaker Studio" Tag="Development"   ToolTip="GameMaker Studio has everything you need for games development no" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="YoYoGames.GameMaker.Studio.2" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Charles" Tag="Development"   ToolTip="Charles is an HTTP proxy HTTP monitor Reverse Proxy that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="charles" Visibility="Collapsed"/>
<TextBlock Text="XK72.Charles" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Media Player" Tag="Media"   ToolTip="Media Player is designed to make listening to and watching" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="9WZDNCRFJ3PT" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="espanso" Tag="Development"   ToolTip="A crossplatform Text Expander written in Rust" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="espanso" Visibility="Collapsed"/>
<TextBlock Text="Espanso.Espanso" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ability Office" Tag="Documents"   ToolTip="Ability Office Standard offers 3 core applications essential for home" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="abilityoffice" Visibility="Collapsed"/>
<TextBlock Text="Ability.AbilityOffice.8.Standard" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Winbox" Tag="Utilities"   ToolTip="Small utility that allows administration of MikroTik RouterOS using a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Mikrotik.Winbox" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SearchMyFiles" Tag="Utilities"   ToolTip="SearchMyFiles allows you to make a very accurate search that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="searchmyfiles" Visibility="Collapsed"/>
<TextBlock Text="NirSoft.SearchMyFiles" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iTunes" Tag="Media"   ToolTip="iTunes is the best way to organize and enjoy the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="itunes" Visibility="Collapsed"/>
<TextBlock Text="Apple.iTunes" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StartIsBack++" Tag="Utilities"   ToolTip="StartIsBack returns Windows 10 and Windows 8 a real fully" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="startisback" Visibility="Collapsed"/>
<TextBlock Text="StartIsBack.StartIsBack" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Advanced SystemCare Free" Tag="Utilities"   ToolTip="Over time your computer may accumulate with large quantities of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="afedteated" Visibility="Collapsed"/>
<TextBlock Text="XPFFGSS4Z9M2TX" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Send Anywhere" Tag="File Sharing"   ToolTip="Send Anywhere is a multiplatform file sharing service where users" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Estmob.SendAnywhere" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="YUMI Legacy" Tag="Utilities"   ToolTip="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="yumi" Visibility="Collapsed"/>
<TextBlock Text="YumiUsb.Legacy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="YUMI UEFI" Tag="Utilities"   ToolTip="YUMI Your Universal Multiboot Installer is the successor to MultibootISOs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="yumi-uefi" Visibility="Collapsed"/>
<TextBlock Text="YumiUsb.UEFI" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OP Auto Clicker" Tag="Utilities"   ToolTip="A fullfledged autoclicker with two modes of autoclicking at your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="autoclicker" Visibility="Collapsed"/>
<TextBlock Text="OPAutoClicker.OPAutoClicker" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Spotube" Tag="Media"   ToolTip="Spotube is a Flutter based lightweight spotify client It utilizes" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="spotube" Visibility="Collapsed"/>
<TextBlock Text="KRTirtho.Spotube" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Audio Switcher" Tag="Media"   ToolTip="Easily switch the default audio device input or output on" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="audioswitcher" Visibility="Collapsed"/>
<TextBlock Text="FortyOneLtd.AudioSwitcher" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Teams Classic Desktop" Tag="Communication"   ToolTip="Microsoft Teams is a messaging app for teams where all" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="microsoft-teams.install" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Windows SDK" Tag="Runtimes"   ToolTip="The Windows 10 SDK for Windows 10 version 1809 provides" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="windows-sdk-10.1" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RunAsDate Portable" Tag="Portable"   ToolTip="RunAsDate is a small utility that allows you to run" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="runasdate" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio 2017 Build " Tag="Development"   ToolTip="These Build Tools allow you to build native and managed" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="visualstudio2017buildtools" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MSEdgeRedirect" Tag="Utilities"   ToolTip="This tool filters and passes the command line arguments of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="msedgeredirect" Visibility="Collapsed"/>
<TextBlock Text="rcmaehl.MSEdgeRedirect" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 5" Tag="Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-5.0-desktopruntime" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.HostingBundle.5" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 3" Tag="Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="Microsoft.DotNet.HostingBundle.3_1" Visibility="Collapsed"/>
<TextBlock Text="dotnetcore-3.0-desktopruntime" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 6" Tag="Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-6.0-desktopruntime" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.HostingBundle.6" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 7" Tag="Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-7.0-desktopruntime" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.AspNetCore.7" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NET Desktop Runtime 8" Tag="Runtimes"   ToolTip="NET Core is a general purpose development platform maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-desktopruntime" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.DesktopRuntime.8" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Viber" Tag="Communication"   ToolTip="Viber is a mobile application that lets you make free" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="viber" Visibility="Collapsed"/>
<TextBlock Text="XPFM5P5KDWF0JP" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="StartAllBack" Tag="Utilities"   ToolTip="Introducing StartAllBack Windows 11 from a better timeline Embrace enhance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="startallback" Visibility="Collapsed"/>
<TextBlock Text="StartIsBack.StartAllBack" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DiskGenius Free" Tag="Disk Tools"   ToolTip="With powerful capabilities and userfriendly interface DiskGenius Free Edition provides" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="diskgenius" Visibility="Collapsed"/>
<TextBlock Text="Eassos.DiskGenius" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UNFORMAT" Tag="Disk Tools"   ToolTip="UNFORMAT is a software utility created to solve almost all" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="LSoftTechnologies.UNFORMAT" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Active@ UNDELETE" Tag="Disk Tools"   ToolTip="Active UNDELETE helps you to recover deleted files and restore" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="LSoftTechnologies.ActiveUNDELETE" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HxD Hex Editor" Tag="Disk Tools"   ToolTip="HxD is a carefully designed and fast hex editor which" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Disk Tools"/>
</StackPanel>
<TextBlock Text="hxd" Visibility="Collapsed"/>
<TextBlock Text="MHNexus.HxD" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Epic Games Launcher" Tag="Gaming"   ToolTip="The Epic Games Launcher is how you obtain the Unreal" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="epicgameslauncher" Visibility="Collapsed"/>
<TextBlock Text="EpicGames.EpicGamesLauncher" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Vivaldi" Tag="Web Browsers"   ToolTip="The new Vivaldi browser protects you from trackers blocks unwanted" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="vivaldi" Visibility="Collapsed"/>
<TextBlock Text="VivaldiTechnologies.Vivaldi" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft PC Manager" Tag="Utilities"   ToolTip="Microsoft PC manager a good way to protect your personal" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="9PM860492SZD" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Openshot" Tag="Media Tools"   ToolTip="OpenShot Video Editor is an awardwinning opensource video editor available" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="openshot" Visibility="Collapsed"/>
<TextBlock Text="OpenShot.OpenShot" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WhatsApp" Tag="Communication"   ToolTip="WhatsApp Messenger or simply WhatsApp is an American freeware crossplatform" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="9NKSQGP7F2NH" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Paint.NET" Tag="Imaging"   ToolTip="PaintNET is image and photo editing software for PCs that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="paint.net" Visibility="Collapsed"/>
<TextBlock Text="dotPDNLLC.paintdotnet" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Stretchly" Tag="Utilities"   ToolTip="stretchly is a crossplatform electron app that reminds you to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="stretchly" Visibility="Collapsed"/>
<TextBlock Text="Stretchly.Stretchly" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Silverlight" Tag="Runtimes"   ToolTip="Silverlight is a powerful development tool for creating engaging interactive" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="silverlight" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TreeSize" Tag="Utilities"   ToolTip="Every hard disk is too small if you just wait" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="treesizefree" Visibility="Collapsed"/>
<TextBlock Text="JAMSoftware.TreeSize.Free" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dot Net 3.5" Tag="Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet3.5" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.DesktopRuntime.3_1" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flash Player ActiveX" Tag="Runtimes"   ToolTip="The Adobe Flash Player is freeware software for viewing multimedia" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="flashplayeractivex" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Google Drive" Tag="File Sharing"   ToolTip="Google Drive All your files everywhere Safely store your files" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="googledrive" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dot Net 4.5.2" Tag="Runtimes"   ToolTip="The Microsoft NET Framework 452 is a highly compatible inplace" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet4.5.2" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dropbox" Tag="File Sharing"   ToolTip="Organize all your teams content tune out distractions and get" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="dropbox" Visibility="Collapsed"/>
<TextBlock Text="Dropbox.Dropbox" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="cURL" Tag="Development"   ToolTip="Command line tool and library for transferring data with URLs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="curl" Visibility="Collapsed"/>
<TextBlock Text="cURL.cURL" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PDF Creator" Tag="Documents"   ToolTip="PDFCreator lets you convert any printable document to PDF" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="pdfcreator" Visibility="Collapsed"/>
<TextBlock Text="pdfforge.PDFCreator" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Autoruns" Tag="Utilities"   ToolTip="This utility shows you what programs are configured to run" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="autoruns" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Sysinternals.Autoruns" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft OneDrive" Tag="File Sharing"   ToolTip="Save your files and photos to OneDrive and access them" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="onedrive" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.OneDrive" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Process Explorer" Tag="Utilities"   ToolTip="Process Explorer shows you information about which handles and DLLs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="procexp" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.Sysinternals.ProcessExplorer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FFmpeg" Tag="Media Tools"   ToolTip="FFmpeg is a widelyused crossplatform multimedia framework which can process" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="ffmpeg" Visibility="Collapsed"/>
<TextBlock Text="Gyan.FFmpeg" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="OpenVPN Connect" Tag="Utilities"   ToolTip="The official OpenVPN Connect client software developed and maintained by" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="openvpn-connect" Visibility="Collapsed"/>
<TextBlock Text="OpenVPNTechnologies.OpenVPNConnect" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Git Large File Storage" Tag="Development"   ToolTip="Git Large File Storage LFS replaces large files such as" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="git-lfs" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Nmap" Tag="Utilities"   ToolTip="Nmap Network Mapper is a free and open source utility" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="nmap" Visibility="Collapsed"/>
<TextBlock Text="Insecure.Nmap" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="UltraVNC" Tag="File Sharing"   ToolTip="UltraVNC is an open source application that uses the VNC" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="ultravnc" Visibility="Collapsed"/>
<TextBlock Text="uvncbvba.UltraVnc" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Plex" Tag="Media Tools"   ToolTip="Plex is a global streaming media service and a clientserver" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="plex" Visibility="Collapsed"/>
<TextBlock Text="Plex.Plex" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Plex Media Server" Tag="Media Tools"   ToolTip="Plex Media Server helps you organise your media and stream" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="plexmediaserver" Visibility="Collapsed"/>
<TextBlock Text="Plex.PlexMediaServer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visio Viewer" Tag="Documents"   ToolTip="Visio 2016 Viewer Visio users can freely distribute Visio drawings" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="visioviewer" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VisioViewer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Keyn Stroke" Tag="Utilities"   ToolTip="KeynStroke makes it easy for your audience to follow your" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="key-n-stroke" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fing" Tag="Utilities"   ToolTip="Fing App is a free network scanner that makes you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="fing" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ryujinx" Tag="Gaming"   ToolTip="Ryujinx is an opensource Nintendo Switch emulator created by gdkchan" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="ryujinx --params" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Omnify Hotspot" Tag="File Sharing"   ToolTip="The best virtual router to turn your PC into a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="omnifyhotspot" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MKVToolNix" Tag="Media Tools"   ToolTip="MKVToolNix is a set of tools to create alter and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="mkvtoolnix" Visibility="Collapsed"/>
<TextBlock Text="MoritzBunkus.MKVToolNix" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Neat Download Manager" Tag="Web Browsers"   ToolTip="Neat Download Manager is a free Internet Download Manager for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="neat" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="x630ce for all games" Tag="Gaming"   ToolTip="Xbox 360 Controller Emulator allows your controller gamepad joystick steering" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="x360ce" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft .NET SDK 7" Tag="Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-7.0-sdk" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.SDK.7" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft .NET SDK 8" Tag="Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-sdk" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.SDK.Preview" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft ASP.NET Core Runtime 7.0" Tag="Runtimes"   ToolTip="NET is a free crossplatform opensource developer platform for building" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="dotnet-aspnetruntime" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.DotNet.AspNetCore.7" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HFS HTTP File Server" Tag="File Sharing"   ToolTip="You can use HFS HTTP File Server to send and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="hfs" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cemu" Tag="Gaming"   ToolTip="Cemu is a highly experimental software to emulate Wii U" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="cemu" Visibility="Collapsed"/>
<TextBlock Text="Cemu.Cemu" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Chatterino" Tag="Communication"   ToolTip="Chatterino is a chat client for Twitch chat that offers" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="chatterino" Visibility="Collapsed"/>
<TextBlock Text="ChatterinoTeam.Chatterino" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clementine" Tag="Media Tools"   ToolTip="Clementine is a modern music player and library organizer supporting" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="clementine" Visibility="Collapsed"/>
<TextBlock Text="Clementine.Clementine" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clink" Tag="Development"   ToolTip="Clink is a powerful Bashcompatible commandline interface CLIenhancement for Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="clink" Visibility="Collapsed"/>
<TextBlock Text="chrisant996.Clink" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CMake" Tag="Development"   ToolTip="CMake is an opensource crossplatform family of tools designed to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="cmake" Visibility="Collapsed"/>
<TextBlock Text="Kitware.CMake" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="CopyQ Clipboard Manager" Tag="Utilities"   ToolTip="CopyQ is a clipboard manager with advanced features allowing you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="copyq" Visibility="Collapsed"/>
<TextBlock Text="hluk.CopyQ" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Crystal Disk Info" Tag="Utilities"   ToolTip="Crystal Disk Info is a disk health monitoring tool that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="crystaldiskinfo" Visibility="Collapsed"/>
<TextBlock Text="CrystalDewWorld.CrystalDiskInfo" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Crystal Disk Mark" Tag="Utilities"   ToolTip="Crystal Disk Mark is a disk benchmarking tool that measures" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="crystaldiskmark" Visibility="Collapsed"/>
<TextBlock Text="CrystalDewWorld.CrystalDiskMark" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Darktable" Tag="Media Tools"   ToolTip="Opensource photo editing tool offering an intuitive interface advanced editing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="darktable" Visibility="Collapsed"/>
<TextBlock Text="darktable.darktable" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EA App" Tag="Gaming"   ToolTip="EA App is a platform for accessing and playing Electronic" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="ea-app" Visibility="Collapsed"/>
<TextBlock Text="ElectronicArts.EADesktop" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Falkon" Tag="Web Browsers"   ToolTip="Falkon is a lightweight and fast web browser with a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="falkon" Visibility="Collapsed"/>
<TextBlock Text="KDE.Falkon" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="File Converter" Tag="Utilities"   ToolTip="File Converter is a very simple tool which allows you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="file-converter" Visibility="Collapsed"/>
<TextBlock Text="AdrienAllard.FileConverter" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Files" Tag="Utilities"   ToolTip="Alternative file explorer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="files" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flameshot" Tag="Media Tools"   ToolTip="Flameshot is a powerful yet simple to use screenshot software" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="flameshot" Visibility="Collapsed"/>
<TextBlock Text="Flameshot.Flameshot" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lightshot" Tag="Media Tools"   ToolTip="Ligthshot is an Easytouse lightweight screenshot software tool where you" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="lightshot" Visibility="Collapsed"/>
<TextBlock Text="Skillbrains.Lightshot" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="F.lux" Tag="Utilities"   ToolTip="flux adjusts the color temperature of your screen to reduce" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="flux" Visibility="Collapsed"/>
<TextBlock Text="flux.flux" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHub CLI" Tag="Development"   ToolTip="GitHub CLI is a commandline tool that simplifies working with" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="gh" Visibility="Collapsed"/>
<TextBlock Text="GitHub.cli" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GOG Galaxy" Tag="Gaming"   ToolTip="GOG Galaxy is a gaming client that offers DRMfree games" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="goggalaxy" Visibility="Collapsed"/>
<TextBlock Text="GOG.Galaxy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Greenshot" Tag="Media Tools"   ToolTip="Greenshot is a lightweight screenshot software tool with builtin image" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="greenshot" Visibility="Collapsed"/>
<TextBlock Text="Greenshot.Greenshot" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hexchat" Tag="Communication"   ToolTip="HexChat is a free opensource IRC Internet Relay Chat client" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="hexchat" Visibility="Collapsed"/>
<TextBlock Text="HexChat.HexChat" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="HWMonitor" Tag="Utilities"   ToolTip="HWMonitor is a hardware monitoring program that reads PC systems" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="hwmonitor" Visibility="Collapsed"/>
<TextBlock Text="CPUID.HWMonitor" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ImageGlass" Tag="Media Tools"   ToolTip="ImageGlass is a versatile image viewer with support for various" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="imageglass" Visibility="Collapsed"/>
<TextBlock Text="DuongDieuPhap.ImageGlass" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Itch.io" Tag="Gaming"   ToolTip="Itchio is a digital distribution platform for indie games and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="itch" Visibility="Collapsed"/>
<TextBlock Text="ItchIo.Itch" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KDE Connect" Tag="File Sharing"   ToolTip="KDE Connect allows seamless integration between your KDE desktop and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="kdeconnect-kde" Visibility="Collapsed"/>
<TextBlock Text="KDE.KDEConnect" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="KeePassXC" Tag="Utilities"   ToolTip="KeePassXC is a crossplatform opensource password manager with strong encryption" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="keepassxc" Visibility="Collapsed"/>
<TextBlock Text="KeePassXCTeam.KeePassXC" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Lazygit" Tag="Development"   ToolTip="Simple terminal UI for git commands" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="lazygit" Visibility="Collapsed"/>
<TextBlock Text="JesseDuffield.lazygit" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LocalSend" Tag="Utilities"   ToolTip="An open source crossplatform alternative to AirDrop" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="localsend.install" Visibility="Collapsed"/>
<TextBlock Text="LocalSend.LocalSend" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fork" Tag="Development"   ToolTip="Fork a fast and friendly git client" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="git-fork" Visibility="Collapsed"/>
<TextBlock Text="Fork.Fork" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PulsarEdit" Tag="Development"   ToolTip="A Communityled HyperHackable Text Editor" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="pulsar" Visibility="Collapsed"/>
<TextBlock Text="Pulsar-Edit.Pulsar" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Shotcut" Tag="Media Tools"   ToolTip="Shotcut is a free open source crossplatform video editor" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="Shotcut" Visibility="Collapsed"/>
<TextBlock Text="Meltytech.Shotcut" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PaleMoon" Tag="Web Browsers"   ToolTip="Pale Moon is an Open Source Goannabased web browser available" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="paleMoon" Visibility="Collapsed"/>
<TextBlock Text="MoonchildProductions.PaleMoon" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="JoyToKey" Tag="Gaming"   ToolTip="enables PC game controllers to emulate the keyboard and mouse" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="joytokey" Visibility="Collapsed"/>
<TextBlock Text="JTKsoftware.JoyToKey" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Auto Dark Mode" Tag="Utilities"   ToolTip="Automatically switches between the dark and light theme of Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="auto-dark-mode" Visibility="Collapsed"/>
<TextBlock Text="Armin2208.WindowsAutoNightMode" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Windows Firewall Control" Tag="Utilities"   ToolTip="Windows Firewall Control is a powerful tool which extends the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="windowsfirewallcontrol" Visibility="Collapsed"/>
<TextBlock Text="BiniSoft.WindowsFirewallControl" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TightVNC" Tag="Utilities"   ToolTip="TightVNC is a free and Open Source remote desktop software" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="TightVNC" Visibility="Collapsed"/>
<TextBlock Text="GlavSoft.TightVNC" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Python Version Manager" Tag="Development"   ToolTip="pyenv for Windows is a simple python version management tool" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="pyenv-win" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Pixi" Tag="Development"   ToolTip="Pixi is a fast software package manager built on top" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="pixi" Visibility="Collapsed"/>
<TextBlock Text="prefix-dev.pixi" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VSCodium" Tag="Development"   ToolTip="VSCodium is a communitydriven freelylicensed binary distribution of Microsofts VS" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="vscodium" Visibility="Collapsed"/>
<TextBlock Text="VSCodium.VSCodium" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Thonny Python IDE" Tag="Development"   ToolTip="Python IDE for beginners" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="thonny" Visibility="Collapsed"/>
<TextBlock Text="AivarAnnamaa.Thonny" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Poedit" Tag="Development"   ToolTip="Poedit translations editor The best way to translate apps and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Adobe Acrobat Reader" Tag="Documents"   ToolTip="Adobe Acrobat Reader DC software is the free trusted global" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="adobereader" Visibility="Collapsed"/>
<TextBlock Text="Adobe.Acrobat.Reader.32-bit" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Flash Player Plugin" Tag="Documents"   ToolTip="The Adobe Flash Player is freeware software for viewing multimedia" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="flashplayerplugin" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sysinternals" Tag="Documents"   ToolTip="The Sysinternals Troubleshooting Utilities have been rolled up into a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="sysinternals" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SelfishNet" Tag="Utilities"   ToolTip="Control your internet bandwidth with SelfishNet V3 ARP Spoofing application." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="selfishnet" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NTLite" Tag="Drivers"   ToolTip="Integrate updates drivers automate Windows and application setup speedup Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="ntlite-free" Visibility="Collapsed"/>
<TextBlock Text="Nlitesoft.NTLite" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Olive Video Editor" Tag="Media Tools"   ToolTip="Olive is a free nonlinear video editor for Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="olive" Visibility="Collapsed"/>
<TextBlock Text="OliveTeam.OliveVideoEditor" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mark Text" Tag="Portable"   ToolTip="A simple and elegant opensource markdown editor that focused on" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="marktext.portable" Visibility="Collapsed"/>
<TextBlock Text="MarkText.MarkText" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="pCloud Drive" Tag="File Sharing"   ToolTip="pCloud is a file hosting service also called cloud storage" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="pcloud" Visibility="Collapsed"/>
<TextBlock Text="pCloudAG.pCloudDrive" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Hurl" Tag="Utilities"   ToolTip="Hurl is a command line tool that runs HTTP requests" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="hurl" Visibility="Collapsed"/>
<TextBlock Text="Orange-OpenSource.Hurl" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="File Hash Generator" Tag="Utilities"   ToolTip="Compute and save MD5 SHA1 SHA2 RIPEMD hashes and CRC1632" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="file-hash-generator" Visibility="Collapsed"/>
<TextBlock Text="BinaryMark.FileHashGenerator" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Multimark down" Tag="Utilities"   ToolTip="MultiMarkdown or MMD is a tool to help turn minimally" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="multimarkdown" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PCSX2 Emulator" Tag="Portable"   ToolTip="PCSX2 is a free and opensource PlayStation 2 PS2 emulator" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="pcsx2.portable" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RetroArch" Tag="Gaming"   ToolTip="RetroArch is a frontend for emulators game engines and media" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="retroarch" Visibility="Collapsed"/>
<TextBlock Text="Libretro.RetroArch" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Free Virtual Keyboard" Tag="Utilities"   ToolTip="Free Virtual Keyboard works on any Windows based UMPC with" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="free-virtual-keyboard" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TypeScript for Visual Studio 2017 and 2019" Tag="Development"   ToolTip="This is a standalone power tool release of TypeScript for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="typescript-vs2017-vs2019" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Caret" Tag="Development"   ToolTip="Beautiful Clever Markdown Editor Download trial" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="caret" Visibility="Collapsed"/>
<TextBlock Text="Caret.Caret" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="iSpy" Tag="Imaging"   ToolTip="iSpy is the worlds most popular open source video surveillance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="ispy" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WavPack" Tag="Utilities"   ToolTip="WavPack is a completely open audio compression format providing lossless" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="wavpack" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ProcessThreadsView" Tag="Utilities"   ToolTip="ProcessThreadsView is a small utility that displays extensive information about" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="processthreadsview" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zulu" Tag="Development"   ToolTip="Zulu is a certified build of OpenJDK that is fully" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="zulu12" Visibility="Collapsed"/>
<TextBlock Text="Azul.Zulu.11.JRE" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitHubReleaseNotesv1" Tag="Development"   ToolTip="Generate Release Notes in MarkDown format from a GitHub project" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="githubreleasenotes" Visibility="Collapsed"/>
<TextBlock Text="StefHeyenrath.GitHubReleaseNotes" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Tome" Tag="Development"   ToolTip="Developing games is all about data With game systems for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="tome-editor" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Win32 OpenSSH" Tag="Utilities"   ToolTip="OpenSSH is a complete implementation of the SSH protocol version" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="openssh" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.OpenSSH.Beta" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Komodo Edit" Tag="Development"   ToolTip="Komodo Edit is a free and open source text editor" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="komodo-edit" Visibility="Collapsed"/>
<TextBlock Text="ActiveState.KomodoEdit" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FreeCAD" Tag="Imaging"   ToolTip="A free and opensource multiplatform 3D parametric modeler" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="freecad" Visibility="Collapsed"/>
<TextBlock Text="FreeCAD.FreeCAD" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SQLite" Tag="Development"   ToolTip="SQLite is an inprocess library that implements a selfcontained serverless" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="sqlite" Visibility="Collapsed"/>
<TextBlock Text="SQLite.SQLite" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MkDocs" Tag="Development"   ToolTip="MkDocs is a fast simple and downright gorgeous static site" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mkdocs" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MkDocs Material Theme" Tag="Development"   ToolTip="MkDocs is a fast simple and downright gorgeous static site" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mkdocs-material" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PuTTY" Tag="Utilities"   ToolTip="A free implementation of SSH and Telnet along with an" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="putty" Visibility="Collapsed"/>
<TextBlock Text="PuTTY.PuTTY" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="WinSCP" Tag="Utilities"   ToolTip="WinSCP is an open source free SFTP client FTP client" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="winscp" Visibility="Collapsed"/>
<TextBlock Text="WinSCP.WinSCP" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="LibreOffice Still" Tag="Documents"   ToolTip="LibreOffice is the free powerpacked Open Source personal productivity suite" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="libreoffice-still" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aio Runtimes" Tag="Runtimes"   ToolTip="All in One Runtimes also known as AIO Runtimes is" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="aio-runtimes" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual-C-Runtimes All in One Oct 2024" Tag="Runtimes"   ToolTip="This archive contains the latest version Oct 2024 of all" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="vsall" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GPU-Z" Tag="Utilities"   ToolTip="GPUZ is a lightweight system utility designed to provide vital" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="gpu-z" Visibility="Collapsed"/>
<TextBlock Text="TechPowerUp.GPU-Z" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MemTest86" Tag="Utilities"   ToolTip="MemTest86 boots from a USB flash drive and tests the" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="memtest86" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Memtest86 Plus" Tag="Utilities"   ToolTip="Memtest86 Plus v6 is a unified free opensource memory testing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="memtest86plus" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="VLC Skins" Tag="Media Tools"   ToolTip="Put the downloaded VLT files in the following folder On" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="vlc-skins" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GrepWin" Tag="Utilities"   ToolTip="Regular expression search and replace for Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="grepwin" Visibility="Collapsed"/>
<TextBlock Text="StefansTools.grepWin" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NICE DCV Server" Tag="Utilities"   ToolTip="NICE DCV is a remote display protocol that securely streams" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="nice-dcv-server" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NTag" Tag="Media Tools"   ToolTip="NTag is a cross platformgraphical tag editor focused on everyday" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="ntag" Visibility="Collapsed"/>
<TextBlock Text="nrittsti.NTag" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Volume2" Tag="Media Tools"   ToolTip="Advanced Windows volume control" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="volume2" Visibility="Collapsed"/>
<TextBlock Text="irzyxa.Volume2Portable" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="qBittorrent Enhanced Edition" Tag="File Sharing"   ToolTip="Unofficial qBittorrent Enhanced based on qBittorrent" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="qbittorrent-enhanced" Visibility="Collapsed"/>
<TextBlock Text="wingetinstallc0re100.qBittorrent-Enhanced-Edition" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aspia" Tag="File Sharing"   ToolTip="Remote desktop and file transfer tool" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Aspia" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SimpleTransfer Desktop" Tag="File Sharing"   ToolTip="Simple Transfer is the easiest way of transferring your Photos" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="simpletransfer" Visibility="Collapsed"/>
<TextBlock Text="Rambax.SimpleTransfer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Twitch Desktop App" Tag="Gaming"   ToolTip="Servers  A virtual home for your community to chat" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="twitch" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remote Desktop Manager" Tag="File Sharing"   ToolTip="Remote Connections  Passwords. Everywhere" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="rdm" Visibility="Collapsed"/>
<TextBlock Text="Devolutions.RemoteDesktopManager" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Torrid" Tag="Utilities"   ToolTip="Torrid is a multiserver multiclient multitracker Remote Torrent Client which" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="torrid" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mediamonkey" Tag="Media"   ToolTip="Manage small to large collections of audio files videos and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="mediamonkey" Visibility="Collapsed"/>
<TextBlock Text="VentisMedia.MediaMonkey" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MediaInfo" Tag="Media Tools"   ToolTip="Convenient unified display of the most relevent technical and tag" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="mediainfo" Visibility="Collapsed"/>
<TextBlock Text="MediaArea.MediaInfo.GUI" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Universal Media Server" Tag="Media"   ToolTip="Universal Media Server is a DLNAcompliant UPnP Media Server. It" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="ums" Visibility="Collapsed"/>
<TextBlock Text="UniversalMediaServer.UniversalMediaServer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="K-Lite Codec Pack Standard" Tag="Media"   ToolTip="The KLite Codec Pack is a collection of DirectShow filters" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="k-litecodecpack-standard" Visibility="Collapsed"/>
<TextBlock Text="CodecGuide.K-LiteCodecPack.Standard" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="PowerISO" Tag="Compression"   ToolTip="PowerISO provides an allinone solution. You can do every thing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Compression"/>
</StackPanel>
<TextBlock Text="poweriso" Visibility="Collapsed"/>
<TextBlock Text="PowerSoftware.PowerISO" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Screen To Gif" Tag="Utilities"   ToolTip="This tool allows you to record a selected area of" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="screentogif.portable" Visibility="Collapsed"/>
<TextBlock Text="NickeManarin.ScreenToGif" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Figma" Tag="Development"   ToolTip="The collaborative interface design tool Build better products as a" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="figma" Visibility="Collapsed"/>
<TextBlock Text="Figma.Figma" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EarTrumpet" Tag="Utilities"   ToolTip="EarTrumpet is a powerful volume control app for Windows" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="eartrumpet" Visibility="Collapsed"/>
<TextBlock Text="File-New-Project.EarTrumpet" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Visual Studio Code Insiders" Tag="Development"   ToolTip="Microsoft Visual Studio Code is a code editor redefined and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="vscode-insiders" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VisualStudioCode.Insiders" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AyuGramDesktop" Tag="Communication"   ToolTip=" Desktop Telegram client with good customization and Ghost mode" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="ayugramdesktop" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Zettlr" Tag="Documents"   ToolTip="Zettlr is a supercharged markdown editor that combines many writing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="zettlr" Visibility="Collapsed"/>
<TextBlock Text="Zettlr.Zettlr" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="RustDesk" Tag="File Sharing"   ToolTip="An opensource remote desktop software works out of the box" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="File Sharing"/>
</StackPanel>
<TextBlock Text="rustdesk" Visibility="Collapsed"/>
<TextBlock Text="RustDesk.RustDesk" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Ente Auth" Tag="Security"   ToolTip="An endtoend encrypted cross platform and free app for storing" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="ente-auth" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SQLiteStudio" Tag="Development"   ToolTip="SQLiteStudio is desktop application for browsing and editing SQLite database" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="sqlitestudio" Visibility="Collapsed"/>
<TextBlock Text="sqlitestudio.pl.SQLiteStudio" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DuckStation" Tag="Portable"   ToolTip=" Fast PlayStation 1 emulator for x8664/AArch32/AArch64/RV64" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="duckstation" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Authme - Simple 2FA" Tag="Security"   ToolTip="Simple 2FA desktop application" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Security"/>
</StackPanel>
<TextBlock Text="authme.portable" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SuperCopier2" Tag="Utilities"   ToolTip="SuperCopier2 SuperCopier replaces Windows explorer file copy and adds many" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="supercopier2" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Octopus Deploy" Tag="Development"   ToolTip="Octopus Deploy is a Continuous Delivery platform for complex deployments" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="octopusdeploy.tentacle" Visibility="Collapsed"/>
<TextBlock Text="OctopusDeploy.Tentacle" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kindle Previewer" Tag="Documents"   ToolTip="Kindle Previewer is a graphical user interface tool that emulates" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="kindlepreviewer" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Interior Design 3D" Tag="Imaging"   ToolTip="Interior Design 3D is an expert program for home design" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="AMSSoftware.InteriorDesign3D-e" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MeshLab" Tag="Imaging"   ToolTip="MeshLab is an open source portable and extensible system for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Imaging"/>
</StackPanel>
<TextBlock Text="meshlab" Visibility="Collapsed"/>
<TextBlock Text="CNRISTI.MeshLab" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GitKraken" Tag="Development"   ToolTip="Legendary Git GUI client for Windows Mac  Linux" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="gitkraken" Visibility="Collapsed"/>
<TextBlock Text="Axosoft.GitKraken" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Slack" Tag="Communication"   ToolTip="Slack is a collaboration hub for work no matter what" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="slack" Visibility="Collapsed"/>
<TextBlock Text="SlackTechnologies.Slack" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rocket Chat" Tag="Communication"   ToolTip="Rocket.Chat is the leading open source team chat software solution." FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="rocketchat" Visibility="Collapsed"/>
<TextBlock Text="RocketChat.RocketChat" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="TeamSpeak" Tag="Communication"   ToolTip="Use crystal clear sound to communicate with your team mates" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Communication"/>
</StackPanel>
<TextBlock Text="teamspeak" Visibility="Collapsed"/>
<TextBlock Text="TeamSpeakSystems.TeamSpeakClient" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="FFFTP" Tag="Development"   ToolTip="FFFTP is lightweight FTP client software. FFFTP has many useful" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="ffftp" Visibility="Collapsed"/>
<TextBlock Text="Sayuri.FFFTP" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="SmartFTP" Tag="Development"   ToolTip="SmartFTP is a fast and reliable FTP FTPS SFTP HTTP" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="smartftp" Visibility="Collapsed"/>
<TextBlock Text="SmartSoft.SmartFTP" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Rclone" Tag="Development"   ToolTip="Rclone rsync for cloud storage is a commandline program to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="rclone" Visibility="Collapsed"/>
<TextBlock Text="Rclone.Rclone" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Cyberduck" Tag="Development"   ToolTip="Cyberduck is a libre server and cloud storage browser for" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="cyberduck" Visibility="Collapsed"/>
<TextBlock Text="Iterate.Cyberduck" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dolphin" Tag="Gaming"   ToolTip="Dolphin is an emulator for two recent Nintendo video game" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="dolphin" Visibility="Collapsed"/>
<TextBlock Text="DolphinEmulator.Dolphin" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="mGBA" Tag="Gaming"   ToolTip="mGBA is an opensource Game Boy Advance emulator" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="mgba" Visibility="Collapsed"/>
<TextBlock Text="JeffreyPfau.mGBA" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="EmulationStation" Tag="Gaming"   ToolTip="A graphical and themeable emulator frontend that allows you to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="emulationstation" Visibility="Collapsed"/>
<TextBlock Text="Emulationstation.Emulationstation" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ScummVM" Tag="Gaming"   ToolTip="ScummVM is a program which allows you to run certain" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="scummvm" Visibility="Collapsed"/>
<TextBlock Text="ScummVM.ScummVM" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Project64" Tag="Gaming"   ToolTip="Project64 is a free and opensource emulator for the Nintendo" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="project64" Visibility="Collapsed"/>
<TextBlock Text="Project64.Project64" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DOSBox" Tag="Gaming"   ToolTip="DOSBox is an emulator program which emulates an IBM PC" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Gaming"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="DOSBox.DOSBox" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Kodu Game Lab" Tag="Development"   ToolTip="Kodu Game Lab is a 3D game development environment that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="InfiniteInstant.KoduGameLab" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="GDevelop" Tag="Development"   ToolTip="A free and open source nocode game engine designed to" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="gdevelop" Visibility="Collapsed"/>
<TextBlock Text="GDevelop.GDevelop" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Tools" Tag="Development"   ToolTip="The MongoDB Database Tools are a collection of commandline utilities" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mongodb-database-tools" Visibility="Collapsed"/>
<TextBlock Text="MongoDB.DatabaseTools" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="DB Browser for SQLite" Tag="Development"   ToolTip="DB Browser for SQLite DB4S is a high quality visual" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="sqlitebrowser" Visibility="Collapsed"/>
<TextBlock Text="DBBrowserForSQLite.DBBrowserForSQLite" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MySQL" Tag="Development"   ToolTip="The MySQL software delivers a very fast multithreaded multiuser and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mysql" Visibility="Collapsed"/>
<TextBlock Text="Oracle.MySQL" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Compass" Tag="Development"   ToolTip="Compass is a free interactive tool for querying optimizing and" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mongodb-compass" Visibility="Collapsed"/>
<TextBlock Text="MongoDB.Compass.Full" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MongoDB Compass readonly" Tag="Development"   ToolTip="Compass is a free interactive tool for analyzing your MongoDB" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Development"/>
</StackPanel>
<TextBlock Text="mongodb-compass-readonly" Visibility="Collapsed"/>
<TextBlock Text="MongoDB.Compass.Readonly" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="IDA free" Tag="Utilities"   ToolTip="DA is a Windows Linux or Mac OS X hosted" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="ida-free" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Binary Ninja" Tag="Utilities"   ToolTip="reverse engineering tool. It supports a number of great features" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Utilities"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="binaryninja" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Resource Hacker" Tag="Portable"   ToolTip="freeware resource compiler  decompiler for Windows applications" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Portable"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="resourcehacker" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Microsoft Visual C++ Redistributable for Visual Studio 2015-2022" Tag="Runtimes"   ToolTip="Runtime components that are required to run C applications that" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Runtimes"/>
</StackPanel>
<TextBlock Text="vcredist140" Visibility="Collapsed"/>
<TextBlock Text="Microsoft.VCRedist.2015+.x86" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="MPV" Tag="Media"   ToolTip="a free open source and crossplatform media player" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media"/>
</StackPanel>
<TextBlock Text="mpvio" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="ZenBrowser" Tag="Web Browsers"   ToolTip="The modern privacyfocused performancedriven browser built on Firefox" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Web Browsers"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="Zen-Team.Zen-Browser" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Aegisub" Tag="Media Tools"   ToolTip="Aegisub is a free crossplatform open source tool for creating" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Media Tools"/>
</StackPanel>
<TextBlock Text="aegisub" Visibility="Collapsed"/>
<TextBlock Text="Aegisub.Aegisub" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="AppGroup" Tag="Documents"   ToolTip="App Group lets you organize customize and launch your apps" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Documents"/>
</StackPanel>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="na" Visibility="Collapsed"/>
<TextBlock Text="iandiv-appgroup" Visibility="Collapsed"/>
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
<CheckBox Content="Disk cleanup" Tag="Storage"   ToolTip="Clean temporary files that are not necessary" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Storage"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="System File Checker" Tag="Fixer"   ToolTip="sfc /scannow Use the System File Checker tool to repair missing or corrupted system files" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore Classic Context Menu Windows 11" Tag="Classic"   ToolTip="Restore the old context menu for Windows 11" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Classic"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore All Windows Services to Default" Tag="Fixer"   ToolTip="if you face issues with services try Restore All Windows Services to Default" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Super Privacy Disable all Privacy Settings" Tag="Privacy"   ToolTip="Disable WifiSense  Activity History  ActivityFeed All Telemetry  DataCollection  disable various telemetry and annoyances in Edge" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clean Taskbar" Tag="Performance"   ToolTip="Disable icons" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Microsoft Apps" Tag="Performance"   ToolTip="Uninstalls preinstalled Microsoft apps like Clipchamp People etc" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Xbox Apps" Tag="Performance"   ToolTip="Uninstalls preinstalled Xbox apps" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fix Stutter in games" Tag="Performance"   ToolTip="Fix Stutter in Games Disable GameBarPresenceWriter. Windows 10/11" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable the Ultimate Performance Power Plan" Tag="Power"   ToolTip="This will add the Ultimate Performance power plan to enable it go to the power options" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Power"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Reset the TCP/IP Stack" Tag="Fixer"   ToolTip="If you have an internet issue reset the network configuration" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Setup Auto login" Tag="Other"   ToolTip="Setup auto login Windows username" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Other"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Xbox Services" Tag="Performance"   ToolTip="Disables all Xbox Services Game Mode" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Start Menu Ads" Tag="Privacy"   ToolTip="Start menu Ads and Settings" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Windows Web Search" Tag="Privacy"   ToolTip="Web results in search" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Turn off background Apps" Tag="Performance"   ToolTip="Turn off background apps" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable suggestions on Start Menu" Tag="Privacy"   ToolTip="Suggestions on start menu" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Folder Shortcuts From File Explorer" Tag="Other"   ToolTip="Documents Videos Pictures Desktop. Shortcuts from File Explorer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Other"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimize Windows Services" Tag="Performance"   ToolTip="Print Spooler Fax Diagnostic Policy Downloaded Maps Manager Windows Error Reporting Service Remote Registry  Internet Connection Sharing Disables Telemetry and Data" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Hibernate" Tag="Performance"   ToolTip="Allows the system to save the current state of your computer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable OneDrive" Tag="Performance"   ToolTip="Disabling OneDrive" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove OneDrive" Tag="Performance"   ToolTip="Removes OneDrive from the system" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Microsoft Edge (Not Recommended)" Tag="Performance"   ToolTip="Removes Edge from the system" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Activate Windows Classic Photo Viewer" Tag="Classic"   ToolTip="Classic Photo Viewer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Classic"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Copilot in Windows 11" Tag="Privacy"   ToolTip="AI assistance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Recall Snapshots in Windows 11 24H" Tag="Privacy"   ToolTip="Recall is an upcoming preview experience exclusive to Copilot" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Delete Thumbnail Cache" Tag="Performance"   ToolTip="Removing the stored image thumbnails" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Classic Volume Control" Tag="Classic"   ToolTip="The old volume control" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Classic"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Toggle Key Sounds" Tag="Classic"   ToolTip="Toggle key sounds are audio cues that play when you press the Caps Lock Num Lock or Scroll Lock keys" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Classic"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Homegroup" Tag="Privacy"   ToolTip="HomeGroup is a passwordprotected home networking service that lets you share your stuff with other PCs" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Home and Gallery from explorer in Windows 11" Tag="Privacy"   ToolTip="Home and Gallery from explorer and sets This PC as default" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Wifi Sense" Tag="Protection"   ToolTip="Service that phones home all nearby scanned wifi networks and your location" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Autoplay and Autorun" Tag="Protection"   ToolTip="Autoplay in prevents the automatic launch of media or applications when a removable device such as a USB drive or CD" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable SMB Server" Tag="Protection"   ToolTip="SMB Server enables file and printer sharing over a network allowing access to resources on remote computers" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Set current network profile to public" Tag=""   ToolTip="Deny file sharing device discovery" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content=""/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable F8 boot menu options" Tag="BIOS"   ToolTip="Enable F8 boot menu options" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="BIOS"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable display and sleep mode timeouts" Tag="Power"   ToolTip="If you frequently use your device disable this" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Power"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Set Wallpaper desktop Quality to 100%" Tag="Personalization"   ToolTip="Set Wallpaper desktop Quality" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Personalization"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Windows Transparency" Tag="Performance"   ToolTip="Disableing improve performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable scheduled defragmentation task" Tag="Performance"   ToolTip="Optimizes disk performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable NET 3.5" Tag="Classic"   ToolTip="Some old games and applications require .NET Framework 3.5" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Classic"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Super Performance" Tag="Performance"   ToolTip="Disabled all windows effects. You may need to log out and back in for changes to take effect. You can reset to default settings in Settings Tab" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Remove Widgets from Taskbar in Windows 11" Tag="Performance"   ToolTip="Widgets are one of the new user interface elements in Windows 11" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Unknown" Tag="Privacy"   ToolTip="Rename Computer name and Username to Unknown. The changes will take effect after you restart the computer" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Privacy"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Fix Arabic encoding" Tag="Fixer"   ToolTip="Fix issues related to strange symbols appearing in Arabic text" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Restore Default File Type Associations" Tag="Fixer"   ToolTip="Restoring default apps for file type associations resets Windows settings allowing the system to select the appropriate programs by default" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Fixer"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Limit Defender CPU Usage" Tag="Performance"   ToolTip="Limits Defender CPU maximum usage at 25 instead of default 50" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimizing GPU scheduling" Tag="Performance"   ToolTip="Disables HardwareAccelerated GPU Scheduling which may improve performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Fullscreen Optimizations" Tag="Performance"   ToolTip="Fullscreen Optimizations which may improve performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimize Network" Tag="Performance"   ToolTip="Optimize network performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable system cache" Tag="Performance"   ToolTip="Enabling large system cache can improve performance for certain workloads but may affect system stability" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Optimizing NVIDIA GPU settings" Tag="Performance"   ToolTip="Optimize NVIDIA GPU settings " FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Enable Faster Shutdown" Tag="Performance"   ToolTip="Optimize NVIDIA GPU settings " FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
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
<CheckBox Content="Show file extensions" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="Showfileextensions" ToolTip="Show file extensions in Windows displays the suffix at the end of file names like .txt .jpg .exe etc" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Show Super Hidden" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="ShowSuperHidden" ToolTip="Show Super Hidden displays files and folders" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Dark Mode" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="DarkMode" ToolTip="Dark Mode is a setting that changes the screen to darker colors reducing eye strain and saving battery life on OLED screens" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Personalize"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="NumLook" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="NumLook" ToolTip="Toggle the Num Lock key state when your computer starts" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Protection"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Sticky Keys" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="StickyKeys" ToolTip="Sticky keys is an accessibility feature of some graphical user interfaces which assists users who have physical disabilities" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Mouse Acceleration" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="MouseAcceleration" ToolTip="Cursor movement is affected by the speed of your physical mouse movements" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="End Task On Taskbar Windows 11" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="EndTaskOnTaskbarWindows11" ToolTip="End task when right clicking a program in the taskbar" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Clear Page File At Shutdown" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="ClearPageFileAtShutdown" ToolTip="Removes sensitive data stored in virtual memory when the system shuts down" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Storage "/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Auto End Tasks" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="AutoEndTasks" ToolTip="Automatically end tasks that are not responding" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Performance Options" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="PerformanceOptions" ToolTip="Adjust for best performance" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Launch To This PC" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="LaunchToThisPC" ToolTip="File Explorer open directly to This PC" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Accessibility"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Disable Automatic Driver Installation" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="DisableAutomaticDriverInstallation" ToolTip="Automatically downloading and installing drivers" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Drivers"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Always show icons never Thumbnail" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="AlwaysshowiconsneverThumbnail" ToolTip="Show icons in the file explorer instead of thumbnails" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
</StackPanel>        <StackPanel Orientation="Vertical" Margin="10">
<StackPanel Orientation="Horizontal">
<CheckBox Content="Core Isolation Memory Integrity" Tag="" Style="{StaticResource ToggleSwitchStyle}" Name="CoreIsolationMemoryIntegrity" ToolTip="Core Isolation Memory Integrity" FontWeight="SemiBold" FontSize="15" Foreground="{DynamicResource TextColorSecondaryColor}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
<Label Margin="5,0,0,0" FontSize="13" Content="Performance"/>
</StackPanel>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
<TextBlock Text="" Visibility="Collapsed"/>
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
$itt.event.FindName('DisablePopup').add_MouseLeftButtonDown({ DisablePopup; $itt.event.Close() })
$itt.event.FindName('title').text = 'Changelog'.Trim()
$itt.event.FindName('date').text = '04/01/2025'.Trim()
$itt.event.FindName('ytv').add_MouseLeftButtonDown({
Start-Process('https://www.youtube.com/watch?v=QmO82OTsU5c')
})
$itt.event.FindName('shell').add_MouseLeftButtonDown({
Start-Process('https://www.youtube.com/watch?v=nI7rUhWeOrA')
})
$itt.event.FindName('preview').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$itt.event.FindName('preview2').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$itt.event.FindName('esg').add_MouseLeftButtonDown({
Start-Process('https://github.com/emadadel4/itt')
})
$storedDate = [datetime]::ParseExact($itt.event.FindName('date').Text, 'MM/dd/yyyy', $null)
$daysElapsed = (Get-Date) - $storedDate
if (($daysElapsed.Days -ge 1) -and (($itt.PopupWindow -ne "0") -or $i)) {return}
$itt.event.Add_PreViewKeyDown({ if ($_.Key -eq "Escape") { $itt.event.Close() } })
if ($daysElapsed.Days -lt 1){$itt.event.FindName('DisablePopup').Visibility = 'Hidden'}
$itt.event.ShowDialog() | Out-Null
}
function DisablePopup {
Set-ItemProperty -Path $itt.registryPath -Name "PopupWindow" -Value 1 -Force
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
'Refresh-Explorer', 'Remove-ScheduledTasks','CreateRestorePoint'
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
$result = Message -title "Are you sure" -key "Exit_msg" -icon "ask" -action "YesNo"
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