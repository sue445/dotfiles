#!/bin/bash

echo "[RAILS_ENV=development]"
rake $1 RAILS_ENV=development

echo "[RAILS_ENV=test]"
rake $1 RAILS_ENV=test
