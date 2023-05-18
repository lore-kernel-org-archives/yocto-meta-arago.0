Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2103C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 12:41:58 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3022.1684441013100809797
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 13:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tLmJ+h4J;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: b-brnich@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IKGntd078138;
	Thu, 18 May 2023 15:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684441009;
	bh=zYAWgU3x2Ep0X1oDnlcDoKxFeWxvr+qd0Gluhzm88Ug=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=tLmJ+h4JEePLZ0LSSRTH+HyuUxpuNMu8QPgtGEtEzFbrc870XpJ4g05W9b2GS50oN
	 SzklmP1vBGft45F2bCZ9HM5iFo/b2KpdiQ+4034GgZILMUX18Ebx0xOBR7PGJOZqLK
	 /DkO/hFO3w1E5mZdEfDdmLEw4ziI1PgJDJ/uSey4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IKGnqG034636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 15:16:49 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 15:16:48 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Thu, 18 May 2023 15:16:48 -0500
From: "Brnich, Brandon" <b-brnich@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        "Ravikumar, Rahul" <r-ravikumar@ti.com>
CC: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
        "Choudhary, Jayesh" <j-choudhary@ti.com>,
        "Bhatia, Aradhya"
	<a-bhatia1@ti.com>,
        "Thakkar, Devarsh" <devarsht@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to enable kmssink plugin
Thread-Topic: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to
 enable kmssink plugin
Thread-Index: AQHZicDb35JVfeJWLUu5DLqn5iJ6Hq9gd2gg
Date: Thu, 18 May 2023 20:16:48 +0000
Message-ID: <29f2111bf97b45eb953b4a8576768a17@ti.com>
References: <20230518132636.17398-1-r-ravikumar@ti.com>
 <20230518180151.GS9226@denix.org>
 <1cd2c743-c752-02b4-b7aa-84bbf62eea69@ti.com>
