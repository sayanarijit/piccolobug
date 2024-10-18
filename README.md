# Bug Report for Piccolo ORM

## Repduce the bug

```python
# Start postgres
docker-compose up -d  # Or podman-compose up -d

# Install dependencies
pip install -e .

# Reproduce the bug
python -m piccolobug.reproduce
```

## Expected behavior

```python
{'id': 2, 'meta': '{"a": true, "b": false}'}
{'id': 3, 'meta': '{"a": false, "b": true}'}
```

## Actual behavior

```python
{'id': 1, 'meta': '{"a": true, "b": true}'}
{'id': 2, 'meta': '{"a": true, "b": false}'}
{'id': 3, 'meta': '{"a": false, "b": true}'}
{'id': 4, 'meta': '{"a": false, "b": false}'}
```
