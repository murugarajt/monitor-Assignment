#!/bin/bash
source Dr_Build/input.txt
output=$(aws rds describe-db-instances --db-instance-identifier $DB_IDEN 2>&1)

if [ $? -ne 0 ]; then
  if echo ${output} | grep -q DBInstanceNotFound; then
   aws rds create-db-instance --db-instance-identifier "$DB_IDEN"  --db-instance-class "$DB_CLASS"  --engine "$DB_ENGINE" --master-username "$DB_MAS_USER" --master-user-password "$DB_MAS_PASS" --allocated-storage "$DB_STORAGE"
  else
    >&2 echo ${output}
  fi
fi
