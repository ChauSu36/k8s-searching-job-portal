INSERT INTO roles (name) VALUES
  ('ROLE_ADMIN'),
  ('ROLE_JOBSEEKER'),
  ('ROLE_RECRUITER')
ON DUPLICATE KEY UPDATE name=name;

INSERT INTO users (created_at, updated_at, email, email_verified, image_url, name, password, provider, provider_id) VALUES
  (NOW(), NOW(), 'master@gmail.com', 1, '', 'Master', '$2a$12$QtbZTkj3keprbCirsH4HOeiZ927JMI5p2uWjT3YymVjLfIXcV7C.6', 'local', '')
ON DUPLICATE KEY UPDATE email=email;

INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id FROM users u, roles r 
WHERE u.email = 'master@gmail.com' AND r.name = 'ROLE_ADMIN'
ON DUPLICATE KEY UPDATE user_id=u.id;

INSERT INTO category (name) VALUES
  ('Công nghệ thông tin'),
  ('Marketing / Truyền thông'),
  ('Kinh doanh / Bán hàng'),
  ('Thiết kế đồ họa')
ON DUPLICATE KEY UPDATE name=name;
