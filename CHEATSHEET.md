# DBT Cheat Sheet

## Generic Commands

1. `dbt init project_name` - performs several actions necessary to create a new dbt project.
2. `dbt deps` - install the dbt dependencies from packages.yml file
3. `dbt clean` - this will remove the /dbt_modules (populated when you run deps) and /target folder (populated when models are run)
4. `dbt run` - regular run. will run all models based on hierarchy
5. `dbt run` --full-refresh - will refresh incremental models
6. `dbt test` - will run custom data tests and schema tests
7. `dbt seed` - will load CSV files specified in the data-paths directory into the data warehouse. Also, see the seeds section of this guide
8. `dbt compile` - compiles all models. This isn't a command you will need to run regularly. dbt will compile the models when you run any models.
9. `dbt snapshot` - execute all the snapshot defined in your project
10. `dbt clean` - a utility function that deletes all folders specified in the clean-targets list specified in dbt_project.yml. It is useful for deleting the dbt_modules and target directories.
11. `dbt debug` - make sure your connection, config file, and dbt dependencies are good.
12. `dbt run threads 2` - run all models in 2 threads and also over-ride the threads in profiles.yml.

## Model Specifying Commands

Specifying models can save you a lot of time by only running/testing the models that you think are relevant.
However, there is a risk that you'll forget to specify that dependency is needed or not, so it's a good idea to understand the syntax thoroughly.

### Running based on the model name

1. `dbt run --models modelname` - will only run modelname
2. `dbt run --models +modelname` - will run modelname and all parents
3. `dbt run --models modelname+` - will run modelname and all children
4. `dbt run --models +modelname+` - will run modelname, and all parents and children
5. `dbt run --models @modelname` - will run modelname, all parents, all children, AND all parents of all children
6. `dbt run --exclude modelname` - will run all models except modelname

### Running based on the folder name

1. `dbt run --models folder` - will run all models in a folder
2. `dbt run --models folder. subfolder` - will run all models in the subfolder
3. `dbt run --models +folder. subfolder` - will run all models in the subfolder and all parents
4. `dbt run --models folder.subfolder+` - will run all models in the subfolder and all children
5. `dbt run --models +folder.subfolder+` - will run all models in the subfolder, all parents, all children
6. `dbt run --models @folder.subfolder` - will run all models in the subfolder, all parents, all children,
and all parents of all children
7. `dbt run --exclude folder` - will run all models except the folder

### Running based on tag

1. `dbt run --models tag:tagname`- will run only tagged models.
2. `dbt run --models +tag:tagname` - will run tagged models and all parents.
3. `dbt run --models tag:tagname+`- will run tagged models and all children.
4. `dbt run --models +tag:tagname+` - will run tagged models and all parents and children.
5. `dbt run --models @tag:tagname` - will run tagged, all parents, all children, AND all parents of all children.
6. `dbt run --exclude tag:tagname` - will run all models except the tagged models

**Note:**

1. In here --models can be replaced by -m.
2. dbt test can also have all combinations syntax referenced for dbt run

### Multiple model inputs in dbt command

1. `dbt run --models modelname+ folder @tag:tagname modelname` - like this any number of models can be specified.
2. `dbt run --exclude modelname folder tag:tagname modelname` - like this any number of models can be excluded.

## Special Commands

1. `help` - help command shows the available input combinations and sub-commands also. Example:

   ```shell
   dbt run –help, dbt docs --help
   ```

2. `dbt source` - It provides subcommands that are helpful when working with source data.
    - `dbt source snapshot-freshness` - this command will query all the source table defined and determines the freshness of the tables.
3. `dbt docs`
    - `dbt docs generate` - a very powerful command which will generate documentation for the models in your folder based on config files.
    - `dbt docs serve --port 8001` - it will host the docs in your local browser. Users can have more info about each model, dependencies, and also DAG diagram.

4. Treat warnings as errors
    `dbt --warn-error run` - some time dbt shows warning like the use of deprecated methods or configurations, if you want to treat that as an error then this command will help you

5. Failing fast
    `dbt run --fail-fast(x)` - to make dbt exit immediately if a single model fails to build. If other models are in-progress when the first model fails, then dbt will terminate the connections for these still-running models.

6. Enable or Disable colorized logs
    `dbt --use-colors run` - color enabled by default
    `dbt --no-use-colors run` - disable the terminal color logs(green/red)

7. list resources (CLI only)
    `dbt ls(list)` - list all the models and sources in the dbt project folder
