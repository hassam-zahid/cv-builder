Role.find_or_create_by(:name => 'super_admin', :is_active => true, :access_level => 1000) 
Role.find_or_create_by(:name => 'admin', :is_active => true, :access_level => 950)
Role.find_or_create_by(:name => 'admin_editor', :is_active => true, :access_level => 900)
Role.find_or_create_by(:name => 'accountent', :is_active => true, :access_level => 850)
Role.find_or_create_by(:name => 'star_user', :is_active => true, :access_level => 800)
Role.find_or_create_by(:name => 'complete_user', :is_active => true, :access_level => 750)#it can use all services by paying on monthly basis 
Role.find_or_create_by(:name => 'paid_user', :is_active => true, :access_level => 700)#pay just for one time / buying templates and other services 
Role.find_or_create_by(:name => 'trial_user', :is_active => true, :access_level => 650)

#Emails
MasterLookup.find_or_create_by(:key => 'super_admin_emails', :value => 'hssmmalik@gmail.com', :category => 'EMAIL_ADDESSES' )

#Priorities
MasterLookup.find_or_create_by(:key => 'very_high', :value => 'Very High', :category => 'PRIORITY' )
MasterLookup.find_or_create_by(:key => 'high', :value => 'Hight', :category => 'PRIORITY' )
MasterLookup.find_or_create_by(:key => 'medium', :value => 'Medium', :category => 'PRIORITY' )
MasterLookup.find_or_create_by(:key => 'low', :value => 'Low', :category => 'PRIORITY' )
MasterLookup.find_or_create_by(:key => 'very_low', :value => 'Very Low', :category => 'PRIORITY' )
MasterLookup.find_or_create_by(:key => 'trial_allowed_resumes', :value => '2', :category => 'ALLOWED_RESUME' )


#Languages 
MasterLookup.find_or_create_by(:key => 'english', :value => 'english', :category => 'LANGUAGE', :code => 'en' )
MasterLookup.find_or_create_by(:key => 'russian', :value => 'русский', :category => 'LANGUAGE', :code => 'ru' )
#MasterLookup.find_or_create_by(:key => 'chinese', :value => '中文', :category => 'LANGUAGE', :code => 'zh_CN' )
MasterLookup.find_or_create_by(:key => 'spanish', :value => 'Español', :category => 'LANGUAGE', :code => 'es' )
MasterLookup.find_or_create_by(:key => 'arabic', :value => 'أربي', :category => 'LANGUAGE', :code => 'ar' )
MasterLookup.find_or_create_by(:key => 'bengali', :value => 'বাঙালি', :category => 'LANGUAGE', :code => 'bn' )
MasterLookup.find_or_create_by(:key => 'japnese', :value => '日本語', :category => 'LANGUAGE', :code => 'ja' )
MasterLookup.find_or_create_by(:key => 'german', :value => 'Deutsche', :category => 'LANGUAGE', :code => 'de')

#Users 

User.new_user_validation_and_creation('hssmmalik@gmail.com', 'hassam', 'hassam')


#Admin Users
#User.find_by_email('hssmmalik@gmail.com').make_admin_user
#User Categories

