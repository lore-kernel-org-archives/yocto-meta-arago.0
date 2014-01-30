Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 80FD7529BC
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 11:25:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UBP6iv003797;
	Thu, 30 Jan 2014 05:25:06 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UBP6Cp016124;
	Thu, 30 Jan 2014 05:25:06 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 30 Jan 2014 05:25:06 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "jose.alarcon@kuviovision.com" <jose.alarcon@kuviovision.com>
Thread-Topic: [meta-arago] ti-mpm-transport broken on MCSDK
Thread-Index: AQHPHAFd5pmVTW4n6kOvlbIps7GHIZqbX4qAgAFbKqCAAJ0JgP//yApg
Date: Thu, 30 Jan 2014 11:25:06 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549EA071@DLEE11.ent.ti.com>
References: <1390871192-3063-1-git-send-email-denis@denix.org>
	<25a2617e42192ee8409b5072a91434b7@kuviovision.com>
	<20140129022615.GK6814@edge>
	<4F9216F96E5DF9428610502835A9F490549E9CD0@DLEE11.ent.ti.com>
	<7c8427fe4e9c9ee151dd5f2030b2176d@kuviovision.com>
In-Reply-To: <7c8427fe4e9c9ee151dd5f2030b2176d@kuviovision.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: ti-mpm-transport broken on MCSDK
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
X-List-Received-Date: Thu, 30 Jan 2014 11:25:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIGFuZCBzdWdnZXN0aW9ucy4NCkFwcHJlY2lhdGUgaXQu
IA0KU2FtDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogam9zZS5hbGFy
Y29uQGt1dmlvdmlzaW9uLmNvbSBbbWFpbHRvOmpvc2UuYWxhcmNvbkBrdXZpb3Zpc2lvbi5jb21d
DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDMwLCAyMDE0IDM6MzEgQU0NCj4gVG86IE5lbHNv
biwgU2FtDQo+IENjOiBEbXl0cml5ZW5rbywgRGVueXM7IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUkU6IFttZXRhLWFyYWdvXSB0aS1tcG0tdHJhbnNwb3J0IGJyb2tl
biBvbiBNQ1NESw0KPiANCj4gSGVsbG8NCj4gDQo+IE9uIDIwMTQtMDEtMzAgMDc6MTIsIE5lbHNv
biwgU2FtIHdyb3RlOg0KPiA+IEpvc2UsDQo+ID4gVGhlIG1wbS10cmFuc3BvcnQgcmVjaXBlcyB3
ZXJlIHVwZGF0ZWQgZm9yIE1DU0RLIDMuMC4zIHRvIHBvaW50IHRvDQo+ID4gREVWLk1QTS1UUkFO
U1BPUlQtMDEuMDAuMDEuMDAuDQo+ID4gTWF5IGJlIHlvdSBhcmUgbG9va2luZyBhdCB0aGUgb2xk
ZXIgdmVyc2lvbiBvZiB0aGUgcmVjaXBlPw0KPiA+IFdpdGggcmVnYXJkcywNCj4gPiBTYW0NCj4g
DQo+IFNhbSwgeW91IGFyZSByaWdodC4gSSBzZWUgdGhhdCB0aGlzIHdhcyBmaXhlZCBieSB0aGUg
Zm9sbG93aW5nIGNvbW1pdDoNCj4gDQo+IGNvbW1pdCBkNzI3ZDEzYmM5MjA0ZmEwZTdjM2Q5N2Iy
N2Y4ZDI5N2Q5YTBiNzExDQo+IEF1dGhvcjogU2FtIE5lbHNvbiA8c2FtLm5lbHNvbkB0aS5jb20+
DQo+IERhdGU6ICAgVGh1IEphbiAyIDA5OjMwOjE0IDIwMTQgLTA1MDANCj4gDQo+ICAgICAgbWNz
ZGstMDMuMDAuMDMuMTU6IFVwZGF0ZSBtY3NkayAwMy4wMC4wMy4xNSBjb25maWd1cmF0aW9uDQo+
IA0KPiAgICAgIC0gRml4IGlzc3VlIHdpdGggcmVjaXBlcyBwb2ludGluZyB0byB3cm9uZyBzb3Vy
Y2UgdXJsDQo+IA0KPiAgICAgIFNpZ25lZC1vZmYtYnk6IFNhbSBOZWxzb24gPHNhbS5uZWxzb25A
dGkuY29tPg0KPiANCj4gSG93ZXZlciBJIHdhcyBzdGlsbCB1c2luZyB0aGUgb3JpZ2luYWwgdmVy
c2lvbiBvZiB0aGUgbWNzZGstMy4wMC4wMy4xNQ0KPiBjb25maWd1cmF0aW9uIGZpbGUgZnJvbSBO
b3YgMjYNCj4gKDc1MDBlODUyZjc3ZTdhOWIxMmJjODE5OGU4N2U0YmQ5MTM2MjMwMGMpDQo+IA0K
PiBXZSBjbG9uZSB0aGUgTUNTREsgbGF5ZXJzIHRvIG91ciBpbnRlcm5hbCBzZXJ2ZXIgZWFjaCB0
aW1lIHRoZXJlIGlzIGENCj4gbmV3IHJlbGVhc2UuIE9idmlvdXNseSBJIG1pc3NlZCB0aGlzIGZp
eC4NCj4gDQo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBwb3N0IGFuIG5vdGUgaGVy
ZSAob3Igb24gdGhlIG11bHRpY29yZQ0KPiBlMmUgY29tbXVuaXR5KSB3aGVuIHNvbWUgZml4ZXMg
YXJlIGJlaW5nIG1hZGUgdG8gdGhlIGN1cnJlbnQgcmVsZWFzZS4NCj4gDQo+IFRoYW5rcywNCj4g
DQo+IC0tDQo+IEpvc2UNCg==

