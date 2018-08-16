# The name of your project
workspace = "dev-s2-nrt-index"

# Setting this to false will turn off auto-restart and web access
webservice = false

# The number of containers to run at once
task_desired_count = 1

# The name of the database
database = "nrtprod"

# The name of the service
name = "datacube-wms-index"

# The docker image to deploy
docker_image = "daporter/datacube-wms:aux_index"

# environment variables configuring the docker container
environment_vars = {
  "DC_S3_INDEX_BUCKET" = "landsat-pds"
  "DC_S3_INDEX_PREFIX" = "c1/L8"
  "DC_S3_INDEX_SUFFIX" = "_MTL.txt"
  "WMS_CONFIG_URL"     = "https://raw.githubusercontent.com/daporter/odc-config/master/wms_cfg.py"
}

schedulable = true

schedule_expression = "cron(1 0 * * ? *)"
