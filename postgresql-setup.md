# PostgreSQL Setup — Windows

## What is PostgreSQL?

PostgreSQL is a relational database used by applications to store and retrieve structured data.

## 1. Download PostgreSQL

Official Windows page:

https://www.postgresql.org/download/windows/

Use the Windows installer linked from the official PostgreSQL website.

The installer includes PostgreSQL Server, pgAdmin, and StackBuilder.

## 2. Install PostgreSQL

1. Open the downloaded installer.
2. Click **Next**.
3. Keep the default installation directory.
4. Keep these components selected:
   - PostgreSQL Server
   - pgAdmin 4
   - StackBuilder
   - Command Line Tools
5. Continue to the password screen.

## 3. Create the PostgreSQL password

The default administrative username is:

```text
postgres
```

Create a strong password and save it securely.

**Do not put the password in GitHub, source code, or a committed `.env` file.**

## 4. Select the port

Use:

```text
5432
```

unless the project specifies another port.

Complete the installation.

## 5. Verify PostgreSQL

Open a new PowerShell window:

```powershell
psql --version
```

A PostgreSQL client version should be displayed.

## 6. Connect

```powershell
psql -U postgres
```

Enter the password created during installation.

A successful connection will show:

```text
postgres=#
```

Exit:

```sql
\q
```

## 7. Create a test database

Connect as `postgres` and run:

```sql
CREATE DATABASE test_database;
```

List databases:

```sql
\l
```

Connect:

```sql
\c test_database
```

Exit:

```sql
\q
```

## 8. Open pgAdmin

Open the Windows Start menu and search:

```text
pgAdmin 4
```

Open it and connect to the PostgreSQL server using the password created during installation.

## Troubleshooting

### `psql` is not recognized

1. Close PowerShell.
2. Open a new PowerShell window.
3. Run `psql --version` again.

If it still fails, PostgreSQL's `bin` directory may not be in PATH. A typical location is:

```text
C:\Program Files\PostgreSQL\<version>\bin
```

Confirm the actual installation directory before changing PATH.

### Cannot connect

Check that the PostgreSQL service is running and that the username, password, host, and port are correct.

## Official links

- PostgreSQL downloads: https://www.postgresql.org/download/
- PostgreSQL Windows: https://www.postgresql.org/download/windows/
- PostgreSQL documentation: https://www.postgresql.org/docs/
