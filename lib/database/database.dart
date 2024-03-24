import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;
part 'database.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
const SqfEntityTable tablePrimaryInfo = SqfEntityTable(
  tableName: 'user',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('email', DbType.text, isUnique: true),
    SqfEntityField('password', DbType.text),
    SqfEntityField('isSignIN', DbType.bool, defaultValue: true)
  ],
);

const tickets = SqfEntityTable(
  tableName: 'ticket',
  primaryKeyName: 'ticketID',
  primaryKeyType: PrimaryKeyType.integer_unique,
  fields: [
    SqfEntityField('movieID', DbType.integer),
    SqfEntityField('customerName', DbType.text),
    SqfEntityField('email', DbType.text),
    SqfEntityField('customerID', DbType.integer),
    SqfEntityField('contactNumber', DbType.integer),
    SqfEntityField('movieTitle', DbType.text),
    SqfEntityField('url', DbType.text),
    SqfEntityField('movieStartTime', DbType.integer),
    SqfEntityField('movieEndTime', DbType.integer),
  ],
);

const history = SqfEntityTable(
  tableName: 'history',
  primaryKeyName: 'movieID',
  primaryKeyType: PrimaryKeyType.integer_unique,
  fields: [
    SqfEntityField('url', DbType.text),
    SqfEntityField('searchAt', DbType.integer, isUnique: true),
    SqfEntityField('title', DbType.text),
  ],
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MovieDB',
  databaseName: 'movie-db.db',
  sequences: [seqIdentity],
  databaseTables: [tablePrimaryInfo, tickets, history],
);
