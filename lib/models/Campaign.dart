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


/** This is an auto generated class representing the Campaign type in your schema. */
class Campaign extends amplify_core.Model {
  static const classType = const _CampaignModelType();
  final String id;
  final String? _title;
  final String? _description;
  final amplify_core.TemporalDateTime? _startDate;
  final amplify_core.TemporalDateTime? _endDate;
  final String? _imageUrl;
  final CampaignStatus? _status;
  final int? _priority;
  final bool? _isVerified;
  final amplify_core.TemporalDateTime? _previewDate;
  final String? _longitude;
  final String? _latitude;
  final String? _address;
  final EventType? _eventType;
  final int? _attendeesCount;
  final bool? _currentUserAttending;
  final String? _userdetailID;
  final List<CampaignAttendees>? _campaignAttendees;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  CampaignModelIdentifier get modelIdentifier {
      return CampaignModelIdentifier(
        id: id
      );
  }
  
  String? get title {
    return _title;
  }
  
  String? get description {
    return _description;
  }
  
  amplify_core.TemporalDateTime? get startDate {
    return _startDate;
  }
  
  amplify_core.TemporalDateTime? get endDate {
    return _endDate;
  }
  
  String? get imageUrl {
    return _imageUrl;
  }
  
  CampaignStatus? get status {
    return _status;
  }
  
  int? get priority {
    return _priority;
  }
  
  bool? get isVerified {
    return _isVerified;
  }
  
  amplify_core.TemporalDateTime? get previewDate {
    return _previewDate;
  }
  
  String? get longitude {
    return _longitude;
  }
  
  String? get latitude {
    return _latitude;
  }
  
  String? get address {
    return _address;
  }
  
  EventType? get eventType {
    return _eventType;
  }
  
  int? get attendeesCount {
    return _attendeesCount;
  }
  
