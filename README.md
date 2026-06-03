# Coding-lab_Group5# 🏥 KNH Digital Infrastructure — Group XX

A shell-script system that manages live sensor data (heart rate, temperature, water usage) for Kenyatta National Hospital.

---

## 👥 Group Members

| Member | Role | Task |
|--------|------|------|
| Member 1 | The Architect | `initialize_system()` — creates folders |
| Member 2 | The Security Lead | `secure_data()` — locks permissions |
| Member 3 | The Orchestrator | Runs M1 + M2 in order, prints status |
| Member 4 | The Archivist | Moves and timestamps old logs |
| Member 5 | The Clinical Analyst | Finds CRITICAL alerts in logs |
| Member 6 | The Facility Auditor | Calculates average ICU water usage |

---

## 🚀 How to Run

```bash
# 1. Set up folders and permissions
bash hospital_admin.sh

# 2. Start the data engine
python3 hospital_system.py start

# 3. Analyze the data
bash hospital_analysis.sh

# 4. Archive old logs
bash hospital_archive.sh

# 5. Stop the engine when done
python3 hospital_system.py stop
```

---

## 🌿 Git Workflow

Each member works on their own branch:

```bash
git checkout -b feature/your-task-name
# write your code
git add .
git commit -m "describe what you did"
git push origin feature/your-task-name
# then open a Pull Request to merge into main
```

> Every member must have **at least 3 commits** showing their contribution.

---

## ⚠️ Important

- **Never push** `active_logs/`, `archived_logs/`, or `reports/` to GitHub — these contain patient data and are blocked by `.gitignore`
- Always `git pull origin main` before starting work each day
