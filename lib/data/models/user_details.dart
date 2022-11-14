class UserDetailModel {
  int? errorCode;
  Msg? msg;

  UserDetailModel({this.errorCode, this.msg});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    msg = json['msg'] != null ? Msg.fromJson(json['msg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    if (msg != null) {
      data['msg'] = msg?.toJson();
    }
    return data;
  }
}

class Msg {
  String? id;
  String? name;
  String? mobile;
  String? role;
  String? email;
  String? userName;
  String? password;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? dob;
  String? family;
  String? panNo;
  String? bankName;
  String? accountNo;
  String? uccCode;
  String? familyGroupName;
  String? aOF;
  String? nACHMandate;
  String? nACH;
  String? faxRes;
  String? uRNBillerMandate;
  String? gender;
  String? placeOfBirth;
  String? fatherName;
  String? motherName;
  String? guardianName;
  String? guardianPanNo;
  String? tel1Off;
  String? faxOff;
  String? taxResident;
  String? taxIdNo;
  String? address2;
  String? address3;
  String? nriPincode;
  String? country;
  String? nriCity;
  String? nriPhoneNo;
  String? nriCountry;
  String? bankAccountType;
  String? bankBranch;
  String? bankMicrCode;
  String? bankIfscCode;
  String? bankAddress;
  String? bankPincode;
  String? bankCity;
  String? bankState;
  String? bankCountry;
  String? fATCATaxResident;
  String? fATCAPoliticalExposure;
  String? fATCAIdentificationType;
  String? fATCAOccupation;
  String? fATCAGrossAnnualIncome;
  String? bSEUCCCode;
  String? nACHMandateXSIP;
  String? uRNBillerMandateISIP;
  String? nomineeName;
  String? nomineeDOB;
  String? nomineePanNo;
  String? nomineeAccountHolder;
  String? nomineeGuardianName;
  String? nomineeAddress;
  String? nomineePincode;
  String? nomineeCity;
  String? nomineeState;
  String? nomineeCountry;

