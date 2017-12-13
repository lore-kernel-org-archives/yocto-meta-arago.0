Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5395852093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 16:28:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDGSHNB026028
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:28:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513182497;
	bh=0NIJ1jRUfQeXXVnxIOHNX4OiBHjHaGa17D2oN1ElVbw=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=VeVHOd5+bsVe8Bq0ufI1Ofrvuist7ZzyivBhcgfPyQP4ugbfi7VCn8um+nrg8+anr
	RMVxWmSHrXeraBbuyFGTfRZi+thNYtg0Zhb869FFLO5E5NKmZsIJ9qypycnctywo3l
	6PKNi+ugyUuSh7XNGMHPI4kyLocpAfF1TNYU4+uI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDGSCAV006593
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:28:12 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 10:28:12 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.0845.034; Wed, 13 Dec 2017 10:28:12 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	common-csl-ip: Updating to version 3.0.0.9
Thread-Index: AQHTdCPu/uj2G1zRMUmRIQ+JADvu26NBdhCw
Date: Wed, 13 Dec 2017 16:28:12 +0000
Message-ID: <59a9e78677f0428b8ebcfbe5f92d12bc@ti.com>
References: <1513120974-54884-1-git-send-email-m-radhakrishnan2@ti.com>
	<7c81d186-4f11-2279-dd6d-cbd1f7814e84@ti.com>
In-Reply-To: <7c81d186-4f11-2279-dd6d-cbd1f7814e84@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] common-csl-ip: Updating to version 3.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 16:28:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SEkgSmFrZSwNCiBSZWdhcmRpbmcgdGhlIHdhcm5pbmcgeW91IG1lbnRpb25lZCBhYm91dCANCg0K
PiArcmVxdWlyZSByZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXAuaW5jDQoN
CkhvdyBlbHNlIHdvdWxkIHRoaXMgZmlsZSBiZSBpbmNsdWRlZD8gDQoNCg0KUmVnYXJkcw0KTWFj
aHUuDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RpZmZsZXIsIEphY29iIA0K
U2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxMywgMjAxNyAxMDowNiBBTQ0KVG86IFJhZGhha3Jp
c2huYW4sIE1haGVzaDsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6
IFtFWFRFUk5BTF0gW21ldGEtYXJhZ29dIFttb3J0eV1bbWV0YS1wcm9jZXNzb3Itc2RrXVtQQVRD
SF0gY29tbW9uLWNzbC1pcDogVXBkYXRpbmcgdG8gdmVyc2lvbiAzLjAuMC45DQoNCg0KDQpPbiAx
Mi8xMi8yMDE3IDY6MjIgUE0sIE1haGVzaCBSYWRoYWtyc2lobmFuIHdyb3RlOg0KPiBGcm9tOiBN
YWhlc2ggUmFkaGFrcmlzaG5hbiA8bS1yYWRoYWtyaXNobmFuMkB0aS5jb20+DQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IE1haGVzaCBSYWRoYWtyaXNobmFuIDxtLXJhZGhha3Jpc2huYW4yQHRpLmNvbT4N
Cj4gLS0tDQo+ICAgcmVjaXBlcy1ic3AvY29tbW9uLWNzbC1pcC9jb21tb24tY3NsLWlwLTMuMC4w
LjkuaW5jICAgICAgIHwgOCArKysrKysrKw0KPiAgIHJlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAv
Y29tbW9uLWNzbC1pcC1ydG9zX2dpdC5iYmFwcGVuZCB8IDUgKysrKysNCj4gICByZWNpcGVzLWJz
cC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXBfZ2l0LmJiYXBwZW5kICAgICAgfCAyICsrDQo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHJlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcC0zLjAuMC45LmluYw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1j
c2wtaXAtcnRvc19naXQuYmJhcHBlbmQNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IHJlY2lw
ZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcF9naXQuYmJhcHBlbmQNCj4NCj4gZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcC0zLjAuMC45
LmluYyANCj4gYi9yZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXAtMy4wLjAu
OS5pbmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uYzc0NTQxMw0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9u
LWNzbC1pcC0zLjAuMC45LmluYw0KPiBAQCAtMCwwICsxLDggQEANCj4gK3JlcXVpcmUgcmVjaXBl
cy1ic3AvY29tbW9uLWNzbC1pcC9jb21tb24tY3NsLWlwLmluYw0KDQpQbGVhc2UgZG8gbm90IGlu
Y2x1ZGUgdGhpcyBoZXJlLiBJdCBjYXVzZXMgbWFueSB3YXJuaW5ncyBhcyBpdCBpcyBhbHJlYWR5
IGluY2x1ZGVkIGJ5IHRoZSB1cHN0cmVhbSBiYiBmaWxlcy4NCg0KPiArDQo+ICtQViA9ICIwMy4w
My4wMC4wOSINCj4gK0lOQ19QUiA9ICJyMCINCj4gKw0KPiArIyBCZWxvdyBjb21taXQgSUQgY29y
cmVzcG9uZGluZyB0byAiREVWLkNTTF9QUk9DRVNTT1ItU0RLLjAzLjAzLjAwLjA5Ig0KPiArQ1NM
X1NSQ1JFViA9ICI3YTdlZjA2MzNkOWUzMDUwNzJiNzlhYzk3ODczOGM0OGU0NjU4M2NjIg0KPiAr
DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXAt
cnRvc19naXQuYmJhcHBlbmQgDQo+IGIvcmVjaXBlcy1ic3AvY29tbW9uLWNzbC1pcC9jb21tb24t
Y3NsLWlwLXJ0b3NfZ2l0LmJiYXBwZW5kDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAuLjcxYzg2ZTYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9yZWNpcGVzLWJzcC9j
b21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXAtcnRvc19naXQuYmJhcHBlbmQNCj4gQEAgLTAsMCAr
MSw1IEBADQo+ICtyZXF1aXJlIHJlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1p
cC0zLjAuMC45LmluYw0KPiArDQo+ICsjIEhUTUwgZG9jIGxpbmsgcGFyYW1zDQo+ICtQREtfQ09N
UF9MSU5LX1RFWFQgPSAiQ1NMLUNoaXAgU3VwcG9ydCBMaWJyYXJ5Ig0KPiArDQo+IGRpZmYgLS1n
aXQgYS9yZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXBfZ2l0LmJiYXBwZW5k
IA0KPiBiL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcF9naXQuYmJhcHBl
bmQNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uMWU0MjkzOA0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNz
bC1pcF9naXQuYmJhcHBlbmQNCj4gQEAgLTAsMCArMSwyIEBADQo+ICtyZXF1aXJlIHJlY2lwZXMt
YnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcC0zLjAuMC45LmluYw0KPiArDQoNCg==

