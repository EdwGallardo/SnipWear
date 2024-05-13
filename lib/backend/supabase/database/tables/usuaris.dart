import '../database.dart';

class UsuarisTable extends SupabaseTable<UsuarisRow> {
  @override
  String get tableName => 'Usuaris';

  @override
  UsuarisRow createRow(Map<String, dynamic> data) => UsuarisRow(data);
}

class UsuarisRow extends SupabaseDataRow {
  UsuarisRow(super.data);

  @override
  SupabaseTable get table => UsuarisTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get nom => getField<String>('nom');
  set nom(String? value) => setField<String>('nom', value);

  String? get cognom => getField<String>('cognom');
  set cognom(String? value) => setField<String>('cognom', value);

  int? get telefon => getField<int>('telefon');
  set telefon(int? value) => setField<int>('telefon', value);

  String? get urlFoto => getField<String>('url_foto');
  set urlFoto(String? value) => setField<String>('url_foto', value);

  int? get totalLikes => getField<int>('total_likes');
  set totalLikes(int? value) => setField<int>('total_likes', value);
}
