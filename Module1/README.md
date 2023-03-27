## Module1 - Role and responsibility of Data Analytics
[DataLearn DE-101 Module01](https://github.com/Data-Learn/data-engineering/tree/master/DE-101%20Modules/Module01)

### 1. Architecture of Data Analytics solution

###

I developed the Architecture Solution y using [draw.io](https://app.diagrams.net/)

1. Source Layer.
The source of systems with Raw Data (OLTP - Online Transaction Pocessing).

* processing transactions;
* the systems quickly work for Data adding to DataBases but don't good for analysis responds;
* business processes makes Data;
* all Raw Data goes to a storage.

2. Storage Layer.
Storage of Data for further analysis (DataWarehouses, DataLake, DataPlatform).
* should have 2 layers for Data:
  * Staging - a copy og all Data from Source Layer;
  * BL - a Data model.
  
3. Business Layer.
Business users have an access to all Data by using I Business Intelligence tools (Tableau, Power BI, SAP BO, Excel, QlikView) or SQL. There is connection to the systems for the generating of reports.

There can be one more layer - Processing/ Computer Layer - for data transormation before loading to a storage.

![my drawio image](https://github.com/alexkuzh/DE-101/blob/main/Module1/Drawio_Module1_cr.png)

### 2. Analytics using MS Excel

I designed [Dashboard](https://github.com/alexkuzh/DE-101/blob/main/Module1/HW_module1.xlsx) for Superstore dataset in MS Excel. The dashboard consists of several charts and metrics which reflect Sales by various dimensions, including sales change dynamics by time.

**Metrics:**

* KPI
* Sales
* Profit
* Quantity
* Discount

**Charts:**

* Sales by Regions
* Sales by Personal
* Sales by Segment
* Sales by Shipping
* Sales by Category
* Sales by Sub-Category
* Sales by States
* Sales/Profit Dynamic by month/year

![my_dashboard](https://github.com/alexkuzh/DE-101/blob/main/Module1/SuperStore_dashboard_Module1_cr.png)
