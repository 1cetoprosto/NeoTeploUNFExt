&НаКлиенте
Процедура АНТ_АНТ_РазделыГруппыПриАктивизацииСтроки(Элемент)
	
	Если Элемент.ТекущиеДанные <> Неопределено Тогда
		ТекДанныеИД = Строка(Элемент.ТекущиеДанные.РазделГруппаИД);
		ИДГруппы = ТекДанныеИД;
		Для каждого стр Из Объект.Запасы Цикл
			Если стр.А_ГруппаИД = "" Тогда
				стр.А_ГруппаИД = ТекДанныеИД;
				стр.Пометка = Истина;
			Иначе
				Если стр.А_ГруппаИД = ТекДанныеИД Тогда
				стр.Пометка = Истина;
			Иначе
				стр.Пометка = Ложь;
			КонецЕсли;
			КонецЕсли; 
			 
		КонецЦикла; 
		
		Элементы.Запасы.ОтборСтрок  = Новый ФиксированнаяСтруктура(Новый Структура("А_ГруппаИД", Строка(ТекДанныеИД)));
		
		
	КонецЕсли; 

КонецПроцедуры

&НаКлиенте
Процедура АНТ_АНТ_РазделыГруппыПриОкончанииРедактированияВместо(Элемент, НоваяСтрока, ОтменаРедактирования)
	
	ТекДанные = Элемент.ТекущиеДанные.РазделГруппа;
	ТекДанныеИД = Элемент.ТекущиеДанные.РазделГруппаИД;
	Элемент.ТекущиеДанные.РазделГруппаИД = ПолучитьИДНаСервере(ТекДанные, ТекДанныеИД);
	ИДГруппы = Строка(Элемент.ТекущиеДанные.РазделГруппаИД);
	Если ТекДанныеИД <> ИДГруппы Тогда
		Для каждого стр Из Объект.Запасы Цикл
			Если стр.А_ГруппаИД = Строка(ТекДанныеИД) Тогда
				стр.А_ГруппаИД = ИДГруппы;
			КонецЕсли; 
		КонецЦикла; 
		
		Элементы.Запасы.ОтборСтрок  = Новый ФиксированнаяСтруктура(Новый Структура("А_ГруппаИД", Строка(ИДГруппы)));
		
	КонецЕсли;

КонецПроцедуры

&НаСервере
Функция  ПолучитьИДНаСервере(ТекДанные, ТекДанныеИД)
	
	//Таб = Объект.РазделыГруппы.Выгрузить(,"УникальныйИдентефикатор");    
	
	//Если ТипЗнч(ТекДанные) = Тип("Строка") Тогда
		//НайденнаяСтрока = Таб.Найти(Строка(ТекДанныеИД), "УникальныйИдентефикатор");
		Если Строка(ТекДанныеИД) = "00000000-0000-0000-0000-000000000000" или Строка(ТекДанныеИД) = "" Тогда
			ИД =  Новый УникальныйИдентификатор;
		Иначе
			ИД = ТекДанныеИД;
		КонецЕсли;  
		
	//Иначе
	//	ИД = ТекДанные.УникальныйИдентификатор();
	//КонецЕсли;
	Возврат ИД;
КонецФункции


&НаСервере
Процедура АНТ_ПриСозданииНаСервереПосле(Отказ, СтандартнаяОбработка)
	//Элементы.ГруппаРазделы.Видимость = Истина;
	//ЗначениеВидЗаказа = Объект.ВидЗаказа.Наименование;
	//Если ЗначениеВидЗаказа = "Комерційне по опаленню" Тогда
	//	Элементы.ГруппаРазделы.Видимость = Истина;
	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Истина;
	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
	//ИначеЕсли ЗначениеВидЗаказа = "Комерційне по сонячним" Тогда
	//	Элементы.ГруппаРазделы.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Истина;
	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
	//ИначеЕсли ЗначениеВидЗаказа = "Комерційне по тепловим" Тогда
	//	Элементы.ГруппаРазделы.Видимость = Истина;
	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Истина;
	//Иначе
	//	Элементы.ГруппаРазделы.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
	//КонецЕсли; 

	 СписокМощностей = Новый Массив;
	 Для а=1 по 1000 Цикл
		 СписокМощностей.Добавить(а);
	 КонецЦикла;
	 Элементы.АНТ_Мощность.СписокВыбора.ЗагрузитьЗначения(СписокМощностей);

	  СписокСолнечныеКоллекторы = Новый Массив;
	 Для а=1 по 100 Цикл
		 СписокСолнечныеКоллекторы.Добавить(а);
	 КонецЦикла;
	 Элементы.АНТ_Оборудование_Солнечные.СписокВыбора.ЗагрузитьЗначения(СписокСолнечныеКоллекторы);
	//НужнаТаблицаРазделы =  Объект.ВидЗаказа.АНТ_НужныРазделы;
	//Если НужнаТаблицаРазделы Тогда
	//	Элементы.ГруппаРазделы.Видимость = Истина;
	//КонецЕсли; 
