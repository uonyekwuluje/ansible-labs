SELECT 'CREATE DATABASE uchdatabase'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'uchdatabase')\gexec
CREATE USER reading_user WITH PASSWORD 'reading_pass';
GRANT CONNECT ON DATABASE uchdatabase TO reading_user;
CREATE USER repl_user WITH PASSWORD 'repl_password';
GRANT CONNECT ON DATABASE uchdatabase TO repl_user;
\c uchdatabase;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO repl_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reading_user;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO reading_user;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO repl_user;
GRANT USAGE ON SCHEMA public TO reading_user;
GRANT USAGE ON SCHEMA public TO repl_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO reading_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO repl_user;