In-Reply-To: <1cd2c743-c752-02b4-b7aa-84bbf62eea69@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.25.106]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 May 2023 12:41:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14425

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFYXRtb24sIFJ5YW4gPHJlYXRt
b25AdGkuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE4LCAyMDIzIDI6NDIgUE0NCj4gVG86
IERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+OyBSYXZpa3VtYXIsIFJhaHVsIDxy
LQ0KPiByYXZpa3VtYXJAdGkuY29tPg0KPiBDYzogbWV0YS1hcmFnb0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnOyBDaG91ZGhhcnksIEpheWVzaCA8ai0NCj4gY2hvdWRoYXJ5QHRpLmNvbT47IEJoYXRp
YSwgQXJhZGh5YSA8YS1iaGF0aWExQHRpLmNvbT47IEJybmljaCwgQnJhbmRvbg0KPiA8Yi1icm5p
Y2hAdGkuY29tPjsgVGhha2thciwgRGV2YXJzaCA8ZGV2YXJzaHRAdGkuY29tPg0KPiBTdWJqZWN0
OiBSZTogW21ldGEtYXJhZ29dW21hc3Rlci9raXJrc3RvbmVdW1BBVENIXSBjb25mOiBhcmFnbzog
QWRkIGZsYWcgdG8NCj4gZW5hYmxlIGttc3NpbmsgcGx1Z2luDQo+IA0KPiANCj4gDQo+IE9uIDUv
MTgvMjAyMyAxOjAxIFBNLCBEZW55cyBEbXl0cml5ZW5rbyB3cm90ZToNCj4gPiBPbiBUaHUsIE1h
eSAxOCwgMjAyMyBhdCAwNjo1NjozNlBNICswNTMwLCBSYWh1bCBUIFIgdmlhDQo+IGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+ID4+IEVuYWJsZSBidWlsZGluZyBrbXNzaW5rIHBsdWdp
biBpbiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQNCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTog
UmFodWwgVCBSIDxyLXJhdmlrdW1hckB0aS5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIG1ldGEtYXJh
Z28tZGlzdHJvL2NvbmYvZGlzdHJvL2FyYWdvLmNvbmYgfCAzICsrKw0KPiA+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL21ldGEtYXJh
Z28tZGlzdHJvL2NvbmYvZGlzdHJvL2FyYWdvLmNvbmYNCj4gPj4gYi9tZXRhLWFyYWdvLWRpc3Ry
by9jb25mL2Rpc3Ryby9hcmFnby5jb25mDQo+ID4+IGluZGV4IDM3OWIxZDQ0Li5lMzIyNTlhOSAx
MDA2NDQNCj4gPj4gLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vY29uZi9kaXN0cm8vYXJhZ28uY29u
Zg0KPiA+PiArKysgYi9tZXRhLWFyYWdvLWRpc3Ryby9jb25mL2Rpc3Ryby9hcmFnby5jb25mDQo+
ID4+IEBAIC0xMTMsNiArMTEzLDkgQEAgUEFDS0FHRUNPTkZJRzphcHBlbmQ6cG4tb3BlbnNzbCA9
ICINCj4gY3J5cHRvZGV2LWxpbnV4Ig0KPiA+PiAgICMgRW5hYmxlIEdTVF9UUkFDRVIgbG9nZ2lu
ZyBpbiBnc3RyZWFtZXINCj4gPj4gICBQQUNLQUdFQ09ORklHOmFwcGVuZDpwbi1nc3RyZWFtZXIx
LjAgPSAiIHRyYWNlci1ob29rcyINCj4gPj4NCj4gPj4gKyMgRW5hYmxlIGttc3NpbmsgaW4gZ3N0
cmVhbWVyDQo+ID4+ICtQQUNLQUdFQ09ORklHOmFwcGVuZDpwbi1nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYWQgPSAiIGttcyINCj4gPg0KPiA+IEZXSVcsIGNvcnJlc3BvbmRpbmcgYmJhcHBlbmQgYWxz
byBzZXRzIHRoaXMgb3B0aW9uLCBidXQgaXQgbmVlZHMNCj4gPiB1cGRhdGluZyB0byB0aGUgY3Vy
cmVudCBnc3RyZWFtZXIgdmVyc2lvbjoNCj4gPg0KPiA+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvbWV0YS1hcmFnby90cmVlL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMNCj4gPiAtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMTYuJTI1LmJiYXBw
ZW5kI24zDQo+IA0KPiBBZ3JlZWQuICBUaGlzIHBhdGNoIGRvZXMgbm90IGFkZCBtdWNoIHNpbmNl
IHRoZSBzZXR0aW5ncyBpdCBhbHJlYWR5IGluIHBsYWNlIGluDQo+IHRoZSB0YXJnZXR0ZWQgcmVj
aXBlIGluIGFyYWdvLg0KPiANCj4gVGhlIHJlYWwgaXNzdWUgaXMgdGhhdCB0aGUgcmVjaXBlIHRo
YXQgYWRkcyB0aGUga21zIHNldHRpbmcgaXMgbm90IGJlaW5nIHVzZWQNCj4gYmVjYXVzZSBvZiB0
aGUgb3V0ZGF0ZWQgdmVyc2lvbi4gIFdlIHJlYWxseSBuZWVkIHRvIGdldCB0aGUgZ3N0cmVhbWVy
IHN0dWZmDQo+IHVwZGF0ZWQgaW4gb3JkZXIgZm9yIHRoaXMgdG8gd29yay4NCg0KQXBvbG9naWVz
IC0ganVzdCBzYXcgdGhpcyByZXNwb25zZSBhZnRlciBJIHNlbnQgbXkgcmVzcG9uc2UgdG8gdGhp
cyBwYXRjaC4gSSBhbSB3b3JraW5nIG9uIGNsZWFuaW5nDQp1cCBnc3RyZWFtZXIgZm9yIGtpcmtz
dG9uZS4gU2hvdWxkIGhhdmUgcGF0Y2ggaW4gYnkgZW5kIG9mIHRoaXMgd2VlayBvciBlYXJseSBu
ZXh0IHdlZWsuDQoNCj4gDQo+IA0KPiA+PiAgICMgRGlzYWJsZSBwdWxzZWF1ZGlvIHJvdXRpbmcg
aW4gYWxzYSBieSBkZWZhdWx0DQo+ID4+ICAgUEFDS0FHRUNPTkZJRzpyZW1vdmU6cG4tYWxzYS1w
bHVnaW5zID0gInB1bHNlYXVkaW8iDQo+ID4+ICAgUkRFUEVORFM6cHVsc2VhdWRpby1zZXJ2ZXI6
cmVtb3ZlID0gImFsc2EtcGx1Z2lucy1wdWxzZWF1ZGlvLWNvbmYiDQo+ID4+IC0tDQo+ID4+IDIu
MTcuMQ0KPiANCj4gLS0NCj4gUnlhbiBFYXRtb24gICAgICAgICAgICAgICAgcmVhdG1vbkB0aS5j
b20NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gVGV4YXMg
SW5zdHJ1bWVudHMsIEluYy4gIC0gIExDUEQgIC0gIE1HVFMNCg==

