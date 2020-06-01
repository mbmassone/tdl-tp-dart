# Dart stuff

## Un programa simple
```
// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```


## Boludeces copadas:

- Constructores con asignacion directa y con nombre (Syntactic sugar).
  ```
    Spacecraft(this.name, this.launchDate) {
      // Initialization code goes here.
    }

    Spacecraft.unlaunched(String name) : this(name, null);
  ```
- Propiedades privadas por default
```
class Spacecraft {
  String name;
  DateTime launchDate;

  int get launchYear =>
      launchDate?.year; // read-only non-final property
}
```
- Herencia simple:
  ```
  class Orbiter extends Spacecraft {
  double altitude;
    Orbiter(String name, DateTime launchDate, this.altitude)
        : super(name, launchDate);
  }
  ```

- Mixings

    ```
    class Musician extends Performer with Musical {
      // ···
    }
    // Musician

    class Maestro extends Person
        with Musical, Aggressive, Demented {
      Maestro(String maestroName) {
        name = maestroName;
        canConduct = true;
      }
    }
    ```

- No hay keyword para las interfaces y todas las clases definen una interfaz implícitamente, se puede implementar cualquier clase
  ```
  class MockSpaceship implements Spacecraft {
    // ···
  }
  ```

- Futures y Async
  ```  
  // Futures
  const oneSecond = Duration(seconds: 1);
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  // Awaits
  var file = File('$object.txt');
  if (await file.exists()) {
    var modified = await file.lastModified();
    print(
        'File for $object already exists. It was modified on $modified.');
    continue;
  }
  ```

- Manejo de errores por excepciones.
  ```
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
  ```