  Msg(
      {this.id,
        this.name,
        this.mobile,
        this.role,
        this.email,
        this.userName,
        this.password,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.dob,
        this.family,
        this.panNo,
        this.bankName,
        this.accountNo,
        this.uccCode,
        this.familyGroupName,
        this.aOF,
        this.nACHMandate,
        this.nACH,
        this.faxRes,
        this.uRNBillerMandate,
        this.gender,
        this.placeOfBirth,
        this.fatherName,
        this.motherName,
        this.guardianName,
        this.guardianPanNo,
        this.tel1Off,
        this.faxOff,
        this.taxResident,
        this.taxIdNo,
        this.address2,
        this.address3,
        this.nriPincode,
        this.country,
        this.nriCity,
        this.nriPhoneNo,
        this.nriCountry,
        this.bankAccountType,
        this.bankBranch,
        this.bankMicrCode,
        this.bankIfscCode,
        this.bankAddress,
        this.bankPincode,
        this.bankCity,
        this.bankState,
        this.bankCountry,
        this.fATCATaxResident,
        this.fATCAPoliticalExposure,
        this.fATCAIdentificationType,
        this.fATCAOccupation,
        this.fATCAGrossAnnualIncome,
        this.bSEUCCCode,
        this.nACHMandateXSIP,
        this.uRNBillerMandateISIP,
        this.nomineeName,
        this.nomineeDOB,
        this.nomineePanNo,
        this.nomineeAccountHolder,
        this.nomineeGuardianName,
        this.nomineeAddress,
        this.nomineePincode,
        this.nomineeCity,
        this.nomineeState,
        this.nomineeCountry});

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    role = json['role'];
    email = json['email'];
    userName = json['user_name'];
    password = json['password'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    dob = json['dob'];
    family = json['family'];
    panNo = json['pan_no'];
    bankName = json['bank_name'];
    accountNo = json['account_no'];
    uccCode = json['ucc_code'];
    familyGroupName = json['family_group_name'];
    aOF = json['AOF'];
    nACHMandate = json['NACH_Mandate'];
    nACH = json['NACH'];
    faxRes = json['fax_res'];
    uRNBillerMandate = json['URN_Biller_Mandate'];
    gender = json['Gender'];
    placeOfBirth = json['place_of_birth'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    guardianName = json['guardian_name'];
    guardianPanNo = json['guardian_pan_no'];
    tel1Off = json['tel1_off'];
    faxOff = json['fax_off'];
    taxResident = json['tax_resident'];
    taxIdNo = json['tax_id_no'];
    address2 = json['address2'];
    address3 = json['address3'];
    nriPincode = json['nri_pincode'];
    country = json['country'];
    nriCity = json['nri_city'];
    nriPhoneNo = json['nri_phone_no'];
    nriCountry = json['nri_country'];
    bankAccountType = json['bank_account_type'];
    bankBranch = json['bank_branch'];
    bankMicrCode = json['bank_micr_code'];
    bankIfscCode = json['bank_ifsc_code'];
    bankAddress = json['bank_address'];
    bankPincode = json['bank_pincode'];
    bankCity = json['bank_city'];
    bankState = json['bank_state'];
    bankCountry = json['bank_country'];
    fATCATaxResident = json['FATCA_tax_resident'];
    fATCAPoliticalExposure = json['FATCA_political_exposure'];
    fATCAIdentificationType = json['FATCA_identification_type'];
    fATCAOccupation = json['FATCA_occupation'];
    fATCAGrossAnnualIncome = json['FATCA_gross_annual_income'];
    bSEUCCCode = json['BSE_UCC_Code'];
    nACHMandateXSIP = json['NACH_Mandate_xSIP'];
    uRNBillerMandateISIP = json['URN_Biller_Mandate_iSIP'];
    nomineeName = json['Nominee_name'];
    nomineeDOB = json['Nominee_DOB'];
    nomineePanNo = json['Nominee_pan_no'];
    nomineeAccountHolder = json['Nominee_account_holder'];
    nomineeGuardianName = json['Nominee_guardian_name'];
    nomineeAddress = json['Nominee_address'];
    nomineePincode = json['Nominee_pincode'];
    nomineeCity = json['Nominee_city'];
    nomineeState = json['Nominee_state'];
    nomineeCountry = json['Nominee_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['role'] = role;
    data['email'] = email;
    data['user_name'] = userName;
    data['password'] = password;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['dob'] = dob;
    data['family'] = family;
    data['pan_no'] = panNo;
    data['bank_name'] = bankName;
    data['account_no'] = accountNo;
    data['ucc_code'] = uccCode;
    data['family_group_name'] = familyGroupName;
    data['AOF'] = aOF;
    data['NACH_Mandate'] = nACHMandate;
    data['NACH'] = nACH;
    data['fax_res'] = faxRes;
    data['URN_Biller_Mandate'] = uRNBillerMandate;
    data['Gender'] = gender;
    data['place_of_birth'] = placeOfBirth;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['guardian_name'] = guardianName;
    data['guardian_pan_no'] = guardianPanNo;
    data['tel1_off'] = tel1Off;
    data['fax_off'] = faxOff;
    data['tax_resident'] = taxResident;
    data['tax_id_no'] = taxIdNo;
    data['address2'] = address2;
    data['address3'] = address3;
    data['nri_pincode'] = nriPincode;
    data['country'] = country;
    data['nri_city'] = nriCity;
    data['nri_phone_no'] = nriPhoneNo;
    data['nri_country'] = nriCountry;
    data['bank_account_type'] = bankAccountType;
    data['bank_branch'] = bankBranch;
    data['bank_micr_code'] = bankMicrCode;
    data['bank_ifsc_code'] = bankIfscCode;
    data['bank_address'] = bankAddress;
    data['bank_pincode'] = bankPincode;
    data['bank_city'] = bankCity;
    data['bank_state'] = bankState;
    data['bank_country'] = bankCountry;
    data['FATCA_tax_resident'] = fATCATaxResident;
    data['FATCA_political_exposure'] = fATCAPoliticalExposure;
    data['FATCA_identification_type'] = fATCAIdentificationType;
    data['FATCA_occupation'] = fATCAOccupation;
    data['FATCA_gross_annual_income'] = fATCAGrossAnnualIncome;
    data['BSE_UCC_Code'] = bSEUCCCode;
    data['NACH_Mandate_xSIP'] = nACHMandateXSIP;
    data['URN_Biller_Mandate_iSIP'] = uRNBillerMandateISIP;
    data['Nominee_name'] = nomineeName;
    data['Nominee_DOB'] = nomineeDOB;
    data['Nominee_pan_no'] = nomineePanNo;
    data['Nominee_account_holder'] = nomineeAccountHolder;
    data['Nominee_guardian_name'] = nomineeGuardianName;
    data['Nominee_address'] = nomineeAddress;
    data['Nominee_pincode'] = nomineePincode;
    data['Nominee_city'] = nomineeCity;
    data['Nominee_state'] = nomineeState;
    data['Nominee_country'] = nomineeCountry;
    return data;
  }
}