КонецПроцедуры


//&НаКлиенте
//Процедура АНТ_ВидЗаказаПриИзмененииПосле(Элемент)
//	
//	//ЗначениеВидЗаказа = Элемент.ТекстРедактирования;
//	//Если ЗначениеВидЗаказа = "Комерційне по опаленню" Тогда
//	//	Элементы.ГруппаРазделы.Видимость = Истина;
//	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Истина;
//	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
//	//ИначеЕсли ЗначениеВидЗаказа = "Комерційне по сонячним" Тогда 
//	//	Элементы.ГруппаРазделы.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Истина;
//	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
//	//ИначеЕсли ЗначениеВидЗаказа = "Комерційне по тепловим" Тогда
//	//	Элементы.ГруппаРазделы.Видимость = Истина;
//	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Истина;
//	//Иначе
//	//	Элементы.ГруппаРазделы.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеИнженерныеСети.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеСолнечныеКоллекторы.Видимость = Ложь;
//	//	Элементы.ГруппаОборудованиеТепловыеНасосы.Видимость = Ложь;
//	//КонецЕсли; 
//	//ф=1;
//	// Вставить содержимое обработчика.
//КонецПроцедуры



//&НаКлиенте
//Процедура АНТ_ВидЗаказаОбработкаВыбораПеред(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
//	
//	//ВидОперацииНач = Объект.ВидЗаказа;
//	//НужнаТаблицаРазделыНач = ПолучитьНеобходимостьВывестиТаблицу(Объект.ВидЗаказа);
//	//НужнаТаблицаРазделыВыбранноеЗначение = ПолучитьНеобходимостьВывестиТаблицу(ВыбранноеЗначение);
//	//Если НужнаТаблицаРазделыНач Тогда
//	//	Если Не НужнаТаблицаРазделыВыбранноеЗначение Тогда
//	//		ОписаниеОповещения = Новый ОписаниеОповещения("УстановитьВозможностьРедактированияВидЗаказаЗавершение", ЭтотОбъект);
//	//	
//	//	 	ПоказатьВопрос(
//	//		ОписаниеОповещения,
//	//		НСтр("ru='Все строки таблицы Разделы будут удалены. Продолжить?';uk='Всі рядки таблиці Розділи будуть видалені. Продовжити?'"),
//	//		РежимДиалогаВопрос.ДаНет
//	//	);
//	//	 КонецЕсли; 
//	// КонецЕсли;
//	// 
//	// Если НужнаТаблицаРазделыВыбранноеЗначение Тогда
//	//	 УстановитьВидимостьТаблицы();
//	//	//Элементы.АНТ_РазделыГруппы.Видимость = Истина;
//	// КонецЕсли;
//	 
//	

//КонецПроцедуры

&НаКлиенте
Процедура УстановитьВозможностьРедактированияВидЗаказаЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Если Результат <> КодВозвратаДиалога.Да Тогда
		Объект.ВидЗаказа = ВидОперацииНач;
		Возврат;
	Иначе
		Объект.А_РазделыГруппы.Очистить();
		Элементы.А_РазделыГруппы.Видимость = Ложь;
		Элементы.Запасы.ОтборСтрок  = Новый ФиксированнаяСтруктура(Новый Структура("А_ГруппаИД", ));
		
		Для каждого стр Из Объект.Запасы Цикл
			стр.А_ГруппаИД = "";
		КонецЦикла; 
	КонецЕсли;
	
	//Пока Объект.ПлатежныйКалендарь.Количество() > 1 Цикл
	//	Объект.ПлатежныйКалендарь.Удалить(Объект.ПлатежныйКалендарь.Количество()-1);
	//КонецЦикла;
	//
	//Элементы.РедактироватьСписком.Пометка = НЕ Элементы.РедактироватьСписком.Пометка;
	//УправлениеФормой();
	
КонецПроцедуры

	
//&НаСервере
//Функция ПолучитьНеобходимостьВывестиТаблицу(ВидЗаказа)
//	
//	
//	ЗначениеВидЗаказа = ВидЗаказа.Наименование;
//	Если ЗначениеВидЗаказа = "Комерційне по опаленню" или ЗначениеВидЗаказа = "Комерційне по тепловим" Тогда
//		Возврат Истина;
//	Иначе
//		 Возврат Ложь;
//	КонецЕсли; 
//	
//КонецФункции
 	

//&НаСервере
//Процедура УстановитьВидимостьТаблицы()
//	 Элементы.А_РазделыГруппы.Видимость = Истина;

//КонецПроцедуры

&НаКлиенте
Процедура АНТ_ЗапасыНоменклатураПриИзмененииПосле(Элемент)
	СтрокаТабличнойЧасти = Элементы.Запасы.ТекущиеДанные;
	СтрокаТабличнойЧасти.А_ГруппаИД = ИДГруппы;
КонецПроцедуры

&НаКлиенте
Процедура АНТ_АНТ_РазделыГруппыПередУдалениемПосле(Элемент, Отказ)
	УдалитьРазделыНаСервере();
