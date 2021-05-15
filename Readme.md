
- https://docs.aws.amazon.com/codepipeline/latest/userguide/ecs-cd-pipeline.html


1. Naviage to AWS Console -> CodeBuild -> Create vuild project
   1. Provide "Project name" with "Description"
   2. Connect this public github repository
   3. Choose "Environment Image" as "Managed Image"
   4. "Operating System" -> "Amazon Linux 2"
   5. "Runtime(s)" -> "Standard"
   6. "Image" -> "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
   7. "Privileged" -> "Enable the toggle" # Because we build a docker image, we need this enabled.
   8. "Service role" -> "New service role"
   9. "Role name" -> "choose your own name. Eg: poc-codepipeline-ecs-integration"
      1.  Note: This new role will not have ECR permissions. so, you should add it manually.
   10. "Build specifications" -> "Use a buildspec file"
   11. Leave everything else blank (optional) and then "Create build project"
2.  Select "Build project" -> Start build -> Check status -> Success? or Failed?
    1.  Failed -> what is the error? not authorized? then fix IAM
            1.  "retry build" after fixing the errors
    2.  Success -> Navigate to ECR and validate if you see a repository with name ""