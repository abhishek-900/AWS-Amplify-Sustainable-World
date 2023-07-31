/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Order type in your schema. */
class Order extends amplify_core.Model {
  static const classType = const _OrderModelType();
  final String id;
  final amplify_core.TemporalDateTime? _orderDate;
  final String? _transactionId;
  final OrderStatus? _status;
  final String? _userdetailID;
  final Product? _product;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _orderProductId;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OrderModelIdentifier get modelIdentifier {
      return OrderModelIdentifier(
        id: id
      );
  }
  
  amplify_core.TemporalDateTime? get orderDate {
    return _orderDate;
  }
  
  String? get transactionId {
    return _transactionId;
  }
  
  OrderStatus? get status {
    return _status;
  }
  
  String get userdetailID {
    try {
      return _userdetailID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Product? get product {
    return _product;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get orderProductId {
    return _orderProductId;
  }
  
  const Order._internal({required this.id, orderDate, transactionId, status, required userdetailID, product, createdAt, updatedAt, orderProductId}): _orderDate = orderDate, _transactionId = transactionId, _status = status, _userdetailID = userdetailID, _product = product, _createdAt = createdAt, _updatedAt = updatedAt, _orderProductId = orderProductId;
  
  factory Order({String? id, amplify_core.TemporalDateTime? orderDate, String? transactionId, OrderStatus? status, required String userdetailID, Product? product, String? orderProductId}) {
    return Order._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      orderDate: orderDate,
      transactionId: transactionId,
      status: status,
      userdetailID: userdetailID,
      product: product,
      orderProductId: orderProductId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
      id == other.id &&
      _orderDate == other._orderDate &&
      _transactionId == other._transactionId &&
      _status == other._status &&
      _userdetailID == other._userdetailID &&
      _product == other._product &&
      _orderProductId == other._orderProductId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Order {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("orderDate=" + (_orderDate != null ? _orderDate!.format() : "null") + ", ");
    buffer.write("transactionId=" + "$_transactionId" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("userdetailID=" + "$_userdetailID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("orderProductId=" + "$_orderProductId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Order copyWith({amplify_core.TemporalDateTime? orderDate, String? transactionId, OrderStatus? status, String? userdetailID, Product? product, String? orderProductId}) {
    return Order._internal(
      id: id,
      orderDate: orderDate ?? this.orderDate,
      transactionId: transactionId ?? this.transactionId,
      status: status ?? this.status,
      userdetailID: userdetailID ?? this.userdetailID,
      product: product ?? this.product,
      orderProductId: orderProductId ?? this.orderProductId);
  }
  
  Order copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalDateTime?>? orderDate,
    ModelFieldValue<String?>? transactionId,
    ModelFieldValue<OrderStatus?>? status,
    ModelFieldValue<String>? userdetailID,
    ModelFieldValue<Product?>? product,
    ModelFieldValue<String?>? orderProductId
  }) {
    return Order._internal(
      id: id,
      orderDate: orderDate == null ? this.orderDate : orderDate.value,
      transactionId: transactionId == null ? this.transactionId : transactionId.value,
      status: status == null ? this.status : status.value,
      userdetailID: userdetailID == null ? this.userdetailID : userdetailID.value,
      product: product == null ? this.product : product.value,
      orderProductId: orderProductId == null ? this.orderProductId : orderProductId.value
    );
  }
  
  Order.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _orderDate = json['orderDate'] != null ? amplify_core.TemporalDateTime.fromString(json['orderDate']) : null,
      _transactionId = json['transactionId'],
      _status = amplify_core.enumFromString<OrderStatus>(json['status'], OrderStatus.values),
      _userdetailID = json['userdetailID'],
      _product = json['product']?['serializedData'] != null
        ? Product.fromJson(new Map<String, dynamic>.from(json['product']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _orderProductId = json['orderProductId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'orderDate': _orderDate?.format(), 'transactionId': _transactionId, 'status': amplify_core.enumToString(_status), 'userdetailID': _userdetailID, 'product': _product?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'orderProductId': _orderProductId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'orderDate': _orderDate,
    'transactionId': _transactionId,
    'status': _status,
    'userdetailID': _userdetailID,
    'product': _product,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'orderProductId': _orderProductId
  };

  static final amplify_core.QueryModelIdentifier<OrderModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OrderModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ORDERDATE = amplify_core.QueryField(fieldName: "orderDate");
  static final TRANSACTIONID = amplify_core.QueryField(fieldName: "transactionId");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final USERDETAILID = amplify_core.QueryField(fieldName: "userdetailID");
  static final PRODUCT = amplify_core.QueryField(
    fieldName: "product",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final ORDERPRODUCTID = amplify_core.QueryField(fieldName: "orderProductId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Order";
    modelSchemaDefinition.pluralName = "Orders";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userdetailID"], name: "byUserDetail")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Order.ORDERDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Order.TRANSACTIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Order.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Order.USERDETAILID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Order.PRODUCT,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Order.ORDERPRODUCTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _OrderModelType extends amplify_core.ModelType<Order> {
  const _OrderModelType();
  
  @override
  Order fromJson(Map<String, dynamic> jsonData) {
    return Order.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Order';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Order] in your schema.
 */
class OrderModelIdentifier implements amplify_core.ModelIdentifier<Order> {
  final String id;

  /** Create an instance of OrderModelIdentifier using [id] the primary key. */
  const OrderModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'OrderModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OrderModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}