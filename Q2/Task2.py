## Task related to RDD
from pyspark.sql import SparkSession
def is_even(x):
    return x % 2 == 0

spark = SparkSession.builder \
    .appName("RDD Example - Count Even Numbers") \
    .master("local[*]") \
    .getOrCreate()
rdd = spark.sparkContext.parallelize(range(1, 100000))
evens = rdd.filter(is_even)
print("Even count:", evens.count())
