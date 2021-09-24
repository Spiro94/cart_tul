import 'dart:io';

String reader(String name) => File('test/json/$name.json').readAsStringSync();
