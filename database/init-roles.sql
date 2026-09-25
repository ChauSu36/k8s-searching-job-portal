-- 1. Nạp quyền bắt buộc
INSERT INTO roles (name) VALUES
  ('ROLE_ADMIN'),
  ('ROLE_JOBSEEKER'),
  ('ROLE_RECRUITER')
ON DUPLICATE KEY UPDATE name=name;

-- 2. Nạp tài khoản Master Admin
INSERT INTO users (created_at, updated_at, email, email_verified, image_url, name, password, provider, provider_id) VALUES
  (NOW(), NOW(), 'master@gmail.com', 1, '', 'Master', '$2a$12$QtbZTkj3keprbCirsH4HOeiZ927JMI5p2uWjT3YymVjLfIXcV7C.6', 'local', '')
ON DUPLICATE KEY UPDATE email=email;

-- 3. Gán quyền Admin
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM users u, roles r 
WHERE u.email = 'master@gmail.com' AND r.name = 'ROLE_ADMIN'
ON DUPLICATE KEY UPDATE user_id=u.id;

-- 4. Danh mục mẫu
INSERT INTO category (name, description) VALUES
  ('Công nghệ thông tin', 'Lập trình viên, DevOps Engineer, Cloud, QA/QC'),
  ('Marketing / Truyền thông', 'Digital Marketing, Content Creator, SEO'),
  ('Kinh doanh / Bán hàng', 'B2B Sales, Chăm sóc khách hàng, Telesales'),
  ('Thiết kế đồ họa', 'UI/UX Designer, Banner, Video Editor')
ON DUPLICATE KEY UPDATE name=name;
