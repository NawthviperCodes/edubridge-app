# 🎓 EduBridge Registration Platform

👉 [Live Demo](https://edubridge-app.onrender.com)

## ❌ The Problem

Many students face a common challenge:

* Some **modules required for graduation** are **not offered** at their home university.
* Universities often work in **silos**, limiting collaboration and access to courses.
* The current process (emails, paperwork, manual approvals) is **slow, frustrating, and inefficient**.

As a result, students are left with **fewer learning opportunities** and sometimes **delayed graduations**.

---

## ✅ The Solution: EduBridge

EduBridge was built to address this problem head-on. It’s a **web-based platform** that allows students to:

* 🔍 **Browse modules** offered by partner universities
* 📝 **Register instantly** for external courses without transferring institutions
* 📄 **Download proof of registration & results** in PDF
* 📊 **Track status** of enrolled modules in real time

For universities, it provides:

* 👩‍🏫 Easy course management tools
* 🔗 A framework for **cross-institutional collaboration**
* ⚡ Reduced admin workload with digital automation

---

## 🌍 Future Potential

Right now, EduBridge demonstrates the concept with secure logins, course catalogs, and registration. But the **vision goes further**:

* 🤝 Build full partnerships between universities
* 🔄 Enable **credit transfers** across institutions seamlessly
* 📡 Integrate with existing academic systems (APIs)
* 🌐 Expand inclusivity by giving every student access to the courses they need

EduBridge is not just a project — it’s a **scalable solution** that can change how universities share knowledge.

---

## 🛠️ Tech Stack

* **Backend:** FastAPI (Python)
* **Database:** PostgreSQL
* **Frontend:** HTML5, CSS3, Jinja2
* **PDF Engine:** ReportLab
* **Hosting:** Render.com

## Deployment

EduBridge can use any hosted PostgreSQL database that supplies a standard
connection string. Neon is a convenient option for a small deployment.

1. Create a PostgreSQL project and copy its connection string.
2. In Render, open the EduBridge web service and add these environment
   variables:

   - `DATABASE_URL`: the PostgreSQL connection string (including
     `sslmode=require`)
   - `SESSION_SECRET`: a long random value
   - `ADMIN_EMAIL`: the initial administrator email
   - `ADMIN_PASSWORD`: the initial administrator password

3. Deploy the latest commit. On first startup, `schema.sql` creates the tables
   and seed records automatically.
4. Open `/health`. A successful database connection returns
   `{"status":"ok"}`.

Copy `.env.example` to `.env` to run locally. Never commit `.env` or database
credentials.

---

## 🌟 Impact on Students

* 🎯 **Access modules beyond home university**
* ⏳ **Save time** with instant digital registration
* 📈 **Wider academic opportunities** for growth and specialization
* 🏆 **Equity in education**: everyone gets the chance to learn what they need

---

💡 *EduBridge demonstrates how thoughtful software design can solve real educational barriers while showcasing skills in full-stack web development, database design, and cloud deployment.*
