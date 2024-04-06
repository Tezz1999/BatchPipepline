# Batch Data Processing Pipeline with Airflow, EMR, and Snowflake

## Overview

This project demonstrates an automated data processing pipeline utilizing Apache Airflow for workflow orchestration, Amazon EMR for big data processing, and Snowflake for data storage and analytics. The pipeline ingests, processes, and loads data for analytical purposes, showcasing a scalable architecture for handling big data workloads.

## System Architecture



The architecture comprises the following components:

- **Apache Airflow**: Orchestrates the workflow, including the initiation of the EMR cluster, execution of data processing tasks on EMR, termination EMR cluster and loading of processed data into Snowflake.
- **Amazon EMR**: Processes large datasets using Spark and Hive applications. EMR clusters are dynamically created and terminated by Airflow to optimize resource utilization.
- **Snowflake**: Stores the processed data in a parquet format, allowing for efficient data analysis and querying.

Data flows through the system as follows:
1. Airflow triggers the creation of an EMR cluster.
2. Data ingestion from S3 and processing tasks are executed on EMR using Spark and Hive.
3. Processed data again stored in S3 is then loaded into Snowflake.
4. The EMR cluster is terminated to release resources.

## Prerequisites

- AWS account with access to EMR, S3, and IAM.
- Snowflake account.
- Apache Airflow environment setup.

## Setup Instructions

### AWS Configuration

1. **EMR Cluster**: Ensure your AWS account has the necessary permissions to create and manage EMR clusters.
2. **S3 Bucket**: Create an S3 bucket (`emrdata`) for storing scripts and output data.
3. **IAM Roles**: Create IAM roles for EMR with necessary permissions for S3 access.

### Snowflake Configuration

1. **Create Snowflake Resources**: Follow the commands in the script to set up the database, schema, stage, and external table in Snowflake.

### Airflow DAG Configuration

1. **DAG Setup**: Place the DAG script in your Airflow environment's DAG directory.
2. **Snowflake Connection**: Configure a Snowflake connection (`snowflake_conn`) in Airflow with your Snowflake account details.

## Running the Pipeline

Trigger the DAG `snowflake_automation_dag` in Apache Airflow. Monitor the workflow's progress through the Airflow UI. Upon successful execution, processed data will be available in Snowflake for analysis.

## Security Considerations

- Use IAM roles and policies to manage access permissions securely.
- Store sensitive credentials securely using Airflow connections or a secrets manager.
- Review Snowflake's network policies and access controls.

## Further Improvements

- Implement error handling and retry mechanisms in the DAG.
- Optimize EMR cluster configurations based on workload.
- Explore Snowflake's advanced features for data analysis.
