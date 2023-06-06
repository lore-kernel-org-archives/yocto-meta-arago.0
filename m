Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1ACC77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 18:52:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5123.1686077552352067211
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 11:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p4fr+OPU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: b-brnich@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356IqVkb025963
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 13:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686077551;
	bh=hxxBF9TZVJOnsECm80xcsfJAPr3qrBK5BjT+TJrKxWg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=p4fr+OPUifJzgTHibxnE0gbyq/cneCEgpSssdegsoN1UeAV+PUC/+713KsM7fiesP
	 XYhhLRNQ/wheOHvU+i9YuOuaZGmOXN0nCkYd/Z51Cvyr5PlaYXRMGFzV4OFwRi29NM
	 x2CPUuEB0D8ngTG16mLQixMjFTw7epze9XOhgoHo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356IqVn7110344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 13:52:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 13:52:31 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Tue, 6 Jun 2023 13:52:30 -0500
From: "Brnich, Brandon" <b-brnich@ti.com>
To: "Davis, Andrew" <afd@ti.com>, "Etheridge, Darren" <detheridge@ti.com>,
        "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>
CC: "Thakkar, Devarsh" <devarsht@ti.com>
Subject: RE: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: Add kmssink support
Thread-Topic: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: Add kmssink support
Thread-Index: AQHZjOK3E6/2yae29UOBVgIJ22x9i69+LwdA
Date: Tue, 6 Jun 2023 18:52:30 +0000
Message-ID: <4eb452df9ea8424592a290145ed9805b@ti.com>
References: <20230522175821.510236-1-b-brnich@ti.com>
 <1d72f6df-5f49-669d-1a50-d395c7b1c544@ti.com>
In-Reply-To: <1d72f6df-5f49-669d-1a50-d395c7b1c544@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.19.229]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 18:52:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14497

