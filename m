Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B5DEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 05:14:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6408.1687842878323140838
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 22:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n7v4bek4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35R5Eb2G006079
	for <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 00:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687842877;
	bh=vXLfP9RVUJj/CtFqgxhVhKH21ANE/MsJ56G083z6wtw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=n7v4bek4ja3lTBEnULqe09bS/vIHw44mkKCmak8Z/gpLfO/1clAgcufQPhxbTlO/D
	 PTv1J+946P6kTFtPmRoygaKfjpAjoPKRjG5wvuWS2m8DYvP+Y4m4hm/MaaHr3I6xD2
	 QOHRDtREY6Wus4bF7DT6pQujpzFQT716Q0RzXMH4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35R5Ebed021135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 00:14:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 00:14:36 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.023; Tue, 27 Jun 2023 00:14:36 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Weaver, Lucas" <l-weaver@ti.com>, "Shilwant, Chirag" <c-shilwant@ti.com>
Subject: RE: [meta-arago][master/kirkstone][PATCH] classes: tisdk-bundle: Move
 the licenses directory out of docs/
Thread-Topic: [meta-arago][master/kirkstone][PATCH] classes: tisdk-bundle:
 Move the licenses directory out of docs/
Thread-Index: AQHZqDQ4Rv5gpov41EmKLpwI2Yxoy6+d7F8AgAAvSRA=
Date: Tue, 27 Jun 2023 05:14:36 +0000
Message-ID: <409c883e49c5471cb5772f8d12661553@ti.com>
References: <20230626134336.1169017-1-a-limaye@ti.com>
 <0fc32cbc-e68c-edec-8e19-c7854f576844@ti.com>
In-Reply-To: <0fc32cbc-e68c-edec-8e19-c7854f576844@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.128.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 05:14:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14692

