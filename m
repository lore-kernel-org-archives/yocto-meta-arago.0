Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D1EC43334
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 20:18:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.33986.1656274705744081371
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 26 Jun 2022 13:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GOzCRtIs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-humphreys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25QKIP3Y122399
	for <meta-arago@lists.yoctoproject.org>; Sun, 26 Jun 2022 15:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656274705;
	bh=L/919i6Ri1kBhOOZaL7eIDX/UlhFlywhrVC4TYXTKyg=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=GOzCRtIs267uCW4LiFt0Ehp9GceRg5nA60cAFIxkD34ZgefqO9kGCGyCpknj5VhqG
	 th1jEIy0cMfWo5IGX8nPw0G76sBxvBfYXEGU+3PqbgNaxo/HRGJ+pT/IGCkSAVKk74
	 ztrV3l/QPSojhbCCDgICosHMjc/pNJDNhoqR7bMo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25QKIPhI012137
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Sun, 26 Jun 2022 15:18:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sun, 26
 Jun 2022 15:18:24 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2308.014; Sun, 26 Jun 2022 15:18:24 -0500
From: "Humphreys, Jonathan" <j-humphreys@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
Subject: RE: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Thread-Topic: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Thread-Index: AQHYf0IlaSlHNTfce0OGJIuJLL0IKa1iNQNw
Date: Sun, 26 Jun 2022 20:18:24 +0000
Message-ID: <ae85101ccf564b72adcd54a83965af3a@ti.com>
References: <20220609170520.31162-1-afd@ti.com>
 <16989.1655137101944524297@lists.yoctoproject.org>
In-Reply-To: <16989.1655137101944524297@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.44.110]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 26 Jun 2022 20:18:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13915

