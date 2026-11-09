// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteItemsTable extends FavoriteItems
    with TableInfo<$FavoriteItemsTable, FavoriteItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [itemId, title, price, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  FavoriteItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteItem(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $FavoriteItemsTable createAlias(String alias) {
    return $FavoriteItemsTable(attachedDatabase, alias);
  }
}

class FavoriteItem extends DataClass implements Insertable<FavoriteItem> {
  final String itemId;
  final String title;
  final double price;
  final String imageUrl;
  const FavoriteItem({
    required this.itemId,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<String>(itemId);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  FavoriteItemsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteItemsCompanion(
      itemId: Value(itemId),
      title: Value(title),
      price: Value(price),
      imageUrl: Value(imageUrl),
    );
  }

  factory FavoriteItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteItem(
      itemId: serializer.fromJson<String>(json['itemId']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<String>(itemId),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  FavoriteItem copyWith({
    String? itemId,
    String? title,
    double? price,
    String? imageUrl,
  }) => FavoriteItem(
    itemId: itemId ?? this.itemId,
    title: title ?? this.title,
    price: price ?? this.price,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  FavoriteItem copyWithCompanion(FavoriteItemsCompanion data) {
    return FavoriteItem(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteItem(')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, title, price, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteItem &&
          other.itemId == this.itemId &&
          other.title == this.title &&
          other.price == this.price &&
          other.imageUrl == this.imageUrl);
}

class FavoriteItemsCompanion extends UpdateCompanion<FavoriteItem> {
  final Value<String> itemId;
  final Value<String> title;
  final Value<double> price;
  final Value<String> imageUrl;
  final Value<int> rowid;
  const FavoriteItemsCompanion({
    this.itemId = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteItemsCompanion.insert({
    required String itemId,
    required String title,
    required double price,
    required String imageUrl,
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId),
       title = Value(title),
       price = Value(price),
       imageUrl = Value(imageUrl);
  static Insertable<FavoriteItem> custom({
    Expression<String>? itemId,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteItemsCompanion copyWith({
    Value<String>? itemId,
    Value<String>? title,
    Value<double>? price,
    Value<String>? imageUrl,
    Value<int>? rowid,
  }) {
    return FavoriteItemsCompanion(
      itemId: itemId ?? this.itemId,
      title: title ?? this.title,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteItemsCompanion(')
          ..write('itemId: $itemId, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ListingDraftsTable extends ListingDrafts
    with TableInfo<$ListingDraftsTable, ListingDraft> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListingDraftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    category,
    description,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'listing_drafts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ListingDraft> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ListingDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ListingDraft(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
    );
  }

  @override
  $ListingDraftsTable createAlias(String alias) {
    return $ListingDraftsTable(attachedDatabase, alias);
  }
}

class ListingDraft extends DataClass implements Insertable<ListingDraft> {
  final int id;
  final String title;
  final String category;
  final String description;
  final String imagePath;
  const ListingDraft({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['category'] = Variable<String>(category);
    map['description'] = Variable<String>(description);
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  ListingDraftsCompanion toCompanion(bool nullToAbsent) {
    return ListingDraftsCompanion(
      id: Value(id),
      title: Value(title),
      category: Value(category),
      description: Value(description),
      imagePath: Value(imagePath),
    );
  }

  factory ListingDraft.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ListingDraft(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      category: serializer.fromJson<String>(json['category']),
      description: serializer.fromJson<String>(json['description']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'category': serializer.toJson<String>(category),
      'description': serializer.toJson<String>(description),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  ListingDraft copyWith({
    int? id,
    String? title,
    String? category,
    String? description,
    String? imagePath,
  }) => ListingDraft(
    id: id ?? this.id,
    title: title ?? this.title,
    category: category ?? this.category,
    description: description ?? this.description,
    imagePath: imagePath ?? this.imagePath,
  );
  ListingDraft copyWithCompanion(ListingDraftsCompanion data) {
    return ListingDraft(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      category: data.category.present ? data.category.value : this.category,
      description: data.description.present
          ? data.description.value
          : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ListingDraft(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, category, description, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListingDraft &&
          other.id == this.id &&
          other.title == this.title &&
          other.category == this.category &&
          other.description == this.description &&
          other.imagePath == this.imagePath);
}

class ListingDraftsCompanion extends UpdateCompanion<ListingDraft> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> category;
  final Value<String> description;
  final Value<String> imagePath;
  const ListingDraftsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  ListingDraftsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String category,
    required String description,
    required String imagePath,
  }) : title = Value(title),
       category = Value(category),
       description = Value(description),
       imagePath = Value(imagePath);
  static Insertable<ListingDraft> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  ListingDraftsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? category,
    Value<String>? description,
    Value<String>? imagePath,
  }) {
    return ListingDraftsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListingDraftsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteItemsTable favoriteItems = $FavoriteItemsTable(this);
  late final $ListingDraftsTable listingDrafts = $ListingDraftsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    favoriteItems,
    listingDrafts,
  ];
}

typedef $$FavoriteItemsTableCreateCompanionBuilder =
    FavoriteItemsCompanion Function({
      required String itemId,
      required String title,
      required double price,
      required String imageUrl,
      Value<int> rowid,
    });
typedef $$FavoriteItemsTableUpdateCompanionBuilder =
    FavoriteItemsCompanion Function({
      Value<String> itemId,
      Value<String> title,
      Value<double> price,
      Value<String> imageUrl,
      Value<int> rowid,
    });

class $$FavoriteItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$FavoriteItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteItemsTable,
          FavoriteItem,
          $$FavoriteItemsTableFilterComposer,
          $$FavoriteItemsTableOrderingComposer,
          $$FavoriteItemsTableAnnotationComposer,
          $$FavoriteItemsTableCreateCompanionBuilder,
          $$FavoriteItemsTableUpdateCompanionBuilder,
          (
            FavoriteItem,
            BaseReferences<_$AppDatabase, $FavoriteItemsTable, FavoriteItem>,
          ),
          FavoriteItem,
          PrefetchHooks Function()
        > {
  $$FavoriteItemsTableTableManager(_$AppDatabase db, $FavoriteItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> itemId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteItemsCompanion(
                itemId: itemId,
                title: title,
                price: price,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String itemId,
                required String title,
                required double price,
                required String imageUrl,
                Value<int> rowid = const Value.absent(),
              }) => FavoriteItemsCompanion.insert(
                itemId: itemId,
                title: title,
                price: price,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FavoriteItemsTable, FavoriteItem>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $FavoriteItemsTable,
                    FavoriteItem
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteItemsTable,
      FavoriteItem,
      $$FavoriteItemsTableFilterComposer,
      $$FavoriteItemsTableOrderingComposer,
      $$FavoriteItemsTableAnnotationComposer,
      $$FavoriteItemsTableCreateCompanionBuilder,
      $$FavoriteItemsTableUpdateCompanionBuilder,
      (
        FavoriteItem,
        BaseReferences<_$AppDatabase, $FavoriteItemsTable, FavoriteItem>,
      ),
      FavoriteItem,
      PrefetchHooks Function()
    >;
typedef $$ListingDraftsTableCreateCompanionBuilder =
    ListingDraftsCompanion Function({
      Value<int> id,
      required String title,
      required String category,
      required String description,
      required String imagePath,
    });
typedef $$ListingDraftsTableUpdateCompanionBuilder =
    ListingDraftsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> category,
      Value<String> description,
      Value<String> imagePath,
    });

class $$ListingDraftsTableFilterComposer
    extends Composer<_$AppDatabase, $ListingDraftsTable> {
  $$ListingDraftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ListingDraftsTableOrderingComposer
    extends Composer<_$AppDatabase, $ListingDraftsTable> {
  $$ListingDraftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ListingDraftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ListingDraftsTable> {
  $$ListingDraftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);
}

class $$ListingDraftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ListingDraftsTable,
          ListingDraft,
          $$ListingDraftsTableFilterComposer,
          $$ListingDraftsTableOrderingComposer,
          $$ListingDraftsTableAnnotationComposer,
          $$ListingDraftsTableCreateCompanionBuilder,
          $$ListingDraftsTableUpdateCompanionBuilder,
          (
            ListingDraft,
            BaseReferences<_$AppDatabase, $ListingDraftsTable, ListingDraft>,
          ),
          ListingDraft,
          PrefetchHooks Function()
        > {
  $$ListingDraftsTableTableManager(_$AppDatabase db, $ListingDraftsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ListingDraftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ListingDraftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ListingDraftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
              }) => ListingDraftsCompanion(
                id: id,
                title: title,
                category: category,
                description: description,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String category,
                required String description,
                required String imagePath,
              }) => ListingDraftsCompanion.insert(
                id: id,
                title: title,
                category: category,
                description: description,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ListingDraftsTable, ListingDraft>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ListingDraftsTable,
                    ListingDraft
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ListingDraftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ListingDraftsTable,
      ListingDraft,
      $$ListingDraftsTableFilterComposer,
      $$ListingDraftsTableOrderingComposer,
      $$ListingDraftsTableAnnotationComposer,
      $$ListingDraftsTableCreateCompanionBuilder,
      $$ListingDraftsTableUpdateCompanionBuilder,
      (
        ListingDraft,
        BaseReferences<_$AppDatabase, $ListingDraftsTable, ListingDraft>,
      ),
      ListingDraft,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteItemsTableTableManager get favoriteItems =>
      $$FavoriteItemsTableTableManager(_db, _db.favoriteItems);
  $$ListingDraftsTableTableManager get listingDrafts =>
      $$ListingDraftsTableTableManager(_db, _db.listingDrafts);
}
