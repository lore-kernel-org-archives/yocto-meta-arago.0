Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5D898529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 13:11:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LDBuuL007688
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521637917;
	bh=XK15pZG8HHHeV382K/pinflkTphOkVz9Uwo3dOpGwu4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=XSdUWrr515usHSCA8pCVPr9AEZSnHYyd7L7qUilXQvJM0DxUyS7+JtB9reMJSNn8a
	sba79xg90u3/C15UH7twHSzSxRMT94+By8fEHTKdKrHZCWAgpUF8JGVLmusyV7mW6w
	tnMTZ7wNOObPAO/BQKPn8fZyo1LX9pgxCDYf/MF4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LDBuHK010092
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:11:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 08:11:56 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Wed, 21 Mar 2018 08:11:56 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	posix-smp-demo: Updating to version 01.01.00.00
Thread-Index: AQHTwJIGHOKzTWXBkUGKybvuw5Kyn6PaqxHQ
Date: Wed, 21 Mar 2018 13:11:56 +0000
Message-ID: <b8ddada296104e1fa6d7662a08063d79@ti.com>
References: <1521579632-31441-1-git-send-email-m-radhakrishnan2@ti.com>
	<629d7d6f-cff6-618e-ff62-7d6cc2dace74@ti.com>
In-Reply-To: <629d7d6f-cff6-618e-ff62-7d6cc2dace74@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.180]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] posix-smp-demo: Updating to version 01.01.00.00
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 13:11:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpTb3JyeSBmb3IgdGhhdC4gSSBoYXZlIGNvcnJlY3RlZCAocmVtb3ZlZCB0aGUgcnRvcyBhcHBl
bmQpIGFuZCBzdWJtaXR0ZWQgdGhlIHBhdGNoIHYyDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDIwLCAy
MDE4IDU6MjYgUE0NClRvOiBSYWRoYWtyaXNobmFuLCBNYWhlc2g7IG1ldGEtYXJhZ29AYXJhZ28t
cHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRhLWFyYWdvXSBbbW9ydHld
W21ldGEtcHJvY2Vzc29yLXNka11bUEFUQ0hdIHBvc2l4LXNtcC1kZW1vOiBVcGRhdGluZyB0byB2
ZXJzaW9uIDAxLjAxLjAwLjAwDQoNCg0KDQpPbiAzLzIwLzIwMTggNTowMCBQTSwgTWFoZXNoIFJh
ZGhha3Jpc2huYW4gd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IE1haGVzaCBSYWRoYWtyaXNobmFu
IDxtLXJhZGhha3Jpc2huYW4yQHRpLmNvbT4NCj4gLS0tDQo+ICAgcmVjaXBlcy1hcHBzL3Bvc2l4
LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLTAxLjAxLjAwLjAwLmluYyAgIHwgNSArKysrKw0KPiAg
IHJlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAtZGVtby1ydG9zX2dpdC5iYmFw
cGVuZCB8IDEgKw0KPiAgIHJlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAtZGVt
b19naXQuYmJhcHBlbmQgICAgICB8IDEgKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVt
by9wb3NpeC1zbXAtZGVtby0wMS4wMS4wMC4wMC5pbmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLXJ0b3NfZ2l0LmJiYXBw
ZW5kDQoNClRoZXJlIGlzIG5vIHBvc2l4LXNtcC1kZW1vLXJ0b3MgcmVjaXBlIGZvciB0aGlzIGJi
YXBwZW5kLg0KDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMtYXBwcy9wb3NpeC1zbXAt
ZGVtby9wb3NpeC1zbXAtZGVtb19naXQuYmJhcHBlbmQNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lw
ZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAtZGVtby0wMS4wMS4wMC4wMC5pbmMgYi9y
ZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8vcG9zaXgtc21wLWRlbW8tMDEuMDEuMDAuMDAuaW5j
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjIwNThhZGENCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8vcG9zaXgtc21w
LWRlbW8tMDEuMDEuMDAuMDAuaW5jDQo+IEBAIC0wLDAgKzEsNSBAQA0KPiArIyBCZWxvdyBjb21t
aXQgSUQgY29ycmVzcG9uZHMgdG8gIkRFVi5QT1NJWC1TTVAuMDEuMDEuMDAuMDAiDQo+ICtQT1NJ
WF9TTVBfU1JDUkVWID0gIjEzOWZlN2VjNTg5MzlkYzI3NDMzNTVlNWZlZGUwNzM1Zjg2OTNlYmQi
DQo+ICsNCj4gK1BWID0gIjAxLjAxLjAwLjAwIg0KPiArSU5DX1BSID0gInIwIg0KPiBkaWZmIC0t
Z2l0IGEvcmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLXJ0b3NfZ2l0
LmJiYXBwZW5kIGIvcmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLXJ0
b3NfZ2l0LmJiYXBwZW5kDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAu
LmU3YjNkY2UNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9yZWNpcGVzLWFwcHMvcG9zaXgtc21w
LWRlbW8vcG9zaXgtc21wLWRlbW8tcnRvc19naXQuYmJhcHBlbmQNCj4gQEAgLTAsMCArMSBAQA0K
PiArcmVxdWlyZSByZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8vcG9zaXgtc21wLWRlbW8tMDEu
MDEuMDAuMDAuaW5jDQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8v
cG9zaXgtc21wLWRlbW9fZ2l0LmJiYXBwZW5kIGIvcmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1v
L3Bvc2l4LXNtcC1kZW1vX2dpdC5iYmFwcGVuZA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwLi5lN2IzZGNlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvcmVjaXBlcy1h
cHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vX2dpdC5iYmFwcGVuZA0KPiBAQCAtMCww
ICsxIEBADQo+ICtyZXF1aXJlIHJlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAt
ZGVtby0wMS4wMS4wMC4wMC5pbmMNCg0K

