Return-Path: <sam.nelson@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9C44752985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 18:35:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85IZP57055189
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536172525;
	bh=FSpXEJKWmzwdxCf7Mu/7ct5v39i7ZCjUkUAagQW75uI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ua4DoKAkm+LKHXDrGo13+VAhM88OwocixABoPSoZMN4PgqeiE1c6nCJEpVw9sh4ET
	dsxYznJd2cyhlO93CV7iE7zn/RUlH01adXa4JZsZMNxB9bmm0rAVagUfpGQYBc59FY
	X/gNbNItoDBWiiImXUg7N5SDeYJm3DxQTN65gJS0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85IZP7q022211
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:35:25 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 13:35:25 -0500
Received: from DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d]) by
	DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d%17]) with mapi id
	15.01.1466.003; Wed, 5 Sep 2018 13:35:25 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Anna, Suman" <s-anna@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago][rocko][PATCH] packagegroup-tisdk-addons: Add
	firmware images for am65xx-evm
Thread-Index: AQHURT7PXRTv751kzEqlKp1Bta5pN6TiSWIA//+6ebA=
Date: Wed, 5 Sep 2018 18:35:25 +0000
Message-ID: <307bcf649551417c849a85173041541d@ti.com>
References: <1536168915-10192-1-git-send-email-sam.nelson@ti.com>
	<8c063e36-6b83-c746-1e91-4a38e5268d11@ti.com>
In-Reply-To: <8c063e36-6b83-c746-1e91-4a38e5268d11@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.135]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [rocko][PATCH] packagegroup-tisdk-addons: Add firmware images for am65xx-evm
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
X-List-Received-Date: Wed, 05 Sep 2018 18:35:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5uYSwgU3VtYW4NCj4g
U2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNSwgMjAxOCAxOjQ0IFBNDQo+IFRvOiBOZWxzb24s
IFNhbTsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPiBDYzogRG15dHJpeWVua28sIERl
bnlzDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS1hcmFnb11bcm9ja29dW1BBVENIXSBwYWNrYWdlZ3Jv
dXAtdGlzZGstYWRkb25zOiBBZGQNCj4gZmlybXdhcmUgaW1hZ2VzIGZvciBhbTY1eHgtZXZtDQo+
IA0KPiBPbiAwOS8wNS8yMDE4IDEyOjM1IFBNLCBTYW0gTmVsc29uIHdyb3RlOg0KPiA+IFByb3Zp
ZGVzIGlwYyB0ZXN0IGltYWdlcyBmb3IgcjVmIGNvcmVzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gTmVsc29uIDxzYW0ubmVsc29uQHRpLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlY2lw
ZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby10aXNkay1hZGRvbnMuYmIg
ICAgICAgfCAyDQo+ICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2Fn
ZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtDQo+IGFyYWdvLXRpc2RrLWFkZG9ucy5iYiBiL21ldGEtYXJh
Z28tZGlzdHJvL3JlY2lwZXMtDQo+IGNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJh
Z28tdGlzZGstYWRkb25zLmJiDQo+ID4gaW5kZXggNWI5N2Q3Ny4uZDkwNTQwMiAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNr
YWdlZ3JvdXAtYXJhZ28tDQo+IHRpc2RrLWFkZG9ucy5iYg0KPiA+ICsrKyBiL21ldGEtYXJhZ28t
ZGlzdHJvL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby0NCj4g
dGlzZGstYWRkb25zLmJiDQo+ID4gQEAgLTEwMiw2ICsxMDIsOCBAQCBVVElMU19hcHBlbmRfazJn
ID0gIiBcDQo+ID4gICAgICB1aW8tdGVzdC1wcnVzcyBcDQo+ID4gICINCj4gPg0KPiA+ICtVVElM
U19hcHBlbmRfYW02NXh4LWV2bSA9ICIgdGktaXBjLXJ0b3MtZnciDQo+IA0KPiBJIGFtIG5vdCBz
dXJlIGlmIGFyYWdvIGFuZCBtZXRhLXRpIHVzZXMgZGlmZmVyZW50IGxhYmVscy9wbGF0Zm9ybXMs
IGJ1dA0KPiBzaG91bGQgdGhpcyBiZSB1c2luZyB0aGUgYWxyZWFkeSBleGlzdGluZyBVVElMU19h
cHBlbmRfazMuIEkgc2VlIHRoYXQncw0KPiB3aGF0IHRoZSBQUlUgZmlybXdhcmUgaW1hZ2VzIGFy
ZSB1c2luZy4gSSB3aWxsIGxldCBEZW55cyBjb21tZW50IG9uIHRoaXMNCj4gbW9yZS4NCj4gDQo+
IHJlZ2FyZHMNCj4gU3VtYW4NCg0KSSB3aWxsIHNlbmQgdXBkYXRlZCBwYXRjaCB0byB1c2UgazMu
DQo+IA0KPiA+ICsNCj4gPiAgRVhUUkFfTElCUyA9ICIiDQo+ID4gIEVYVFJBX0xJQlNfYXBwZW5k
X29tYXAtYTE1ID0gIiBcDQo+ID4gICAgICBjbWVtIFwNCj4gPg0KDQo=

