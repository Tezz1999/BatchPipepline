wget -O - https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data | aws s3 cp - s3://emrdata/inputfolder/hello_world.csv