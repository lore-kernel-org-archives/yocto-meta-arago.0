Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0461CE7C4CA
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 14:56:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.20659.1696431371402071093
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 07:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IzR/I82W;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 394EuAdh100397
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 09:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696431370;
	bh=2JDrQgwsyT6J/0BfK7iY49RbICbirLXSM0n7n2M1hZA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=IzR/I82WqCZQzal4/GLhIKAwLp+o8CwSVilWlgo/cRFRZQ6Nj2RYL4hzCEma7ebyU
	 kBNTZRcPlINoIf1mKwVzksuWTsBsWMqkEWFFPy79kJtN+yOQC5E4dXce2VGwzB69/o
	 jyyKODky81a2CcLs0hXxZ+cjJQCwGG06SKau3nAo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 394EuAXS042223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 09:56:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 09:56:10 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.023; Wed, 4 Oct 2023 09:56:10 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
Subject: RE: [meta-arago][master/kirkstone][PATCH] tisdk-bundle: Fix
 generate_sw_manifest_table
Thread-Topic: [meta-arago][master/kirkstone][PATCH] tisdk-bundle: Fix
 generate_sw_manifest_table
Thread-Index: AQHZ9o2TNF+qUT9+mE+tg9pbTtkGILA59YcA///ClYA=
Date: Wed, 4 Oct 2023 14:56:10 +0000
Message-ID: <793fdf628fbe4054a60df487c233532d@ti.com>
References: <20231004063945.703846-1-a-limaye@ti.com>
 <e3d6efb9-201f-4423-951f-2ef85bd3be4e@ti.com>
In-Reply-To: <e3d6efb9-201f-4423-951f-2ef85bd3be4e@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Oct 2023 14:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14920

SGkgUnlhbiwNCg0KWWVhaCBzdXJlLCB0aGFua3MhDQpTb3JyeSwgSSBzYXcgeW91ciBwYXRjaCBv
bmx5IGFmdGVyIEkgc2VudCBtaW5lLiAgDQoNClJlZ2FyZHMsDQpBbmlrZXQNCg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRWF0bW9uLCBSeWFuIDxyZWF0bW9uQHRpLmNvbT4g
DQpTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgNCwgMjAyMyA3OjA0IFBNDQpUbzogTGltYXllLCBB
bmlrZXQgPGEtbGltYXllQHRpLmNvbT47IG1ldGEtYXJhZ29AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KU3ViamVjdDogUmU6IFttZXRhLWFyYWdvXVttYXN0ZXIva2lya3N0b25lXVtQQVRDSF0gdGlz
ZGstYnVuZGxlOiBGaXggZ2VuZXJhdGVfc3dfbWFuaWZlc3RfdGFibGUNCg0KDQoNCk9uIDEwLzQv
MjAyMyAxOjM5IEFNLCBBbmlrZXQgTGltYXllIHdyb3RlOg0KPiBUaGUgZ2VuZXJhdGVkIG1hbmlm
ZXN0IGZpbGUgaXMgZXhwZWN0ZWQgdG8gc3RyaWN0bHkgaGF2ZSA3IGNvbHVtbnMsIA0KPiBkZWxp
bWl0ZWQgYnkgJ3wnIHdoaWxlIHRoZSBMaWNlbnNlIHNlY3Rpb24gYWxzbyBzb21ldGltZXMgaGFz
ICd8Jw0KPiBjaGFyYWN0ZXIuIFJlcGxhY2UgdGhpcyBvbmUgYnkgJ29yJyB0byBmaXggbWFuaWZl
c3QgZmlsZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5pa2V0IExpbWF5ZSA8YS1saW1heWVAdGku
Y29tPg0KPiAtLS0NCj4gICBtZXRhLWFyYWdvLWRpc3Ryby9jbGFzc2VzL3Rpc2RrLWJ1bmRsZS5i
YmNsYXNzIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL2NsYXNzZXMvdGlz
ZGstYnVuZGxlLmJiY2xhc3MgDQo+IGIvbWV0YS1hcmFnby1kaXN0cm8vY2xhc3Nlcy90aXNkay1i
dW5kbGUuYmJjbGFzcw0KPiBpbmRleCAxZWJkYjZmYi4uZDJkMzEzODEgMTAwNjQ0DQo+IC0tLSBh
L21ldGEtYXJhZ28tZGlzdHJvL2NsYXNzZXMvdGlzZGstYnVuZGxlLmJiY2xhc3MNCj4gKysrIGIv
bWV0YS1hcmFnby1kaXN0cm8vY2xhc3Nlcy90aXNkay1idW5kbGUuYmJjbGFzcw0KPiBAQCAtNTUz
LDcgKzU1Myw3IEBAIEVPRg0KPiAgICAgICAgICAgcGFja2FnZT0iYGNhdCAkaSB8IGdyZXAgUGFj
a2FnZTogfCBhd2sgeydwcmludCAkMid9YCINCj4gICAgICAgICAgIHZlcnNpb249ImBjYXQgJGkg
fCBncmVwIFZlcnNpb246IHwgYXdrIHsncHJpbnQgJDInfSB8IGN1dCAtZjEtMiAtZC1gIg0KPiAg
ICAgICAgICAgbG9uZ192ZXJzaW9uPSJgY2F0ICRpIHwgZ3JlcCBWZXJzaW9uOiB8IGF3ayB7J3By
aW50ICQyJ31gIg0KPiAtICAgICAgICBsaWNlbnNlPSJgY2F0ICRpIHwgZ3JlcCBMaWNlbnNlOiB8
IGN1dCAtZDogLWYyIGAiDQo+ICsgICAgICAgIGxpY2Vuc2U9ImBjYXQgJGkgfCBncmVwIExpY2Vu
c2U6IHwgY3V0IC1kOiAtZjIgfCBzZWQgJ3MvfC9vci9nJyBgIg0KPiAgICAgICAgICAgYXJjaGl0
ZWN0dXJlPSJgY2F0ICRpIHwgZ3JlcCBBcmNoaXRlY3R1cmU6IHwgYXdrIHsncHJpbnQgJDInfWAi
DQo+ICAgICAgICAgICBzb3VyY2VzPSJgY2F0ICRpIHwgZ3JlcCBTb3VyY2U6IHwgY3V0IC1kICc6
JyAtZjItYCINCj4gICAgICAgICAgIGxvY2F0aW9uPSIkcGFja2FnZSIiXyIiJGxvbmdfdmVyc2lv
biIiXyIiJGFyY2hpdGVjdHVyZSIiLmlwayINCg0KSSdtIGluIHRoZSBtaWRkbGUgb2YgbW9kaWZ5
aW5nIGFsbCBvZiB0aGlzIGNvZGUgdG8gZml4IGEgYnVpbGQgaXNzdWUuIA0KVGhpcyBzZWN0aW9u
IG9mIGNvZGUgaXMgbW92aW5nIHRvIGEgbmV3IGZpbGUuICBJIHdpbGwgcmVzdWJtaXQgYSBuZXcg
dmVyc2lvbiBvZiB0aGlzIHBhdGNoIHdpdGggdGhlIGNoYW5nZSBtYWRlIGluIHRoZSBuZXcgbG9j
YXRpb24uDQoNCi0tIA0KUnlhbiBFYXRtb24gICAgICAgICAgICAgICAgcmVhdG1vbkB0aS5jb20N
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpUZXhhcyBJbnN0cnVt
ZW50cywgSW5jLiAgLSAgTENQRCAgLSAgTUdUUw0K

