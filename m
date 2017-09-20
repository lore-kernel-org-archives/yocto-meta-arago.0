Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 51296529FD
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 14:32:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KEW4dO002322
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505917924;
	bh=D2h/ysgcryVg4YFg5jB0/5tpJ03CDUmsSMbyXCZmqSE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=moGVswenmexK42M8cT+bWZ0V9fvmSKw+zIegYnBY5xXu8U6tmK2FcMJoUGSrJhT98
	PG8LbcRWj3CVSDdgzVgJbpZtN6dyAwpVFbKrnNv5hBh81DdCnThJGrTsn7sGMM2vzu
	is9k8ocaSQncQHBNIm8jpPI26nWAhX9fpjAPFjCQ=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KEW4Zi000899
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 09:32:04 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Wed, 20 Sep 2017 09:32:03 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk PATCH]
	pruss-lld-rtos: Adding RTOS recipe for pruss-lld
Thread-Index: AQHTMZbxoi2bLEg9AUqQeMtpkHsCTKK+JegA//+xQkA=
Date: Wed, 20 Sep 2017 14:32:02 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F64E9@DFLE12.ent.ti.com>
References: <1505860246-5344-1-git-send-email-m-radhakrishnan2@ti.com>
	<f4cfe5c3-6bfe-f887-cbcd-34cd21991400@ti.com>
In-Reply-To: <f4cfe5c3-6bfe-f887-cbcd-34cd21991400@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk PATCH] pruss-lld-rtos: Adding RTOS recipe for pruss-lld
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
X-List-Received-Date: Wed, 20 Sep 2017 14:32:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHBhdGNoIHdhcyBzdWJtaXR0ZWQgc29tZXRpbWUgYmFjayBhbmQgaXMgdW5kZXIgcmV2aWV3
Lg0KaHR0cDovL3BhdGNod29yay5kYWwuZGVzaWduLnRpLmNvbS9wYXRjaC8zMzE2MC8NCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RpZmZsZXIsIEphY29iIA0KU2VudDog
V2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjAsIDIwMTcgMTA6MTQgQU0NClRvOiBSYWRoYWtyaXNobmFu
LCBNYWhlc2g7IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbRVhU
RVJOQUxdIFttZXRhLWFyYWdvXSBbbWV0YS1wcm9jZXNzb3Itc2RrIFBBVENIXSBwcnVzcy1sbGQt
cnRvczogQWRkaW5nIFJUT1MgcmVjaXBlIGZvciBwcnVzcy1sbGQNCg0KUGxlYXNlIHN1Ym1pdCB0
aGlzIHRvIG1ldGEtdGkuDQoNCk9uIDkvMTkvMjAxNyA2OjMwIFBNLCBNYWhlc2ggUmFkaGFrcmlz
aG5hbiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogTWFoZXNoIFJhZGhha3Jpc2huYW4gPG0tcmFk
aGFrcmlzaG5hbjJAdGkuY29tPg0KPiAtLS0NCj4gICByZWNpcGVzLWJzcC9wcnVzcy1sbGQvcHJ1
c3MtbGxkLXJ0b3NfZ2l0LmJiIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJl
Y2lwZXMtYnNwL3BydXNzLWxsZC9wcnVzcy1sbGQtcnRvc19naXQuYmINCj4NCj4gZGlmZiAtLWdp
dCBhL3JlY2lwZXMtYnNwL3BydXNzLWxsZC9wcnVzcy1sbGQtcnRvc19naXQuYmIgYi9yZWNpcGVz
LWJzcC9wcnVzcy1sbGQvcHJ1c3MtbGxkLXJ0b3NfZ2l0LmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAuLjQ5OWFmY2UNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9y
ZWNpcGVzLWJzcC9wcnVzcy1sbGQvcHJ1c3MtbGxkLXJ0b3NfZ2l0LmJiDQo+IEBAIC0wLDAgKzEs
MjUgQEANCj4gK1NVTU1BUlkgPSAiVEkgUlRPUyBsb3cgbGV2ZWwgZHJpdmVyIGxpYnJhcnkgZm9y
IFBSVVNTIg0KPiArDQo+ICtpbmhlcml0IHRpLXBkaw0KPiArcmVxdWlyZSByZWNpcGVzLWJzcC9w
cnVzcy1sbGQvcHJ1c3MtbGxkLmluYw0KPiArcmVxdWlyZSByZWNpcGVzLWJzcC9wcnVzcy1sbGQv
cHJ1c3MtbGxkLTEuMC4wLmluYw0KPiArDQo+ICsNCj4gK1BSID0gIiR7SU5DX1BSfS4wIg0KPiAr
DQo+ICtTID0gIiR7V09SS0RJUn0vJHtQUlVTU19MTERfR0lUX0RFU1RTVUZGSVh9Ig0KPiArDQo+
ICtERVBFTkRTX2FwcGVuZCA9ICIgb3NhbC1ydG9zIg0KPiArREVQRU5EU19hcHBlbmRfdGkzM3gg
PSAiIHN0YXJ0ZXJ3YXJlLXJ0b3MiDQo+ICtERVBFTkRTX2FwcGVuZF90aTQzeCA9ICIgc3RhcnRl
cndhcmUtcnRvcyINCj4gKw0KPiArIyBCdWlsZCB3aXRoIG1ha2UgaW5zdGVhZCBvZiBYREMNCj4g
K1RJX1BES19YRENNQUtFID0gIjAiDQo+ICsNCj4gK2V4cG9ydCBQREtfUFJVU1NfUk9PVF9QQVRI
ID0iJHtXT1JLRElSfS9idWlsZCINCj4gK2V4cG9ydCBERVNUX1JPT1Q9IiR7V09SS0RJUn0vYnVp
bGQiDQo+ICsNCj4gKyMgSFRNTCBkb2MgbGluayBwYXJhbXMNCj4gK1BES19DT01QX0xJTktfVEVY
VCA9ICJQUlVTUyBMTEQiDQo+ICsNCj4gK0lOU0FORV9TS0lQXyR7UE59ID0gImFyY2giDQoNCg==

