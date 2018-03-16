Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0C7B952994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 13:05:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GD4wDP032688
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521205498;
	bh=TUgJh7KoiO3nOQy8GR0gkczg0ai6Pa2YMKR53mifBC4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=YL/whvnW3jXS9ppyEs/hx6iLMU/SWS2L2YLusoyzuzs/9lvCIyRMQAJH7c8trkUys
	fORfEicFZVK+sqgpzrEheIDtO/yjPikDrdpkG6rZSDE3802u9B8ugEkzmfCsWH51Tu
	PE1UhEikLPEvOnsF2RBaFcRsy5DQGWieRhfcHB4w=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GD4wva015744
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:04:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 08:04:58 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Fri, 16 Mar 2018 08:04:58 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v3]
	video-graphics-test: bump SRCREV to pick up the latest version
Thread-Index: AQHTvSSmfIyx0dzec0SEjrsX6TKFT6PS0mwQgABUfYD//6140A==
Date: Fri, 16 Mar 2018 13:04:58 +0000
Message-ID: <6a27ae35e51a4ee181c51f1848ad5984@ti.com>
References: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
	<6d774a67-674a-9615-5e81-d0500faef810@ti.com>
	<f8e51ccdc7a048d59712f5deca3abd9d@ti.com>
	<b330dc3cb06e428fb49ac43192ba0529@ti.com>
