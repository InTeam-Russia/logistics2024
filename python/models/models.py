from datetime import datetime

from sqlalchemy import MetaData, Table, Column, Integer, String, ForeignKey, JSON, Boolean, Text

metadata = MetaData()

users = Table(
"users",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String(128), nullable=False),
    Column("surname", String(128), nullable=False),
    Column("email", String(320), nullable=False),
    Column("password", String, nullable=False),
    Column("photo", String, nullable=True),
    Column("is_active", Boolean, default=True, nullable=False),
    Column("is_superuser", Boolean, default=False, nullable=False),
    Column("is_verified", Boolean, default=False, nullable=False),
)
clients = Table(
    "clients",
    metadata,
    Column("id", Integer, primary_key=True, unique=True),
    Column("name", String(128), nullable=False),
    Column("surname", String(128), nullable=False),
    Column("email", String(320), nullable=False),
    Column("password", String, nullable=False),
    Column("photo", String, nullable=True),
    Column("is_active", Boolean, default=True, nullable=False),
    Column("is_superuser", Boolean, default=False, nullable=False),
    Column("is_verified", Boolean, default=False, nullable=False),
)
companies = Table(
    "companies",
    metadata,
    Column("id", Integer, primary_key=True, unique=True),
    Column("email", String(320), nullable=False),
    Column("password", String(64), nullable=False),
    Column("name", String(255), nullable=False),
    Column("description", Text, nullable=True),
    Column("is_active", Boolean, default=True, nullable=False),
    Column("is_superuser", Boolean, default=False, nullable=False),
    Column("is_verified", Boolean, default=False, nullable=False),
)

