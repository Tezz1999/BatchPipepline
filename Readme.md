# Batch Data Processing Pipeline with Airflow, EMR, and Snowflake

## Overview

This project demonstrates the implementation of a scalable big data architecture using an EMR cluster for distributed processing, Apache Airflow for workflow orchestration, and PySpark for data transformation. The processed data is seamlessly loaded into Snowflake, showcasing an end-to-end big data pipeline.

While the dataset size was relatively small, the architecture was intentionally designed to simulate the demands of processing large-scale data. The project highlights the integration of tools and technologies to handle high data velocity and volume, ensuring reliability and scalability.

## Key Features:

EMR Cluster Setup: Configured and optimized a customized EMR cluster for distributed data processing, mimicking real-world big data scenarios.
Workflow Orchestration: Utilized Apache Airflow to schedule, monitor, and manage ETL tasks, ensuring efficient and fault-tolerant execution.
Data Transformation: Processed raw data with PySpark, leveraging its distributed computing capabilities to prepare the data for analysis.
Data Integration: Loaded transformed data into Snowflake, enabling seamless storage and querying for analytics.
Purpose-Driven Design: Despite the dataset's size, the architecture emphasizes scalability, outlining how similar systems can be applied to large datasets in production environments.
Impact and Learning Outcomes:

Gained hands-on experience in building and deploying a scalable big data architecture.
Strengthened skills in workflow automation, distributed computing, and cloud-based data integration.
Showcased the ability to design systems that balance flexibility, scalability, and reliability for big data applications.
This project serves as a blueprint for handling big data workflows, bridging theoretical knowledge and practical application.

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
