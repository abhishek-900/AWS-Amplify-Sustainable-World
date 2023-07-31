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


/** This is an auto generated class representing the UserDetail type in your schema. */
class UserDetail extends amplify_core.Model {
  static const classType = const _UserDetailModelType();
  final String id;
  final List<Campaign>? _Campaigns;
  final List<Article>? _Articles;
  final String? _email;
  final List<Product>? _Products;
  final String? _profileImage;
  final String? _referralCode;
  final String? _companyName;
  final String? _companyAddress;
  final String? _companyRegistrationNumber;
  final String? _companyProfileImage;
  final UserType? _userType;
  final String? _contactNumber;
  final String? _firstName;
  final String? _lastName;
  final bool? _activated;
  final List<UserDetailProduct>? _SelectiveRecycler;
  final List<Order>? _Orders;
  final List<CampaignAttendees>? _campaignAttendees;
  final String? _address;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserDetailModelIdentifier get modelIdentifier {
      return UserDetailModelIdentifier(
        id: id
      );
  }
  
  List<Campaign>? get Campaigns {
    return _Campaigns;
  }
  
  List<Article>? get Articles {
    return _Articles;
  }
  
  String? get email {
    return _email;
  }
  
  List<Product>? get Products {
    return _Products;
  }
  
  String? get profileImage {
    return _profileImage;
  }
  
  String? get referralCode {
    return _referralCode;
  }
  
  String? get companyName {
    return _companyName;
  }
  
  String? get companyAddress {
    return _companyAddress;
  }
  
  String? get companyRegistrationNumber {
    return _companyRegistrationNumber;
  }
  
  String? get companyProfileImage {
    return _companyProfileImage;
  }
  
  UserType? get userType {
    return _userType;
  }
  
