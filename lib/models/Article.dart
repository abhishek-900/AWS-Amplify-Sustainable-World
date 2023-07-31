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


/** This is an auto generated class representing the Article type in your schema. */
class Article extends amplify_core.Model {
  static const classType = const _ArticleModelType();
  final String id;
  final String? _title;
  final String? _decription;
  final amplify_core.TemporalDateTime? _uploadDate;
  final amplify_core.TemporalDateTime? _modifiedDate;
  final String? _imageUrl;
  final bool? _isVerified;
  final bool? _isRemoved;
  final String? _userdetailID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ArticleModelIdentifier get modelIdentifier {
      return ArticleModelIdentifier(
        id: id
      );
  }
  
  String? get title {
    return _title;
  }
  
  String? get decription {
    return _decription;
  }
  
  amplify_core.TemporalDateTime? get uploadDate {
    return _uploadDate;
  }
  
  amplify_core.TemporalDateTime? get modifiedDate {
    return _modifiedDate;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  bool? get isVerified {
    return _isVerified;
  }
  
  bool? get isRemoved {
    return _isRemoved;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Article._internal({required this.id, title, decription, uploadDate, modifiedDate, imageUrl, isVerified, isRemoved, required userdetailID, createdAt, updatedAt}): _title = title, _decription = decription, _uploadDate = uploadDate, _modifiedDate = modifiedDate, _imageUrl = imageUrl, _isVerified = isVerified, _isRemoved = isRemoved, _userdetailID = userdetailID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Article({String? id, String? title, String? decription, amplify_core.TemporalDateTime? uploadDate, amplify_core.TemporalDateTime? modifiedDate, String? imageUrl, bool? isVerified, bool? isRemoved, required String userdetailID}) {
    return Article._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      decription: decription,
      uploadDate: uploadDate,
      modifiedDate: modifiedDate,
      imageUrl: imageUrl,
      isVerified: isVerified,
      isRemoved: isRemoved,
      userdetailID: userdetailID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Article &&
      id == other.id &&
      _title == other._title &&
      _decription == other._decription &&
      _uploadDate == other._uploadDate &&
      _modifiedDate == other._modifiedDate &&
      _imageUrl == other._imageUrl &&
      _isVerified == other._isVerified &&
      _isRemoved == other._isRemoved &&
      _userdetailID == other._userdetailID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Article {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("decription=" + "$_decription" + ", ");
    buffer.write("uploadDate=" + (_uploadDate != null ? _uploadDate!.format() : "null") + ", ");
    buffer.write("modifiedDate=" + (_modifiedDate != null ? _modifiedDate!.format() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("isVerified=" + (_isVerified != null ? _isVerified!.toString() : "null") + ", ");
    buffer.write("isRemoved=" + (_isRemoved != null ? _isRemoved!.toString() : "null") + ", ");
    buffer.write("userdetailID=" + "$_userdetailID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Article copyWith({String? title, String? decription, amplify_core.TemporalDateTime? uploadDate, amplify_core.TemporalDateTime? modifiedDate, String? imageUrl, bool? isVerified, bool? isRemoved, String? userdetailID}) {
    return Article._internal(
      id: id,
      title: title ?? this.title,
      decription: decription ?? this.decription,
      uploadDate: uploadDate ?? this.uploadDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      imageUrl: imageUrl ?? this.imageUrl,
      isVerified: isVerified ?? this.isVerified,
      isRemoved: isRemoved ?? this.isRemoved,
      userdetailID: userdetailID ?? this.userdetailID);
  }
  
  Article copyWithModelFieldValues({
    ModelFieldValue<String?>? title,
    ModelFieldValue<String?>? decription,
    ModelFieldValue<amplify_core.TemporalDateTime?>? uploadDate,
    ModelFieldValue<amplify_core.TemporalDateTime?>? modifiedDate,
    ModelFieldValue<String?>? imageUrl,
    ModelFieldValue<bool?>? isVerified,
    ModelFieldValue<bool?>? isRemoved,
    ModelFieldValue<String>? userdetailID
  }) {
    return Article._internal(
      id: id,
      title: title == null ? this.title : title.value,
      decription: decription == null ? this.decription : decription.value,
      uploadDate: uploadDate == null ? this.uploadDate : uploadDate.value,
      modifiedDate: modifiedDate == null ? this.modifiedDate : modifiedDate.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      isVerified: isVerified == null ? this.isVerified : isVerified.value,
      isRemoved: isRemoved == null ? this.isRemoved : isRemoved.value,
      userdetailID: userdetailID == null ? this.userdetailID : userdetailID.value
    );
  }
  
  Article.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _decription = json['decription'],
      _uploadDate = json['uploadDate'] != null ? amplify_core.TemporalDateTime.fromString(json['uploadDate']) : null,
      _modifiedDate = json['modifiedDate'] != null ? amplify_core.TemporalDateTime.fromString(json['modifiedDate']) : null,
      _imageUrl = json['imageUrl'],
      _isVerified = json['isVerified'],
      _isRemoved = json['isRemoved'],
      _userdetailID = json['userdetailID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'decription': _decription, 'uploadDate': _uploadDate?.format(), 'modifiedDate': _modifiedDate?.format(), 'imageUrl': _imageUrl, 'isVerified': _isVerified, 'isRemoved': _isRemoved, 'userdetailID': _userdetailID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'decription': _decription,
    'uploadDate': _uploadDate,
    'modifiedDate': _modifiedDate,
    'imageUrl': _imageUrl,
    'isVerified': _isVerified,
    'isRemoved': _isRemoved,
    'userdetailID': _userdetailID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ArticleModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ArticleModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DECRIPTION = amplify_core.QueryField(fieldName: "decription");
  static final UPLOADDATE = amplify_core.QueryField(fieldName: "uploadDate");
  static final MODIFIEDDATE = amplify_core.QueryField(fieldName: "modifiedDate");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final ISVERIFIED = amplify_core.QueryField(fieldName: "isVerified");
  static final ISREMOVED = amplify_core.QueryField(fieldName: "isRemoved");
  static final USERDETAILID = amplify_core.QueryField(fieldName: "userdetailID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Article";
    modelSchemaDefinition.pluralName = "Articles";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
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
      key: Article.TITLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.DECRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.UPLOADDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.MODIFIEDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.ISVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.ISREMOVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Article.USERDETAILID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _ArticleModelType extends amplify_core.ModelType<Article> {
  const _ArticleModelType();
  
  @override
  Article fromJson(Map<String, dynamic> jsonData) {
    return Article.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Article';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Article] in your schema.
 */
class ArticleModelIdentifier implements amplify_core.ModelIdentifier<Article> {
  final String id;

  /** Create an instance of ArticleModelIdentifier using [id] the primary key. */
  const ArticleModelIdentifier({
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
  String toString() => 'ArticleModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ArticleModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}