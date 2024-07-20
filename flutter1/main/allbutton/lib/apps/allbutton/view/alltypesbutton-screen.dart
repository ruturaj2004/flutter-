import 'package:flutter/material.dart';


void main() {
  runApp(const AllButton());
}

class AllButton extends StatelessWidget {
  const AllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Flutter Buttons Example'),),
    body: _allbutton(),
    );
    
  }
  
  _allbutton() {
    return Column(
          
          children: <Widget>[
       
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: null,
              child: const Text('ElevatedButton deshabilitado'),
            ),
            const SizedBox(height: 10),
                  const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton normal'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              label: const Text('ElevatedButton con icono'),
            ),
            const Divider(),
                  
           
            const SizedBox(height: 4),
            FilledButton(
              onPressed: null,
              child: const Text('FilledButton deshabilitado'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            FilledButton(
              onPressed: () {},
              child: const Text('FilledButton normal'),
            ),
            const SizedBox(height: 10),
                     const SizedBox(height: 4),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              label: const Text('FilledButton con icono'),
            ),
            const SizedBox(height: 10),
         
            const SizedBox(height: 4),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('FilledButton tonal'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            FilledButton.tonalIcon(
              onPressed: () {},
                icon: const Icon(Icons.file_copy),
              label: const Text('FilledButton tonal icon'),
            ),
            const Divider(),
                  
 
           
            const SizedBox(height: 4),
            OutlinedButton(
              onPressed: null,
              child: const Text('OutlinedButton deshabilitado'),
            ),
            const SizedBox(height: 10),
                    const SizedBox(height: 4),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton normal'),
            ),
            const SizedBox(height: 10),
                       const SizedBox(height: 4),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.book),
              label: const Text('OutlinedButton con icono'),
            ),
            const Divider(),
           
                        TextButton(
              onPressed: null,
              child: const Text('TextButton deshabilitado'),
            ),
            const SizedBox(height: 10),
           
            const SizedBox(height: 4),
            TextButton(
              onPressed: () {},
              child: const Text('TextButton normal'),
            ),
            const SizedBox(height: 10),
           
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () {},
                icon: const Icon(Icons.file_copy),
              label: const Text('TextButton con icono'),
            ),
          ],
        );
  }
}

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Buttons Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: <Widget>[
       
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: null,
              child: const Text('ElevatedButton deshabilitado'),
            ),
            const SizedBox(height: 10),
                  const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton normal'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              label: const Text('ElevatedButton con icono'),
            ),
            const Divider(),
                  
           
            const SizedBox(height: 4),
            FilledButton(
              onPressed: null,
              child: const Text('FilledButton deshabilitado'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            FilledButton(
              onPressed: () {},
              child: const Text('FilledButton normal'),
            ),
            const SizedBox(height: 10),
                     const SizedBox(height: 4),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              label: const Text('FilledButton con icono'),
            ),
            const SizedBox(height: 10),
         
            const SizedBox(height: 4),
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('FilledButton tonal'),
            ),
            const SizedBox(height: 10),
          
            const SizedBox(height: 4),
            FilledButton.tonalIcon(
              onPressed: () {},
                icon: const Icon(Icons.file_copy),
              label: const Text('FilledButton tonal icon'),
            ),
            const Divider(),
                  
 
           
            const SizedBox(height: 4),
            OutlinedButton(
              onPressed: null,
              child: const Text('OutlinedButton deshabilitado'),
            ),
            const SizedBox(height: 10),
                    const SizedBox(height: 4),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton normal'),
            ),
            const SizedBox(height: 10),
                       const SizedBox(height: 4),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.book),
              label: const Text('OutlinedButton con icono'),
            ),
            const Divider(),
           
                        TextButton(
              onPressed: null,
              child: const Text('TextButton deshabilitado'),
            ),
            const SizedBox(height: 10),
           
            const SizedBox(height: 4),
            TextButton(
              onPressed: () {},
              child: const Text('TextButton normal'),
            ),
            const SizedBox(height: 10),
           
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () {},
                icon: const Icon(Icons.file_copy),
              label: const Text('TextButton con icono'),
            ),
          ],
        ),
      ),
    );
  }
}



class FilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;

  const FilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        backgroundColor: onPressed != null ? Theme.of(context).colorScheme.primary : Colors.grey[300],
        foregroundColor: onPressed != null ? Colors.white : Colors.grey[500],
      ),
      child: child,
    );
  }

  static FilledButton icon({
    required VoidCallback? onPressed,
    required  icon,
    required Widget label,
    ButtonStyle? style,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          label,
        ],
      ),
    );
  }

  static FilledButton tonal({
    required VoidCallback? onPressed,
    required Widget child,
    ButtonStyle? style,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        backgroundColor: onPressed != null ? Colors.deepPurple[200] : Colors.grey[300],
        foregroundColor: onPressed != null ? Colors.black : Colors.grey[500],
      ),
      child: child,
    );
  }

  static FilledButton tonalIcon({
    required VoidCallback? onPressed,
    required  icon,
    required Widget label,
    ButtonStyle? style,
  }) {
    return FilledButton(
      onPressed: onPressed,
      style: style ?? ElevatedButton.styleFrom(
        backgroundColor: onPressed != null ? Colors.deepPurple[200] : Colors.grey[300],
        foregroundColor: onPressed != null ? Colors.black : Colors.grey[500],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          label,
        ],
      ),
    );
  }
}