UnlhbiwgSSBkbyBub3Qgc2VlIHRoaXMgcGF0Y2ggYXBwbGllZCB0byBtYXN0ZXIuICBDYW4geW91
IGNoZWNrPw0KDQpUaGFua3MNCkpvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogbWV0YS1hcmFnb0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLWFyYWdvQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKb25hdGhhbiBIdW1waHJleXMgdmlhIGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6IE1vbmRheSwgSnVuZSAxMywgMjAyMiAxMToxOCBBTQ0K
VG86IG1ldGEtYXJhZ29AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRh
LWFyYWdvXSBbZHVuZmVsbC9tYXN0ZXJdW1BBVENIIHYyXSB0aXNkay11ZW52OiByZW1vdmUgdUVu
di50eHQgZm9yIGszDQoNCk9uIFRodSwgSnVuICA5LCAyMDIyIGF0IDEwOjA1IEFNLCBBbmRyZXcg
RGF2aXMgd3JvdGU6DQoNCj4NCj4gVGhpcyBmaXh1cCBzaG91bGQgaGF2ZSBiZWVuIGRvbmUgaW4g
dS1ib290IGFuZCBub3QgaW4gYSB1RW52LnR4dCBmaWxlLiANCj4gSXQgaXMgbm90IGNvcnJlY3Qg
Zm9yIGFsbCBLMyBhbnltb3JlIGVpdGhlci4gUmVtb3ZlIGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IERhdmlzIDxhZmRAdGkuY29tPg0KPiAtLS0NCj4gDQo+IENoYW5nZXMgZnJvbSB2
MToNCj4gIC0gU3ViamVjdCBzL3RpdXNkay11ZW52L3Rpc2RrLXVlbnYNCj4gDQo+ICAuLi4vdGlz
ZGstdWVudi90aXNkay11ZW52L2szL3VFbnYudHh0ICAgICAgICAgfCAxOSAtLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTkgZGVsZXRpb25zKC0pDQo+ICBkZWxldGUgbW9k
ZSAxMDA2NDQNCj4gbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy10aXNkay90aXNkay11ZW52L3Rp
c2RrLXVlbnYvazMvdUVudi50eHQNCj4gDQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS1hcmFnby1k
aXN0cm8vcmVjaXBlcy10aXNkay90aXNkay11ZW52L3Rpc2RrLXVlbnYvazMvdUVudi50eHQNCj4g
Yi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi9r
My91RW52LnR4dA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggODBlYTM0ZjUu
LjAwMDAwMDAwDQo+IC0tLSANCj4gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLXRpc2RrL3Rp
c2RrLXVlbnYvdGlzZGstdWVudi9rMy91RW52LnR4dA0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0x
LDE5ICswLDAgQEANCj4gLSMgVGhpcyB1RW52LnR4dCBmaWxlIGNhbiBjb250YWluIGFkZGl0aW9u
YWwgZW52aXJvbm1lbnQgc2V0dGluZ3MgdGhhdCANCj4geW91IC0jIHdhbnQgdG8gc2V0IGluIFUt
Qm9vdCBhdCBib290IHRpbWUuICBUaGlzIGNhbiBiZSBzaW1wbGUgDQo+IHZhcmlhYmxlcyBzdWNo
IC0jIGFzIHRoZSBzZXJ2ZXJpcCBvciBjdXN0b20gdmFyaWFibGVzLiAgVGhlIGZvcm1hdCBvZiB0
aGlzIGZpbGUgaXM6DQo+IC0jICAgIHZhcmlhYmxlPXZhbHVlDQo+IC0jIE5PVEU6IFRoaXMgZmls
ZSB3aWxsIGJlIGV2YWx1YXRlZCBhZnRlciB0aGUgYm9vdGNtZCBpcyBydW4gYW5kIHRoZQ0KPiAt
IyAgICAgICBib290Y21kIG11c3QgYmUgc2V0IHRvIGxvYWQgdGhpcyBmaWxlIGlmIGl0IGV4aXN0
cyAodGhpcyBpcyB0aGUNCj4gLSMgICAgICAgZGVmYXVsdCBvbiBhbGwgbmV3ZXIgVS1Cb290IGlt
YWdlcy4gIFRoaXMgYWxzbyBtZWFucyB0aGF0IHNvbWUNCj4gLSMgICAgICAgdmFyaWFibGVzIHN1
Y2ggYXMgYm9vdGRlbGF5IGNhbm5vdCBiZSBjaGFuZ2VkIGJ5IHRoaXMgZmlsZSBzaW5jZQ0KPiAt
IyAgICAgICBpdCBpcyBub3QgZXZhbHVhdGVkIHVudGlsIHRoZSBib290Y21kIGlzIHJ1bi4NCj4g
LQ0KDQpTaG91bGRuJ3Qgd2Uga2VlcCB0aGUgYWJvdmUsIGFzIHRoaXMgaXMgZ2VuZXJpYyBpbmZv
cm1hdGlvbiBhYm91dCBob3cgdG8gdXNlIHVFbnYudHh0IGFuZCB3aGVuIGl0IGlzIGludm9rZWQ/
DQoNCj4gLSMgVGhlIHNwZWNpZmljIGJvYXJkIGlzIG5vdCBhYmxlIHRvIGJlIGF1dG9tYXRpY2Fs
bHkgZGV0ZWN0ZWQuIFRoZSANCj4gYmVsb3cgaXMgYSAtIyB3b3JrYXJvdW5kIHRvIHNldCBhIHNh
bmUgZGVmYXVsdCBpbmNhc2UgdGhlIHVzZXIgaGFzIG5vdCANCj4gbWFudWFsbHkgY29uZmlndXJl
ZCAtIyBhIHNwZWNpZmljIGJvYXJkLg0KPiAtZGVmX2JvYXJkX25hbWU9ImFtNjV4Ig0KPiAtDQo+
IC0jIENoZWNrIGlmIHVzaW5nIGRlZmF1bHQgYm9hcmRfbmFtZSB3aGVuIG5hbWVfb3ZlcmxheXMg
aXMgbm90IHNldCANCj4gLWNoZWNrX2Zvcl9ib2FyZD1pZiB0ZXN0ICRuYW1lX292ZXJsYXlzOyB0
aGVuIGVjaG8gIlVzaW5nIGJvYXJkX25hbWUgPSANCj4gJGJvYXJkX25hbWUiOyBlbHNlIHNldGVu
diBib2FyZF9uYW1lICRkZWZfYm9hcmRfbmFtZTsgZmkNCj4gLQ0KPiAtdWVudmNtZD1ydW4gY2hl
Y2tfZm9yX2JvYXJkOyBydW4gZmluZGZkdA0KPiAtLQ0KPiAyLjM2LjENCj4gDQo+DQoNCg0KLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KVmlldy9SZXBseSBPbmxpbmUgKCMxMzg5Nik6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJhZ28vbWVzc2FnZS8xMzg5Ng0KTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvOTE2NTA3MzAvMzYxNzEw
Ng0KR3JvdXAgT3duZXI6IG1ldGEtYXJhZ28rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0K
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJhZ28v
dW5zdWIgW2otaHVtcGhyZXlzQHRpLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

