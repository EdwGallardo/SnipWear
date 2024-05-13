import '../database.dart';

class BotigaTable extends SupabaseTable<BotigaRow> {
  @override
  String get tableName => 'Botiga';

  @override
  BotigaRow createRow(Map<String, dynamic> data) => BotigaRow(data);
}

class BotigaRow extends SupabaseDataRow {
  BotigaRow(super.data);

  @override
  SupabaseTable get table => BotigaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nomBotiga => getField<String>('nomBotiga');
  set nomBotiga(String? value) => setField<String>('nomBotiga', value);

  String? get latitut => getField<String>('latitut');
  set latitut(String? value) => setField<String>('latitut', value);

  String? get longitut => getField<String>('longitut');
  set longitut(String? value) => setField<String>('longitut', value);

  String? get urlFoto => getField<String>('urlFoto');
  set urlFoto(String? value) => setField<String>('urlFoto', value);
}
