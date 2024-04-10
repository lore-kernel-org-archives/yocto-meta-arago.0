Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8528CCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:22:30 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2747.1712762543774972834
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=MmvXG5zF;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43AFMHkZ104195;
	Wed, 10 Apr 2024 10:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712762537;
	bh=Ls8LmrqpNHlyWUt2KHxc7MWM97YS/lVlfrNHKQSwrmM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MmvXG5zFa8RK3iyelhdnPyMiT0462VPSSsX+30dajdmzfDECN3iZrj7Uv3An4bd3Q
	 C3ILcfLVsJT4IX/SglOlUhfmraE512WLjFqIv5XZLql9tKWhReRx3447aqu0foYzI4
	 cQsZdPKp9OjRO/KaKNyTbFUnwQPqHWVeJwCmjGWU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43AFMHG1084904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Apr 2024 10:22:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 10:22:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 10:22:17 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43AFMHel117351;
	Wed, 10 Apr 2024 10:22:17 -0500
Message-ID: <a7383756-961c-4c6c-a8e4-5c3e03b910a5@ti.com>
Date: Wed, 10 Apr 2024 10:22:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] base-files: Remove fstab override
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240305191145.67894-1-afd@ti.com>
 <20240305204954.GI6072@denix.org>
 <ac416e5d-0e01-4db8-a780-f35fc1f73b27@ti.com>
 <17BE33D39135657C.24580@lists.yoctoproject.org>
 <1f15050c-98ab-4df1-a843-1975c771c285@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1f15050c-98ab-4df1-a843-1975c771c285@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by lelv0143.ext.ti.com id 43AFMHkZ104195
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 10 Apr 2024 15:22:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15260

