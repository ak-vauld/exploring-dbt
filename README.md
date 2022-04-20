# Learning dbt (Data Build Tool)

Learning the fatures and capabilities of dbt for building robust data transformations.

## Setting Up Development Environment

- Development tools in use
    - [Python](https://www.python.org/) - Runtime
    - [Poetry](https://python-poetry.org/) - Dependency manager
    - [Visual Studio Code](https://code.visualstudio.com/) - Code editor

- Install poetry

    ```shell
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
    ```

- Clone reporsitory

    ``` shell
    git clone https://github.com/amiteshrai/learn-dbt.git
    ```

- Create virtual environment

    - Using Python's built-in venv:
        - Create a virtual environment using `venv` module

        ```shell
        python3 -m venv <CLONED_REPO_PATH>
        ```

        - Change curent directory to the local reporsitory

        ```shell
        cd <CLONED_REPO_PATH>
        ```

        - Activate the virtual environment

        ```shell
        source bin/activate
        ```

        - Install required dependencies/packages

        ```shell
        pip install -r requirements.txt
        ```

    - Using poetry:

        - Configure poetry to create `virtual environment` in the current directory. You just need to type in your shell:

            ```shell
            poetry config virtualenvs.in-project true
            ```

            - The `virtual environment` will be created inside the project path and `VS Code` will recognize.

        - Create virtual environment using command

            ``` shell
            poetry init --no-interaction
            ```

        - If you already have created your project, you need to re-create the virtualenv to make it appear in the correct place:

            ```shell
            poetry env list  # shows the name of the current environment
            poetry env remove <current_environment>
            poetry install  # will create a new environment using your updated configuration
            ```

        - Install required dependencies/libraries using command

            ```shell
            poetry install
            ```

- Linting

- Formatting

- Static Type Checking

- Automating Commits Using Pre Commit Hooks

    - Install `pre-commit` globally using the command:

        ```shell
        pip install --user --upgrade pre-commit
        ```

    - Install git hooks in your local repository using the command:

        ```shell
        pre-commit install
        ```

### Using the starter dbt project

Try running the following commands:

- dbt run
- dbt test

### dbt Tests Overview

- There are two types of tests
    - Singular
        - Singular tests are SQL queries stored in tests which are expected to return an empty resultset.
        - These tests are one-off assertions usable for a single purpose.
    - Generic
        - There are four built-in generic tests:
            1. unique
            2. not_null
            3. accepted_values
            4. relationships
        - You can also define your own generic tests or import tests from dbt packages

### dbt Macros

- Macros are jinja templates created in the `macros` folder.
- There are many built-in macros in dbt.
- Macros can be used in model definitions and tests.
- A special macro called `test` can be used for implementing your own teneric tests.
- dbt packages can be installed to get access to other macros and tests.

### dbt Documentation Overview

- Documentation can be defined in two ways:
    - In yaml files (like shema.yml)
    - In standalone markdown files
- dbt ships with a lightweight documentation web server.
- For customizing the landing page, a special file, overview.md is used.
- You can add your assets to a project folder.

#### Generating documentation

- Generate documentation using command:

    ```shell
    dbt docs generate
    ```

- View generated documentation using command:

    ``` shell
    dbt docs serve
    ```

- Sample documentation

- ![sample documentation!](https://github.com/ak-vauld/exploring-dbt/blob/main/assets/dbt%20sample%20docs.png)

### dbt Commands Cheat Sheet

- [DBT Cheat Sheet](https://github.com/ak-vauld/exploring-dbt/blob/a62232e2329d518483b85d24215d3388ed1afcd9/CHEATSHEET.md)

### Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Useful dbt Packages

1. [hub.getdbt.com](https://hub.getdbt.com/)
2. [snowflake_spend](https://hub.getdbt.com/gitlabhq/snowflake_spend/latest/)
3. [dbt_expectations](https://hub.getdbt.com/calogica/dbt_expectations/latest/)
4. [audit_helper](https://hub.getdbt.com/dbt-labs/audit_helper/latest/)
5. [re_data](https://hub.getdbt.com/re-data/re_data/latest/)
