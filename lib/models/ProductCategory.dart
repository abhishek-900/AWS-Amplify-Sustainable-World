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


/** This is an auto generated class representing the ProductCategory type in your schema. */
class ProductCategory extends amplify_core.Model {
  static const classType = const _ProductCategoryModelType();
  final String id;
  final String? _title;
  final String? _description;
  final String? _imageUrl;
  final bool? _isActive;
  final int? _priority;
  final List<Product>? _Products;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductCategoryModelIdentifier get modelIdentifier {
      return ProductCategoryModelIdentifier(
        id: id
      );
  }
  
  String? get title {
    return _title;
  }
  
  String? get description {
    return _description;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  bool? get isActive {
    return _isActive;
  }
  
  int? get priority {
    return _priority;
  }
  
  List<Product>? get Products {
    return _Products;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProductCategory._internal({required this.id, title, description, imageUrl, isActive, priority, Products, createdAt, updatedAt}): _title = title, _description = description, _imageUrl = imageUrl, _isActive = isActive, _priority = priority, _Products = Products, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProductCategory({String? id, String? title, String? description, String? imageUrl, bool? isActive, int? priority, List<Product>? Products}) {
    return ProductCategory._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      isActive: isActive,
      priority: priority,
      Products: Products != null ? List<Product>.unmodifiable(Products) : Products);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductCategory &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _imageUrl == other._imageUrl &&
      _isActive == other._isActive &&
      _priority == other._priority &&
      DeepCollectionEquality().equals(_Products, other._Products);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductCategory copyWith({String? title, String? description, String? imageUrl, bool? isActive, int? priority, List<Product>? Products}) {
    return ProductCategory._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
      priority: priority ?? this.priority,
      Products: Products ?? this.Products);
  }
  
  ProductCategory copyWithModelFieldValues({
    ModelFieldValue<String?>? title,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? imageUrl,
    ModelFieldValue<bool?>? isActive,
    ModelFieldValue<int?>? priority,
    ModelFieldValue<List<Product>?>? Products
  }) {
    return ProductCategory._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      isActive: isActive == null ? this.isActive : isActive.value,
      priority: priority == null ? this.priority : priority.value,
      Products: Products == null ? this.Products : Products.value
    );
  }
  
  ProductCategory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _imageUrl = json['imageUrl'],
      _isActive = json['isActive'],
      _priority = (json['priority'] as num?)?.toInt(),
      _Products = json['Products'] is List
        ? (json['Products'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Product.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'imageUrl': _imageUrl, 'isActive': _isActive, 'priority': _priority, 'Products': _Products?.map((Product? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'imageUrl': _imageUrl,
    'isActive': _isActive,
    'priority': _priority,
    'Products': _Products,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProductCategoryModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProductCategoryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final ISACTIVE = amplify_core.QueryField(fieldName: "isActive");
  static final PRIORITY = amplify_core.QueryField(fieldName: "priority");
  static final PRODUCTS = amplify_core.QueryField(
    fieldName: "Products",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductCategory";
    modelSchemaDefinition.pluralName = "ProductCategories";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductCategory.TITLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductCategory.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductCategory.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductCategory.ISACTIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductCategory.PRIORITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: ProductCategory.PRODUCTS,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.PRODUCTCATEGORYID
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

class _ProductCategoryModelType extends amplify_core.ModelType<ProductCategory> {
  const _ProductCategoryModelType();
  
  @override
  ProductCategory fromJson(Map<String, dynamic> jsonData) {
    return ProductCategory.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductCategory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductCategory] in your schema.
 */
class ProductCategoryModelIdentifier implements amplify_core.ModelIdentifier<ProductCategory> {
  final String id;

  /** Create an instance of ProductCategoryModelIdentifier using [id] the primary key. */
  const ProductCategoryModelIdentifier({
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
  String toString() => 'ProductCategoryModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductCategoryModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}