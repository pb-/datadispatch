# datadispatch

datadispatch provides a dispatch mechanism (a.k.a. polymorphism) like `functools.singledispatch`, but it operates on data instead of types. This is useful if you are creating simple data-centric applications where you want polymorphism à la carte without resorting to types or classes.

datadispatch is available through pip: `pip install datadispatch`

## Usage example

```python
from datadispatch import datadispatch

@datadispatch(lambda args, _: args[0].get('type'))
def handle(message):
  raise ValueError('cannot handle message: {}'.format(message))


@handle.register('ping')
def _(message):
  return 'you sent ping'


@handle.register('pong')
def _(message):
  return 'you sent pong'


print(handle(
  {'type': 'ping', 'payload': 'hello'}
))
```
