# Reproduction of #allure-python/636 issue

## Check reproduction in github actions
Open the latest run of the
[the latest Test #allure-pytest/636](https://github.com/delatrie/allure-python-633-repro/actions/workflows/test.yaml)
workflow and check the output of `Show result files` step. There are two jobs
with the step: one for Linux and the other one for Windows.

## Try by your own

Prepare the environment.

For example, on Windows (if you are using the py launcher):

```powershell
py -m venv .env
./.env/Scripts/Activate.ps1
python -m pip install -U pip setuptools wheel
pip install pytest pytest-bdd allure-pytest-bdd
```

Or on Linux/Mac OS:

```shell
python -m venv .env
source ./.env/bin/activate
python -m pip install -U pip setuptools wheel
pip install pytest pytest-bdd allure-pytest-bdd
```

Run pytest-bdd with allure:

```shell
pytest -m cucumber -W ignore --alluredir allure-results
```

Check the output in `allure-results`. Each `"parameters"` section should contain
the following array literal:

```json
[
    {
        "name": "A",
        "values": "5"
    },
    {
        "name": "B",
        "values": "3"
    },
    {
        "name": "C",
        "values": "2"
    },
    {
        "name": "D",
        "values": "0"
    }
]
```

If you see the `"_pytest_bdd_example"` parameter instead, the issue is
reproduced.