SGVsbG8gQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERh
dmlzLCBBbmRyZXcgPGFmZEB0aS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDIyLCAyMDIzIDI6
MjIgUE0NCj4gVG86IEJybmljaCwgQnJhbmRvbiA8Yi1icm5pY2hAdGkuY29tPjsgRXRoZXJpZGdl
LCBEYXJyZW4NCj4gPGRldGhlcmlkZ2VAdGkuY29tPjsgbWV0YS1hcmFnb0BsaXN0cy55b2N0b3By
b2plY3Qub3JnDQo+IENjOiBUaGFra2FyLCBEZXZhcnNoIDxkZXZhcnNodEB0aS5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbbWV0YS1hcmFnb11bbWFzdGVyL2tpcmtzdG9uZV1bUEFUQ0hdIHJlY2VpcGVz
LW11bHRpbWVkaWE6DQo+IGdzdHJlYW1lcjogQWRkIGttc3Npbmsgc3VwcG9ydA0KPiANCj4gT24g
NS8yMi8yMyAxMjo1OCBQTSwgQnJhbmRvbiBCcm5pY2ggdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgd3JvdGU6DQo+ID4gUmVtb3ZlIHRoZSBvbGQgYmJhcGVuZCBmaWxlcyB0aGF0IGRlYWx0IHdp
dGggb2xkIGdzdHJlYW1lciB2ZXJzaW9uLg0KPiA+IFRoZXNlIGZpbGVzIGFwcGxpZWQgcGF0Y2hl
cyB0byBoYWNrIGdzdHJlYW1lciB0byB3b3JrIHdpdGggb3VyDQo+ID4gZGV2aWNlcy4gV2UgYXJl
IG5vIGxvbmdlciBjYXJyeWluZyB0aGVzZSBwYXRjaGVzIGludG8ga2lya3N0b25lLiBPdXINCj4g
PiBkZXZpY2VzIHNob3VsZCB3b3JrIHdpdGggdGhlIGtpcmtzdG9uZSBwYWNrYWdlZCBnc3RyZWFt
ZXIuDQo+ID4NCj4gDQo+IFRoZSBpbXBvcnRhbnQgcGFydCBvZiB0aGVzZSBwYXRjaGVzIHdhcyBH
U1QgRFJNIEFsbG9jYXRvciBzdXBwb3J0LCBxdWljaw0KPiBjaGVjayBJIHNlZSBpdCB1c2VkIGJ5
Og0KPiANCj4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdnBlDQo+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWR1Y2F0aQ0KPiANCj4gV291bGQgYmUgbmljZSB0byBrZWVwIG11bHRpbWVkaWEgYWNjZWxlcmF0
aW9uIHdvcmtpbmcgb24gYWxsIHRoZSBub24tSzMNCj4gcGxhdGZvcm1zLi4NCj4gDQo+IEknbSBn
dWVzc2luZyB0aGVzZSBjb3VsZCBiZSBjb252ZXJ0ZWQgd2l0aG91dCB0b28gbXVjaCBlZmZvcnQg
dG8gb25lIG9mDQo+IHRoZXNlWzBdIGFuZCBpZiBzbyBkbyB5b3UgaGF2ZSBhbnkgdGltZWxpbmVz
IGZvciB0aGF0Pw0KDQpBdCB0aGlzIHBvaW50IGluIHRpbWUsIHRoZXJlIGlzIG5vIHRpbWVsaW5l
IGZvciBzdXBwb3J0aW5nIHRoZXNlIG9sZCBwbGF0Zm9ybXMuIA0KDQpQb3J0aW5nIHRoZXNlIHBh
dGNoZXMgYXJlIG5vdCB0cml2aWFsIGFzIGdzdHJlYW1lciBzdHJ1Y3R1cmUgaGFzIGNoYW5nZWQg
cXVpdGUNCnNpZ25pZmljYW50bHkgc2luY2UgMS4xNi4gRm9yIEszIHBsYXRmb3JtcywgdGhlIEdT
VCBEUk0gQWxsb2NhdG9yIGlzIG5vdCByZXF1aXJlZC4NCg0KTm90IHN1cmUgd2hhdCBiZXN0IGNv
dXJzZSBvZiBhY3Rpb24gaXMuIElzIGl0IGJlc3QgdG8gbm90IGFjY2VwdCB0aGVzZSBwYXRjaGVz
IGFuZCBsZWF2ZQ0KdGhlIGJiIGFwcGVuZCBmaWxlcyBpbiB0aGUgdHJlZSB3aGVyZSB0aGV5IGFy
ZW4ndCBuZWNlc3NhcmlseSBodXJ0aW5nIGFueXRoaW5nIGJlY2F1c2UNCnRoZSByZXZpc2lvbiBu
dW1iZXIgaXMgd3Jvbmcgc28gbm9uZSBvZiB0aGVzZSBwYXRjaGVzIGFyZSBiZWluZyBhcHBsaWVk
PyANCg0KU2hvdWxkIHRoaXMgc2VyaWVzIGJlIGFjY2VwdGVkPyANCldpdGggdGhpcywgd2UgYXJl
IG9wdGltaXN0aWMgaW4gdGhhdCBzb21lb25lIHdpbGwgZXZlbnR1YWxseSB1cGRhdGUgdGhlIHBh
dGNoZXMgdG8gZW5hYmxlIERSTSBhbGxvY2F0aW9uDQpvbiB0aGVzZSBvdXQgb2YgZGF0ZSBwbGF0
Zm9ybXMuDQoNCklmIGRyb3BwaW5nIGR1Y2F0aSBhbmQgdnBlIHN1cHBvcnQgaXMgY2hvc2VuLCB0
aGVuIFswXSBzaG91bGQgYmUgYWNjZXB0ZWQgDQpiZWNhdXNlIGttc3NpbmsgZW5hYmxlbWVudCBp
cyByZXF1aXJlZCBvbiBLMyBwbGF0Zm9ybXMgYW5kIHNpbmNlIG5vdGhpbmcgZWxzZSBuZWVkcyB0
byBiZQ0KY2hhbmdlZCBvbiBnc3QtcGx1Z2lucy1iYWQsIGFyYWdvLmNvbmYgc2VlbXMgdG8gYmUg
dGhlIHBsYWNlIHRvIGRvIGl0LiBEZW55cyBhbHNvIG1hZGUgdGhhdCByZW1hcmsNCmhlcmUgWzFd
LiBJIGNhbiBzZW5kIGluIGFub3RoZXIgc2VyaWVzIHRvIGp1c3QgZGVsZXRlIHRoaXMgYmJhcGVu
ZCBhcyBhIHdob2xlIHNpbmNlIGVuYWJsZW1lbnQgaXMgbm90DQpuZWVkZWQgaGVyZS4NCg0KR3N0
LXBsdWdpbnMtZ29vZCB3aWxsIG5lZWQgdG8gc3RheSBiZWNhdXNlIHRoZXJlIGlzIGEgcGF0Y2gg
dGhhdCB3aWxsIG5lZWQgdG8gYmUgY2FycmllZCBoZXJlLg0KDQpSZWdhcmRsZXNzLCB0aGlzIHNl
cmllcyB3aWxsIG5lZWQgYSB2Mi4gSnVzdCB0cnlpbmcgdG8gZmlndXJlIG91dCB0aGUgYmVzdCB3
YXkgdG8gYXBwcm9hY2ggdGhpcyBwcm9ibGVtLg0KDQpbMF0gaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvbWV0YS1hcmFnby90b3BpYy85ODk5MDk4NyMxNDQyNg0KWzFdIGh0dHBzOi8v
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJhZ28vdG9waWMvOTkwNzA0NTAjMTQ0MzQN
Cg0KPiANCj4gWzBdDQo+IGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9kb2N1bWVu
dGF0aW9uL2FsbG9jYXRvcnMvaW5kZXguaHRtbD9naQ0KPiAtbGFuZ3VhZ2U9Yw0KPiANCj4gQW5k
cmV3DQoNCkJlc3QsIA0KQnJhbmRvbg0K

