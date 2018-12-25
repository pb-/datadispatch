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

## Real-life examples

 * [Message dispatch in a game server](https://github.com/pb-/set/blob/d6b742ffa50eed977523e49908c2dd4529e746e3/backend/set/game.py#L26)
 * In a todo-item manager
   * [Parsing user-input commands](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/parse.py#L16)
   * [Dispatching events](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/update.py#L32)
   * [Dispatching run-time commands](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/main.py#L71)