  bool? get currentUserAttending {
    return _currentUserAttending;
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
  
  List<CampaignAttendees>? get campaignAttendees {
    return _campaignAttendees;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Campaign._internal({required this.id, title, description, startDate, endDate, imageUrl, status, priority, isVerified, previewDate, longitude, latitude, address, eventType, attendeesCount, currentUserAttending, required userdetailID, campaignAttendees, createdAt, updatedAt}): _title = title, _description = description, _startDate = startDate, _endDate = endDate, _imageUrl = imageUrl, _status = status, _priority = priority, _isVerified = isVerified, _previewDate = previewDate, _longitude = longitude, _latitude = latitude, _address = address, _eventType = eventType, _attendeesCount = attendeesCount, _currentUserAttending = currentUserAttending, _userdetailID = userdetailID, _campaignAttendees = campaignAttendees, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Campaign({String? id, String? title, String? description, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? imageUrl, CampaignStatus? status, int? priority, bool? isVerified, amplify_core.TemporalDateTime? previewDate, String? longitude, String? latitude, String? address, EventType? eventType, int? attendeesCount, bool? currentUserAttending, required String userdetailID, List<CampaignAttendees>? campaignAttendees}) {
    return Campaign._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      imageUrl: imageUrl,
      status: status,
      priority: priority,
      isVerified: isVerified,
      previewDate: previewDate,
      longitude: longitude,
      latitude: latitude,
      address: address,
      eventType: eventType,
      attendeesCount: attendeesCount,
      currentUserAttending: currentUserAttending,
      userdetailID: userdetailID,
      campaignAttendees: campaignAttendees != null ? List<CampaignAttendees>.unmodifiable(campaignAttendees) : campaignAttendees);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Campaign &&
      id == other.id &&
      _title == other._title &&
      _description == other._description &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _imageUrl == other._imageUrl &&
      _status == other._status &&
      _priority == other._priority &&
      _isVerified == other._isVerified &&
      _previewDate == other._previewDate &&
      _longitude == other._longitude &&
      _latitude == other._latitude &&
      _address == other._address &&
      _eventType == other._eventType &&
      _attendeesCount == other._attendeesCount &&
      _currentUserAttending == other._currentUserAttending &&
      _userdetailID == other._userdetailID &&
      DeepCollectionEquality().equals(_campaignAttendees, other._campaignAttendees);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Campaign {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("priority=" + (_priority != null ? _priority!.toString() : "null") + ", ");
    buffer.write("isVerified=" + (_isVerified != null ? _isVerified!.toString() : "null") + ", ");
    buffer.write("previewDate=" + (_previewDate != null ? _previewDate!.format() : "null") + ", ");
    buffer.write("longitude=" + "$_longitude" + ", ");
    buffer.write("latitude=" + "$_latitude" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("eventType=" + (_eventType != null ? amplify_core.enumToString(_eventType)! : "null") + ", ");
    buffer.write("attendeesCount=" + (_attendeesCount != null ? _attendeesCount!.toString() : "null") + ", ");
    buffer.write("currentUserAttending=" + (_currentUserAttending != null ? _currentUserAttending!.toString() : "null") + ", ");
    buffer.write("userdetailID=" + "$_userdetailID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Campaign copyWith({String? title, String? description, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? imageUrl, CampaignStatus? status, int? priority, bool? isVerified, amplify_core.TemporalDateTime? previewDate, String? longitude, String? latitude, String? address, EventType? eventType, int? attendeesCount, bool? currentUserAttending, String? userdetailID, List<CampaignAttendees>? campaignAttendees}) {
    return Campaign._internal(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      isVerified: isVerified ?? this.isVerified,
      previewDate: previewDate ?? this.previewDate,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      address: address ?? this.address,
      eventType: eventType ?? this.eventType,
      attendeesCount: attendeesCount ?? this.attendeesCount,
      currentUserAttending: currentUserAttending ?? this.currentUserAttending,
      userdetailID: userdetailID ?? this.userdetailID,
      campaignAttendees: campaignAttendees ?? this.campaignAttendees);
  }
  
  Campaign copyWithModelFieldValues({
    ModelFieldValue<String?>? title,
    ModelFieldValue<String?>? description,
    ModelFieldValue<amplify_core.TemporalDateTime?>? startDate,
    ModelFieldValue<amplify_core.TemporalDateTime?>? endDate,
    ModelFieldValue<String?>? imageUrl,
    ModelFieldValue<CampaignStatus?>? status,
    ModelFieldValue<int?>? priority,
    ModelFieldValue<bool?>? isVerified,
    ModelFieldValue<amplify_core.TemporalDateTime?>? previewDate,
    ModelFieldValue<String?>? longitude,
    ModelFieldValue<String?>? latitude,
    ModelFieldValue<String?>? address,
    ModelFieldValue<EventType?>? eventType,
    ModelFieldValue<int?>? attendeesCount,
    ModelFieldValue<bool?>? currentUserAttending,
    ModelFieldValue<String>? userdetailID,
    ModelFieldValue<List<CampaignAttendees>?>? campaignAttendees
  }) {
    return Campaign._internal(
      id: id,
      title: title == null ? this.title : title.value,
      description: description == null ? this.description : description.value,
      startDate: startDate == null ? this.startDate : startDate.value,
      endDate: endDate == null ? this.endDate : endDate.value,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      status: status == null ? this.status : status.value,
      priority: priority == null ? this.priority : priority.value,
      isVerified: isVerified == null ? this.isVerified : isVerified.value,
      previewDate: previewDate == null ? this.previewDate : previewDate.value,
      longitude: longitude == null ? this.longitude : longitude.value,
      latitude: latitude == null ? this.latitude : latitude.value,
      address: address == null ? this.address : address.value,
      eventType: eventType == null ? this.eventType : eventType.value,
      attendeesCount: attendeesCount == null ? this.attendeesCount : attendeesCount.value,
      currentUserAttending: currentUserAttending == null ? this.currentUserAttending : currentUserAttending.value,
      userdetailID: userdetailID == null ? this.userdetailID : userdetailID.value,
      campaignAttendees: campaignAttendees == null ? this.campaignAttendees : campaignAttendees.value
    );
  }
  
  Campaign.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _description = json['description'],
      _startDate = json['startDate'] != null ? amplify_core.TemporalDateTime.fromString(json['startDate']) : null,
      _endDate = json['endDate'] != null ? amplify_core.TemporalDateTime.fromString(json['endDate']) : null,
      _imageUrl = json['imageUrl'],
      _status = amplify_core.enumFromString<CampaignStatus>(json['status'], CampaignStatus.values),
      _priority = (json['priority'] as num?)?.toInt(),
      _isVerified = json['isVerified'],
      _previewDate = json['previewDate'] != null ? amplify_core.TemporalDateTime.fromString(json['previewDate']) : null,
      _longitude = json['longitude'],
      _latitude = json['latitude'],
      _address = json['address'],
      _eventType = amplify_core.enumFromString<EventType>(json['eventType'], EventType.values),
      _attendeesCount = (json['attendeesCount'] as num?)?.toInt(),
      _currentUserAttending = json['currentUserAttending'],
      _userdetailID = json['userdetailID'],
      _campaignAttendees = json['campaignAttendees'] is List
        ? (json['campaignAttendees'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CampaignAttendees.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'description': _description, 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'imageUrl': _imageUrl, 'status': amplify_core.enumToString(_status), 'priority': _priority, 'isVerified': _isVerified, 'previewDate': _previewDate?.format(), 'longitude': _longitude, 'latitude': _latitude, 'address': _address, 'eventType': amplify_core.enumToString(_eventType), 'attendeesCount': _attendeesCount, 'currentUserAttending': _currentUserAttending, 'userdetailID': _userdetailID, 'campaignAttendees': _campaignAttendees?.map((CampaignAttendees? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'description': _description,
    'startDate': _startDate,
    'endDate': _endDate,
    'imageUrl': _imageUrl,
    'status': _status,
    'priority': _priority,
    'isVerified': _isVerified,
    'previewDate': _previewDate,
    'longitude': _longitude,
    'latitude': _latitude,
    'address': _address,
    'eventType': _eventType,
    'attendeesCount': _attendeesCount,
    'currentUserAttending': _currentUserAttending,
    'userdetailID': _userdetailID,
    'campaignAttendees': _campaignAttendees,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<CampaignModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<CampaignModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final STARTDATE = amplify_core.QueryField(fieldName: "startDate");
  static final ENDDATE = amplify_core.QueryField(fieldName: "endDate");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final PRIORITY = amplify_core.QueryField(fieldName: "priority");
  static final ISVERIFIED = amplify_core.QueryField(fieldName: "isVerified");
  static final PREVIEWDATE = amplify_core.QueryField(fieldName: "previewDate");
  static final LONGITUDE = amplify_core.QueryField(fieldName: "longitude");
  static final LATITUDE = amplify_core.QueryField(fieldName: "latitude");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final EVENTTYPE = amplify_core.QueryField(fieldName: "eventType");
  static final ATTENDEESCOUNT = amplify_core.QueryField(fieldName: "attendeesCount");
  static final CURRENTUSERATTENDING = amplify_core.QueryField(fieldName: "currentUserAttending");
  static final USERDETAILID = amplify_core.QueryField(fieldName: "userdetailID");
  static final CAMPAIGNATTENDEES = amplify_core.QueryField(
    fieldName: "campaignAttendees",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CampaignAttendees'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Campaign";
    modelSchemaDefinition.pluralName = "Campaigns";
    
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
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
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
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["userdetailID"], name: "byUserDetail")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.TITLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.STARTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.STATUS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.PRIORITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.ISVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.PREVIEWDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.LONGITUDE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.LATITUDE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.EVENTTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.ATTENDEESCOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.CURRENTUSERATTENDING,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Campaign.USERDETAILID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Campaign.CAMPAIGNATTENDEES,
      isRequired: false,
      ofModelName: 'CampaignAttendees',
      associatedKey: CampaignAttendees.CAMPAIGNID
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

class _CampaignModelType extends amplify_core.ModelType<Campaign> {
  const _CampaignModelType();
  
  @override
  Campaign fromJson(Map<String, dynamic> jsonData) {
    return Campaign.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Campaign';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Campaign] in your schema.
 */
class CampaignModelIdentifier implements amplify_core.ModelIdentifier<Campaign> {
  final String id;

  /** Create an instance of CampaignModelIdentifier using [id] the primary key. */
  const CampaignModelIdentifier({
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
  String toString() => 'CampaignModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is CampaignModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}