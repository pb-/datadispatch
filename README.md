# datadispatch

datadispatch provides a dispatch mechanism (a.k.a. polymorphism) like [`functools.singledispatch`](https://docs.python.org/3/library/functools.html#functools.singledispatch), but it operates on data instead of types. This is useful if you are creating simple data-centric applications where you want polymorphism à la carte without resorting to types or classes.

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

## Documentation

The API of datadispatch is identical to [`functools.singledispatch`](https://docs.python.org/3/library/functools.html#functools.singledispatch), except that the main decorator `@datadispatch(...)` takes a function argument mapping `args` and `kwargs` to a value. If your dispatch function takes, say, a dictionary with a `type` key you would invoke `@datadispatch(...)` as shown in the code example above. All dispatch handlers then register themselves with the value they are handling; you can also stack the register calls to handle multiple values. If none of your registered dispatch handlers are able to handle the value, you can perform default handling in the original function.

Note that all decorated functions can still be called just as if they were regular functions.

## Real-life examples

 * [Message dispatch in a game server](https://github.com/pb-/set/blob/d6b742ffa50eed977523e49908c2dd4529e746e3/backend/set/game.py#L26)
 * In a todo-item manager
   * [Parsing user-input commands](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/parse.py#L16)
   * [Dispatching events](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/update.py#L32)
   * [Dispatching run-time commands](https://github.com/pb-/tasks/blob/8985f55eff93f7ce63e357e4793f4b034fe0cfd5/tasks/main.py#L71)
