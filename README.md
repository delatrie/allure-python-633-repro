# Reproduction of #allure-python/636 issue

## Check reproduction in github actions
Open the latest run of the
[the latest Test #allure-pytest/636](https://github.com/delatrie/allure-python-633-repro/actions/workflows/test.yaml)
workflow and check the output of `Show result files` step. There are two jobs
with the step: one for Linux and the other one for Windows.

## Try by your own

Prepare env:

```shell
python -m venv .env
./.env/Scripts/Activate.ps1
python -m pip install -U pip setuptools wheel
pip install pytest pytest-bdd allure-pytest-bdd
```

> These may differs on your actual system

Run pytest-bdd with allure:

```shell
pytest -m cucumber -W ignore --alluredir allure-results
```

Check the output in `allure-results`. Each `"parameters"` section should contain

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