  String? get contactNumber {
    return _contactNumber;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  bool? get activated {
    return _activated;
  }
  
  List<UserDetailProduct>? get SelectiveRecycler {
    return _SelectiveRecycler;
  }
  
  List<Order>? get Orders {
    return _Orders;
  }
  
  List<CampaignAttendees>? get campaignAttendees {
    return _campaignAttendees;
  }
  
  String? get address {
    return _address;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserDetail._internal({required this.id, Campaigns, Articles, email, Products, profileImage, referralCode, companyName, companyAddress, companyRegistrationNumber, companyProfileImage, userType, contactNumber, firstName, lastName, activated, SelectiveRecycler, Orders, campaignAttendees, address, createdAt, updatedAt}): _Campaigns = Campaigns, _Articles = Articles, _email = email, _Products = Products, _profileImage = profileImage, _referralCode = referralCode, _companyName = companyName, _companyAddress = companyAddress, _companyRegistrationNumber = companyRegistrationNumber, _companyProfileImage = companyProfileImage, _userType = userType, _contactNumber = contactNumber, _firstName = firstName, _lastName = lastName, _activated = activated, _SelectiveRecycler = SelectiveRecycler, _Orders = Orders, _campaignAttendees = campaignAttendees, _address = address, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserDetail({String? id, List<Campaign>? Campaigns, List<Article>? Articles, String? email, List<Product>? Products, String? profileImage, String? referralCode, String? companyName, String? companyAddress, String? companyRegistrationNumber, String? companyProfileImage, UserType? userType, String? contactNumber, String? firstName, String? lastName, bool? activated, List<UserDetailProduct>? SelectiveRecycler, List<Order>? Orders, List<CampaignAttendees>? campaignAttendees, String? address}) {
    return UserDetail._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Campaigns: Campaigns != null ? List<Campaign>.unmodifiable(Campaigns) : Campaigns,
      Articles: Articles != null ? List<Article>.unmodifiable(Articles) : Articles,
      email: email,
      Products: Products != null ? List<Product>.unmodifiable(Products) : Products,
      profileImage: profileImage,
      referralCode: referralCode,
      companyName: companyName,
      companyAddress: companyAddress,
      companyRegistrationNumber: companyRegistrationNumber,
      companyProfileImage: companyProfileImage,
      userType: userType,
      contactNumber: contactNumber,
      firstName: firstName,
      lastName: lastName,
      activated: activated,
      SelectiveRecycler: SelectiveRecycler != null ? List<UserDetailProduct>.unmodifiable(SelectiveRecycler) : SelectiveRecycler,
      Orders: Orders != null ? List<Order>.unmodifiable(Orders) : Orders,
      campaignAttendees: campaignAttendees != null ? List<CampaignAttendees>.unmodifiable(campaignAttendees) : campaignAttendees,
      address: address);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetail &&
      id == other.id &&
      DeepCollectionEquality().equals(_Campaigns, other._Campaigns) &&
      DeepCollectionEquality().equals(_Articles, other._Articles) &&
      _email == other._email &&
      DeepCollectionEquality().equals(_Products, other._Products) &&
      _profileImage == other._profileImage &&
      _referralCode == other._referralCode &&
      _companyName == other._companyName &&
      _companyAddress == other._companyAddress &&
      _companyRegistrationNumber == other._companyRegistrationNumber &&
      _companyProfileImage == other._companyProfileImage &&
      _userType == other._userType &&
      _contactNumber == other._contactNumber &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _activated == other._activated &&
      DeepCollectionEquality().equals(_SelectiveRecycler, other._SelectiveRecycler) &&
      DeepCollectionEquality().equals(_Orders, other._Orders) &&
      DeepCollectionEquality().equals(_campaignAttendees, other._campaignAttendees) &&
      _address == other._address;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserDetail {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("profileImage=" + "$_profileImage" + ", ");
    buffer.write("referralCode=" + "$_referralCode" + ", ");
    buffer.write("companyName=" + "$_companyName" + ", ");
    buffer.write("companyAddress=" + "$_companyAddress" + ", ");
    buffer.write("companyRegistrationNumber=" + "$_companyRegistrationNumber" + ", ");
    buffer.write("companyProfileImage=" + "$_companyProfileImage" + ", ");
    buffer.write("userType=" + (_userType != null ? amplify_core.enumToString(_userType)! : "null") + ", ");
    buffer.write("contactNumber=" + "$_contactNumber" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("activated=" + (_activated != null ? _activated!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserDetail copyWith({List<Campaign>? Campaigns, List<Article>? Articles, String? email, List<Product>? Products, String? profileImage, String? referralCode, String? companyName, String? companyAddress, String? companyRegistrationNumber, String? companyProfileImage, UserType? userType, String? contactNumber, String? firstName, String? lastName, bool? activated, List<UserDetailProduct>? SelectiveRecycler, List<Order>? Orders, List<CampaignAttendees>? campaignAttendees, String? address}) {
    return UserDetail._internal(
      id: id,
      Campaigns: Campaigns ?? this.Campaigns,
      Articles: Articles ?? this.Articles,
      email: email ?? this.email,
      Products: Products ?? this.Products,
      profileImage: profileImage ?? this.profileImage,
      referralCode: referralCode ?? this.referralCode,
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
      companyRegistrationNumber: companyRegistrationNumber ?? this.companyRegistrationNumber,
      companyProfileImage: companyProfileImage ?? this.companyProfileImage,
      userType: userType ?? this.userType,
      contactNumber: contactNumber ?? this.contactNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      activated: activated ?? this.activated,
      SelectiveRecycler: SelectiveRecycler ?? this.SelectiveRecycler,
      Orders: Orders ?? this.Orders,
      campaignAttendees: campaignAttendees ?? this.campaignAttendees,
      address: address ?? this.address);
  }
  
  UserDetail copyWithModelFieldValues({
    ModelFieldValue<List<Campaign>?>? Campaigns,
    ModelFieldValue<List<Article>?>? Articles,
    ModelFieldValue<String?>? email,
    ModelFieldValue<List<Product>?>? Products,
    ModelFieldValue<String?>? profileImage,
    ModelFieldValue<String?>? referralCode,
    ModelFieldValue<String?>? companyName,
    ModelFieldValue<String?>? companyAddress,
    ModelFieldValue<String?>? companyRegistrationNumber,
    ModelFieldValue<String?>? companyProfileImage,
    ModelFieldValue<UserType?>? userType,
    ModelFieldValue<String?>? contactNumber,
    ModelFieldValue<String?>? firstName,
    ModelFieldValue<String?>? lastName,
    ModelFieldValue<bool?>? activated,
    ModelFieldValue<List<UserDetailProduct>?>? SelectiveRecycler,
    ModelFieldValue<List<Order>?>? Orders,
    ModelFieldValue<List<CampaignAttendees>?>? campaignAttendees,
    ModelFieldValue<String?>? address
  }) {
    return UserDetail._internal(
      id: id,
      Campaigns: Campaigns == null ? this.Campaigns : Campaigns.value,
      Articles: Articles == null ? this.Articles : Articles.value,
      email: email == null ? this.email : email.value,
      Products: Products == null ? this.Products : Products.value,
      profileImage: profileImage == null ? this.profileImage : profileImage.value,
      referralCode: referralCode == null ? this.referralCode : referralCode.value,
      companyName: companyName == null ? this.companyName : companyName.value,
      companyAddress: companyAddress == null ? this.companyAddress : companyAddress.value,
      companyRegistrationNumber: companyRegistrationNumber == null ? this.companyRegistrationNumber : companyRegistrationNumber.value,
      companyProfileImage: companyProfileImage == null ? this.companyProfileImage : companyProfileImage.value,
      userType: userType == null ? this.userType : userType.value,
      contactNumber: contactNumber == null ? this.contactNumber : contactNumber.value,
      firstName: firstName == null ? this.firstName : firstName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      activated: activated == null ? this.activated : activated.value,
      SelectiveRecycler: SelectiveRecycler == null ? this.SelectiveRecycler : SelectiveRecycler.value,
      Orders: Orders == null ? this.Orders : Orders.value,
      campaignAttendees: campaignAttendees == null ? this.campaignAttendees : campaignAttendees.value,
      address: address == null ? this.address : address.value
    );
  }
  
  UserDetail.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Campaigns = json['Campaigns'] is List
        ? (json['Campaigns'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Campaign.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Articles = json['Articles'] is List
        ? (json['Articles'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Article.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _email = json['email'],
      _Products = json['Products'] is List
        ? (json['Products'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Product.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _profileImage = json['profileImage'],
      _referralCode = json['referralCode'],
      _companyName = json['companyName'],
      _companyAddress = json['companyAddress'],
      _companyRegistrationNumber = json['companyRegistrationNumber'],
      _companyProfileImage = json['companyProfileImage'],
      _userType = amplify_core.enumFromString<UserType>(json['userType'], UserType.values),
      _contactNumber = json['contactNumber'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _activated = json['activated'],
      _SelectiveRecycler = json['SelectiveRecycler'] is List
        ? (json['SelectiveRecycler'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserDetailProduct.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Orders = json['Orders'] is List
        ? (json['Orders'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Order.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _campaignAttendees = json['campaignAttendees'] is List
        ? (json['campaignAttendees'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => CampaignAttendees.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _address = json['address'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Campaigns': _Campaigns?.map((Campaign? e) => e?.toJson()).toList(), 'Articles': _Articles?.map((Article? e) => e?.toJson()).toList(), 'email': _email, 'Products': _Products?.map((Product? e) => e?.toJson()).toList(), 'profileImage': _profileImage, 'referralCode': _referralCode, 'companyName': _companyName, 'companyAddress': _companyAddress, 'companyRegistrationNumber': _companyRegistrationNumber, 'companyProfileImage': _companyProfileImage, 'userType': amplify_core.enumToString(_userType), 'contactNumber': _contactNumber, 'firstName': _firstName, 'lastName': _lastName, 'activated': _activated, 'SelectiveRecycler': _SelectiveRecycler?.map((UserDetailProduct? e) => e?.toJson()).toList(), 'Orders': _Orders?.map((Order? e) => e?.toJson()).toList(), 'campaignAttendees': _campaignAttendees?.map((CampaignAttendees? e) => e?.toJson()).toList(), 'address': _address, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Campaigns': _Campaigns,
    'Articles': _Articles,
    'email': _email,
    'Products': _Products,
    'profileImage': _profileImage,
    'referralCode': _referralCode,
    'companyName': _companyName,
    'companyAddress': _companyAddress,
    'companyRegistrationNumber': _companyRegistrationNumber,
    'companyProfileImage': _companyProfileImage,
    'userType': _userType,
    'contactNumber': _contactNumber,
    'firstName': _firstName,
    'lastName': _lastName,
    'activated': _activated,
    'SelectiveRecycler': _SelectiveRecycler,
    'Orders': _Orders,
    'campaignAttendees': _campaignAttendees,
    'address': _address,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserDetailModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserDetailModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CAMPAIGNS = amplify_core.QueryField(
    fieldName: "Campaigns",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Campaign'));
  static final ARTICLES = amplify_core.QueryField(
    fieldName: "Articles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Article'));
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final PRODUCTS = amplify_core.QueryField(
    fieldName: "Products",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Product'));
  static final PROFILEIMAGE = amplify_core.QueryField(fieldName: "profileImage");
  static final REFERRALCODE = amplify_core.QueryField(fieldName: "referralCode");
  static final COMPANYNAME = amplify_core.QueryField(fieldName: "companyName");
  static final COMPANYADDRESS = amplify_core.QueryField(fieldName: "companyAddress");
  static final COMPANYREGISTRATIONNUMBER = amplify_core.QueryField(fieldName: "companyRegistrationNumber");
  static final COMPANYPROFILEIMAGE = amplify_core.QueryField(fieldName: "companyProfileImage");
  static final USERTYPE = amplify_core.QueryField(fieldName: "userType");
  static final CONTACTNUMBER = amplify_core.QueryField(fieldName: "contactNumber");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final ACTIVATED = amplify_core.QueryField(fieldName: "activated");
  static final SELECTIVERECYCLER = amplify_core.QueryField(
    fieldName: "SelectiveRecycler",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserDetailProduct'));
  static final ORDERS = amplify_core.QueryField(
    fieldName: "Orders",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Order'));
  static final CAMPAIGNATTENDEES = amplify_core.QueryField(
    fieldName: "campaignAttendees",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CampaignAttendees'));
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserDetail";
    modelSchemaDefinition.pluralName = "UserDetails";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.CAMPAIGNS,
      isRequired: false,
      ofModelName: 'Campaign',
      associatedKey: Campaign.USERDETAILID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.ARTICLES,
      isRequired: false,
      ofModelName: 'Article',
      associatedKey: Article.USERDETAILID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.PRODUCTS,
      isRequired: false,
      ofModelName: 'Product',
      associatedKey: Product.USERDETAILID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.PROFILEIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.REFERRALCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.COMPANYNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.COMPANYADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.COMPANYREGISTRATIONNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.COMPANYPROFILEIMAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.USERTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.CONTACTNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.FIRSTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.LASTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.ACTIVATED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.SELECTIVERECYCLER,
      isRequired: false,
      ofModelName: 'UserDetailProduct',
      associatedKey: UserDetailProduct.USERDETAIL
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.ORDERS,
      isRequired: false,
      ofModelName: 'Order',
      associatedKey: Order.USERDETAILID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: UserDetail.CAMPAIGNATTENDEES,
      isRequired: false,
      ofModelName: 'CampaignAttendees',
      associatedKey: CampaignAttendees.USERDETAILID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserDetail.ADDRESS,
      isRequired: false,
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

class _UserDetailModelType extends amplify_core.ModelType<UserDetail> {
  const _UserDetailModelType();
  
  @override
  UserDetail fromJson(Map<String, dynamic> jsonData) {
    return UserDetail.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserDetail';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserDetail] in your schema.
 */
class UserDetailModelIdentifier implements amplify_core.ModelIdentifier<UserDetail> {
  final String id;

  /** Create an instance of UserDetailModelIdentifier using [id] the primary key. */
  const UserDetailModelIdentifier({
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
  String toString() => 'UserDetailModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserDetailModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}