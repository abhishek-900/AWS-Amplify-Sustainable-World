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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Product type in your schema. */
class Product extends amplify_core.Model {
  static const classType = const _ProductModelType();
  final String id;
  final String? _title;
  final String? _description;
  final ContributionType? _contributionType;
  final double? _amount;
  final Visibility? _visibility;
  final ProductStatus? _status;
  final double? _weight;
  final String? _productLocation;
  final List<String>? _producImages;
  final List<String>? _productTags;
  final String? _userdetailID;
  final String? _productcategoryID;
  final List<UserDetailProduct>? _userdetails;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductModelIdentifier get modelIdentifier {
      return ProductModelIdentifier(
        id: id
      );
  }
  
  String? get title {
    return _title;
  }
  
  String? get description {
    return _description;
  }
  
  ContributionType? get contributionType {
    return _contributionType;
  }
  
  double? get amount {
    return _amount;
  }
  
  Visibility? get visibility {
    return _visibility;
  }
  
  ProductStatus? get status {
    return _status;
  }
  
  double? get weight {
    return _weight;
  }
  
  String? get productLocation {
    return _productLocation;
  }
  
  List<String>? get producImages {
    return _producImages;
  }
  
  List<String>? get productTags {
    return _productTags;
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
  
  String get productcategoryID {
    try {
      return _productcategoryID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<UserDetailProduct>? get userdetails {
    return _userdetails;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Product._internal({required this.id, title, description, contributionType, amount, visibility, status, weight, productLocation, producImages, productTags, required userdetailID, required productcategoryID, userdetails, createdAt, updatedAt}): _title = title, _description = description, _contributionType = contributionType, _amount = amount, _visibility = visibility, _status = status, _weight = weight, _productLocation = productLocation, _producImages = producImages, _productTags = productTags, _userdetailID = userdetailID, _productcategoryID = productcategoryID, _userdetails = userdetails, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Product({String? id, String? title, String? description, ContributionType? contributionType, double? amount, Visibility? visibility, ProductStatus? status, double? weight, String? productLocation, List<String>? producImages, List<String>? productTags, required String userdetailID, required String productcategoryID, List<UserDetailProduct>? userdetails}) {
    return Product._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      contributionType: contributionType,
      amount: amount,
      visibility: visibility,
      status: status,
      weight: weight,
      productLocation: productLocation,
      producImages: producImages != null ? List<String>.unmodifiable(producImages) : producImages,
      productTags: productTags != null ? List<String>.unmodifiable(productTags) : productTags,
      userdetailID: userdetailID,
      productcategoryID: productcategoryID,
      userdetails: userdetails != null ? List<UserDetailProduct>.unmodifiable(userdetails) : userdetails);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _contributionType == other._contributionType &&
      _amount == other._amount &&
      _visibility == other._visibility &&
      _status == other._status &&
      _weight == other._weight &&
      _productLocation == other._productLocation &&
      DeepCollectionEquality().equals(_producImages, other._producImages) &&
      DeepCollectionEquality().equals(_productTags, other._productTags) &&
      _userdetailID == other._userdetailID &&
      _productcategoryID == other._productcategoryID &&
      DeepCollectionEquality().equals(_userdetails, other._userdetails);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Product {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("contributionType=" + (_contributionType != null ? amplify_core.enumToString(_contributionType)! : "null") + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("visibility=" + (_visibility != null ? amplify_core.enumToString(_visibility)! : "null") + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("productLocation=" + "$_productLocation" + ", ");
    buffer.write("producImages=" + (_producImages != null ? _producImages!.toString() : "null") + ", ");
    buffer.write("productTags=" + (_productTags != null ? _productTags!.toString() : "null") + ", ");
    buffer.write("userdetailID=" + "$_userdetailID" + ", ");
    buffer.write("productcategoryID=" + "$_productcategoryID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Product copyWith({String? title, String? description, ContributionType? contributionType, double? amount, Visibility? visibility, ProductStatus? status, double? weight, String? productLocation, List<String>? producImages, List<String>? productTags, String? userdetailID, String? productcategoryID, List<UserDetailProduct>? userdetails}) {
    return Product._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      contributionType: contributionType ?? this.contributionType,
      amount: amount ?? this.amount,
      visibility: visibility ?? this.visibility,
      status: status ?? this.status,
      weight: weight ?? this.weight,
      productLocation: productLocation ?? this.productLocation,
      producImages: producImages ?? this.producImages,
      productTags: productTags ?? this.productTags,
      userdetailID: userdetailID ?? this.userdetailID,
      productcategoryID: productcategoryID ?? this.productcategoryID,
      userdetails: userdetails ?? this.userdetails);
  }
  
  Product copyWithModelFieldValues({
    ModelFieldValue<String?>? title,
    ModelFieldValue<String?>? description,
    ModelFieldValue<ContributionType?>? contributionType,
    ModelFieldValue<double?>? amount,
    ModelFieldValue<Visibility?>? visibility,
    ModelFieldValue<ProductStatus?>? status,
    ModelFieldValue<double?>? weight,
    ModelFieldValue<String?>? productLocation,
    ModelFieldValue<List<String>?>? producImages,
    ModelFieldValue<List<String>?>? productTags,
    ModelFieldValue<String>? userdetailID,
    ModelFieldValue<String>? productcategoryID,
    ModelFieldValue<List<UserDetailProduct>?>? userdetails
  }) {
    return Product._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      contributionType: contributionType == null ? this.contributionType : contributionType.value,
      amount: amount == null ? this.amount : amount.value,
      visibility: visibility == null ? this.visibility : visibility.value,
      status: status == null ? this.status : status.value,
      weight: weight == null ? this.weight : weight.value,
      productLocation: productLocation == null ? this.productLocation : productLocation.value,
      producImages: producImages == null ? this.producImages : producImages.value,
      productTags: productTags == null ? this.productTags : productTags.value,
      userdetailID: userdetailID == null ? this.userdetailID : userdetailID.value,
      productcategoryID: productcategoryID == null ? this.productcategoryID : productcategoryID.value,
      userdetails: userdetails == null ? this.userdetails : userdetails.value
    );
  }
  
  Product.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _contributionType = amplify_core.enumFromString<ContributionType>(json['contributionType'], ContributionType.values),
      _amount = (json['amount'] as num?)?.toDouble(),
      _visibility = amplify_core.enumFromString<Visibility>(json['visibility'], Visibility.values),
      _status = amplify_core.enumFromString<ProductStatus>(json['status'], ProductStatus.values),
      _weight = (json['weight'] as num?)?.toDouble(),
      _productLocation = json['productLocation'],
      _producImages = json['producImages']?.cast<String>(),
      _productTags = json['productTags']?.cast<String>(),
      _userdetailID = json['userdetailID'],
      _productcategoryID = json['productcategoryID'],
      _userdetails = json['userdetails'] is List
        ? (json['userdetails'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserDetailProduct.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'contributionType': amplify_core.enumToString(_contributionType), 'amount': _amount, 'visibility': amplify_core.enumToString(_visibility), 'status': amplify_core.enumToString(_status), 'weight': _weight, 'productLocation': _productLocation, 'producImages': _producImages, 'productTags': _productTags, 'userdetailID': _userdetailID, 'productcategoryID': _productcategoryID, 'userdetails': _userdetails?.map((UserDetailProduct? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'contributionType': _contributionType,
    'amount': _amount,
    'visibility': _visibility,
    'status': _status,
    'weight': _weight,
    'productLocation': _productLocation,
    'producImages': _producImages,
    'productTags': _productTags,
    'userdetailID': _userdetailID,
    'productcategoryID': _productcategoryID,
    'userdetails': _userdetails,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProductModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProductModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final CONTRIBUTIONTYPE = amplify_core.QueryField(fieldName: "contributionType");
  static final AMOUNT = amplify_core.QueryField(fieldName: "amount");
  static final VISIBILITY = amplify_core.QueryField(fieldName: "visibility");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static final PRODUCTLOCATION = amplify_core.QueryField(fieldName: "productLocation");
  static final PRODUCIMAGES = amplify_core.QueryField(fieldName: "producImages");
  static final PRODUCTTAGS = amplify_core.QueryField(fieldName: "productTags");
  static final USERDETAILID = amplify_core.QueryField(fieldName: "userdetailID");
  static final PRODUCTCATEGORYID = amplify_core.QueryField(fieldName: "productcategoryID");
  static final USERDETAILS = amplify_core.QueryField(
    fieldName: "userdetails",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserDetailProduct'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Product";
    modelSchemaDefinition.pluralName = "Products";
    
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
      amplify_core.ModelIndex(fields: const ["userdetailID"], name: "byUserDetail"),
      amplify_core.ModelIndex(fields: const ["productcategoryID"], name: "byProductCategory")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.TITLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.CONTRIBUTIONTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.AMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.VISIBILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.WEIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.PRODUCTLOCATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.PRODUCIMAGES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.PRODUCTTAGS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.USERDETAILID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Product.PRODUCTCATEGORYID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Product.USERDETAILS,
      isRequired: false,
      ofModelName: 'UserDetailProduct',
      associatedKey: UserDetailProduct.PRODUCT
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
  });
}

class _ProductModelType extends amplify_core.ModelType<Product> {
  const _ProductModelType();
  
  @override
  Product fromJson(Map<String, dynamic> jsonData) {
    return Product.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Product';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Product] in your schema.
 */
class ProductModelIdentifier implements amplify_core.ModelIdentifier<Product> {
  final String id;

  /** Create an instance of ProductModelIdentifier using [id] the primary key. */
  const ProductModelIdentifier({
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
  String toString() => 'ProductModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}