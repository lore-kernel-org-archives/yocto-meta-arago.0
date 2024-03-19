Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98828CD11C2
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:25:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18586.1710861892022717125
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 Mar 2024 08:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jVvbRoCn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42JFOn2V060050;
	Tue, 19 Mar 2024 10:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710861889;
	bh=q2BznWPWDblQP6LkKbO/IOUmt8XqsCNpngU21+hxEHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jVvbRoCn30LoXJaydai+56Qdt8sIhlvqoTcQJ9nEecVATB0CmLE0zYnJn+Jdm5Te0
	 zSLguS9JGjc1MDleRBnBsaLYrLpl/3q2nHEOg6/2BZFwsFgr7+mMoMOjT55iEpfvfx
	 RiCc439vaUCKdAhPNpnVfHfwzPtMXc8t6OQ2gDIk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42JFOntD050719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 10:24:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 10:24:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 10:24:48 -0500
Received: from [10.249.32.72] ([10.249.32.72])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42JFOmbs084311;
	Tue, 19 Mar 2024 10:24:48 -0500
Message-ID: <05cbf208-8225-4cb5-8da9-b1ad74de4633@ti.com>
Date: Tue, 19 Mar 2024 10:24:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] base-files: Remove fstab override
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191145.67894-1-afd@ti.com>
 <20240305204954.GI6072@denix.org>
 <ac416e5d-0e01-4db8-a780-f35fc1f73b27@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ac416e5d-0e01-4db8-a780-f35fc1f73b27@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllv0016.ext.ti.com id 42JFOn2V060050
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 Mar 2024 15:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15241

