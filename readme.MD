# 🧰 DevOps Automation Toolkit  
### From Basic Shell Scripts ➜ Fully Automated Microservices on AWS 🚀

Welcome! 👋  
This repository is my **hands-on DevOps journey** — starting from Linux scripting basics and ending with a completely automated **production-style RoboShop microservices deployment on AWS**.

Think of it as:  
➡️ Learn Linux Internals → Write Smart Scripts → Automate Servers → Deploy Real Applications ☁️

---

## 🌟 What This Project Shows

### 🧩 End-to-End Automation
Automatically deploys **7+ microservices** written in:
- 🐹 GoLang
- 🐍 Python
- ☕ Java
- 🌐 Node.js

No manual server setup needed — one command handles everything.

---

### 🏢 Real-World Engineering Practices
Designed like real company production environments:

- ♻️ Idempotent scripts (safe to run multiple times)
- 🧠 Smart error handling & recovery
- ⚙️ Dynamic configuration using **SystemD + Environment Variables**

---

### 🗄️ Multi-Database Architecture
Automatic setup & configuration of:

- 🍃 MongoDB (NoSQL)
- ⚡ Redis (Cache)
- 🐬 MySQL (SQL)
- 🐰 RabbitMQ (Messaging)

All deployed inside a secure private network (VPC) 🔒

---

### 🔍 Observability & Debugging
Professional logging support:

- SyslogIdentifier tagging
- `journalctl` monitoring
- Easy troubleshooting in real time

---

## 📁 Repository Structure

The repo is divided into **2 major learning phases**

---

## 1️⃣ `bash_scripts/` — Linux & Scripting Foundations 🐧

This section builds strong DevOps fundamentals.

### 🧠 Logic & Reusability
- Advanced `if-elif-else`
- Reusable functions
- Package installation automation

---

### 🔐 Security Practices
- Secure user input handling
- Automatic password generation  
  (`user_creator.sh`)

---

### 🛡️ Reliability
Scripts never fail silently:

- `set -e` → stop on error
- `trap` → controlled failure handling

---

## 2️⃣ `aws-automation/` — RoboShop Microservices ☁️

The main project 🎯  
Full automation of a real e-commerce architecture.

---

### 🌐 Frontend
- Nginx Reverse Proxy
- Dynamic internal DNS routing

---

### ⚙️ Backend Services
Auto build & deploy:

| Service | Technology |
|------|------|
| Dispatch | GoLang 🐹 |
| Shipping | Java ☕ |
| Payment | Python 🐍 |
| Cart / User / Catalogue | Node.js 🌐 |

---

### 🗄️ Database Layer
Automatic:

- Schema loading
- DB initialization
- SQL + NoSQL configuration

---

## 🏆 Engineering Standards (Production Ready)

---

### 🔐 Zero Secrets in Code
No passwords or hostnames inside scripts ❌

Instead, runtime injection is used:

#### Positional Parameters
```bash
sudo sh mysql.sh <db_password>
