FROM gvenzl/oracle-free:23
ENV ORACLE_PASSWORD="oracle_password"
ENV APP_USER="app_user"
ENV APP_USER_PASSWORD="app_user_password"
# install HR sample
ADD https://github.com/oracle-samples/db-sample-schemas/blob/main/human_resources/hr_create.sql /container-entrypoint-startdb.d/hr_1.sql
ADD https://github.com/oracle-samples/db-sample-schemas/blob/main/human_resources/hr_populate.sql /container-entrypoint-startdb.d/hr_2.sql
ADD https://github.com/oracle-samples/db-sample-schemas/blob/main/human_resources/hr_code.sql /container-entrypoint-startdb.d/hr_3.sql
