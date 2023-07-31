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


/** This is an auto generated class representing the CampaignAttendees type in your schema. */
class CampaignAttendees extends amplify_core.Model {
  static const classType = const _CampaignAttendeesModelType();
  final String id;
  final AttendeesStatus? _status;
  final String? _userdetailID;
  final String? _campaignID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CampaignAttendeesModelIdentifier get modelIdentifier {
      return CampaignAttendeesModelIdentifier(
        id: id
      );
  }
  
  AttendeesStatus? get status {
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
  
  String get campaignID {
    try {
      return _campaignID!;
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
  
  const CampaignAttendees._internal({required this.id, status, required userdetailID, required campaignID, createdAt, updatedAt}): _status = status, _userdetailID = userdetailID, _campaignID = campaignID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CampaignAttendees({String? id, AttendeesStatus? status, required String userdetailID, required String campaignID}) {
    return CampaignAttendees._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      status: status,
      userdetailID: userdetailID,
      campaignID: campaignID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CampaignAttendees &&
      id == other.id &&
      _status == other._status &&
      _userdetailID == other._userdetailID &&
      _campaignID == other._campaignID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CampaignAttendees {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("userdetailID=" + "$_userdetailID" + ", ");
    buffer.write("campaignID=" + "$_campaignID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CampaignAttendees copyWith({AttendeesStatus? status, String? userdetailID, String? campaignID}) {
    return CampaignAttendees._internal(
      id: id,
      status: status ?? this.status,
      userdetailID: userdetailID ?? this.userdetailID,
      campaignID: campaignID ?? this.campaignID);
  }
  
  CampaignAttendees copyWithModelFieldValues({
    ModelFieldValue<AttendeesStatus?>? status,
    ModelFieldValue<String>? userdetailID,
    ModelFieldValue<String>? campaignID
  }) {
    return CampaignAttendees._internal(
      id: id,
      status: status == null ? this.status : status.value,
      userdetailID: userdetailID == null ? this.userdetailID : userdetailID.value,
      campaignID: campaignID == null ? this.campaignID : campaignID.value
    );
  }
  
  CampaignAttendees.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _status = amplify_core.enumFromString<AttendeesStatus>(json['status'], AttendeesStatus.values),
      _userdetailID = json['userdetailID'],
      _campaignID = json['campaignID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'status': amplify_core.enumToString(_status), 'userdetailID': _userdetailID, 'campaignID': _campaignID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'status': _status,
    'userdetailID': _userdetailID,
    'campaignID': _campaignID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CampaignAttendeesModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CampaignAttendeesModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final USERDETAILID = amplify_core.QueryField(fieldName: "userdetailID");
  static final CAMPAIGNID = amplify_core.QueryField(fieldName: "campaignID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CampaignAttendees";
    modelSchemaDefinition.pluralName = "CampaignAttendees";
    
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
      amplify_core.ModelIndex(fields: const ["campaignID"], name: "byCampaign")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CampaignAttendees.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CampaignAttendees.USERDETAILID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CampaignAttendees.CAMPAIGNID,
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

class _CampaignAttendeesModelType extends amplify_core.ModelType<CampaignAttendees> {
  const _CampaignAttendeesModelType();
  
  @override
  CampaignAttendees fromJson(Map<String, dynamic> jsonData) {
    return CampaignAttendees.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CampaignAttendees';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [CampaignAttendees] in your schema.
 */
class CampaignAttendeesModelIdentifier implements amplify_core.ModelIdentifier<CampaignAttendees> {
  final String id;

  /** Create an instance of CampaignAttendeesModelIdentifier using [id] the primary key. */
  const CampaignAttendeesModelIdentifier({
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
  String toString() => 'CampaignAttendeesModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CampaignAttendeesModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}