T29vcHMgbXkgYmFkLiBTZW50IHRoZSB3cm9uZyBwYXRjaCBhZnRlciBzcXVhc2hpbmcgMiBjb21t
aXRzLi4uDQpTZW50IHJlY3RpZmllZCB2MiBwYXRjaCBhdCBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvZy9tZXRhLWFyYWdvL21lc3NhZ2UvMTQ2OTENCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEVhdG1vbiwgUnlhbiA8cmVhdG1vbkB0aS5jb20+IA0KU2VudDogVHVl
c2RheSwgSnVuZSAyNywgMjAyMyAyOjU0IEFNDQpUbzogTGltYXllLCBBbmlrZXQgPGEtbGltYXll
QHRpLmNvbT47IG1ldGEtYXJhZ29AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KQ2M6IFdlYXZlciwg
THVjYXMgPGwtd2VhdmVyQHRpLmNvbT47IFNoaWx3YW50LCBDaGlyYWcgPGMtc2hpbHdhbnRAdGku
Y29tPg0KU3ViamVjdDogUmU6IFttZXRhLWFyYWdvXVttYXN0ZXIva2lya3N0b25lXVtQQVRDSF0g
Y2xhc3NlczogdGlzZGstYnVuZGxlOiBNb3ZlIHRoZSBsaWNlbnNlcyBkaXJlY3Rvcnkgb3V0IG9m
IGRvY3MvDQoNCg0KVGhpcyBwYXRjaCBmYWlscyB0byBidWlsZC4gIFdhcyBpdCB0ZXN0ZWQ/DQoN
Cg0KT24gNi8yNi8yMDIzIDg6NDMgQU0sIEFuaWtldCBMaW1heWUgd3JvdGU6DQo+IFdlIHBsYW4g
b24gbm90IGhhdmluZyBkb2NzIHBvcHVsYXRlZCBpbiB0aGUgaW50YWxsZXIsIHRvIGFsbG93IGZv
ciANCj4gZWFzaWVyIGRvYyB1cGRhdGVzIG9uIHRoZSByZWxlYXNlIHBhZ2VzIHdpdGhvdXQgaGF2
aW5nIHRvIHVwZGF0ZSB0aGUgDQo+IGluc3RhbGxlci4NCj4gU28gbW92ZSB0aGUgbGljZW5zZXMg
ZGlyZWN0b3J5IG91dCBvZiB0aGUgZG9jcyBkaXJlY3RvcnkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuaWtldCBMaW1heWUgPGEtbGltYXllQHRpLmNvbT4NCj4gLS0tDQo+ICAgbWV0YS1hcmFnby1k
aXN0cm8vY2xhc3Nlcy90aXNkay1idW5kbGUuYmJjbGFzcyB8IDEwICsrKy0tLS0tLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL2NsYXNzZXMvdGlzZGstYnVuZGxlLmJiY2xhc3Mg
DQo+IGIvbWV0YS1hcmFnby1kaXN0cm8vY2xhc3Nlcy90aXNkay1idW5kbGUuYmJjbGFzcw0KPiBp
bmRleCBiOTJjYTBjMC4uNGU2MTNjNmYgMTAwNjQ0DQo+IC0tLSBhL21ldGEtYXJhZ28tZGlzdHJv
L2NsYXNzZXMvdGlzZGstYnVuZGxlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS1hcmFnby1kaXN0cm8v
Y2xhc3Nlcy90aXNkay1idW5kbGUuYmJjbGFzcw0KPiBAQCAtMjQwLDcgKzI0MCw3IEBAIGVjaG8g
Ig0KPiAgIDxoMj5DcmVkaXRzPC9oMj4NCj4gICANCj4gICA8aDI+TGljZW5zZXM8L2gyPg0KPiAt
PHA+TGljZW5zZXMgY2FuIGJlIGZvdW5kIGluIHRoZSBcImRvY3MvbGljZW5zZXNcIiBkaXJlY3Rv
cnkgb2YgdGhlIA0KPiBTREsgaW5zdGFsbCBkaXJlY3Rvcnk8L3A+DQo+ICs8cD5MaWNlbnNlcyBj
YW4gYmUgZm91bmQgaW4gdGhlIFwibGljZW5zZXNcIiBkaXJlY3Rvcnkgb2YgdGhlIFNESyANCj4g
K2luc3RhbGwgZGlyZWN0b3J5PC9wPg0KPiAgIA0KPiAgIDxoMj48dT48Yj5HQ0MgUlVOVElNRSBM
SUJSQVJZIEVYQ0VQVElPTjwvYj48L3U+PC9oMj4NCj4gICA8cD5WZXJzaW9uIDMuMSwgMzEgTWFy
Y2ggMjAwOTwvcD4NCj4gQEAgLTI4Nyw3ICsyODcsNyBAQCBjYXQgPj4gJHtTV19NQU5JRkVTVF9U
RVhUfSA8PCAnRU9GJw0KPiAgIA0KPiAgIDxMaWNlbnNlcz4NCj4gICANCj4gLUxpY2Vuc2VzIGNh
biBiZSBmb3VuZCBpbiB0aGUgImRvY3MvbGljZW5zZXMiIGRpcmVjdG9yeSBvZiB0aGUgU0RLIA0K
PiBpbnN0YWxsIGRpcmVjdG9yeQ0KPiArTGljZW5zZXMgY2FuIGJlIGZvdW5kIGluIHRoZSAibGlj
ZW5zZXMvIiBkaXJlY3Rvcnkgb2YgdGhlIFNESyBpbnN0YWxsIA0KPiArZGlyZWN0b3J5DQo+ICAg
R0NDIFJVTlRJTUUgTElCUkFSWSBFWENFUFRJT04NCj4gICANCj4gICBWZXJzaW9uIDMuMSwgMzEg
TWFyY2ggMjAwOQ0KPiBAQCAtODc2LDExICs4NzYsNyBAQCB0aXNka19pbWFnZV9idWlsZCAoKSB7
DQo+ICAgICAgICMgdGhlIGxpY2Vuc2VzIHRoYXQgd2VyZSB1c2VkIGluIHRoZSBidWlsZC4NCj4g
ICAgICAgaWYgWyAtZCAke0RFUExPWV9ESVJ9L2xpY2Vuc2VzIF0NCj4gICAgICAgdGhlbg0KPiAt
ICAgICAgICBpZiBbICEgLWQgJHtJTUFHRV9ST09URlN9L2RvY3MgXQ0KPiAtICAgICAgICB0aGVu
DQo+IC0gICAgICAgICAgICBta2RpciAtcCAke0lNQUdFX1JPT1RGU30vZG9jcw0KPiAtICAgICAg
ICBmaQ0KPiAtICAgICAgICBjcCAtcmYgJHtERVBMT1lfRElSfS9saWNlbnNlcyAke0lNQUdFX1JP
T1RGU30vZG9jcy8NCj4gKyAgICAgICAgY3AgLXJmICR7REVQTE9ZX0RJUn0vbGljZW5zZXMgJHtJ
TUFHRV9ST09URlN9Lw0KPiAgICAgICBmaQ0KPiAgIA0KPiAgICAgICAjIENyZWF0ZSB0aGUgVEkg
c29mdHdhcmUgbWFuaWZlc3QNCg0KLS0gDQpSeWFuIEVhdG1vbiAgICAgICAgICAgICAgICByZWF0
bW9uQHRpLmNvbQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRl
eGFzIEluc3RydW1lbnRzLCBJbmMuICAtICBMQ1BEICAtICBNR1RTDQo=

