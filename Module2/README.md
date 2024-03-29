# Module 2

## Создание таблиц и заполнение данными

### Таблица Orders

Если выполнять скрипт как предложено с insert каждой строки, то это слишком долго (и на MySQL не пойдет, он очень капризен для входных форматов данных) , да Postgres рулит :)  На MySQL конечно можно допилить костыли, но это время нужно.
В DBever есть механизм импорта данных (не во всех инструментах такая фишка есть, в штатном MySQL Workbench импорта из csv,txt нет. На самом деле механизмы массовой загрузки данных есть и там и там, но это уже через sql-скрипты.
Я бы пока не углублялся в дебри скриптописания, а сделал все тоже самое, но только тыкая мышкой.
Далее только для таблицы orders, остальные таблицы маленькие и можно воспользоваться теми скриптами с insert что выложили на курсе.

Качаем предварительно подготовленный файл [import_orders.csv](https://github.com/alexkuzh/DE-101/blob/main/Module2/import_orders.csv) 
* Создаем таблицу order штатным скриптом (drop, create и т.д.)
* Тыкаем на таблицу orders прав.кнопкой вызываем контекстное меню и выбираем Import Data
* Выбираем источник данных наш файл csv
* Устанавливаем (ВАЖНО) column delimiter \t (колонки в файле разделены табуляцией) , NULL, Date format, см. [screenshot](https://github.com/alexkuzh/DE-101/blob/main/Module2/import_orders_cr.png)
* Ну и там дальше next...proceed

Весь импорт займет 3 секунды! Есть разница между insert? :) Способ работает для Postgres и MySQL.
Если будет полезно, то этот способ можно прикрутить к официальному курсу. Буду рад, если кому-то пригодится.

Еще совет, если вы хотите удалить все строки в таблице, не используйте delete, лучше truncate - это быстрее и чище.

### Таблица Returns
В основном репозитории курса ошибочное создание этой таблицы (наимернования полей и ключи)
правильное создание [скрипт](https://github.com/alexkuzh/DE-101/blob/main/Module2/return_create.sql)
и если через импорт, как с таблицей orders, то вот [файл csv](https://github.com/alexkuzh/DE-101/blob/main/Module2/import_returns.csv), он уже без дубликатов.
Традиционный скрипт создания таблицы и заполнение данными через insert [create_returns_inserts.sql](https://github.com/alexkuzh/DE-101/blob/main/Module2/create_returns_inserts.sql)

### Таблица People
Тут все просто [create_people_inserts.sql](https://github.com/alexkuzh/DE-101/blob/main/Module2/create_people_inserts.sql)

## Основные метрики
[Основные метрики](https://github.com/alexkuzh/DE-101/tree/main/Module2/Metrics_sql)

## Модель базы. Нормализация.

### Концептуальная модель

![concept](https://github.com/alexkuzh/DE-101/blob/main/Module2/ConceptModel.png)

### Физическая модель

![dll model](https://github.com/alexkuzh/DE-101/blob/main/Module2/DLL_model.png)

* Создание таблиц [DLL.sql](https://github.com/alexkuzh/DE-101/blob/main/Module2/DLL.sql)

* Заполнение таблиц из предыдущей таблицы Orders [insert_references.sql](https://github.com/alexkuzh/DE-101/blob/main/Module2/inserts_references.sql)