categories_in_english  = "All,Physician,Teacher,Technician,Engineer,Laborer,Accountant,Pharmacist,Veterinary physician,Dietitian,Dentist,Engineering technologist,Mechanic,Midwife,Lawyer,Psychologist,Police officer,Radiographer,Tradesman,Actuary,Hairdresser,Surveyor,Health professional,Programmer,Electrician,Dental hygienist,Consultant,Tailor,Chef,Optician,Barber,Occupational Therapist,Actor,Broker,Journalist,Medical laboratory scientist,Paramedic,Secretary,Machinist,Respiratory therapist,Waiter,Librarian,Bricklayer,Welder,Designer,Claims adjuster,Official,Firefighter,Landscape architect,Baker,Dressmaker,Doctor,Engineer,Mathemathics,Professor,Guard,Real Estate Agent,Sports Man"
categories_in_russian  = "Все, Врач, Учитель, Техник, Инженер, Работник, Бухгалтер, Фармацевт, Ветеринарный врач, Диетолог, Стоматолог, Инженер-технолог, Механик, Акушерка, Юрист, Психолог, Полицейский, Радиограф, Продавец, Актуарий, Парикмахер, Сюрвейер, Программист, электрик, стоматолог-гигиенист, консультант, портной, шеф-повар, оптик, парикмахер, профессиональный терапевт, актер, брокер, журналист, медицинский лабораторный ученый, парамедик, секретарь, машинист, респираторный терапевт, официант, библиотекарь, каменщик, сварщик, дизайнер, претензии Администратор, Пожарный, Ландшафтный архитектор, Бейкер, Швейцар, Доктор, Инженер, Математика, Профессор, Охрана, Агент по Недвижимости, Спорт Человек"
categories_in_japnese  = "医師,教師,技師,技術者,技術者,労働者,会計士,薬剤師,獣医,医師,栄養士,工学技術者,メカニック,助産師,弁護士,心理学者,警察官,プログラマー,電気工学者,コンサルタント,テーラー,シェフ,眼科医,理学療法士,理学療法士,職業療法士,俳優,ブローカー,ジャーナリスト,医療検査科学者,救急処置医師,医師,機械工,秘書,司書,レンガ,アジャスタ,公式,消防士,ランドスケープアーキテクト,ベイカー,ドレスメーカー,医者,エンジニア,数学,教授,警備員,不動産エージェント,スポーツマン"
categories_in_spansish = "Todos, Médico, Profesor, Técnico, Ingeniero, Obrero, Contador, Farmacéutico, Médico veterinario, Dietista, Dentista, Técnico en ingeniería, Mecánico, Partera, Abogado, Psicólogo, Oficial de policía, Radiógrafo, Comerciante, Actuario, Peluquero, Topógrafo, Profesional de la salud, Programador, Electricista, Higienista Dental, Consultor, Sastre, Chef, Óptico, Peluquero, Terapeuta Ocupacional, Actor, Agente, Periodista, Científico de laboratorio médico, Paramédico, Secretario, Maquinista, Terapeuta respiratorio, Camarero, Bibliotecario, Albañil, Soldador, Diseñador, Reclamaciones Ajustador, Oficial, Bombero, Arquitecto paisajista, Panadero, Modista, Médico, Ingeniero, Matemático, Profesor, Guardia, Agente de bienes raíces, Hombre de deportes" 
categories_in_arabic   = "مهندس,طبيب,طبيب بيطري,اختصاصي تغذية,طبيب أسنان,تقني هندسة,ميكانيكي,قابلة,محامي,طبيب نفسي,ضابط شرطة,مصور,تاجر,خبير أكتواري,كوافير,مساح,أخصائي صحة,مصمم,فني كهربائي,طبيب أسنان,استشاري,خياط,شيف,أخصائي بصريات,حلاق,أخصائي علاج,ممثل,وسيط,صحفي,عالم مختبرات طبية,مسعف,سكرتير,ماهنيست,أخصائي في الجهاز التنفسي,نادل,أمين مكتبة,بريكلاير,ويلدر,ديسيغنر,كليمز الضابط,مسؤول,رجال الاطفاء,مهندس المناظر الطبيعية,بيكر,خياطة,طبيب,مهندس,الرياضيات,أستاذ,الحرس,وكيل عقارات,رجل الرياضة"
categories_in_bengali  = "চিকিৎসক, ডাক্তার, প্রকৌশলী, ডাক্তার, চিকিৎসক, ফার্মাসিস্ট, ভেটেরিনারি চিকিৎসক, ডিত্তীয়িয়ান, ডেন্টিস্ট, প্রকৌশল টেকনোলজিস্ট, মেকানিক, মিডওয়াইফ, আইনজীবী, মনোবৈজ্ঞানিক, পুলিশ অফিসার, রেডিয়োগ্রাফার, ব্যবসায়ী, অ্যাক্টিউরিয়াস, হেয়ারড্রেসার, সার্ভেয়ার, স্বাস্থ্য পেশাদার, প্রোগ্রামার, ইলেকট্রিকিয়ান, ডেন্টাল হিউজিস্ট, কনসালট্যান্ট, টাইলার, শেফ, অপ্টিশিয়ান, বারবার, পেশাগত থেরাপিস্ট, অভিনেতা, ব্রোকার, সাংবাদিক, ঔষধের পরীক্ষাগার বিজ্ঞানী, পারিবারিক, সচিব, যন্ত্রচালক, শ্বাসযন্ত্রের থেরাপিস্ট, ওয়েটার, লাইব্রেরিয়ান, ব্রাইটাইলার, ওয়েলডার, ডিজাইনার, দাবিদার অ্যাডজাস্টার, অফিসিয়াল, অগ্নিকাণ্ড, ল্যান্ডস্কেপ স্থপতি, বেকার, পোষাক, ডাক্তার, প্রকৌশলী, গণিতবিদ, প্রফেসর, গার্ড, রিয়েল এস্টেট এজেন্ট, স্পোর্টস ম্যান"
categories_in_german   = "Alle, Arzt, Lehrer, Techniker, Ingenieur, Arbeiter, Buchhalter, Apotheker, Tierarzt, Ernährungsberater, Zahnarzt, Technologe, Mechaniker, Hebamme, Rechtsanwalt, Psychologe, Polizist, Röntgenschnitt, Händler, Aktuar, Friseur, Landvermesser, Gesundheitspersonal, Programmierer, Elektriker, Dentalhygieniker, Berater, Schneider, Koch, Optiker, Friseur, Ergotherapeut, Schauspieler, Makler, Journalist, Medizinischer Laborwissenschaftler, Sanitäter, Sekretär, Maschinist, Atemtherapeut, Kellner, Bibliothekar, Maurer, Schweißer, Designer, Claims Berufsbezeichnung, Beamter, Feuerwehrmann, Landschaftsarchitekt, Bäcker, Schneider, Doktor, Ingenieur, Mathematiker, Professor, Wache, Immobilienmakler, Sportmann"
categories_in_chinese  = "所有,医生,老师,技术员,工程师,劳动者,会计师,药剂师,兽医医师,营养师,牙医,工程技术专家,技工,助产士,律师,心理学家,电工,牙科保健师,顾问,裁缝,厨师,眼镜师,理发师,职业治疗师,演员,经纪人,记者,医学实验室科学家,医务人员,司,机械师,呼吸治疗师,侍者图书管理员,瓦工,焊工,官方,消防员,景观设计师,贝克,裁缝,医生,工程师,数学,教授,警卫,房地产经纪人,体育人"

