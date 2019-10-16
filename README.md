# Pentaho Kettle for AWS Batch

* Base image: oncase/pentaho-kettle:8.1
    * Generic Kettle image configurable via environment variables and docker volumes
    * Please see: https://hub.docker.com/r/oncase/pentaho-kettle


* Adds git pull to the run entrypoint so that it pulls a CodeCommit repo on a specific branch
    * Mounts repository into /pentaho/project
    * `$WORKINGREPO` - CodeCommit repository 
    * `${WORKINGBRANCH}` - default clonned branch: `master`;


* Execution:
    * mandatory vars:
        - `_AWS_aws_access_key_id`
        - `_AWS_aws_secret_access_key`
        - `JOB_OR_TRANS` (trans|job) according to what you'll run
        - `JOB_OR_TRANS_PATH` the path to the ktr or kjb file you'll run
            - Absolute to `/pentaho/project`
            - Relative to the repository you'll clone;
            - Example: `/pentaho/project/etl/main.kjb`
        - `WORKINGREPO`
        - `WORKINGBRANCH` (Not mandatory, will default to `master`)
    * Example - see `test/docker-compose.yml`
        ```
          cd test/
          docker-compose run pentaho-kettle-awsbatch && docker-compose rm -f
        ```
