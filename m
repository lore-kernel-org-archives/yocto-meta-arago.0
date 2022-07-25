Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FB8C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 14:24:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.28898.1658759091093197389
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 07:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=Ce5m5EBI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PEOnMB044358;
	Mon, 25 Jul 2022 09:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658759089;
	bh=nvB9rZ5GuwnJ01KOsLNAz/64pT2EErmibXyhEw2a54w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Ce5m5EBIyey/Zoz+Myq8vj2S8zAm75Y2529cavYLYMZogAAPC/274rQ9RfsAWJ3pp
	 ZNK8JY3g3Nmur3rUj7kO7YGaf8tGGc/Bp83Xlk2kJZd05W4CMObBg+wPCV3w+GWWDa
	 Lx6WUiTsTVUXfuIVL8oka8SmM/1ENYcJWjAPQ/Qg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PEOnnN123986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 09:24:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 09:24:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 09:24:49 -0500
Received: from [10.250.34.242] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PEOmXm074635;
	Mon, 25 Jul 2022 09:24:49 -0500
Message-ID: <b11d274b-6527-9b20-86b3-e9ef678d202b@ti.com>
Date: Mon, 25 Jul 2022 09:24:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][dunfell][PATCH v2] all: Remove reference to
 arago-project.org
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220721123539.24097-1-reatmon@ti.com>
 <a57a187f-bd36-814b-ef74-ae5e1d3aca1e@ti.com>
 <ff35b880-dd7e-7b5a-5b1b-e94114693db2@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <ff35b880-dd7e-7b5a-5b1b-e94114693db2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by lelv0142.ext.ti.com id
 26PEOnMB044358
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 25 Jul 2022 14:24:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13963

