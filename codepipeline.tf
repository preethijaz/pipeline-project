resource "aws_codepipeline" "this" {
  name = "${local.env_vars.pipeline_name}-pipeline"

  role_arn = local.env_vars.role_arn

  artifact_store {
    location = local.env_vars.artifact_store_bucket
    type     = "S3"

    #encryption_key {
     # id   = local.env_vars.artifact_store_kms_key_arn
     # type = "KMS"
    #}
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        S3Bucket             = local.env_vars.bb_source_bucket
        S3ObjectKey          = local.env_vars.bb_source_key
        PollForSourceChanges = "true"
      }
    }
  }

  dynamic "stage" {
    for_each = [for s in local.env_vars.stages: {
      name = s.name
      action = s.action
    }]

    content {
      name = stage.value.name

      dynamic "action" {
        for_each = [for a in stage.value.action: {
          name = a.name
          category = a.category
          owner = a.owner
          provider = a.provider
          version = a.version
          input_artifacts = a.input_artifacts
          output_artifacts = a.output_artifacts
          configuration = a.configuration
        }]

        content {
          name = action.value.name
          category = action.value.category
          owner = action.value.owner
          provider = action.value.provider
          version = action.value.version
          input_artifacts = action.value.input_artifacts
          output_artifacts = action.value.output_artifacts
          configuration = action.value.configuration
        }
      }
    }
  }

  tags = local.env_vars.tags
}
