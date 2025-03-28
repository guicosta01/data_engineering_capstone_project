# data_engineering_capstone_project


# Environment:

Ecommerce company named SoftCart
SoftCart uses a hybrid architecture, with some of its databases on premises and some on cloud.

# Tools and Technologies:

    OLTP database - MySQL
    NoSql database - MongoDB
    Production Data warehouse – DB2 on Cloud
    Staging Data warehouse – PostgreSQL
    Big data platform - Hadoop
    Big data analytics platform – Spark
    Business Intelligence Dashboard - Amazon QuickSight 
    Data Pipelines - Apache Airflow

# Process:

SoftCart's online presence is primarily through its website, which customers access using a variety of devices like laptops, mobiles and tablets.

All the catalog data of the products is stored in the MongoDB NoSQL server.

All the transactional data like inventory and sales are stored in the MySQL database server.

SoftCart's webserver is driven entirely by these two databases.

Data is periodically extracted from these two databases and put into the staging data warehouse running on PostgreSQL.

The production data warehouse is on the cloud instance of IBM DB2 server.

BI teams connect to the IBM DB2 for operational dashboard creation. IBM Cognos Analytics is used to create dashboards.

SoftCart uses Hadoop cluster as its big data platform where all the data is collected for analytics purposes.

Spark is used to analyse the data on the Hadoop cluster.

To move data between OLTP, NoSQL and the data warehouse, ETL pipelines are used and these run on Apache Airflow.




---------------------
pip install mysql-connector-python pandas


chmod +x datadump.sh

-----------------------

Objectives


    import data into a MongoDB database.
    query data in a MongoDB database.
    export data from MongoDB.

Task 1 - Import ‘catalog.json’ into mongodb server into a database named ‘catalog’ and a collection named ‘electronics’

Task 2 - List out all the databases
    mongosh -u root -p root 
    show dbs

Task 3 - List out all the collections in the database catalog.
    use catalog
    show collections

Task 4 - Create an index on the field “type”
    db.electronics.createIndex({ type: 1 })
    db.electronics.getIndexes()

Task 5 - Write a query to find the count of laptops
    db.electronics.countDocuments({ type: "laptop" })

Task 6 - Write a query to find the number of smart phones with screen size of 6 inches.
    db.electronics.countDocuments({ type: "smart phone", "screen size": 6 })

Task 7. Write a query to find out the average screen size of smart phones.

    db.electronics.aggregate([
    { $match: { type: "smart phone" } }, // Filtra os smartphones
    { $group: { _id: null, averageScreenSize: { $avg: "$screen size" } } }
    ])

Task 8 - Export the fields _id, “type”, “model”, from the ‘electronics’ collection into a file named electronics.csv

    mongoexport --uri="mongodb://root:root@localhost:27017/catalog" --collection=electronics --fields=_id,type,model --type=csv --out=electronics.csv

