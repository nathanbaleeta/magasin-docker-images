FROM apache/superset:2.1.0

# Switching to root to install the required packages
USER root

# install requirements for Apache Drill
RUN pip install sqlalchemy-drill

# Switching back to using the `superset` user
USER superset
