Return-Path: <j-humphreys@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57679C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 16:02:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.43454.1656345732727483391
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Jun 2022 09:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Aag35Fl8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-humphreys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25RG28f5120902;
	Mon, 27 Jun 2022 11:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656345728;
	bh=vAN/4hIPy0UO6SeFrDFaJ39wNFbr489UNgWuqY5248M=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Aag35Fl8tQ4eeT0EL62XQomPW/yl+AteoVtE7pjQF3oi2gQMbykqUZd7b9sO+FdSV
	 QPt8ltA780SKgMFSuB0DZtUPAE/DDmqz51K2tTp4Di2cIIAO0COU9kvpxNZHrdIpVE
	 uTuDBDi2cEX9attgiOrauNeYm8H0QM+PnLVWaHT8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25RG283a028548
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jun 2022 11:02:08 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Jun 2022 11:02:08 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2308.014; Mon, 27 Jun 2022 11:02:08 -0500
From: "Humphreys, Jonathan" <j-humphreys@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Denys Dmytriyenko (denis@denix.org)"
	<denis@denix.org>
Subject: RE: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Thread-Topic: [meta-arago] [dunfell/master][PATCH v2] tisdk-uenv: remove
 uEnv.txt for k3
Thread-Index: AQHYf0IlaSlHNTfce0OGJIuJLL0IKa1iNQNwgAGeVAD//6xuoA==
Date: Mon, 27 Jun 2022 16:02:08 +0000
Message-ID: <ab8c4f5585f144a680686130e65010bf@ti.com>
References: <20220609170520.31162-1-afd@ti.com>
 <16989.1655137101944524297@lists.yoctoproject.org>
 <ae85101ccf564b72adcd54a83965af3a@ti.com>
 <e2701861-a955-dee9-3234-2ec160fecd8c@ti.com>
In-Reply-To: <e2701861-a955-dee9-3234-2ec160fecd8c@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.81.64]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Jun 2022 16:02:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13917

