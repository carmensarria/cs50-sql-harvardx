-- =========================================
-- your.harvard - CS50 SQL Week 5
-- =========================================
-- Indexes created to optimize common queries
-- on the Harvard course database.
-- =========================================

-- Improves searches for a student's enrollments.
CREATE INDEX "enrollments_by_student_id"
ON "enrollments"("student_id");

-- Optimizes course searches by department, course number, and semester.
CREATE INDEX "courses_by_dept_no_sem"
ON "courses"("department", "number", "semester");

-- Improves joins between courses and enrollments.
CREATE INDEX "enrollments_by_course_id"
ON "enrollments"("course_id");

-- Optimizes filtering courses by department and semester.
CREATE INDEX "courses_by_dept_sem"
ON "courses"("department", "semester");

-- Improves searches for course requirements.
CREATE INDEX "satisfies_by_course_id"
ON "satisfies"("course_id");

-- Optimizes searches by course title and semester.
CREATE INDEX "courses_by_title_semester"
ON "courses"("title", "semester");
