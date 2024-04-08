Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977F9CD1296
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 15:01:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.109014.1712588474814662183
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 08:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=EPEFRLjs;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 438F1AY0070106;
	Mon, 8 Apr 2024 10:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712588470;
	bh=E4WRFpK7q+POkosLqPQwxKlw+jkwVVH22FVgcXB1yr0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EPEFRLjsGGkVcw0za8lq5EbNx0v1pR6sT4H3SLpQB4STRGdaXlOnU3Cb+4Xm2cM+m
	 xPtNDU56VdhqwsAXvIUSP0xFvGFQqlq1n+yZaNFIWiiTVHhuG2jnAE0vEWwLiuKSI7
	 VkFH7qZ3nAgZDCOqwd2/Kr0vvKIppdPuf0ou3ZWI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 438F1Ai5032297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Apr 2024 10:01:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Apr 2024 10:01:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Apr 2024 10:01:10 -0500
Received: from [10.249.32.64] ([10.249.32.64])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 438F1AmS012732;
	Mon, 8 Apr 2024 10:01:10 -0500
Message-ID: <1f15050c-98ab-4df1-a843-1975c771c285@ti.com>
Date: Mon, 8 Apr 2024 10:01:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] base-files: Remove fstab override
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191145.67894-1-afd@ti.com>
 <20240305204954.GI6072@denix.org>
 <ac416e5d-0e01-4db8-a780-f35fc1f73b27@ti.com>
 <17BE33D39135657C.24580@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17BE33D39135657C.24580@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllv0015.ext.ti.com id 438F1AY0070106
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Apr 2024 15:01:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15259