Category.insert_categories_in_bulk(categories_in_english)
Category.insert_categories_in_bulk(categories_in_russian)
Category.insert_categories_in_bulk(categories_in_japnese)
Category.insert_categories_in_bulk(categories_in_spansish)
Category.insert_categories_in_bulk(categories_in_arabic)
Category.insert_categories_in_bulk(categories_in_bengali)
Category.insert_categories_in_bulk(categories_in_german)
Category.insert_categories_in_bulk(categories_in_chinese)


JobTitle.insert_job_titles_in_bulk(categories_in_english)
JobTitle.insert_job_titles_in_bulk(categories_in_russian)
JobTitle.insert_job_titles_in_bulk(categories_in_japnese)
JobTitle.insert_job_titles_in_bulk(categories_in_spansish)
JobTitle.insert_job_titles_in_bulk(categories_in_arabic)
JobTitle.insert_job_titles_in_bulk(categories_in_bengali)
JobTitle.insert_job_titles_in_bulk(categories_in_german)
JobTitle.insert_job_titles_in_bulk(categories_in_chinese)


Company.find_or_create_by(:name => 'Softoweb')
Company.find_or_create_by(:name => 'Techhive')
Company.find_or_create_by(:name => 'Netsole')
Company.find_or_create_by(:name => 'Ginza App')


countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]
countries.map{|country| Country.insert_country(country)}

t1 = Template.create(:name => 'Orbit', :global_key => Api.global_key, :description => 'It describes the matrics formula', :category_id => 1, :is_active => true, :template_project_url => "http://orbit.mobirecords.com")
t1.image = open("#{Rails.root}/public/images/templates/orbit.png")
t1.save

t2 = Template.create(:name => 'Orbit', :global_key => Api.global_key, :description => 'It describes the matrics formula', :category_id => 1, :is_active => true, :template_project_url => "http://orbit.mobirecords.com")
t2.image = open("#{Rails.root}/public/images/templates/orbit.png")
t2.save