КонецПроцедуры


&НаСервере
Процедура УдалитьРазделыНаСервере()
	
	//ТабЗнач = Новый ТаблицаЗначений;
	//ТабЗнач.Колонки.Добавить("НомерТаблицы");
	
	ТабЗначИД = Новый ТаблицаЗначений;
	ТабЗначИД.Колонки.Добавить("УникальныйИдентефикатор");
	
	Для каждого стр Из Элементы.А_РазделыГруппы.ВыделенныеСтроки Цикл
		//НоваяСтрока = ТабЗнач.Добавить();
		//НоваяСтрока.НомерТаблицы = стр;
		//
		//ПараметрыОтбора = Новый Структура;
		//ПараметрыОтбора.Вставить("НомерСтроки", стр+1);
		//НайденныеСтроки = Объект.АНТ_РазделыГруппы.НайтиСтроки(ПараметрыОтбора);
		//Если НайденныеСтроки <> Неопределено и НайденныеСтроки.КОличество() = 1 Тогда
		стрРазделыГруппы = Объект.А_РазделыГруппы.НайтиПоИдентификатору(стр);
		    Если НЕ стрРазделыГруппы = Неопределено Тогда

		НоваяСтрокаИД = ТабЗначИД.Добавить();
			НоваяСтрокаИД.УникальныйИдентефикатор = стрРазделыГруппы.РазделГруппаИД;
		КонецЕсли; 
	КонецЦикла;
	//ТабЗнач.Сортировать("НомерТаблицы Убыв");
	//Для каждого стр Из ТабЗнач Цикл
	//	Объект.АНТ_РазделыГруппы.Удалить(стр.НомерТаблицы);
	//КонецЦикла; 
	
	Для каждого стрТабЗнач Из ТабЗначИД Цикл
		СтруктураДляПоиска = Новый Структура("А_ГруппаИД", Строка(стрТабЗнач.УникальныйИдентефикатор)); 
		ТабличнаяЧастьДок = Объект.Запасы; 
		
		МассивНайденныхСтрок = ТабличнаяЧастьДок.НайтиСтроки(СтруктураДляПоиска); 
		Для каждого Строка Из МассивНайденныхСтрок Цикл 
			ТабличнаяЧастьДок.Удалить(Строка); 
		КонецЦикла;  
	КонецЦикла; 
	
КонецПроцедуры

&НаСервере
&После("ПолучитьЗапасыИзХранилища")
Процедура АНТ_ПолучитьЗапасыИзХранилища(АдресЗапасовВХранилище, ИмяТабличнойЧасти, ЕстьХарактеристики, ЕстьПартии)
	
	Для каждого стр Из Объект.Запасы Цикл
		Если стр.А_ГруппаИД = "" Тогда
			стр.А_ГруппаИД = ИДГруппы;
		КонецЕсли; 
	КонецЦикла; 
	// Вставить содержимое метода.
КонецПроцедуры

&НаКлиенте
Процедура АНТ_АНТ_РазделыГруппыПриНачалеРедактированияПосле(Элемент, НоваяСтрока, Копирование)
	Если НоваяСтрока и Копирование Тогда
		ТекДанные = Элемент.ТекущиеДанные.РазделГруппа;
		Элемент.ТекущиеДанные.РазделГруппаИД = "";
		ф=1;
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
&После("ОбработатьВставленныеСтроки")
Процедура АНТ_ОбработатьВставленныеСтроки(ИмяТЧ, ИмяЭлемента, КоличествоВставленных)
	Если ИмяТЧ = "Запасы" Тогда
		Количество = Объект[ИмяТЧ].Количество();
	
		Для Итератор = 1 По КоличествоВставленных Цикл
			
			Строка = Объект[ИмяТЧ][Количество - Итератор];
			Строка.А_ГруппаИД = ИДГруппы;
			
		КонецЦикла;
	КонецЕсли;

КонецПроцедуры

//{[+](фрагмент добавлен), Admin 11.09.2018 13:49:33
&НаСервере
Процедура АНТ_ПриСозданииНаСервереПеред(Отказ, СтандартнаяОбработка)
	Если Объект.Ссылка = Документы.ЗаказПокупателя.ПустаяСсылка() и НЕ ЗначениеЗаполнено(Параметры.Основание) Тогда
		Объект.ВидЗаказа = Справочники.ВидыЗаказовПокупателей.ПустаяСсылка();
		Объект.СостояниеЗаказа = Справочники.СостоянияЗаказовПокупателей.ПустаяСсылка();
		Объект.Организация = Справочники.Организации.ПустаяСсылка();
		Объект.СтруктурнаяЕдиницаПродажи = Справочники.СтруктурныеЕдиницы.ПустаяСсылка();
		Объект.СтруктурнаяЕдиницаРезерв = Справочники.СтруктурныеЕдиницы.ПустаяСсылка();
		Объект.Ответственный = Справочники.Сотрудники.ПустаяСсылка();
	КонецЕсли;
КонецПроцедуры
//}Admin 11.09.2018 13:49:33

 
 