T24gNy8yNS8yMiA5OjEzIEFNLCBSeWFuIEVhdG1vbiB3cm90ZToNCj4gDQo+IEl0IGlzIGEg
c2luZ2xlIHRpbnkgdGFyIGJhbGwuwqAgV2Ugd2lsbCBub3QgYmUgYWRkaW5nIGFueSBtb3Jl
IHZlcnNpb25zIG9mIGl0IGdvaW5nIGZvcndhcmQsIGFuZCBkZWFsaW5nIHdpdGggdGhlIGhv
c3RpbmcgaXNzdWUgaXMgbW9yZSBwcm9ibGVtYXRpYyB0aGFuIGp1c3QgcHV0dGluZyB0aGUg
dGFyIGJhbGwgaW4gdGhlIHJlcG8uDQo+IA0KDQpXaGF0IGhvc3RpbmcgaXNzdWU/IEl0J3Mg
YSBwdWJsaWNseSBhdmFpbGFibGUgYmluYXJ5LCBJJ2xsIHB1dCBpdCBpbiBteSBnaXRodWIu
DQoNClRoaXMgaXNuJ3QgcmlnaHQgYW55d2F5LCB3ZSBzaG91bGQgYmUgdGFraW5nIHRoZSBm
aXJtd2FyZSBpbWFnZXMgYW5kIHBhY2thZ2luZw0KdGhlbSBpbnRvIHRoZSBpbml0cmQuY3Bp
byB1c2luZyB0aGUgbm9ybWFsIE9FIG1ldGhvZHMgZm9yIGluaXRyZCBjcmVhdGlvbi4NClBy
ZS1idW5kbGluZyBpc24ndCBjb3JyZWN0IGhlcmUgYW5kIHByZXZlbnRzIHVzIGZyb20gYWRk
aW5nIG1vcmUgdG8gdGhpcyBpbml0cmQgbGF0ZXIuDQpJIGtub3cgdGhhdCdzIGhvdyBpdCB3
YXMgZG9uZSBiZWZvcmUsIGFuZCBJIGFsc28ga25vdyB0aGF0IEtleXN0b25lMiBpc24ndCBz
dXBwb3J0ZWQNCmluIEtpcmtzdG9uZS9NYXN0ZXIgc28gbm9uZSBvZiB0aGlzIG1hdHRlcnMs
IGJ1dCBJJ2Qgc2F5IHRoYXQgaXMgZXZlbiBtb3JlDQpyZWFzb24gbm90IHRvIGZvcmV2ZXIg
cG9sbHV0ZSB0aGUgZ2l0IHJlcG8gd2l0aCB0aGlzIGJsb2IuDQoNCkFuZHJldw0KDQo+IFBs
dXMsIHRoZXJlIGlzIHByZWNlZGVudCBmcm9tIHRoZSBvcGVuZW1iZWRkZWQgcHJvamVjdCBm
b3IgcHV0dGluZyBzbWFsbCB0YXJiYWxscyBpbiB0aGUgcmVjaXBlcyB0aGlzIHdheS4NCj4g
DQo+IA0KPiBPbiA3LzI0LzIwMjIgMTA6NDAsIEFuZHJldyBEYXZpcyB3cm90ZToNCj4+IE9u
IDcvMjEvMjIgNzozNSBBTSwgUnlhbiBFYXRtb24gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgd3JvdGU6DQo+Pj4gYXJhZ28tcHJvamVjdC5vcmcgaXMgYmVpbmcgc2h1dCBkb3duIGlu
IEF1Z3VzdC7CoCBUaGlzDQo+Pj4gY29tbWl0IGNoYW5nZXMgdGhlIGxhc3QgcmVjaXBlcyB0
aGF0IHBvaW50IHRvIHRoYXQNCj4+PiBvbGQgc2l0ZSB0byBwb2ludCB0byBnaXQudGkuY29t
LCBvciBqdXN0IHJtZW92ZSB0aGUNCj4+PiByZWZlcmVuY2UgZW50aXJlbHkuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBSeWFuIEVhdG1vbiA8cmVhdG1vbkB0aS5jb20+DQo+Pj4gLS0t
DQo+Pj4gdjI6IENoYW5nZWQgZGlyIG5hbWUgZm9yIGsyLWZ3LWluaXRyZCBmaWxlcyBhbmQg
cmVtb3ZlZCB1bmVlZGVkIGxpbmUgcGVyDQo+Pj4gZmVlZGJhY2suDQo+Pj4NCj4+PiDCoCBt
ZXRhLWFyYWdvLWRpc3Ryby9SRUFETUXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4+PiDCoCBtZXRhLWFyYWdvLWRpc3Ryby9j
bGFzc2VzL3Rpc2RrLWJ1bmRsZS5iYmNsYXNzwqAgfMKgwqAgMiArLQ0KPj4+IMKgIG1ldGEt
YXJhZ28tZGlzdHJvL2NvbmYvZGlzdHJvL2FyYWdvLmNvbmbCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyIC0tDQo+Pj4gwqAgLi4uL2syLWZ3LWluaXRyZC9rMi1pbml0cmFtZnMtMC4wLjcudGFy
Lmd6wqDCoMKgwqDCoCB8IEJpbiAwIC0+IDQ5NjYwIGJ5dGVzDQo+Pg0KPj4NCj4+IFNhbWUg
Y29tbWVudCBhcyBpbiB2MToNCj4+DQo+PiBTaG91bGRuJ3QgcHV0IGJpbmFyaWVzIGluIGdp
dCwgYmxvYXRzIHRoZSByZXBvIGZvcmV2ZXIuDQo+Pg0KPj4gQ2FuIHdlIGhvc3QgdGhpcyBm
aWxlIHNvbWV3aGVyZSBlbHNlLCB0aS1saW51eC1maXJtd2FyZSBzZWVtcw0KPj4gbGlrZSB0
aGUgcmlnaHQgc3BvdCBnaXZlbiBpdCdzIGEgYnVuY2ggb2YgZmlybXdhcmVzLg0KPj4NCj4+
IEFuZHJldw0KPj4NCj4+DQo+Pj4gwqAgLi4uL2syLWZ3LWluaXRyZC9rMi1mdy1pbml0cmRf
MC4wLjcuYmLCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4+IMKgIC4uLi9yZWNp
cGVzLWNvcmUvYmFzZS1maWxlcy9iYXNlLWZpbGVzL2lzc3VlwqDCoMKgIHzCoMKgIDIgKy0N
Cj4+PiDCoCAuLi4vYmFzZS1maWxlcy9iYXNlLWZpbGVzL2lzc3VlLm5ldMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+Pj4gwqAgLi4uL2ZlZWQtY29uZmlnL2FyYWdv
LWZlZWQtY29uZmlnXzEuMC5iYsKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4+PiDCoCAu
Li4vb2UtbGF5ZXJzZXR1cC9vZS1sYXllcnNldHVwLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMiArLQ0KPj4+IMKgIC4uLi90aS1jcnlwdG8tZXhhbXBsZXNfZ2l0LmJi
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKystLQ0KPj4+
IMKgIC4uLi9sdHAtZGR0L2x0cC1kZHRfMjAyMTA1MjQuYmLCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+Pj4gwqAgLi4uL3JlY2lwZXMtc3VwcG9ydC9p
cHNlY21nci9pcHNlY21nci5pbmPCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4+IMKgIC4u
Li9saWJubC14ZnJtL2xpYm5sLXhmcm1fZ2l0LmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0NCj4+PiDCoCAxMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1ic3AvazItZnctaW5pdHJkL2syLWZ3LWluaXRyZC9r
Mi1pbml0cmFtZnMtMC4wLjcudGFyLmd6DQo+Pj4NCj4gDQo=

