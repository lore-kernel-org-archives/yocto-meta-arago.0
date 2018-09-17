Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 483C2529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 12:33:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HCXZFh109693
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537187615;
	bh=/py34TqKmdg/j0YYr/rzfpGwntIEDCYFNS8g5ECRJY4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=CBpTMYsfiUskknwUXSZOQrs7h4Z2KDpS+EcPPJlVKw84fZRiChN9AeE7bJp97XOeL
	5od2MyiHfrlYB0BfReL/i2phfL1YLVXsxY7WkH2+77in9ewk4vMeByaKYl1gjCdm6d
	hGJYJK2odUz6S/3dqyl9kNMLgpt77KSHdwakNtqk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HCXZ6P003244
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:33:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 07:33:35 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Mon, 17 Sep 2018 07:33:35 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH]
	packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3
	devices
Thread-Index: AQHUToJ61UJ7OOucfkaOgblaqb0NsKT0aCOg
Date: Mon, 17 Sep 2018 12:33:35 +0000
Message-ID: <b953348f33ed45f3a68f0c41531ba436@ti.com>
References: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
	<4b65438d-1403-33ad-d980-a900c29d06e2@ti.com>
In-Reply-To: <4b65438d-1403-33ad-d980-a900c29d06e2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH] packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3 devices
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2018 12:33:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBJIGFtIGp1c3QgbG9va2luZyBpbnRvIHRoYXQuDQoNCkJlc3QgcmVnYXJkcywNCg0KRXJp
Yw0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2Ig
DQpTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNywgMjAxOCA4OjMyIEFNDQpUbzogUnVlaSwgRXJp
YzsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFtFWFRFUk5BTF0g
W21ldGEtYXJhZ29dIFtQQVRDSF0gcGFja2FnZWdyb3VwLWFyYWdvLXRpZHNrLWhtaS1zZGstaG9z
dDogYWRkIGV2c2UgZGVtbyBzb3VyY2UgZm9yIGszIGRldmljZXMNCg0KUGxlYXNlIGFsc28gYWRk
IHRoZSB0aS10aXNkay1tYWtlZmlsZSBmcmFnbWVudCBhbmQgdmVyaWZ5IHRoYXQgaXQgd29ya3Mg
DQpjb3JyZWN0bHkuDQoNCi0gSmFrZQ0KDQoNCk9uIDkvMTcvMjAxOCA4OjMwIEFNLCBFcmljIFJ1
ZWkgd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IEVyaWMgUnVlaSA8ZS1ydWVpMUB0aS5jb20+DQo+
IC0tLQ0KPiAgIC4uLi9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby10aXNkay1obWkt
c2RrLWhvc3QuYmIgICAgICAgICAgfCA2ICsrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28t
ZGlzdHJvL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby10aXNk
ay1obWktc2RrLWhvc3QuYmIgYi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2Fn
ZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJhZ28tdGlzZGstaG1pLXNkay1ob3N0LmJiDQo+IGluZGV4
IDQ5MjExNDcuLmRkMzQwN2QgMTAwNjQ0DQo+IC0tLSBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lw
ZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby10aXNkay1obWktc2RrLWhv
c3QuYmINCj4gKysrIGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91
cHMvcGFja2FnZWdyb3VwLWFyYWdvLXRpc2RrLWhtaS1zZGstaG9zdC5iYg0KPiBAQCAtMSw2ICsx
LDYgQEANCj4gICBTVU1NQVJZID0gIlRhc2sgdG8gYWRkIEhNSSByZWxhdGVkIHNvdXJjZXMgaW50
byB0aGUgU0RLIg0KPiAgIExJQ0VOU0UgPSAiTUlUIg0KPiAtUFIgPSAicjAiDQo+ICtQUiA9ICJy
MSINCj4gICANCj4gICBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9Ig0KPiAgIA0KPiBA
QCAtMjIsNiArMjIsMTAgQEAgSE1JX2FwcGVuZF9vbWFwLWExNSA9ICIgXA0KPiAgICAgICBldnNl
LWhtaS1zcmMgXA0KPiAgICINCj4gICANCj4gK0hNSV9hcHBlbmRfazMgPSAiIFwNCj4gKyAgICBl
dnNlLWhtaS1zcmMgXA0KPiArIg0KPiArDQo+ICAgUkRFUEVORFNfJHtQTn0gPSAiXA0KPiAgICAg
ICAke0hNSX0gXA0KPiAgICINCg0K

