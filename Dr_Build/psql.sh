#!/bin/bash
psql -h hu19-project.c23hdeqouujb.ap-south-1.rds.amazonaws.com -U postgres password=admin123 << EOF
\i Dr_Build/database.sql
EOF

