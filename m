Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDB1C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 14:14:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.28542.1658758442904580917
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 25 Jul 2022 07:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=P1FrRWOq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26PEDxdI060526;
	Mon, 25 Jul 2022 09:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658758439;
	bh=O8S52wav0+RjNDEKa03C559lKDWqzJHOU+19E/FP3Yk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=P1FrRWOqH1pbeTsOnLqUy5IYUN05F6AGZKIicvrWDMnEc5/t6mNBW+cPbi1PMLyPs
	 Q85sHs0f2A12OMGboHQG8PTR3jHEHu4Z+mQve7yZI+MSCtK8vE415KUIuzOfch9cM0
	 roXWsljtWldDi3jJnLGF8Fp+hpWbRAYqvw2MNjRA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26PEDxcq012451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Jul 2022 09:13:59 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Jul 2022 09:13:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Jul 2022 09:13:20 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26PEDKDw022091;
	Mon, 25 Jul 2022 09:13:20 -0500
Message-ID: <ff35b880-dd7e-7b5a-5b1b-e94114693db2@ti.com>
Date: Mon, 25 Jul 2022 09:13:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arago][dunfell][PATCH v2] all: Remove reference to
 arago-project.org
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220721123539.24097-1-reatmon@ti.com>
 <a57a187f-bd36-814b-ef74-ae5e1d3aca1e@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <a57a187f-bd36-814b-ef74-ae5e1d3aca1e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllv0016.ext.ti.com id
 26PEDxdI060526
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 25 Jul 2022 14:14:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13962

DQpJdCBpcyBhIHNpbmdsZSB0aW55IHRhciBiYWxsLiAgV2Ugd2lsbCBub3QgYmUgYWRkaW5n
IGFueSBtb3JlIHZlcnNpb25zIA0Kb2YgaXQgZ29pbmcgZm9yd2FyZCwgYW5kIGRlYWxpbmcg
d2l0aCB0aGUgaG9zdGluZyBpc3N1ZSBpcyBtb3JlIA0KcHJvYmxlbWF0aWMgdGhhbiBqdXN0
IHB1dHRpbmcgdGhlIHRhciBiYWxsIGluIHRoZSByZXBvLg0KDQpQbHVzLCB0aGVyZSBpcyBw
cmVjZWRlbnQgZnJvbSB0aGUgb3BlbmVtYmVkZGVkIHByb2plY3QgZm9yIHB1dHRpbmcgc21h
bGwgDQp0YXJiYWxscyBpbiB0aGUgcmVjaXBlcyB0aGlzIHdheS4NCg0KDQpPbiA3LzI0LzIw
MjIgMTA6NDAsIEFuZHJldyBEYXZpcyB3cm90ZToNCj4gT24gNy8yMS8yMiA3OjM1IEFNLCBS
eWFuIEVhdG1vbiB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4+IGFyYWdv
LXByb2plY3Qub3JnIGlzIGJlaW5nIHNodXQgZG93biBpbiBBdWd1c3QuwqAgVGhpcw0KPj4g
Y29tbWl0IGNoYW5nZXMgdGhlIGxhc3QgcmVjaXBlcyB0aGF0IHBvaW50IHRvIHRoYXQNCj4+
IG9sZCBzaXRlIHRvIHBvaW50IHRvIGdpdC50aS5jb20sIG9yIGp1c3Qgcm1lb3ZlIHRoZQ0K
Pj4gcmVmZXJlbmNlIGVudGlyZWx5Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gRWF0
bW9uIDxyZWF0bW9uQHRpLmNvbT4NCj4+IC0tLQ0KPj4gdjI6IENoYW5nZWQgZGlyIG5hbWUg
Zm9yIGsyLWZ3LWluaXRyZCBmaWxlcyBhbmQgcmVtb3ZlZCB1bmVlZGVkIGxpbmUgcGVyDQo+
PiBmZWVkYmFjay4NCj4+DQo+PiDCoCBtZXRhLWFyYWdvLWRpc3Ryby9SRUFETUXCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4+
IMKgIG1ldGEtYXJhZ28tZGlzdHJvL2NsYXNzZXMvdGlzZGstYnVuZGxlLmJiY2xhc3PCoCB8
wqDCoCAyICstDQo+PiDCoCBtZXRhLWFyYWdvLWRpc3Ryby9jb25mL2Rpc3Ryby9hcmFnby5j
b25mwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiAtLQ0KPj4gwqAgLi4uL2syLWZ3LWluaXRyZC9r
Mi1pbml0cmFtZnMtMC4wLjcudGFyLmd6wqDCoMKgwqDCoCB8IEJpbiAwIC0+IDQ5NjYwIGJ5
dGVzDQo+IA0KPiANCj4gU2FtZSBjb21tZW50IGFzIGluIHYxOg0KPiANCj4gU2hvdWxkbid0
IHB1dCBiaW5hcmllcyBpbiBnaXQsIGJsb2F0cyB0aGUgcmVwbyBmb3JldmVyLg0KPiANCj4g
Q2FuIHdlIGhvc3QgdGhpcyBmaWxlIHNvbWV3aGVyZSBlbHNlLCB0aS1saW51eC1maXJtd2Fy
ZSBzZWVtcw0KPiBsaWtlIHRoZSByaWdodCBzcG90IGdpdmVuIGl0J3MgYSBidW5jaCBvZiBm
aXJtd2FyZXMuDQo+IA0KPiBBbmRyZXcNCj4gDQo+IA0KPj4gwqAgLi4uL2syLWZ3LWluaXRy
ZC9rMi1mdy1pbml0cmRfMC4wLjcuYmLCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0K
Pj4gwqAgLi4uL3JlY2lwZXMtY29yZS9iYXNlLWZpbGVzL2Jhc2UtZmlsZXMvaXNzdWXCoMKg
wqAgfMKgwqAgMiArLQ0KPj4gwqAgLi4uL2Jhc2UtZmlsZXMvYmFzZS1maWxlcy9pc3N1ZS5u
ZXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4gwqAgLi4uL2ZlZWQt
Y29uZmlnL2FyYWdvLWZlZWQtY29uZmlnXzEuMC5iYsKgwqDCoMKgwqDCoMKgIHzCoMKgIDIg
Ky0NCj4+IMKgIC4uLi9vZS1sYXllcnNldHVwL29lLWxheWVyc2V0dXAuYmLCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+PiDCoCAuLi4vdGktY3J5cHRvLWV4YW1w
bGVzX2dpdC5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICsrLS0NCj4+IMKgIC4uLi9sdHAtZGR0L2x0cC1kZHRfMjAyMTA1MjQuYmLCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+PiDCoCAuLi4vcmVjaXBlcy1z
dXBwb3J0L2lwc2VjbWdyL2lwc2VjbWdyLmluY8KgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+
PiDCoCAuLi4vbGlibmwteGZybS9saWJubC14ZnJtX2dpdC5iYsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+PiDCoCAxMyBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0
NCANCj4+IG1ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtYnNwL2syLWZ3LWluaXRyZC9rMi1m
dy1pbml0cmQvazItaW5pdHJhbWZzLTAuMC43LnRhci5neiANCj4+DQo+Pg0KDQotLSANClJ5
YW4gRWF0bW9uICAgICAgICAgICAgICAgIHJlYXRtb25AdGkuY29tDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGV4YXMgSW5zdHJ1bWVudHMsIEluYy4g
IC0gIExDUEQgIC0gIE1HVFMNCg==

