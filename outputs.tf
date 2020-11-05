output lb_adress {
  value = module.ecs_app.lb_address
}

output s3_bucket {
  value = module.ecs_app.bucket_name
}

output database_endpoint {
  value = module.ecs_app.database_endpoint
}
