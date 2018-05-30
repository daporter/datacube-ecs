# The name of your project
workspace = "s2-nrt-au-index"

# Setting this to false will turn off auto-restart and web access
webservice = false

# The number of containers to run at once
task_desired_count = 1

# The name of the database
database = "nrtau"

# The name of the service
name = "datacube-wms-s2-au-index"

# The docker image to deploy
docker_image = "geoscienceaustralia/datacube-wms:aux_index"

# environment variables configuring the docker container
environment_vars = {
  "DC_S3_INDEX_BUCKET" = "dea-public-data"
  "DC_S3_INDEX_PREFIX" = " "
  "DC_S3_INDEX_SUFFIX" = "ARD-METADATA.yaml"
  "WMS_CONFIG_URL"     = "https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/prod/services/wms/nrt-au/wms_cfg.py"
}

schedulable = true

schedule_expression = "cron(1 14 * * ? *)"
