import '../database.dart';

class TipusDescompteTable extends SupabaseTable<TipusDescompteRow> {
  @override
  String get tableName => 'TipusDescompte';

  @override
  TipusDescompteRow createRow(Map<String, dynamic> data) =>
      TipusDescompteRow(data);
}

class TipusDescompteRow extends SupabaseDataRow {
  TipusDescompteRow(super.data);

  @override
  SupabaseTable get table => TipusDescompteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get tipus => getField<String>('tipus');
  set tipus(String? value) => setField<String>('tipus', value);
}
