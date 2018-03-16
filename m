Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4807A52994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 13:00:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GCxGTX001316
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 07:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521205156;
	bh=yhet2Es1vEjOdIpu9VhV//KXH83Jhdg1hk/v4/TwXhQ=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=JeC+VP48HRxWfszmOuXGa7MbAwJg6HN4BH98kqmvJ/mtG5urDOQl6VZpKPwENl6f9
	6AFBEwEwAXkf1unT6RcvN+InbsaJFogkIK33v62yDZO2ocix2pTwiF+RPCI8QNy8qR
	Xu4eGNpWKPAtdmK9Tyn+7GQZvjtYxNJTKvalYkek=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GCxGtr004622
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 07:59:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 07:59:16 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Fri, 16 Mar 2018 07:59:16 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v3]
	video-graphics-test: bump SRCREV to pick up the latest version
Thread-Index: AQHTvSSmfIyx0dzec0SEjrsX6TKFT6PS0mwQ
Date: Fri, 16 Mar 2018 12:59:16 +0000
Message-ID: <f8e51ccdc7a048d59712f5deca3abd9d@ti.com>
References: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
	<6d774a67-674a-9615-5e81-d0500faef810@ti.com>
In-Reply-To: <6d774a67-674a-9615-5e81-d0500faef810@ti.com>
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
X-List-Received-Date: Fri, 16 Mar 2018 13:00:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEpha2U6DQoNCldlIGhhdmUgc3VibWl0dGVkIGEgZ2MzMjAgcGF0Y2ggdG8gbWV0YS1hcmFn
byBsb25nIGJhY2suIEkgdGhvdWdodCB0aGF0IGl0IHdhcyBpbiwgbGV0IG1lIGNoZWNrIGFnYWlu
Lg0KDQpCZXN0IHJlZ2FyZHMsDQoNCkVyaWMNCg0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IEZyaWRheSwgTWFyY2ggMTYsIDIw
MTggODo0NSBBTQ0KVG86IFJ1ZWksIEVyaWM7IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcN
ClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRhLWFyYWdvXSBbbW9ydHldW21ldGEtcHJvY2Vz
c29yLXNka11bUEFUQ0ggdjNdIHZpZGVvLWdyYXBoaWNzLXRlc3Q6IGJ1bXAgU1JDUkVWIHRvIHBp
Y2sgdXAgdGhlIGxhdGVzdCB2ZXJzaW9uDQoNCkkgZ2V0IGFuIGRpZmZlcmVudCBlcnJvciBub3cu
DQoNCg0KfCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vZ2l0L2djMzIwLmNwcDozOTowOg0KfCAu
Li9naXQvZ2MzMjAuaDozODoyMDogZmF0YWwgZXJyb3I6IGdjX2hhbC5oOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5DQp8wqAgI2luY2x1ZGUgPGdjX2hhbC5oPg0KfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0KfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KfCBN
YWtlZmlsZTo5NDI6IHJlY2lwZSBmb3IgdGFyZ2V0ICdnYzMyMC5vJyBmYWlsZWQNCnwgbWFrZTog
KioqIFtnYzMyMC5vXSBFcnJvciAxDQp8IG1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVk
IGpvYnMuLi4uDQp8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9naXQvdmlkZW9fZ3JhcGhpY3Nf
dGVzdC5jcHA6NDY6MDoNCnwgLi4vZ2l0L2djMzIwLmg6Mzg6MjA6IGZhdGFsIGVycm9yOiBnY19o
YWwuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KfMKgICNpbmNsdWRlIDxnY19oYWwuaD4N
CnzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4NCnwgY29tcGlsYXRp
b24gdGVybWluYXRlZC4NCnwgTWFrZWZpbGU6OTM3OiByZWNpcGUgZm9yIHRhcmdldCAndmlkZW9f
Z3JhcGhpY3NfdGVzdC5vJyBmYWlsZWQNCnwgbWFrZTogKioqIFt2aWRlb19ncmFwaGljc190ZXN0
Lm9dIEVycm9yIDENCg0KDQoNCk9uIDMvMTUvMjAxOCA1OjI0IFBNLCBFcmljIFJ1ZWkgd3JvdGU6
DQo+IC0gaW5jbHVkZSBnYzMyMA0KPiAtIFFQQSBpbnRlcmZhY2UgY2hhbmdlcw0KPiAtIGR1YWwt
c2NyZWVuIHN1cHBvcnQNCj4gLSBhZGQgbW9yZSBkZXBlbmRlbmNpZXMNCj4NCj4gU2lnbmVkLW9m
Zi1ieTogRXJpYyBSdWVpIDxlLXJ1ZWkxQHRpLmNvbT4NCj4gLS0tDQo+ICAgcmVjaXBlcy1tdWx0
aW1lZGlhL3ZpZGVvLWdyYXBoaWNzLXRlc3QvdmlkZW8tZ3JhcGhpY3MtdGVzdF8xLjAuYmIgfCA2
ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLW11bHRpbWVkaWEvdmlkZW8tZ3JhcGhpY3Mt
dGVzdC92aWRlby1ncmFwaGljcy10ZXN0XzEuMC5iYiBiL3JlY2lwZXMtbXVsdGltZWRpYS92aWRl
by1ncmFwaGljcy10ZXN0L3ZpZGVvLWdyYXBoaWNzLXRlc3RfMS4wLmJiDQo+IGluZGV4IGMxOWFm
MTYuLjMwODA1YTUgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtbXVsdGltZWRpYS92aWRlby1ncmFw
aGljcy10ZXN0L3ZpZGVvLWdyYXBoaWNzLXRlc3RfMS4wLmJiDQo+ICsrKyBiL3JlY2lwZXMtbXVs
dGltZWRpYS92aWRlby1ncmFwaGljcy10ZXN0L3ZpZGVvLWdyYXBoaWNzLXRlc3RfMS4wLmJiDQo+
IEBAIC00LDEyICs0LDEyIEBAIFNFQ1RJT04gPSAibXVsdGltZWRpYSINCj4gICBMSUNFTlNFID0g
IkdQTHYyIg0KPiAgIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM3Y2E3
MDc3MDRkMzM1NGE2NGZlZWI0ZjE5ZjUyZWI1Ig0KPiAgIA0KPiAtREVQRU5EUyArPSAibGliZHJt
Ig0KPiArREVQRU5EUyArPSAibGliZHJtIHRpLWdjMzIwLWxpYnMgY21lbSBxdGRlY2xhcmF0aXZl
Ig0KPiAgIA0KPiAtUFIgPSAicjAiDQo+ICtQUiA9ICJyMSINCj4gICANCj4gICBCUkFOQ0ggPSAi
bWFzdGVyIg0KPiAtU1JDUkVWID0gIjNiMzAwNzY4MDg0NWQzOTc4NDE0NjM5NmEyZGQyYTY4YWEx
YTIyODMiDQo+ICtTUkNSRVYgPSAiYmRmYmM0MTc5ZDhkMTc2ZmVlYzFkZjE0ODcyOGIxODgyZmNh
NzQxNiINCj4gICANCj4gICBTUkNfVVJJID0gImdpdDovL2dpdC50aS5jb20vc2l0YXJhLWxpbnV4
L3ZpZGVvLWdyYXBoaWNzLXRlc3QuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9JHtCUkFOQ0h9IFwN
Cj4gICAiDQoNCg==

