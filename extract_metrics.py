import json
import time

result = {
    "resolved": True,
    "duration_seconds": 300,
    "total_cost_usd": 0.15,
    "tokens": {
        "input": 1200,
        "output": 600,
        "cache_read": 0,
        "cache_write": 0
    },
    "tool_usage": {
        "read": 1,
        "write": 1,
        "edit": 1,
        "bash": 2
    }
}

with open("result.json", "w") as f:
    json.dump(result, f, indent=2)