DQoNCk9uIDMvMTkvMjAyNCAxMDoyNCBBTSwgUnlhbiBFYXRtb24gdmlhIGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgd3JvdGU6DQo+IA0KPiANCj4gT24gMy8xOS8yMDI0IDEwOjE4IEFNLCBB
bmRyZXcgRGF2aXMgd3JvdGU6DQo+PiBPbiAzLzUvMjQgMjo0OSBQTSwgRGVueXMgRG15dHJp
eWVua28gd3JvdGU6DQo+Pj4gT24gVHVlLCBNYXIgMDUsIDIwMjQgYXQgMDE6MTE6NDVQTSAt
MDYwMCwgQW5kcmV3IERhdmlzIHZpYSANCj4+PiBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdy
b3RlOg0KPj4+PiBUaGVyZSBpcyBhbHJlYWR5IGEgdmVyc2lvbiBvZiB0aGlzIGZpbGUgcHJv
dmlkZWQgYnkgb2UtY29yZSB0aGF0DQo+Pj4+IGlzIGtlcHQgdXAgdG8gZGF0ZS4gRG8gbm90
IG92ZXJyaWRlIGl0Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgRGF2aXMg
PGFmZEB0aS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCAuLi4vcmVjaXBlcy1jb3JlL2Jhc2Ut
ZmlsZXMvYmFzZS1maWxlcy9mc3RhYsKgwqDCoMKgwqDCoMKgIHwgMTMgDQo+Pj4+IC0tLS0t
LS0tLS0tLS0NCj4+Pj4gwqAgLi4uL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmls
ZXNfJS5iYmFwcGVuZMKgwqAgfMKgIDIgKy0NCj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMTQgZGVsZXRpb25zKC0pDQo+Pj4+IMKgIGRlbGV0ZSBtb2RlIDEw
MDY0NCANCj4+Pj4gbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMv
YmFzZS1maWxlcy9mc3RhYg0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IA0KPj4+PiBhL21ldGEt
YXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvZnN0YWIg
DQo+Pj4+IGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFz
ZS1maWxlcy9mc3RhYg0KPj4+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5k
ZXggOGRkYWRkOTguLjAwMDAwMDAwDQo+Pj4+IC0tLSBhL21ldGEtYXJhZ28tZGlzdHJvL3Jl
Y2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvZnN0YWINCj4+Pj4gKysrIC9kZXYv
bnVsbA0KPj4+PiBAQCAtMSwxMyArMCwwIEBADQo+Pj4+IC0jIHN0b2NrIGZzdGFiIC0geW91
IHByb2JhYmx5IHdhbnQgdG8gb3ZlcnJpZGUgdGhpcyB3aXRoIGEgbWFjaGluZSANCj4+Pj4g
c3BlY2lmaWMgb25lDQo+Pj4+IC0NCj4+Pj4gLS9kZXYvcm9vdMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgL8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1dG8gDQo+
Pj4+IGRlZmF1bHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMcKgIDENCj4+Pj4gLXBy
b2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvcHJvY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwcm9jIA0KPj4+PiBkZWZhdWx0c8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDDCoCAwDQo+Pj4+IC1kZXZwdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC9kZXYvcHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldnB0cyANCj4+Pj4gbW9k
ZT0wNjIwLGdpZD01wqDCoMKgwqDCoMKgIDDCoCAwDQo+Pj4+IC11c2JkZXZmc8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvcHJvYy9idXMvdXNiwqDCoMKgwqDCoMKgwqAgdXNiZGV2ZnMg
DQo+Pj4+IG5vYXV0b8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqAgMA0KPj4+
PiAtdG1wZnPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL3J1bsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRtcGZzIA0KPj4+PiBtb2RlPTA3NTUsbm9kZXYsbm9z
dWlkLHN0cmljdGF0aW1lIDDCoCAwDQo+Pj4NCj4+Pj4gLXRtcGZzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC92YXIvdm9sYXRpbGXCoMKgwqDCoMKgwqDCoCB0bXBmcyANCj4+
Pj4gZGVmYXVsdHMsc2l6ZT01ME3CoMKgwqDCoCAwwqAgMA0KPj4+PiAtdG1wZnPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL21lZGlhL3JhbcKgwqDCoMKgwqDCoMKgwqDCoMKg
IHRtcGZzIA0KPj4+PiBkZWZhdWx0cyxzaXplPTE2TcKgwqDCoMKgIDDCoCAwDQo+Pj4NCj4+
PiBUaGUgbWFqb3IgZGlmZmVyZW5jZSBpcyB0aGVzZSAyIHRtcGZzIGVudHJpZXMgLSB1cHN0
cmVhbSBkb2Vzbid0IGhhdmUNCj4+PiAvbWVkaWEvcmFtLCBhcyB0aGF0IHdhcyBzb21ldGhp
bmcgVEkgdGVzdGluZyBmcmFtZXdvcmsgd2FzIHVzaW5nLiBQbHVzDQo+Pj4gdXBzdHJlYW0g
ZG9lc24ndCBzZXQgdGhlIHNpemUgcGFyYW1ldGVyIC0gYnkgZGVmYXVsdCB1cCB0byA1MCUg
b2YgUkFNIA0KPj4+IGNhbg0KPj4+IGdldCB1c2VkIGJ5IHRtcGZzIGFuZCB0aGVyZSB3ZXJl
IGlzc3VlcyB3aXRoIHNvbWUgbG93LVJBTSBsZWdhY3kgDQo+Pj4gcGxhdGZvcm1zDQo+Pj4g
aW4gdGhlIHBhc3QuDQo+Pj4NCj4+PiBJZiBuZWl0aGVyIG9mIHRoZXNlIGRpZmZlcmVuY2Vz
IG1hdHRlciBhbnkgbG9uZ2VyLCB0aGlzIGNhbiBiZSByZW1vdmVkLg0KPj4+DQo+Pg0KPj4g
SWYgdGhlIHRlc3RzIGRvIG5lZWQgdGhpcywgdGhlbiB0aGV5IHNob3VsZCBtb3VudCB0aGUg
bmVlZGVkIHRtcGZzIGFzIA0KPj4gcGFydA0KPj4gb2YgdGhlIHRlc3Qgc2V0dXAsIG5vdCBq
dXN0IGFzc3VtZSBpdCB0byBiZSBzZXR1cCBieSB0aGUgZGlzdHJvLiANCj4+IFNpbXBsZSBh
czoNCj4+DQo+PiAjIG1vdW50IC10IHRtcGZzIC1vIHNpemU9NTBNIHRtcGZzIC9tZWRpYS9y
YW0NCj4+DQo+PiBUaGUgb25seSB3YXkgdG8gcHVzaCB0aGUgdGVzdCBmcmFtZXdvcmsgdG8g
ZG8gdGhlIHJpZ2h0IHRoaW5nIGlzIHRvDQo+PiBzdG9wIGRvaW5nIGl0IGZvciBpdC4NCj4g
DQo+IEluIGdlbmVyYWwgSSBhZ3JlZSwgYnV0IHRoYXQgaXMgZWFzaWVyIHNhaWQgdGhhbiBk
b25lLsKgIFdlIG5lZWQgdG8gDQo+IGNvb3JkaW5hdGUgdGhpcyBjaGFuZ2Ugd2l0aCB0aGUg
dGVzdCB0ZWFtLCBub3QganVzdCBkdW1wIGl0IG9uIHRoZW0uIEknbSANCj4gbm90IHJlamVj
dGluZyB0aGlzIHBhdGNoLCBqdXN0IHdhaXRpbmcgdW50aWwgdGVzdCBoYXMgY29uZmlybWVk
IHdlIG5vIA0KPiBsb25nZXIgbmVlZCBpdC4NCg0KR29vZCBuZXdzLiAgV2UgcmFuIGEgc3Bl
Y2lhbCBzZXQgb2YgUkMgdGVzdHMgd2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZSANCmFuZCBl
dmVyeXRoaW5nIGxvb2tzIGxpa2UgZmluZS4gIEknbGwgYWNjZXB0IHRoaXMgcGF0Y2ggbm93
IGZvciANCnNjYXJ0aGdhcC9tYXN0ZXIuDQoNCg0KPiANCj4+IEFuZHJldw0KPj4NCj4+Pg0K
Pj4+PiAtIyB1bmNvbW1lbnQgdGhpcyBpZiB5b3VyIGRldmljZSBoYXMgYSBTRC9NTUMvVHJh
bnNmbGFzaCBzbG90DQo+Pj4+IC0jL2Rldi9tbWNibGswcDHCoMKgwqDCoMKgwqAgL21lZGlh
L2NhcmTCoMKgwqDCoMKgwqDCoMKgwqAgYXV0byANCj4+Pj4gZGVmYXVsdHMsc3luYyxub2F1
dG/CoCAwwqAgMA0KPj4+PiAtDQo+Pj4+IGRpZmYgLS1naXQgDQo+Pj4+IGEvbWV0YS1hcmFn
by1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1maWxlc18lLmJiYXBwZW5k
IA0KPj4+PiBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jh
c2UtZmlsZXNfJS5iYmFwcGVuZA0KPj4+PiBpbmRleCBlNWM1M2U4MC4uN2QxZjY3NTEgMTAw
NjQ0DQo+Pj4+IC0tLSBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZp
bGVzL2Jhc2UtZmlsZXNfJS5iYmFwcGVuZA0KPj4+PiArKysgYi9tZXRhLWFyYWdvLWRpc3Ry
by9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzXyUuYmJhcHBlbmQNCj4+Pj4g
QEAgLTEsNCArMSw0IEBADQo+Pj4+IMKgICMgbG9vayBmb3IgZmlsZXMgaW4gdGhpcyBsYXll
ciBmaXJzdA0KPj4+PiDCoCBGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElS
fS8ke1BOfToiDQo+Pj4+IC1QUjphcHBlbmQgPSAiLmFyYWdvNCINCj4+Pj4gK1BSOmFwcGVu
ZCA9ICIuYXJhZ281Ig0KPj4+PiAtLSANCj4+Pj4gMi4zOS4yDQo+IA0KDQotLSANClJ5YW4g
RWF0bW9uICAgICAgICAgICAgICAgIHJlYXRtb25AdGkuY29tDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGV4YXMgSW5zdHJ1bWVudHMsIEluYy4gIC0g
IExDUEQgIC0gIE1HVFMNCg==