In-Reply-To: <b330dc3cb06e428fb49ac43192ba0529@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v3] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 13:05:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCB0aGUgbGF0ZXN0IG9uZSB3YXMgaW4uDQoNCkJlc3QgcmVnYXJkcywNCg0KRXJpYw0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpTZW50
OiBGcmlkYXksIE1hcmNoIDE2LCAyMDE4IDk6MDAgQU0NClRvOiBSdWVpLCBFcmljOyBtZXRhLWFy
YWdvQGFyYWdvLXByb2plY3Qub3JnDQpTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBbbWV0YS1hcmFn
b10gW21vcnR5XVttZXRhLXByb2Nlc3Nvci1zZGtdW1BBVENIIHYzXSB2aWRlby1ncmFwaGljcy10
ZXN0OiBidW1wIFNSQ1JFViB0byBwaWNrIHVwIHRoZSBsYXRlc3QgdmVyc2lvbg0KDQpJIG5lZWRl
ZCB0byB1cGRhdGUgbWV0YS10aSBmb3IgdGhpcy4gSSBhbSB0cnlpbmcgYWdhaW4gbm93Lg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJ1ZWksIEVyaWMNCj4gU2VudDog
RnJpZGF5LCBNYXJjaCAxNiwgMjAxOCA4OjU5IEFNDQo+IFRvOiBTdGlmZmxlciwgSmFjb2I7IG1l
dGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW21l
dGEtYXJhZ29dIFttb3J0eV1bbWV0YS1wcm9jZXNzb3Itc2RrXVtQQVRDSCANCj4gdjNdIHZpZGVv
LWdyYXBoaWNzLXRlc3Q6IGJ1bXAgU1JDUkVWIHRvIHBpY2sgdXAgdGhlIGxhdGVzdCB2ZXJzaW9u
DQo+IA0KPiBIaSwgSmFrZToNCj4gDQo+IFdlIGhhdmUgc3VibWl0dGVkIGEgZ2MzMjAgcGF0Y2gg
dG8gbWV0YS1hcmFnbyBsb25nIGJhY2suIEkgdGhvdWdodCANCj4gdGhhdCBpdCB3YXMgaW4sIGxl
dCBtZSBjaGVjayBhZ2Fpbi4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IEVyaWMNCj4gDQo+
IA0KPiANCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0aWZmbGVy
LCBKYWNvYg0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDE2LCAyMDE4IDg6NDUgQU0NCj4gVG86IFJ1
ZWksIEVyaWM7IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtF
WFRFUk5BTF0gW21ldGEtYXJhZ29dIFttb3J0eV1bbWV0YS1wcm9jZXNzb3Itc2RrXVtQQVRDSCAN
Cj4gdjNdIHZpZGVvLWdyYXBoaWNzLXRlc3Q6IGJ1bXAgU1JDUkVWIHRvIHBpY2sgdXAgdGhlIGxh
dGVzdCB2ZXJzaW9uDQo+IA0KPiBJIGdldCBhbiBkaWZmZXJlbnQgZXJyb3Igbm93Lg0KPiANCj4g
DQo+IHwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2dpdC9nYzMyMC5jcHA6Mzk6MDoNCj4gfCAu
Li9naXQvZ2MzMjAuaDozODoyMDogZmF0YWwgZXJyb3I6IGdjX2hhbC5oOiBObyBzdWNoIGZpbGUg
b3IgDQo+IHxkaXJlY3RvcnkNCj4gfMKgICNpbmNsdWRlIDxnY19oYWwuaD4NCj4gfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0KPiB8IGNvbXBpbGF0aW9uIHRlcm1p
bmF0ZWQuDQo+IHwgTWFrZWZpbGU6OTQyOiByZWNpcGUgZm9yIHRhcmdldCAnZ2MzMjAubycgZmFp
bGVkDQo+IHwgbWFrZTogKioqIFtnYzMyMC5vXSBFcnJvciAxDQo+IHwgbWFrZTogKioqIFdhaXRp
bmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4v
Z2l0L3ZpZGVvX2dyYXBoaWNzX3Rlc3QuY3BwOjQ2OjA6DQo+IHwgLi4vZ2l0L2djMzIwLmg6Mzg6
MjA6IGZhdGFsIGVycm9yOiBnY19oYWwuaDogTm8gc3VjaCBmaWxlIG9yIA0KPiB8ZGlyZWN0b3J5
DQo+IHzCoCAjaW5jbHVkZSA8Z2NfaGFsLmg+DQo+IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF4NCj4gfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiB8IE1ha2Vm
aWxlOjkzNzogcmVjaXBlIGZvciB0YXJnZXQgJ3ZpZGVvX2dyYXBoaWNzX3Rlc3QubycgZmFpbGVk
DQo+IHwgbWFrZTogKioqIFt2aWRlb19ncmFwaGljc190ZXN0Lm9dIEVycm9yIDENCj4gDQo+IA0K
PiANCj4gT24gMy8xNS8yMDE4IDU6MjQgUE0sIEVyaWMgUnVlaSB3cm90ZToNCj4gPiAtIGluY2x1
ZGUgZ2MzMjANCj4gPiAtIFFQQSBpbnRlcmZhY2UgY2hhbmdlcw0KPiA+IC0gZHVhbC1zY3JlZW4g
c3VwcG9ydA0KPiA+IC0gYWRkIG1vcmUgZGVwZW5kZW5jaWVzDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBFcmljIFJ1ZWkgPGUtcnVlaTFAdGkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgcmVjaXBlcy1t
dWx0aW1lZGlhL3ZpZGVvLWdyYXBoaWNzLXRlc3QvdmlkZW8tZ3JhcGhpY3MtdGVzdF8xLjAuYmIg
DQo+ID4gfCA2DQo+ICsrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLW11bHRpbWVk
aWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy0NCj4gdGVzdF8xLjAuYmIgYi9y
ZWNpcGVzLW11bHRpbWVkaWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy0NCj4g
dGVzdF8xLjAuYmINCj4gPiBpbmRleCBjMTlhZjE2Li4zMDgwNWE1IDEwMDY0NA0KPiA+IC0tLSAN
Cj4gPiBhL3JlY2lwZXMtbXVsdGltZWRpYS92aWRlby1ncmFwaGljcy10ZXN0L3ZpZGVvLWdyYXBo
aWNzLXRlc3RfMS4wLmJiDQo+ID4gKysrIGIvcmVjaXBlcy1tdWx0aW1lZGlhL3ZpZGVvLWdyYXBo
aWNzLXRlc3QvdmlkZW8tZ3JhcGhpY3MtdGVzdF8xLjANCj4gPiArKysgLmJiDQo+ID4gQEAgLTQs
MTIgKzQsMTIgQEAgU0VDVElPTiA9ICJtdWx0aW1lZGlhIg0KPiA+ICAgTElDRU5TRSA9ICJHUEx2
MiINCj4gPiAgIExJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM3Y2E3
MDc3MDRkMzM1NGE2NGZlZWI0ZjE5ZjUyZWI1Ig0KPiA+DQo+ID4gLURFUEVORFMgKz0gImxpYmRy
bSINCj4gPiArREVQRU5EUyArPSAibGliZHJtIHRpLWdjMzIwLWxpYnMgY21lbSBxdGRlY2xhcmF0
aXZlIg0KPiA+DQo+ID4gLVBSID0gInIwIg0KPiA+ICtQUiA9ICJyMSINCj4gPg0KPiA+ICAgQlJB
TkNIID0gIm1hc3RlciINCj4gPiAtU1JDUkVWID0gIjNiMzAwNzY4MDg0NWQzOTc4NDE0NjM5NmEy
ZGQyYTY4YWExYTIyODMiDQo+ID4gK1NSQ1JFViA9ICJiZGZiYzQxNzlkOGQxNzZmZWVjMWRmMTQ4
NzI4YjE4ODJmY2E3NDE2Ig0KPiA+DQo+ID4gICBTUkNfVVJJID0gImdpdDovL2dpdC50aS5jb20v
c2l0YXJhLWxpbnV4L3ZpZGVvLWdyYXBoaWNzLQ0KPiB0ZXN0LmdpdDtwcm90b2NvbD1naXQ7YnJh
bmNoPSR7QlJBTkNIfSBcDQo+ID4gICAiDQoNCg==

