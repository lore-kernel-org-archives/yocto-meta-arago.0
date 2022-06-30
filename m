Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB75DC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 11:58:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.24130.1656590290849086552
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 04:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KTSU6pjR;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UBw9en006321;
	Thu, 30 Jun 2022 06:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656590289;
	bh=KItbglSQhPVTameZYod0r+9fVQTgh8ZuRpUd/1n9iGI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KTSU6pjRX3+/AUKENnXmn0giV/0i2Q8gkbr3SuxJLmixe6uC5tM+0vM6/av4eIReg
	 5VNQMgod/vSkVEoJt3pAj4c7x6TW+uzBxTxywGgBK9BohLLG1exUscte9fbtVA3N8y
	 l5Rqzd+0P81sBCt6cCVSsmg34YJ9ZA5J9Eng7jdw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UBw9eU037794
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 06:58:09 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 06:58:09 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2308.014; Thu, 30 Jun 2022 06:58:09 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Mantena, Prasanth" <p-mantena@ti.com>,
        "prashanth.ka@pathpartnertech.com" <prashanth.ka@pathpartnertech.com>,
        "R,
 Karthik" <karthik.ramanan@ti.com>
CC: "Eatmon, Ryan" <reatmon@ti.com>, "Weaver, Lucas" <l-weaver@ti.com>
Subject: RE: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build
 flag to enable GST_TRACERS
Thread-Topic: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks
 build flag to enable GST_TRACERS
Thread-Index: AQHYi6ZuNCOe8fvR10Ou7TEI1AAn4q1oDIwA///LxlA=
Date: Thu, 30 Jun 2022 11:58:09 +0000
Message-ID: <3188ef5fecbe458d8d04c4b2348147c2@ti.com>
References: <20220629105304.15355-1-a-limaye@ti.com>
 <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
In-Reply-To: <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.219.43]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 11:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13923

K0thcnRoaWsNCg0KUHJhbmVldGgsDQoNClRoaXMgaXMgbm90IHNwZWNpZmljIHRvIGNvZGVjLiBU
aGlzIGNhbiBiZSB1c2VkIGZvciBwcm9maWxpbmcgbGF0ZW5jaWVzIGFuZCBzdWNoIGZvciBhbnkg
R1N0cmVhbWVyIGVsZW1lbnRzLg0KSXQgc2hvdWxkIG5vdCBpbXBhY3QgcGVyZm9ybWFuY2UgZWl0
aGVyLiBJdCBqdXN0IHByaW50cyBsYXRlbmN5IGxvZ3MgaWYgYW4gZW52aXJvbm1lbnQgdmFyaWFi
bGUgaXMgc2V0LCBzaW1pbGFyIHRvIEdTVF9ERUJVRy4NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQmFqanVyaSwgUHJhbmVldGggPHByYW5lZXRoQHRpLmNvbT4gDQpTZW50
OiBUaHVyc2RheSwgSnVuZSAzMCwgMjAyMiAzOjI5IFBNDQpUbzogTGltYXllLCBBbmlrZXQgPGEt
bGltYXllQHRpLmNvbT47IG1ldGEtYXJhZ29AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsgTWFudGVu
YSwgUHJhc2FudGggPHAtbWFudGVuYUB0aS5jb20+OyBwcmFzaGFudGgua2FAcGF0aHBhcnRuZXJ0
ZWNoLmNvbQ0KQ2M6IEVhdG1vbiwgUnlhbiA8cmVhdG1vbkB0aS5jb20+OyBXZWF2ZXIsIEx1Y2Fz
IDxsLXdlYXZlckB0aS5jb20+DQpTdWJqZWN0OiBSZTogW21ldGEtYXJhZ29dW2R1bmZlbGxdW1BB
VENIXSBnc3RyZWFtZXI6IEFkZGluZyB0cmFjZXItaG9va3MgYnVpbGQgZmxhZyB0byBlbmFibGUg
R1NUX1RSQUNFUlMNCg0KUHJhc2hhbnRoLFByYXNhbnRoLA0KDQpQbGVhc2UgcmV2aWV3Lg0KDQpP
biA2LzI5LzIwMjIgNDoyMyBQTSwgQW5pa2V0IExpbWF5ZSB3cm90ZToNCj4gRW5hYmxlcyBHU1Rf
VFJBQ0VSUyA6IGFuIG9wdGlvbmFsIHV0aWxpdHkgZm9yIHByb2ZpbGluZyBnc3RyZWFtZXIgYXBw
bGljYXRpb25zDQoNCkFuaWtldCwNCg0KMS4gV2hhdCBpcyB0aGUgaW1wYWN0IG9mIHRoaXMgd2l0
aCBjb2RlYyBwZXJmb3JtYW5jZT8NCjIuIFdoeSBpcyB0aGlzIG9wdGlvbmFsIHV0aWxpdHkgbmVl
ZCB0byBlbmFibGVkPw0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuaWtldCBMaW1heWUgPGEt
bGltYXllQHRpLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4x
Ni4lLmJiYXBwZW5kICAgICAgICAgICAgICAgICAgIHwgNSArKysrKw0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1l
eHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4xNi4lLmJi
YXBwZW5kDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4xNi4lLmJiYXBwZW5kIGIvbWV0YS1hcmFn
by1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4xNi4l
LmJiYXBwZW5kDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwLi5kN2Jk
YWEwNA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMTYuJS5iYmFwcGVuZA0KPiBAQCAt
MCwwICsxLDUgQEANCj4gKw0KPiArUEFDS0FHRUNPTkZJR19hcHBlbmQgPSAiIHRyYWNlci1ob29r
cyINCj4gKw0KPiArUFJfYXBwZW5kID0gIi5hcmFnbzAiDQo+ICsNCg==

