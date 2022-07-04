Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF514C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 08:37:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.70225.1656923874027506486
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Jul 2022 01:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aLZYX8Tv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2648bn2d026440;
	Mon, 4 Jul 2022 03:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656923869;
	bh=9krHGERhtbjMDqB7frctfesJ962BXK2MJ9cQL+iEvyQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=aLZYX8TvlAXCvEiyEsbnN6vVCyZQA/8IM6JefXpisTJ2l/18Iey0e/kN+9+39Wlri
	 eNBfJCBiv+1ECcBSRdEegrFCyKCSaX3gdWfQgmGqWtWHNZABKNR+F9Tg/p/z55s4Mx
	 aljnX40SOtLW4Vq3qtxAQH+RnSmgAGNj50E+wRos=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2648bnxD022663
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Jul 2022 03:37:49 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Jul 2022 03:37:48 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2308.014; Mon, 4 Jul 2022 03:37:48 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Mantena, Prasanth" <p-mantena@ti.com>,
        "prashanth.ka@pathpartnertech.com" <prashanth.ka@pathpartnertech.com>,
        "R,
 Karthik" <karthik.ramanan@ti.com>,
        "Weaver, Lucas" <l-weaver@ti.com>
Subject: RE: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build
 flag to enable GST_TRACERS
Thread-Topic: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks
 build flag to enable GST_TRACERS
Thread-Index: AQHYjM5Ku0mXl4rjL0mu7Z5YUmuTZK1t6DgQ
Date: Mon, 4 Jul 2022 08:37:48 +0000
Message-ID: <6d8ae0430d064345b3c9bed39c9cf51b@ti.com>
References: <20220629105304.15355-1-a-limaye@ti.com>
 <2ff910d2-0865-4418-3d66-6bcf8a2efb12@ti.com>
 <3188ef5fecbe458d8d04c4b2348147c2@ti.com> <20220630172553.GX18692@denix.org>
 <faf3ba53-a4ca-1826-bac7-eac13540a81e@ti.com>
 <20220630212001.GZ18692@denix.org>
 <8321ce08-c1cc-d489-f588-fe25a82059f0@ti.com>
In-Reply-To: <8321ce08-c1cc-d489-f588-fe25a82059f0@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.219.43]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Jul 2022 08:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13938