SSBkb24ndCB0aGluayB0aGUgbGF5ZXIgY2hhbmdlcyB3aWxsIGhhdmUgYW55IGltcGFjdCBvbiBp
dC4NCg0KK0RlbnlzDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVhdG1v
biwgUnlhbiA8cmVhdG1vbkB0aS5jb20+IA0KU2VudDogTW9uZGF5LCBKdW5lIDI3LCAyMDIyIDEx
OjAwIEFNDQpUbzogSHVtcGhyZXlzLCBKb25hdGhhbiA8ai1odW1waHJleXNAdGkuY29tPjsgbWV0
YS1hcmFnb0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW21ldGEtYXJhZ29d
IFtkdW5mZWxsL21hc3Rlcl1bUEFUQ0ggdjJdIHRpc2RrLXVlbnY6IHJlbW92ZSB1RW52LnR4dCBm
b3IgazMNCg0KDQpJdCBpcyBub3QgYXBwbGllZCBpbiBtYXN0ZXIgeWV0LiAgSSBoYXZlIG5vdCBo
YWQgdGltZSB0byBrZWVwIGl0IGluIHN5bmMgd2l0aCBkdW5mZWxsIGdpdmVuIGFsbCBvZiB0aGUg
bGF5ZXIgY2hhbmdlcy4gIEkgYmVsaWV2ZSBEZW55cyB3aWxsIGJlIGRvaW5nIGFub3RoZXIgc3lu
YyB1cCBzb29uLg0KDQoNCg0KT24gNi8yNi8yMDIyIDE1OjE4LCBIdW1waHJleXMsIEpvbmF0aGFu
IHdyb3RlOg0KPiBSeWFuLCBJIGRvIG5vdCBzZWUgdGhpcyBwYXRjaCBhcHBsaWVkIHRvIG1hc3Rl
ci4gIENhbiB5b3UgY2hlY2s/DQo+IA0KPiBUaGFua3MNCj4gSm9uDQo+IA0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFyYWdvQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgDQo+IDxtZXRhLWFyYWdvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBK
b25hdGhhbiBIdW1waHJleXMgDQo+IHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFNlbnQ6
IE1vbmRheSwgSnVuZSAxMywgMjAyMiAxMToxOCBBTQ0KPiBUbzogbWV0YS1hcmFnb0BsaXN0cy55
b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbbWV0YS1hcmFnb10gW2R1bmZlbGwvbWFz
dGVyXVtQQVRDSCB2Ml0gdGlzZGstdWVudjogDQo+IHJlbW92ZSB1RW52LnR4dCBmb3IgazMNCj4g
DQo+IE9uIFRodSwgSnVuICA5LCAyMDIyIGF0IDEwOjA1IEFNLCBBbmRyZXcgRGF2aXMgd3JvdGU6
DQo+IA0KPj4NCj4+IFRoaXMgZml4dXAgc2hvdWxkIGhhdmUgYmVlbiBkb25lIGluIHUtYm9vdCBh
bmQgbm90IGluIGEgdUVudi50eHQgZmlsZS4NCj4+IEl0IGlzIG5vdCBjb3JyZWN0IGZvciBhbGwg
SzMgYW55bW9yZSBlaXRoZXIuIFJlbW92ZSBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgRGF2aXMgPGFmZEB0aS5jb20+DQo+PiAtLS0NCj4+DQo+PiBDaGFuZ2VzIGZyb20gdjE6DQo+
PiAgIC0gU3ViamVjdCBzL3RpdXNkay11ZW52L3Rpc2RrLXVlbnYNCj4+DQo+PiAgIC4uLi90aXNk
ay11ZW52L3Rpc2RrLXVlbnYvazMvdUVudi50eHQgICAgICAgICB8IDE5IC0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQ0KPj4gICBkZWxldGUg
bW9kZSAxMDA2NDQNCj4+IG1ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtdGlzZGsvdGlzZGstdWVu
di90aXNkay11ZW52L2szL3VFbnYudHh0DQo+Pg0KPj4gZGlmZiAtLWdpdA0KPj4gYS9tZXRhLWFy
YWdvLWRpc3Ryby9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi9rMy91RW52LnR4
dA0KPj4gYi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGst
dWVudi9rMy91RW52LnR4dA0KPj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCA4
MGVhMzRmNS4uMDAwMDAwMDANCj4+IC0tLQ0KPj4gYS9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVz
LXRpc2RrL3Rpc2RrLXVlbnYvdGlzZGstdWVudi9rMy91RW52LnR4dA0KPj4gKysrIC9kZXYvbnVs
bA0KPj4gQEAgLTEsMTkgKzAsMCBAQA0KPj4gLSMgVGhpcyB1RW52LnR4dCBmaWxlIGNhbiBjb250
YWluIGFkZGl0aW9uYWwgZW52aXJvbm1lbnQgc2V0dGluZ3MgDQo+PiB0aGF0IHlvdSAtIyB3YW50
IHRvIHNldCBpbiBVLUJvb3QgYXQgYm9vdCB0aW1lLiAgVGhpcyBjYW4gYmUgc2ltcGxlIA0KPj4g
dmFyaWFibGVzIHN1Y2ggLSMgYXMgdGhlIHNlcnZlcmlwIG9yIGN1c3RvbSB2YXJpYWJsZXMuICBU
aGUgZm9ybWF0IG9mIHRoaXMgZmlsZSBpczoNCj4+IC0jICAgIHZhcmlhYmxlPXZhbHVlDQo+PiAt
IyBOT1RFOiBUaGlzIGZpbGUgd2lsbCBiZSBldmFsdWF0ZWQgYWZ0ZXIgdGhlIGJvb3RjbWQgaXMg
cnVuIGFuZCB0aGUNCj4+IC0jICAgICAgIGJvb3RjbWQgbXVzdCBiZSBzZXQgdG8gbG9hZCB0aGlz
IGZpbGUgaWYgaXQgZXhpc3RzICh0aGlzIGlzIHRoZQ0KPj4gLSMgICAgICAgZGVmYXVsdCBvbiBh
bGwgbmV3ZXIgVS1Cb290IGltYWdlcy4gIFRoaXMgYWxzbyBtZWFucyB0aGF0IHNvbWUNCj4+IC0j
ICAgICAgIHZhcmlhYmxlcyBzdWNoIGFzIGJvb3RkZWxheSBjYW5ub3QgYmUgY2hhbmdlZCBieSB0
aGlzIGZpbGUgc2luY2UNCj4+IC0jICAgICAgIGl0IGlzIG5vdCBldmFsdWF0ZWQgdW50aWwgdGhl
IGJvb3RjbWQgaXMgcnVuLg0KPj4gLQ0KPiANCj4gU2hvdWxkbid0IHdlIGtlZXAgdGhlIGFib3Zl
LCBhcyB0aGlzIGlzIGdlbmVyaWMgaW5mb3JtYXRpb24gYWJvdXQgaG93IHRvIHVzZSB1RW52LnR4
dCBhbmQgd2hlbiBpdCBpcyBpbnZva2VkPw0KPiANCj4+IC0jIFRoZSBzcGVjaWZpYyBib2FyZCBp
cyBub3QgYWJsZSB0byBiZSBhdXRvbWF0aWNhbGx5IGRldGVjdGVkLiBUaGUgDQo+PiBiZWxvdyBp
cyBhIC0jIHdvcmthcm91bmQgdG8gc2V0IGEgc2FuZSBkZWZhdWx0IGluY2FzZSB0aGUgdXNlciBo
YXMgDQo+PiBub3QgbWFudWFsbHkgY29uZmlndXJlZCAtIyBhIHNwZWNpZmljIGJvYXJkLg0KPj4g
LWRlZl9ib2FyZF9uYW1lPSJhbTY1eCINCj4+IC0NCj4+IC0jIENoZWNrIGlmIHVzaW5nIGRlZmF1
bHQgYm9hcmRfbmFtZSB3aGVuIG5hbWVfb3ZlcmxheXMgaXMgbm90IHNldCANCj4+IC1jaGVja19m
b3JfYm9hcmQ9aWYgdGVzdCAkbmFtZV9vdmVybGF5czsgdGhlbiBlY2hvICJVc2luZyBib2FyZF9u
YW1lIA0KPj4gPSAkYm9hcmRfbmFtZSI7IGVsc2Ugc2V0ZW52IGJvYXJkX25hbWUgJGRlZl9ib2Fy
ZF9uYW1lOyBmaQ0KPj4gLQ0KPj4gLXVlbnZjbWQ9cnVuIGNoZWNrX2Zvcl9ib2FyZDsgcnVuIGZp
bmRmZHQNCj4+IC0tDQo+PiAyLjM2LjENCj4+DQo+Pg0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEzODk2KTogDQo+IGh0dHBzOi8vbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJhZ28vbWVzc2FnZS8xMzg5Ng0KPiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85MTY1MDczMC8zNjE3MTA2
DQo+IEdyb3VwIE93bmVyOiBtZXRhLWFyYWdvK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJh
Z28vdW5zdWIgDQo+IFtqLWh1bXBocmV5c0B0aS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IA0KPiANCg0KLS0gDQpSeWFuIEVhdG1vbiAgICAgICAgICAgICAgICByZWF0bW9uQHRp
LmNvbQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRleGFzIElu
c3RydW1lbnRzLCBJbmMuICAtICBMQ1BEICAtICBNR1RTDQo=

