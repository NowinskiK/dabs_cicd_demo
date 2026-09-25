# SQLDay Lite - Databricks Demo Repository

This repository contains demonstration projects for the SQLDay Lite 2026 conference, showcasing modern data engineering practices with Databricks, including CI/CD automation, ETL pipelines.

## 📁 Repository Structure

### [dabs_cicd_demo/](dabs_cicd_demo/)
**Declarative Automation Bundles (DAB) CI/CD Demonstration**

A complete example of implementing CI/CD best practices with Databricks using GitHub Actions and Declarative Automation Bundles.

**Key Components:**
- **Workflows**: Automated deployment pipelines for dev and production environments
  - `dabs_cicd_demo_dev.yaml` - Deploys to dev on push to `dev` branch
  - `dabs_cicd_demo_prod.yaml` - Deploys to production on push to `main` branch
- **Resources**: 
  - Jobs (`demo_dabs_project_job.yml`, `demo_dabs_project_dbt_job.yml`) - Scheduled data processing
  - Pipelines (`demo_dabs_project_pipeline.yml`) - Delta Live Tables (DLT) pipelines
  - Dashboard (`basic_dashboard.yml`) - Data visualization example
  - Job Manager App (`job_manager.app.yml`) - Workflow orchestration
  - Testing Job (`testing_job.yml`) - Data quality and testing
- **Source Code**:
  - `src/notebook.ipynb` - Main ETL notebook
  - `src/dlt_pipeline.ipynb` - Delta Live Tables pipeline definition
  - `src/dbt_data.ipynb` - DBT integration example
  - `src/basic_nyc_dashboard.lvdash.json` - Lakeview dashboard configuration
  - `src/app/` - Databricks apps and applications
- **Testing**: Integration and unit testing infrastructure
- **Configuration**:
  - `databricks.yml` - Bundle configuration
  - `.databricks/.databricks.env` - Environment variables
  - `.vscode/` - VS Code integration and settings

**Use Case:**
Perfect for demonstrating production-ready CI/CD workflows, automated testing, and multi-environment deployment strategies.

---

### [InitDemo/](InitDemo/)
**Databricks ETL Project Template**

A well-structured Databricks project demonstrating best practices for data engineering workflows.

**Key Components:**
- **Source Code** (`src/`):
  - `InitDemo/` - Shared Python modules for jobs and pipelines
  - `InitDemo_etl/` - ETL-specific Python code
- **Resources**:
  - `InitDemo_etl.pipeline.yml` - Delta Live Tables ETL pipeline
  - `sample_job.job.yml` - Sample scheduled job
- **Testing** (`tests/`):
  - `conftest.py` - Pytest configuration
  - `sample_taxis_test.py` - Unit test examples
- **Data** (`fixtures/`) - Test data sets and fixtures
- **Configuration**:
  - `pyproject.toml` - Python dependencies and project metadata
  - `databricks.yml` - Bundle configuration

**Use Case:**
Great for teaching Python-based ETL development, testing strategies, and project organization on Databricks.

---

### [helpers/](helpers/)
**Utility Scripts**

PowerShell helper scripts for managing Databricks resources.

- `jobs.ps1` - Job management utilities (list, delete, batch operations)
- `dashboards.ps1` - Dashboard management utilities

---

## 🚀 Quick Start

### Prerequisites
- Databricks workspace access
- [Databricks CLI](https://docs.databricks.com/dev-tools/cli/databricks-cli.html) installed and configured
- Python 3.9+ (for local development)
- [UV package manager](https://docs.astral.sh/uv/) (optional but recommended)

### Deploy dabs_cicd_demo

```bash
cd dabs_cicd_demo

# Install dependencies (if needed)
# pip install -r requirements.txt

# Deploy to dev environment
databricks bundle deploy --target dev

# Deploy to production
databricks bundle deploy --target prod

# Run deployed jobs/pipelines
databricks bundle run
```

### Deploy InitDemo

```bash
cd InitDemo

# Install dependencies
uv sync --dev

# Deploy to dev environment
databricks bundle deploy --target dev

# Run tests locally
uv run pytest

# Deploy to production
databricks bundle deploy --target prod
```

---

## 🔄 CI/CD Workflow

This repository uses GitHub Actions for automated deployments:

### Development Environment
- **Trigger**: Push to `dev` branch
- **Workflow**: `.github/workflows/dabs_cicd_demo_dev.yaml`
- **Action**: Deploys `dabs_cicd_demo` bundle to dev environment

### Production Environment
- **Trigger**: Push to `main` branch
- **Workflow**: `.github/workflows/dabs_cicd_demo_prod.yaml`
- **Action**: Deploys `dabs_cicd_demo` bundle to production environment

### Configuration
Workflows use GitHub environment secrets:
- `DATABRICKS_TOKEN` - Databricks PAT for authentication
- `DATABRICKS_BUNDLE_ENV` - Target environment (dev/prod)

---

## 📚 Key Features Demonstrated

### Data Engineering
- ✅ Delta Live Tables (DLT) pipelines for incremental data processing
- ✅ Structured ETL workflows with notebooks and Python modules
- ✅ Data quality testing and validation

### DevOps & Automation
- ✅ GitHub Actions CI/CD integration
- ✅ Multi-environment deployment (dev, prod)
- ✅ Declarative Automation Bundles for infrastructure-as-code
- ✅ Automated testing in pipeline

### Analytics & Visualization
- ✅ Lakeview dashboards for data insights
- ✅ Job orchestration and scheduling

### Development Practices
- ✅ Local development with IDE support (VS Code)
- ✅ Python best practices (pyproject.toml, type hints)
- ✅ Unit testing and fixtures
- ✅ Version control and git workflows

---

## 🎯 Conference Context

These demos are prepared for **SQLDay Lite 2026** to showcase:
1. Modern data platform capabilities with Databricks
2. CI/CD best practices in data engineering
3. Real-world scenarios and production patterns
4. Hands-on learning with working examples

---

## 📖 Documentation

- Each project subdirectory contains its own `README.md` with specific setup instructions
- `dabs_cicd_demo/scratch/README.md` - Additional scratch/temporary notes
- `InitDemo/AGENTS.md` - Agent-based automation examples
- `InitDemo/CLAUDE.md` - Project-specific guidelines

---

## 🛠️ Management

### Using Helper Scripts

**PowerShell - List all jobs:**
```powershell
./helpers/jobs.ps1
# Or from Databricks CLI
databricks jobs list --output json
```

**PowerShell - Delete jobs by pattern:**
```powershell
$jobs = databricks jobs list --output json | ConvertFrom-Json
$jobs | Where-Object { $_.settings.name -like "*Test*" } | ForEach-Object {
    databricks jobs delete $_.job_id
}
```

---

## 📝 Next Steps

1. **Clone the repository** and set up your Databricks workspace
2. **Configure authentication** with `databricks configure`
3. **Deploy a demo project** to see CI/CD in action
4. **Explore the workflows** to understand best practices
5. **Adapt examples** to your own data engineering scenarios

---

## 🤝 Support

For Databricks documentation and additional resources:
- [Declarative Automation Bundles](https://docs.databricks.com/dev-tools/bundles/index.html)
- [Delta Live Tables](https://docs.databricks.com/en/delta-live-tables/index.html)
- [Databricks CLI](https://docs.databricks.com/dev-tools/cli/)
- [VS Code Extension](https://docs.databricks.com/dev-tools/vscode-ext.html)

---

**Last Updated:** September 25, 2026  
**Conference:** SQLDay Lite 2026