SGkgUnlhbiwNCg0KSSBoYXZlIGRvbmUgdGhlIHNhbWUgYW5kIHN1Ym1pdHRlZCBhIHYyIHBhdGNo
IGhlcmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJhZ28vbWVzc2Fn
ZS8xMzkzNA0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEVhdG1vbiwg
UnlhbiA8cmVhdG1vbkB0aS5jb20+IA0KU2VudDogRnJpZGF5LCBKdWx5IDEsIDIwMjIgMzo0MSBB
TQ0KVG86IERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5vcmc+DQpDYzogTGltYXllLCBB
bmlrZXQgPGEtbGltYXllQHRpLmNvbT47IEJhamp1cmksIFByYW5lZXRoIDxwcmFuZWV0aEB0aS5j
b20+OyBtZXRhLWFyYWdvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IE1hbnRlbmEsIFByYXNhbnRo
IDxwLW1hbnRlbmFAdGkuY29tPjsgcHJhc2hhbnRoLmthQHBhdGhwYXJ0bmVydGVjaC5jb207IFIs
IEthcnRoaWsgPGthcnRoaWsucmFtYW5hbkB0aS5jb20+OyBXZWF2ZXIsIEx1Y2FzIDxsLXdlYXZl
ckB0aS5jb20+DQpTdWJqZWN0OiBSZTogW21ldGEtYXJhZ29dW2R1bmZlbGxdW1BBVENIXSBnc3Ry
ZWFtZXI6IEFkZGluZyB0cmFjZXItaG9va3MgYnVpbGQgZmxhZyB0byBlbmFibGUgR1NUX1RSQUNF
UlMNCg0KDQpBbmlrZXQsDQoNCkkgbGlrZSB0aGUgbGFzdCBvcHRpb24gdGhhdCBEZW55cyBwcm9w
b3NlZC4gIEFkZGluZyBpdCB0byB0aGUgbGlzdCBpbjoNCg0KbWV0YS1hcmFnby1kaXN0cm8vY29u
Zi9kaXN0cm8vYXJhZ28uY29uZg0KDQoNClRoYXQgZmVlbHMgbGlrZSB0aGUgY2xlYW5lc3Qgd2F5
IG9mIGRvaW5nIHRoaXMuICBEbyB5b3UgaGF2ZSBlbm91Z2ggdG8gbWFrZSB0aGF0IGNoYW5nZSBh
bmQgc3VibWl0IGEgbmV3IHBhdGNoPw0KDQoNCg0KT24gNi8zMC8yMDIyIDE2OjIwLCBEZW55cyBE
bXl0cml5ZW5rbyB3cm90ZToNCj4gQ29ycmVjdC4gSXQgY291bGQgYmUgYSBiYmFwcGVuZCBpbiBt
ZXRhLWFyYWdvLWRpc3RybywgbGlrZSB0aGUgb3JpZ2luYWwgcGF0Y2gsDQo+IG9yIGl0IGNvdWxk
IGJlIGp1c3QgYWRkZWQgaW50byBtZXRhLWFyYWdvLWRpc3Ryby9jb25mL2Rpc3Ryby9hcmFnby5j
b25mIGxpa2UNCj4gZXhpc3RpbmcgUEFDS0FHRUNPTkZJRyBtb2RpZmljYXRpb25zIHRoZXJlIGlu
IGxpbmVzIDEwNy0xNTA6DQo+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS1hcmFn
by90cmVlL21ldGEtYXJhZ28tZGlzdHJvL2NvbmYvZGlzdHJvL2FyYWdvLmNvbmYjbjEwNw0KPiAN
Cj4gDQo+IE9uIFRodSwgSnVuIDMwLCAyMDIyIGF0IDA0OjE1OjAyUE0gLTA1MDAsIFJ5YW4gRWF0
bW9uIHdyb3RlOg0KPj4NCj4+IFNvIHlvdSdyZSBzYXlpbmcgaXQgc2hvdWxkIGJlIGluIG1ldGEt
YXJhZ28tZGlzdHJvPw0KPj4NCj4+DQo+Pg0KPj4gT24gNi8zMC8yMDIyIDEyOjI1LCBEZW55cyBE
bXl0cml5ZW5rbyB3cm90ZToNCj4+PiBUaGlzIGlzIGRpc3Ryby1zcGVjaWZpYyBjb25maWd1cmF0
aW9uIGFuZCBzaG91bGQgbm90IGJlIGRvbmUgaW4gZGlzdHJvLWFnbm9zdGljIG1ldGEtYXJhZ28t
ZXh0cmFzIGxheWVyLg0KPj4+DQo+Pj4NCj4+PiBPbiBUaHUsIEp1biAzMCwgMjAyMiBhdCAxMTo1
ODowOUFNICswMDAwLCBBbmlrZXQgTGltYXllIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdy
b3RlOg0KPj4+PiArS2FydGhpaw0KPj4+Pg0KPj4+PiBQcmFuZWV0aCwNCj4+Pj4NCj4+Pj4gVGhp
cyBpcyBub3Qgc3BlY2lmaWMgdG8gY29kZWMuIFRoaXMgY2FuIGJlIHVzZWQgZm9yIHByb2ZpbGlu
ZyBsYXRlbmNpZXMgYW5kIHN1Y2ggZm9yIGFueSBHU3RyZWFtZXIgZWxlbWVudHMuDQo+Pj4+IEl0
IHNob3VsZCBub3QgaW1wYWN0IHBlcmZvcm1hbmNlIGVpdGhlci4gSXQganVzdCBwcmludHMgbGF0
ZW5jeSBsb2dzIGlmIGFuIGVudmlyb25tZW50IHZhcmlhYmxlIGlzIHNldCwgc2ltaWxhciB0byBH
U1RfREVCVUcuDQo+Pj4+DQo+Pj4+DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
Pj4+IEZyb206IEJhamp1cmksIFByYW5lZXRoIDxwcmFuZWV0aEB0aS5jb20+DQo+Pj4+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDMwLCAyMDIyIDM6MjkgUE0NCj4+Pj4gVG86IExpbWF5ZSwgQW5pa2V0
IDxhLWxpbWF5ZUB0aS5jb20+OyBtZXRhLWFyYWdvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IE1h
bnRlbmEsIFByYXNhbnRoIDxwLW1hbnRlbmFAdGkuY29tPjsgcHJhc2hhbnRoLmthQHBhdGhwYXJ0
bmVydGVjaC5jb20NCj4+Pj4gQ2M6IEVhdG1vbiwgUnlhbiA8cmVhdG1vbkB0aS5jb20+OyBXZWF2
ZXIsIEx1Y2FzIDxsLXdlYXZlckB0aS5jb20+DQo+Pj4+IFN1YmplY3Q6IFJlOiBbbWV0YS1hcmFn
b11bZHVuZmVsbF1bUEFUQ0hdIGdzdHJlYW1lcjogQWRkaW5nIHRyYWNlci1ob29rcyBidWlsZCBm
bGFnIHRvIGVuYWJsZSBHU1RfVFJBQ0VSUw0KPj4+Pg0KPj4+PiBQcmFzaGFudGgsUHJhc2FudGgs
DQo+Pj4+DQo+Pj4+IFBsZWFzZSByZXZpZXcuDQo+Pj4+DQo+Pj4+IE9uIDYvMjkvMjAyMiA0OjIz
IFBNLCBBbmlrZXQgTGltYXllIHdyb3RlOg0KPj4+Pj4gRW5hYmxlcyBHU1RfVFJBQ0VSUyA6IGFu
IG9wdGlvbmFsIHV0aWxpdHkgZm9yIHByb2ZpbGluZyBnc3RyZWFtZXIgYXBwbGljYXRpb25zDQo+
Pj4+DQo+Pj4+IEFuaWtldCwNCj4+Pj4NCj4+Pj4gMS4gV2hhdCBpcyB0aGUgaW1wYWN0IG9mIHRo
aXMgd2l0aCBjb2RlYyBwZXJmb3JtYW5jZT8NCj4+Pj4gMi4gV2h5IGlzIHRoaXMgb3B0aW9uYWwg
dXRpbGl0eSBuZWVkIHRvIGVuYWJsZWQ/DQo+Pj4+DQo+Pj4+DQo+Pj4+Pg0KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogQW5pa2V0IExpbWF5ZSA8YS1saW1heWVAdGkuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+
PiAgICAuLi4vZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjE2LiUuYmJhcHBlbmQgICAgICAgICAg
ICAgICAgICAgfCA1ICsrKysrDQo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspDQo+Pj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1leHRyYXMvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4xNi4lLmJiYXBwZW5kDQo+Pj4+
Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMTYuJS5iYmFwcGVuZCBiL21ldGEtYXJhZ28tZXh0
cmFzL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wXzEuMTYuJS5iYmFw
cGVuZA0KPj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4+IGluZGV4IDAwMDAwMDAwLi5k
N2JkYWEwNA0KPj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+Pj4gKysrIGIvbWV0YS1hcmFnby1leHRy
YXMvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4xNi4lLmJiYXBw
ZW5kDQo+Pj4+PiBAQCAtMCwwICsxLDUgQEANCj4+Pj4+ICsNCj4+Pj4+ICtQQUNLQUdFQ09ORklH
X2FwcGVuZCA9ICIgdHJhY2VyLWhvb2tzIg0KPj4+Pj4gKw0KPj4+Pj4gK1BSX2FwcGVuZCA9ICIu
YXJhZ28wIg0KPj4+Pj4gKw0KDQotLSANClJ5YW4gRWF0bW9uICAgICAgICAgICAgICAgIHJlYXRt
b25AdGkuY29tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGV4
YXMgSW5zdHJ1bWVudHMsIEluYy4gIC0gIExDUEQgIC0gIE1HVFMNCg==