T24gNC84LzI0IDEwOjAxIEFNLCBSeWFuIEVhdG1vbiB3cm90ZToNCj4gDQo+IA0KPiBPbiAz
LzE5LzIwMjQgMTA6MjQgQU0sIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAzLzE5LzIwMjQgMTA6MTggQU0sIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4+PiBPbiAzLzUvMjQgMjo0OSBQTSwgRGVueXMgRG15dHJpeWVua28g
d3JvdGU6DQo+Pj4+IE9uIFR1ZSwgTWFyIDA1LCAyMDI0IGF0IDAxOjExOjQ1UE0gLTA2MDAs
IEFuZHJldyBEYXZpcyB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4+Pj4+
IFRoZXJlIGlzIGFscmVhZHkgYSB2ZXJzaW9uIG9mIHRoaXMgZmlsZSBwcm92aWRlZCBieSBv
ZS1jb3JlIHRoYXQNCj4+Pj4+IGlzIGtlcHQgdXAgdG8gZGF0ZS4gRG8gbm90IG92ZXJyaWRl
IGl0Lg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRp
LmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gwqAgLi4uL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVz
L2Jhc2UtZmlsZXMvZnN0YWLCoMKgwqDCoMKgwqDCoCB8IDEzIC0tLS0tLS0tLS0tLS0NCj4+
Pj4+IMKgIC4uLi9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzXyUuYmJhcHBl
bmTCoMKgIHzCoCAyICstDQo+Pj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxNCBkZWxldGlvbnMoLSkNCj4+Pj4+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
LWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzL2ZzdGFi
DQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMt
Y29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvZnN0YWIgYi9tZXRhLWFyYWdvLWRpc3Ryby9y
ZWNpcGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzL2ZzdGFiDQo+Pj4+PiBkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4+IGluZGV4IDhkZGFkZDk4Li4wMDAwMDAwMA0KPj4+
Pj4gLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFz
ZS1maWxlcy9mc3RhYg0KPj4+Pj4gKysrIC9kZXYvbnVsbA0KPj4+Pj4gQEAgLTEsMTMgKzAs
MCBAQA0KPj4+Pj4gLSMgc3RvY2sgZnN0YWIgLSB5b3UgcHJvYmFibHkgd2FudCB0byBvdmVy
cmlkZSB0aGlzIHdpdGggYSBtYWNoaW5lIHNwZWNpZmljIG9uZQ0KPj4+Pj4gLQ0KPj4+Pj4g
LS9kZXYvcm9vdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGF1dG8gZGVmYXVsdHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAxwqAgMQ0KPj4+Pj4gLXByb2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvcHJvY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcm9jIGRlZmF1bHRzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgIDANCj4+Pj4+IC1kZXZwdHPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC9kZXYvcHRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dnB0cyBtb2RlPTA2MjAsZ2lkPTXCoMKgwqDCoMKgwqAgMMKgIDANCj4+Pj4+IC11c2JkZXZm
c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvcHJvYy9idXMvdXNiwqDCoMKgwqDCoMKgwqAg
dXNiZGV2ZnMgbm9hdXRvwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDDCoCAwDQo+
Pj4+PiAtdG1wZnPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL3J1bsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRtcGZzIG1vZGU9MDc1NSxub2Rldixub3N1aWQs
c3RyaWN0YXRpbWUgMMKgIDANCj4+Pj4NCj4+Pj4+IC10bXBmc8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvdmFyL3ZvbGF0aWxlwqDCoMKgwqDCoMKgwqAgdG1wZnMgZGVmYXVs
dHMsc2l6ZT01ME3CoMKgwqDCoCAwwqAgMA0KPj4+Pj4gLXRtcGZzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC9tZWRpYS9yYW3CoMKgwqDCoMKgwqDCoMKgwqDCoCB0bXBmcyBk
ZWZhdWx0cyxzaXplPTE2TcKgwqDCoMKgIDDCoCAwDQo+Pj4+DQo+Pj4+IFRoZSBtYWpvciBk
aWZmZXJlbmNlIGlzIHRoZXNlIDIgdG1wZnMgZW50cmllcyAtIHVwc3RyZWFtIGRvZXNuJ3Qg
aGF2ZQ0KPj4+PiAvbWVkaWEvcmFtLCBhcyB0aGF0IHdhcyBzb21ldGhpbmcgVEkgdGVzdGlu
ZyBmcmFtZXdvcmsgd2FzIHVzaW5nLiBQbHVzDQo+Pj4+IHVwc3RyZWFtIGRvZXNuJ3Qgc2V0
IHRoZSBzaXplIHBhcmFtZXRlciAtIGJ5IGRlZmF1bHQgdXAgdG8gNTAlIG9mIFJBTSBjYW4N
Cj4+Pj4gZ2V0IHVzZWQgYnkgdG1wZnMgYW5kIHRoZXJlIHdlcmUgaXNzdWVzIHdpdGggc29t
ZSBsb3ctUkFNIGxlZ2FjeSBwbGF0Zm9ybXMNCj4+Pj4gaW4gdGhlIHBhc3QuDQo+Pj4+DQo+
Pj4+IElmIG5laXRoZXIgb2YgdGhlc2UgZGlmZmVyZW5jZXMgbWF0dGVyIGFueSBsb25nZXIs
IHRoaXMgY2FuIGJlIHJlbW92ZWQuDQo+Pj4+DQo+Pj4NCj4+PiBJZiB0aGUgdGVzdHMgZG8g
bmVlZCB0aGlzLCB0aGVuIHRoZXkgc2hvdWxkIG1vdW50IHRoZSBuZWVkZWQgdG1wZnMgYXMg
cGFydA0KPj4+IG9mIHRoZSB0ZXN0IHNldHVwLCBub3QganVzdCBhc3N1bWUgaXQgdG8gYmUg
c2V0dXAgYnkgdGhlIGRpc3Ryby4gU2ltcGxlIGFzOg0KPj4+DQo+Pj4gIyBtb3VudCAtdCB0
bXBmcyAtbyBzaXplPTUwTSB0bXBmcyAvbWVkaWEvcmFtDQo+Pj4NCj4+PiBUaGUgb25seSB3
YXkgdG8gcHVzaCB0aGUgdGVzdCBmcmFtZXdvcmsgdG8gZG8gdGhlIHJpZ2h0IHRoaW5nIGlz
IHRvDQo+Pj4gc3RvcCBkb2luZyBpdCBmb3IgaXQuDQo+Pg0KPj4gSW4gZ2VuZXJhbCBJIGFn
cmVlLCBidXQgdGhhdCBpcyBlYXNpZXIgc2FpZCB0aGFuIGRvbmUuwqAgV2UgbmVlZCB0byBj
b29yZGluYXRlIHRoaXMgY2hhbmdlIHdpdGggdGhlIHRlc3QgdGVhbSwgbm90IGp1c3QgZHVt
cCBpdCBvbiB0aGVtLiBJJ20gbm90IHJlamVjdGluZyB0aGlzIHBhdGNoLCBqdXN0IHdhaXRp
bmcgdW50aWwgdGVzdCBoYXMgY29uZmlybWVkIHdlIG5vIGxvbmdlciBuZWVkIGl0Lg0KPiAN
Cj4gR29vZCBuZXdzLsKgIFdlIHJhbiBhIHNwZWNpYWwgc2V0IG9mIFJDIHRlc3RzIHdpdGgg
dGhpcyBjaGFuZ2UgaW4gcGxhY2UgYW5kIGV2ZXJ5dGhpbmcgbG9va3MgbGlrZSBmaW5lLsKg
IEknbGwgYWNjZXB0IHRoaXMgcGF0Y2ggbm93IGZvciBzY2FydGhnYXAvbWFzdGVyLg0KPiAN
Cg0KR3JlYXQhIFRoYW5rcyBmb3Igc2V0dGluZyB1cCBhbmQgcnVubmluZyB0aGUgZXh0cmEg
dGVzdHMgZm9yIHRoaXMNCg0KQW5kcmV3DQoNCj4gDQo+Pg0KPj4+IEFuZHJldw0KPj4+DQo+
Pj4+DQo+Pj4+PiAtIyB1bmNvbW1lbnQgdGhpcyBpZiB5b3VyIGRldmljZSBoYXMgYSBTRC9N
TUMvVHJhbnNmbGFzaCBzbG90DQo+Pj4+PiAtIy9kZXYvbW1jYmxrMHAxwqDCoMKgwqDCoMKg
IC9tZWRpYS9jYXJkwqDCoMKgwqDCoMKgwqDCoMKgIGF1dG8gZGVmYXVsdHMsc3luYyxub2F1
dG/CoCAwwqAgMA0KPj4+Pj4gLQ0KPj4+Pj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlz
dHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXNfJS5iYmFwcGVuZCBiL21l
dGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXNfJS5i
YmFwcGVuZA0KPj4+Pj4gaW5kZXggZTVjNTNlODAuLjdkMWY2NzUxIDEwMDY0NA0KPj4+Pj4g
LS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL2Jhc2UtZmlsZXMvYmFzZS1m
aWxlc18lLmJiYXBwZW5kDQo+Pj4+PiArKysgYi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVz
LWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzXyUuYmJhcHBlbmQNCj4+Pj4+IEBAIC0xLDQg
KzEsNCBAQA0KPj4+Pj4gwqAgIyBsb29rIGZvciBmaWxlcyBpbiB0aGlzIGxheWVyIGZpcnN0
DQo+Pj4+PiDCoCBGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS8ke1BO
fToiDQo+Pj4+PiAtUFI6YXBwZW5kID0gIi5hcmFnbzQiDQo+Pj4+PiArUFI6YXBwZW5kID0g
Ii5hcmFnbzUiDQo+Pj4+PiAtLSANCj4+Pj4+IDIuMzkuMg0KPj4NCj4gDQo=

