from pyspark.sql import SparkSession
spark = SparkSession.builder \
    .appName("Group Sales by Region") \
    .master("local[*]") \
    .getOrCreate()

df = spark.read.csv("sales_data.csv", header=True, inferSchema=True)
region_sales = df.groupBy("Region").sum("Sales_Amount")
region_sales = region_sales.withColumnRenamed("sum(Sales_Amount)", "total_sales")
df.printSchema()
region_sales.show()
spark.stop()
