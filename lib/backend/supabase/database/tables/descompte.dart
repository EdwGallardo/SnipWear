import '../database.dart';

class DescompteTable extends SupabaseTable<DescompteRow> {
  @override
  String get tableName => 'Descompte';

  @override
  DescompteRow createRow(Map<String, dynamic> data) => DescompteRow(data);
}

class DescompteRow extends SupabaseDataRow {
  DescompteRow(super.data);

  @override
  SupabaseTable get table => DescompteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAT => getField<DateTime>('createdAT')!;
  set createdAT(DateTime value) => setField<DateTime>('createdAT', value);

  String? get descripcio => getField<String>('descripcio');
  set descripcio(String? value) => setField<String>('descripcio', value);

  String? get urlFoto => getField<String>('urlFoto');
  set urlFoto(String? value) => setField<String>('urlFoto', value);

  DateTime? get dataFi => getField<DateTime>('dataFi');
  set dataFi(DateTime? value) => setField<DateTime>('dataFi', value);

  int get tipusDescompte => getField<int>('tipusDescompte')!;
  set tipusDescompte(int value) => setField<int>('tipusDescompte', value);

  String? get idUsuari => getField<String>('idUsuari');
  set idUsuari(String? value) => setField<String>('idUsuari', value);

  int? get idBotiga => getField<int>('idBotiga');
  set idBotiga(int? value) => setField<int>('idBotiga', value);

  int? get percentatgeDescompte => getField<int>('percentatgeDescompte');
  set percentatgeDescompte(int? value) =>
      setField<int>('percentatgeDescompte', value);
}
