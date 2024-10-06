import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "English": "العربية",
          "Beta": "تجريبي",

          //sign in
          "Sign In": "تسجيل الدخول",
          "Sign Out": "تسجيل الخروج",
          "Welcome Back": "مرحبا من جديد",
          "Sign In With Your Email And Password":
              "قم بتسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور",
          "Email": "البريد الإلكتروني",
          "Password": "كلمة المرور",
          "Forgot Password": "نسيت كلمة المرور ",
          "Don't have an account ? ": "ليس لديك حساب؟",
          "OR": "أو",
          "SignUp": "اشترك",
          "I have read and accept ": 'لقد قرأت وأوافق علي ',
          "terms and conditions": 'الشروط و الأحكام ',
          "Welcome to Aegypti": "مرحبا بكم في Aegypti",
          "Your number 1 guide to Arabic World": "دليلك الأول للعالم العربي",
          "Tourist": "سائح",
          "Tour Guide": "مرشد سياحي",
          "Our Website": "موقعنا على الانترنت",
          "About Alrehila": "عن الرحلة",
          "About US": "عننا",
          "Help": "المساعدة",
          "Alrehila": "الرحلة",
          "Hotels": "الفنادق",
          "Sights": "معالم",
          "Restaurants": "المطاعم",
          "Beaches": "الشواطيء",
          "Language": "اللغة",
          "Click Here": "اضغط هنا",
          "Tourism": "السياحة",
          "One night average price:": "متوسط سعر الليلة:",
          "Beach": "شاطيء",
          "Tourist Sight": "معلم سياحي",
          "Restaurant": "مطعم",
          "Hotel": "فندق",
          "beach": "شاطيء",
          "restaurant": "مطعم",

          //onboarding
          "Continue": "استمر",
          "Alrehila is an app to help people travelling to Arab World find the best places to visit":
              "Alrehila هو تطبيق لمساعدة الأشخاص الذين يسافرون إلى العالم العربي في العثور على أفضل الأماكن للزيارة",
          "Hotels and Places": "الفنادق والأماكن",
          "Alrehila provide the user with the top hotels to stay in and also the best places to visit":
              "توفر Alrehila للمستخدم أفضل الفنادق للإقامة فيها وكذلك أفضل الأماكن للزيارة",
          "All About Arab World": "كل شيء عن العالم العربي",
          "Alrehila also helps you with some useful information about the arab world":
              "يساعدك تطبيق Alrehila أيضًا في الحصول على بعض المعلومات المفيدة",
          "Tour Guide Booking": "حجز مرشد السياحي",
          "Alrehila saves you a lot of time as we have the best tour guides you would find":
              "يوفر لك تطبيق Alreihla الكثير من الوقت حيث لدينا افضل المرشديين السياحيين",

          //medical
          "Medical tourism": "سياحة علاجية",
          "Dream lodge hotel": "فندق دريم لودج",
          "See why so many travelers make Siwa Dream Lodge their small hotel of choice when visiting Siwa. Providing an ideal mix of value, comfort and convenience, it offers a family-friendly setting with an array of amenities designed for travelers like you.":
              "تعرف على سبب قيام العديد من المسافرين بجعل فندق دريم لودج فندقهم الصغير المفضل عند زيارة سيوة. يوفر مزيجًا مثاليًا من القيمة والراحة ، ويوفر بيئة مناسبة للعائلة مع مجموعة من وسائل الراحة المصممة للمسافرين مثلك.",
          "Sleep in Siwa": "النوم في سيوة",
          "Conveniently situated in the Siwa part of Siwa, this property puts you close to attractions and interesting dining options.":
              "يقع في مكان ملائم في جزء سيوة من سيوة ، هذه الملكية تجعلك على مقربة من مناطق الجذب وخيارات تناول الطعام الممتعة.",
          "Siwa Shali Resort": "منتجع سيوة شالي",
          "Set within the scenery of the Sahara Desert in Siwa, Siwa Shali Resort offers a landscaped pool area that unravels throughout the resort, traditional Siwa houses and a hot spring bath for medication.":
              "يقع منتجع سيوة شالي وسط المناظر الطبيعية للصحراء الكبرى في سيوة ، ويوفر منطقة مسبح ذات مناظر طبيعية تنتشر في جميع أنحاء المنتجع ومنازل سيوة التقليدية وحوض استحمام بالمياه الحارة للأدوية.",

          //profile
          "Profile": "الحساب",
          "Tour guide profile": "حساب المرشد السياحي",
          "Name : ": "الاسم",
          "Age : ": "السن",
          "Number : ": "رقم الهاتف",
          "Location : ": "الموقع",
          "Contact": "تواصل",
          "Enter your name": "ادخل اسمك",
          "Enter your name here": "ادخل اسمك هنا",
          "Enter your phone": "أدخل هاتفك",
          "Enter your phone here": "أدخل هاتفك هنا",
          "Submit": "تسجيل",
          "Google Account: ": "حساب Google",
          "Link": "ربط",
          "Linked": "مربوط",
          "Facebook Account: ": "حساب Facebook",
          "Sign in to see deals and discounts, \n manage your trips, book hotels ,and more":
              "قم بتسجيل الدخول لرؤية العروض والخصومات, \n إدارة رحلاتك وحجز الفنادق والمزيد",

          //driver
          "Driver request": "طلب سائق",
          "Booking": "الحجز",
          "NO. of People": "عدد الناس",
          "Destination": "وجهة",
          "From(Time)": "من (وقت)",
          "To(Time)": "الى (وقت)",
          "Book": "احجز",

          //guidelist
          "Tour Guide List": "قائمة المرشدين السياحي",
          "Name": "الاسم",
          "View": "اتطلاع",

          //safari
          "Safari": "السفاري",
          "Quadruple desert safari to visit the pyramids and Hurghada":
              "سفاري صحراوي رباعي لزيارة الأهرامات والغردقة",
          "A quad bike ride in the desert around the Pyramids of Giza was one of those once-in-a-lifetime desert encounters from Cairo.":
              "ركوب الدراجة الرباعية في الصحراء حول أهرامات الجيزة كان أحد أبرز تلك اللقاءات الصحراوية التي تحدث مرة في العمر من القاهرة.",
          "Siwa Oasis": "واحة سيوة",
          "Luxor desert safari tour": " جولة سفاري الأقصر الصحراوية",
          "You should try camping in the city of Luxor, which is the gateway to Egyptian tourism, antiquities, museums, Nile Cross trips and other activities, and desert safari trips in Egypt":
              "عليك تجربة التخييم في مدينة الأقصر وهي بوابة السياحة المصرية والأثار والمتاحف ورحلات النايل كروس وغيرها من الفعاليات ورحلات سفاريالصحراءفيمصر",
          "Siwa Oasis is considered one of the areas rich in distinct tourism potentials, including safari tourism. Siwa is located to the west of Marsa Matruh, about 300 km, with an area of about 7,800 km.":
              "تعتبر واحة سيوة من المناطق الغنية بالمقومات السياحية المتميزة منها سياحة السفاري.تقع سيوه إلى الغرب من مرسى مطروح بنحو 300 كيلومتر حيث تبلغ مساحتها حوالي 7800 كم",

          //signup

          "Sign Up": "انشئ حساب",
          "Welcome to our app": "مرحبًا بك في تطبيقنا",
          "Sign Up With Your Email And Password":
              "قم بالتسجيل باستخدام بريدك الإلكتروني وكلمة المرور",
          "Phone": "الهاتف",
          "Username": "اسم المستخدم",
          "Confirm Password": "تأكيد كلمة المرور",
          " have an account ? ": "لديك حساب ؟",
          "Guide Sign In": "تسجيل دخول المرشد",
          "Guide Sign Up": "انشاء حساب للمرشد",
          "Age": "السن",

          //settings
          "Settings": "الاعدادات",
          "Change Password": "تغيير كلمة السر",
          "Theme :": "المظهر :",
          "Build Number": "رقم الاصدار",
          "Account": "الحساب",
          "Appearance": "المظهر",
          "App Language :": ": لغة البرنامج",
          "App Language": "لغة البرنامج",
          "Invite a friend": "ادعو صديق",
          "General": "عام",
          "Live chat": "دردشة مباشرة",
          "Contact US": "تواصل معنا",
          "WhatsApp": "واتساب",
          "Terms": "شروط",
          "Support": "الدعم",
          "About": "معلومات",
          "© 2022-2024  OZYMA  |  All rights reserved":
              "© 2022-2024  OZYMA  | جميع الحقوق محفوظة",
          "Dark": "مظلم",
          "Light": "مضيء",
          "System": "النظام",
          "Select Theme Mode": "حدد وضع المظهر",
          "Need Help?": "تحتاج مساعدة؟",
          "Send us message now": "أرسل لنا رسالة الآن",
          "subject": "الموضوع",
          "description": "الوصف",
          "Send": "إرسال",

          //card
          "Luxor and Aswan Hotel": "فندق الاقصر و اسوان",
          "Cairo Hotel": "فندق القاهرة",
          "Alexandria Hotel": "فندق الاسكندرية",
          "Alexandria Restaurant": "مطعم الاسكندرية",
          "Cairo Restaurant": "مطعم القاهرة",
          "Luxor and Aswan Restaurant": "مطعم الاقصر واسوان",
          "Alexandria Beach": "شاطئ الاسكندرية",

          //home
          "Cities": "مدن",
          "Home": "المنزل",
          "Medical Tourism": "السياحة العلاجية",
          "Alrehila \nYour number 1 guide to Arabic World":
              "الرحلة \nدليلك الأول للعالم العربي",
          "Are You Sure,You Want to Exit?": "هل انت متأكد من رغبتك في الخروج؟",
          "Exit...": "الخروج...",
          "yes": "نعم",
          "cancel": "الغاء",
          "Cancel": "الغاء",
          "Events": "أحداث",
          "Store": "متجر",
          "Hot Beaches :": "الشواطيء الشهيرة :",
          "Hot Hotels :": "الفنادق الشهيرة :",
          "Hot Sights :": "المعالم الشهيرة :",
          "Hot Restaurants :": "المطاعم الشهيرة :",
          "END OF PAGE": "نهاية الصفحة",
          "Search": "البحث",
          "Discover": "استكشف",

          //favorite
          "Favorite": "المفضلة",
          "Save what you love for later": "احفظ ما تحبه لوقت لاحق",
          "Create lists of favourite hotels": "إنشاء قوائم بالفنادق المفضلة",
          "Start searching": "ابدأ البحث",
          "Create a list": "إنشاء قائمة",

          //abouts
          "About Egypt": "عن مصر",
          "About Saudi": "عن السعودية",
          "About UAE": "عن الامارات",
          "About Qatar": "عن قطر",
          "About Morocco": "عن المغرب",

          //about
          "Transportation:": "المواصلات:",
          "Do you need a private driver": "هل تحتاج إلى سائق خاص",
          "Souvenirs:": "هدايا تذكارية:",
          "Egyptian Heritage:": "التراث المصري:",
          "Events:": "الأحداث:",
          "Egyptian Food:": "اكلات مصرية:",

          //aboutus
          "About Us": "عننا",
          "Who we are": "من نحن",
          "We are a group of youth who cooperated in the year 2021 in the field of application development and programming, and we always try to find problems and solve them in the most appropriate way possible, and the idea of developing this program came to us from a personal experience when we traveled to the Arab Emirates in 2022 and in fact we did not have enough information about the country, transportation or tourist attractions, so we decided not to repeat what we experienced with others by developing this program and making it at the level of all the Arab countries.":
              "نحن مجموعة من الشباب تعاونا في عام 2021 في مجال تطوير التطبيقات والبرمجة، ونحاول دائمًا إيجاد المشاكل وحلها بالطريقة الأنسب الممكنة، وجاءت فكرة تطوير هذا البرنامج إلينا من تجربة شخصية عندما سافرنا إلى الإمارات العربية في عام 2022 وفي الحقيقة لم يكن لدينا معلومات كافية عن البلد أو المواصلات أو المعالم السياحية، فقررنا عدم تكرار ما مررنا به مع الآخرين بتطوير هذا البرنامج وجعله على مستوى كافة الدول العربية.",
          "Our Works:": "أعمالنا:",
          "Fixware was our first work at all, the idea of the application is to remedy and solve the problems of modern technology through an application that provides everything the user needs from cutting his computer or needs to repair it and cannot or wants courses and courses to learn hardware skills or if he is interested in programming or design and wants to learn them and acquire their skills.":
              "كان تطبيق فيكس وير هو أول عمل لنا على الإطلاق، فكرة التطبيق هي معالجة وحل مشاكل التكنولوجيا الحديثة من خلال تطبيق يوفر كل ما يحتاجه المستخدم من تقطيع حاسوبه أو يحتاج إلى إصلاحه ولا يستطيع أو يريد دورات ودورات لتعلم مهارات الأجهزة أو إذا كان مهتم بالبرمجة أو التصميم ويريد تعلمها واكتساب مهاراتها.",
          "Our Goals:": "أهدافنا:",
          "- Spread our Arabic culture all over the world.":
              "- نشر ثقافتنا العربية في كافة أنحاء العالم.",
          "- Enjoy every single momment in your trip.":
              "- جعلك تستمتع بكل لحظة في رحلتك.",
          "- reduce the scamming precentage.": "- تقليل نسبة الاحتيال.",
          "- Make your Experience as best as it could be.":
              "- جعل تجربتك أفضل ما يمكن أن تكون.",
          "Powered by": "مدعوم بواسطة",

          //Booking
          "Bookings": "الحجوزات",
          "No booking yet": "لا يوجد حجز حتى الآن",
          "Get started by creating an account or sign in":
              "ابدأ بإنشاء حساب أو تسجيل الدخول",
          "No past bookings": "لا يوجد حجوزات سابقة",
          "No cancelled bookings": "لا يوجد حجوزات ملغاة",
          "Active": "السارية",
          "Past": "الماضية",
          "Cancelled": "الملغاة",

          //More
          "Countries :": "الدول :",
          "Explore services": "اكتشف الخدمات",
          "More details": "المزيد من التفاصيل",
        },
        "en": {}
      };
}
