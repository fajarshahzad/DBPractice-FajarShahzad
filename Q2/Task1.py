## Task to show schema and top 5 values
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("Example").getOrCreate()
df = spark.read.csv("insurance.csv", header=True, inferSchema=True)
df.printSchema()
df.show(5)
