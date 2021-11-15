import 'package:leitor_codigo_barras/models/create_sheet.model.dart';
import 'package:mobx/mobx.dart';

part 'create.store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable
  String _name = '';

  @observable
  List<String> _fields = [];

  CreateSheet? _createSheet;

  _CreateStore() {
    CreateSheet _createSheet = CreateSheet(_name, _fields);
  }

  @action
  void addField(String value) {
    print('adcionado value: $value');
    _fields.add(value);
    _createSheet?.fields?.add(value);
  }

  @action
  void name(String value) {
    _createSheet?.name = value;
  }

  CreateSheet? get createSheet => _createSheet;
  String? value(int index) => _createSheet?.fields?[index];
  int? get length => _createSheet?.fields?.length;
}
