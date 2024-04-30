#Область ОписаниеПеременных
&НаКлиенте   
//{{Доработка DTK-32
перем РеквизитФормыСкидка экспорт;
//}}  
#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды

	//{{Доработка DTK-32
	РеквизитФормыСкидка=Объект.КнЛ_Скидка;
	//}}
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)

	//{{Доработка DTK-32
	
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;

	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество*(100-ТекущиеДанные.Скидка)/100;
	РассчитатьСуммуДокумента();
	//}}

	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти


	//{{Доработка DTK-32---------------------------------------------------------------------
	&НаКлиенте
	Процедура КнЛ_СкидкаПриИзменении(Элемент) 
		//{{Доработка DTK-32
		// При изменении поля пользователю должен задаваться вопрос о необходимости пересчёта табличной части. 
		// Если таблица пустая, вопрос задаваться не должен.

		ПроверкаСтрок=Объект.Товары.Количество()+Объект.Услуги.Количество();
		если РеквизитФормыСкидка <> Объект.КнЛ_Скидка тогда
			СпроситьОбИзмененииСкидки(ПроверкаСтрок);      
		КонецЕсли;  
		//}}
	КонецПроцедуры   

	&НаКлиенте
	Процедура Команда_КнЛ_ПересчитатьТаблицу(Команда)   
		//{{Доработка DTK-32
		// Понадобится кнопка пересчёта табличной части с учётом введённой скидки. 
		ПроверкаСтрок=Объект.Товары.Количество()+Объект.Услуги.Количество(); 
		если РеквизитФормыСкидка <> Объект.КнЛ_Скидка тогда
			СпроситьОбИзмененииСкидки(ПроверкаСтрок);      
		КонецЕсли; 
		//}}
	КонецПроцедуры

	&НаКлиенте
	Асинх Процедура СпроситьОбИзмененииСкидки(ПроверкаСтрок)  //это используется в новейших версиях
		//{{Доработка DTK-32
		СписокОтветов = новый СписокЗначений;
		СписокОтветов.Добавить(0,"Пересчитать (для всех)");
		СписокОтветов.Добавить(1,"Отменить (для всех)");
		
		// для обработчика событий Асихи лучше не прописывать.
		Обещание = ВопросАсинх("Изменен % скидки. Пересчитать табличную часть?",СписокОтветов);
		Ответ = ждать Обещание;
		
		//ответ = ждать ВопросАсинх("Изменен % скидки. Пересчитать табличную часть?",РежимДиалогаВопрос.ДаНет);
		//в браузере такой вариант рабоать будет  
		
		Если ответ=0 тогда
			//Сообщить("Пересчитываем");
			ПересчитатьСУчетомСкидки(); 
			РеквизитФормыСкидка = Объект.КнЛ_Скидка;
		иначе
			//Сообщить("Отмена пересчета");
		КонецЕсли;
        //}}
	КонецПроцедуры  
		
	&НаКлиенте
	Процедура ПересчитатьСУчетомСкидки()
		//{{Доработка DTK-32
		Для Каждого ТекСтрокаТовары Из Объект.Товары Цикл
			ТекСтрокаТовары.Скидка=Объект.КнЛ_Скидка;
			РассчитатьСуммуСтроки(ТекСтрокаТовары);
	    КонецЦикла;	
		
		Для Каждого ТекСтрокаУслуги Из Объект.Услуги Цикл
			ТекСтрокаУслуги.Скидка=Объект.КнЛ_Скидка;
			РассчитатьСуммуСтроки(ТекСтрокаУслуги);
		КонецЦикла;
		//}}
	КонецПроцедуры
	//-----------------------}}


#КонецОбласти