DQoNCk9uIDMvMTkvMjAyNCAxMDoxOCBBTSwgQW5kcmV3IERhdmlzIHdyb3RlOg0KPiBPbiAz
LzUvMjQgMjo0OSBQTSwgRGVueXMgRG15dHJpeWVua28gd3JvdGU6DQo+PiBPbiBUdWUsIE1h
ciAwNSwgMjAyNCBhdCAwMToxMTo0NVBNIC0wNjAwLCBBbmRyZXcgRGF2aXMgdmlhIA0KPj4g
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4+PiBUaGVyZSBpcyBhbHJlYWR5IGEg
dmVyc2lvbiBvZiB0aGlzIGZpbGUgcHJvdmlkZWQgYnkgb2UtY29yZSB0aGF0DQo+Pj4gaXMg
a2VwdCB1cCB0byBkYXRlLiBEbyBub3Qgb3ZlcnJpZGUgaXQuDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAgLi4u
L3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvZnN0YWLCoMKgwqDCoMKgwqDC
oCB8IDEzIC0tLS0tLS0tLS0tLS0NCj4+PiDCoCAuLi4vcmVjaXBlcy1jb3JlL2Jhc2UtZmls
ZXMvYmFzZS1maWxlc18lLmJiYXBwZW5kwqDCoCB8wqAgMiArLQ0KPj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE0IGRlbGV0aW9ucygtKQ0KPj4+IMKgIGRlbGV0
ZSBtb2RlIDEwMDY0NCANCj4+PiBtZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvYmFz
ZS1maWxlcy9iYXNlLWZpbGVzL2ZzdGFiDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IA0KPj4+IGEv
bWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlcy9m
c3RhYiANCj4+PiBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVz
L2Jhc2UtZmlsZXMvZnN0YWINCj4+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBp
bmRleCA4ZGRhZGQ5OC4uMDAwMDAwMDANCj4+PiAtLS0gYS9tZXRhLWFyYWdvLWRpc3Ryby9y
ZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzL2ZzdGFiDQo+Pj4gKysrIC9kZXYv
bnVsbA0KPj4+IEBAIC0xLDEzICswLDAgQEANCj4+PiAtIyBzdG9jayBmc3RhYiAtIHlvdSBw
cm9iYWJseSB3YW50IHRvIG92ZXJyaWRlIHRoaXMgd2l0aCBhIG1hY2hpbmUgDQo+Pj4gc3Bl
Y2lmaWMgb25lDQo+Pj4gLQ0KPj4+IC0vZGV2L3Jvb3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdXRvICAgICAgIA0K
Pj4+IGRlZmF1bHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgIDENCj4+PiAtcHJv
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC9wcm9jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHByb2MgICAgICAgDQo+Pj4gZGVmYXVsdHPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAwwqAgMA0KPj4+IC1kZXZwdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC9kZXYvcHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldnB0cyAgICAgDQo+
Pj4gbW9kZT0wNjIwLGdpZD01wqDCoMKgwqDCoMKgIDDCoCAwDQo+Pj4gLXVzYmRldmZzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC9wcm9jL2J1cy91c2LCoMKgwqDCoMKgwqDCoCB1c2Jk
ZXZmcyAgIA0KPj4+IG5vYXV0b8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqAg
MA0KPj4+IC10bXBmc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvcnVuwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG1wZnMgICAgICANCj4+PiBtb2RlPTA3NTUs
bm9kZXYsbm9zdWlkLHN0cmljdGF0aW1lIDDCoCAwDQo+Pg0KPj4+IC10bXBmc8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvdmFyL3ZvbGF0aWxlwqDCoMKgwqDCoMKgwqAgdG1w
ZnMgICAgICANCj4+PiBkZWZhdWx0cyxzaXplPTUwTcKgwqDCoMKgIDDCoCAwDQo+Pj4gLXRt
cGZzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC9tZWRpYS9yYW3CoMKgwqDCoMKg
wqDCoMKgwqDCoCB0bXBmcyAgICAgIA0KPj4+IGRlZmF1bHRzLHNpemU9MTZNwqDCoMKgwqAg
MMKgIDANCj4+DQo+PiBUaGUgbWFqb3IgZGlmZmVyZW5jZSBpcyB0aGVzZSAyIHRtcGZzIGVu
dHJpZXMgLSB1cHN0cmVhbSBkb2Vzbid0IGhhdmUNCj4+IC9tZWRpYS9yYW0sIGFzIHRoYXQg
d2FzIHNvbWV0aGluZyBUSSB0ZXN0aW5nIGZyYW1ld29yayB3YXMgdXNpbmcuIFBsdXMNCj4+
IHVwc3RyZWFtIGRvZXNuJ3Qgc2V0IHRoZSBzaXplIHBhcmFtZXRlciAtIGJ5IGRlZmF1bHQg
dXAgdG8gNTAlIG9mIFJBTSBjYW4NCj4+IGdldCB1c2VkIGJ5IHRtcGZzIGFuZCB0aGVyZSB3
ZXJlIGlzc3VlcyB3aXRoIHNvbWUgbG93LVJBTSBsZWdhY3kgDQo+PiBwbGF0Zm9ybXMNCj4+
IGluIHRoZSBwYXN0Lg0KPj4NCj4+IElmIG5laXRoZXIgb2YgdGhlc2UgZGlmZmVyZW5jZXMg
bWF0dGVyIGFueSBsb25nZXIsIHRoaXMgY2FuIGJlIHJlbW92ZWQuDQo+Pg0KPiANCj4gSWYg
dGhlIHRlc3RzIGRvIG5lZWQgdGhpcywgdGhlbiB0aGV5IHNob3VsZCBtb3VudCB0aGUgbmVl
ZGVkIHRtcGZzIGFzIHBhcnQNCj4gb2YgdGhlIHRlc3Qgc2V0dXAsIG5vdCBqdXN0IGFzc3Vt
ZSBpdCB0byBiZSBzZXR1cCBieSB0aGUgZGlzdHJvLiBTaW1wbGUgYXM6DQo+IA0KPiAjIG1v
dW50IC10IHRtcGZzIC1vIHNpemU9NTBNIHRtcGZzIC9tZWRpYS9yYW0NCj4gDQo+IFRoZSBv
bmx5IHdheSB0byBwdXNoIHRoZSB0ZXN0IGZyYW1ld29yayB0byBkbyB0aGUgcmlnaHQgdGhp
bmcgaXMgdG8NCj4gc3RvcCBkb2luZyBpdCBmb3IgaXQuDQoNCkluIGdlbmVyYWwgSSBhZ3Jl
ZSwgYnV0IHRoYXQgaXMgZWFzaWVyIHNhaWQgdGhhbiBkb25lLiAgV2UgbmVlZCB0byANCmNv
b3JkaW5hdGUgdGhpcyBjaGFuZ2Ugd2l0aCB0aGUgdGVzdCB0ZWFtLCBub3QganVzdCBkdW1w
IGl0IG9uIHRoZW0uIA0KSSdtIG5vdCByZWplY3RpbmcgdGhpcyBwYXRjaCwganVzdCB3YWl0
aW5nIHVudGlsIHRlc3QgaGFzIGNvbmZpcm1lZCB3ZSANCm5vIGxvbmdlciBuZWVkIGl0Lg0K
DQoNCj4gQW5kcmV3DQo+IA0KPj4NCj4+PiAtIyB1bmNvbW1lbnQgdGhpcyBpZiB5b3VyIGRl
dmljZSBoYXMgYSBTRC9NTUMvVHJhbnNmbGFzaCBzbG90DQo+Pj4gLSMvZGV2L21tY2JsazBw
McKgwqDCoMKgwqDCoCAvbWVkaWEvY2FyZMKgwqDCoMKgwqDCoMKgwqDCoCBhdXRvICAgICAg
IA0KPj4+IGRlZmF1bHRzLHN5bmMsbm9hdXRvwqAgMMKgIDANCj4+PiAtDQo+Pj4gZGlmZiAt
LWdpdCANCj4+PiBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVz
L2Jhc2UtZmlsZXNfJS5iYmFwcGVuZCANCj4+PiBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lw
ZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXNfJS5iYmFwcGVuZA0KPj4+IGluZGV4IGU1
YzUzZTgwLi43ZDFmNjc1MSAxMDA2NDQNCj4+PiAtLS0gYS9tZXRhLWFyYWdvLWRpc3Ryby9y
ZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzXyUuYmJhcHBlbmQNCj4+PiArKysg
Yi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVz
XyUuYmJhcHBlbmQNCj4+PiBAQCAtMSw0ICsxLDQgQEANCj4+PiDCoCAjIGxvb2sgZm9yIGZp
bGVzIGluIHRoaXMgbGF5ZXIgZmlyc3QNCj4+PiDCoCBGSUxFU0VYVFJBUEFUSFM6cHJlcGVu
ZCA6PSAiJHtUSElTRElSfS8ke1BOfToiDQo+Pj4gLVBSOmFwcGVuZCA9ICIuYXJhZ280Ig0K
Pj4+ICtQUjphcHBlbmQgPSAiLmFyYWdvNSINCj4+PiAtLSANCj4+PiAyLjM5LjINCg0KLS0g
DQpSeWFuIEVhdG1vbiAgICAgICAgICAgICAgICByZWF0bW9uQHRpLmNvbQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRleGFzIEluc3RydW1lbnRzLCBJ
bmMuICAtICBMQ1BEICAtICBNR1RTDQo=

