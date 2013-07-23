Return-Path: <pkuttiyam@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D74B4529D3
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 19:31:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NJVhrD024242
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 14:31:43 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NJVhEG022167
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 14:31:43 -0500
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 23 Jul 2013 14:31:42 -0500
From: "Kuttiyam, Prabhu" <pkuttiyam@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] Question when building devkit
Thread-Index: Ac6BaabZMJgtq1BeQiKGms3yooMXxgAAVl9AAApU1GAAI76dcAFzKxmAAAUz0SA=
Message-ID: <5DE143D81A65C045A4FF105C9132505F04219C74@DFLE11.ent.ti.com>
References: <5DE143D81A65C045A4FF105C9132505F0421839C@DFLE11.ent.ti.com>
	<8EAE6244CE843044A42356038645C8551573575F@DFLE12.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015965764F@DLEE11.ent.ti.com>
	<20130723170001.GM31158@edge>
In-Reply-To: <20130723170001.GM31158@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Aug 2013 17:24:50 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Question when building devkit
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
Date: Tue, 23 Jul 2013 19:31:44 -0000
X-Original-Date: Tue, 23 Jul 2013 19:31:41 +0000
X-List-Received-Date: Tue, 23 Jul 2013 19:31:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91Lg0KVGhhdCB3YXMgaW5kZWVkIHRoZSBwcm9ibGVtLg0KR290IHRoaXMgZml4ZWQu
DQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRG15dHJpeWVua28sIERl
bnlzIA0KU2VudDogVHVlc2RheSwgSnVseSAyMywgMjAxMyAxOjAwIFBNDQpUbzogTWF1cGluLCBD
aGFzZQ0KQ2M6IFNhcmFuLCBTYWplc2ggS3VtYXI7IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5v
cmc7IEt1dHRpeWFtLCBQcmFiaHUNClN1YmplY3Q6IFJlOiBbbWV0YS1hcmFnb10gUXVlc3Rpb24g
d2hlbiBidWlsZGluZyBkZXZraXQNCg0KT24gVHVlLCBKdWwgMTYsIDIwMTMgYXQgMTI6NTQ6MzlQ
TSArMDAwMCwgTWF1cGluLCBDaGFzZSB3cm90ZToNCj4gVGhlIGVycm9yIGxvZyBzYXlzOg0KPiAN
Cj4gKiBzYXRpc2Z5X2RlcGVuZGVuY2llc19mb3I6IENhbm5vdCBzYXRpc2Z5IHRoZSBmb2xsb3dp
bmcgZGVwZW5kZW5jaWVzIGZvciBwYWNrYWdlZ3JvdXAtYXJhZ28tc2MtbWNzZGstdG9vbGNoYWlu
LXRhcmdldDoNCj4gKiAgICAgICAgICAgIHRpLXRyYWNlLWZyYW1ld29yay1zdGF0aWNkZXYgKg0K
PiAgKiBvcGtnX2luc3RhbGxfY21kOiBDYW5ub3QgaW5zdGFsbCBwYWNrYWdlIHBhY2thZ2Vncm91
cC1hcmFnby1zYy1tY3Nkay10b29sY2hhaW4tdGFyZ2V0Lg0KPiANCj4gU28gaXQgbG9va3MgbGlr
ZSB0aGUgdGktdHJhY2UtZnJhbWV3b3JrLXN0YXRpY2RldiBwYWNrYWdlIGlzIG5vdCB0aGVyZS4g
IA0KPiBIb3dldmVyLCBzaW5jZSBuZWl0aGVyIHRoZSANCj4gcGFja2FnZWdyb3VwLWFyYWdvLXNj
LW1jc2RrLXRvb2xjaGFpbi10YXJnZXQgb3IgDQo+IHRpLXRyYWNlLWZyYW1ld29yay1zdGF0aWNk
ZXYgcmVjaXBlcyBzZWVtIHRvIGJlIGluIHRoZSBtYWlubGluZSBnaXQgDQo+IHJlcG9zaXRvcmll
cyBJIGNhbuKAmXQgdGVsbCB5b3UgbXVjaCBlbHNlLiAgVGhpcyBjb3VsZCBiZSBhbiBtaXMtdXNl
ZCBDT01QQVRJQkxFX01BQ0hJTkUgc2V0dGluZyBvciBzb21ldGhpbmcgZWxzZS4NCg0KSSBhZ3Jl
ZSB3aXRoIENoYXNlIGhlcmUgaW4gZ2VuZXJhbC4gU3BlY2lmaWNhbGx5IHRvIHlvdXIgY2FzZSwg
LXN0YXRpY2RldiBwYWNrYWdlcyBjcmVhdGVkIGF1dG9tYXRpY2FsbHkgYW5kIGhvbGQgc3RhdGlj
IC5hIGxpYnJhcmllcy4gTG9va3MgbGlrZSB0aGF0IGlzIHdoYXQgeW91IGFkZCBhIGRlcGVuZGVu
Y3kgZm9yIGluIHlvdXIgdG9vbGNoYWluLXRhcmdldCByZWNpcGUuIEJ1dCBmb3Igc29tZSByZWFz
b24gdGktdHJhY2UtZnJhbWV3b3JrIGRpZCBubyBnZW5lcmF0ZSB0aGF0IHBhY2thZ2UgLSBjaGVj
ayBpZiB0aGVyZSdzIGEgc3RhdGljIC5hIGxpYnJhcnkgYmVpbmcgYnVpbHQuDQoNCi0tIA0KRGVu
eXMNCg0KDQo+IEZyb206IG1ldGEtYXJhZ28tYm91bmNlc0BhcmFnby1wcm9qZWN0Lm9yZyBbbWFp
bHRvOm1ldGEtYXJhZ28tYm91bmNlc0BhcmFnby1wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFNh
cmFuLCBTYWplc2ggS3VtYXINCj4gU2VudDogTW9uZGF5LCBKdWx5IDE1LCAyMDEzIDI6NTAgUE0N
Cj4gVG86IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4gQ2M6IEt1dHRpeWFtLCBQcmFi
aHUNCj4gU3ViamVjdDogW21ldGEtYXJhZ29dIEZXOiBRdWVzdGlvbiB3aGVuIGJ1aWxkaW5nIGRl
dmtpdA0KPiANCj4gDQo+IA0KPiBGcm9tOiBLdXR0aXlhbSwgUHJhYmh1DQo+IFNlbnQ6IE1vbmRh
eSwgSnVseSAxNSwgMjAxMyAxMDo0MyBBTQ0KPiBUbzogJ21ldGEtYXJhZ29AYXJhZ28tcHJvamVj
dC5vcmcnDQo+IFN1YmplY3Q6IFF1ZXN0aW9uIHdoZW4gYnVpbGRpbmcgZGV2a2l0DQo+IA0KPiBI
aToNCj4gSSBoYXZlIGhvcGVmdWxseSBhIHF1aWNrIHF1ZXN0aW9uIHdoaWxlIGJ1aWxkaW5nIGEg
ZGV2a2l0IGZvciBvdXIgU0RLLg0KPiANCj4gVGhpcyBpcyB3aGF0IEkgZG86DQo+IA0KPiBNQUNI
SU5FPXRjaTY2MTQtZXZtIFRPT0xDSEFJTl9CUkFORD1saW5hcm8gYml0YmFrZSBtZXRhLXRvb2xj
aGFpbi1hcmFnby1zYy1tY3Nkaw0KPiANCj4gQW5kIEkgZ2V0IHRoaXMgZXJyb3I6DQo+IA0KPiA9
PT09PQ0KPiBQYXJzaW5nIG9mIDE1MzggLmJiIGZpbGVzIGNvbXBsZXRlICgxNTI4IGNhY2hlZCwg
MTAgcGFyc2VkKS4gMTkwMiB0YXJnZXRzLCAxOTkgc2tpcHBlZCwgNyBtYXNrZWQsIDAgZXJyb3Jz
Lg0KPiANCj4gQnVpbGQgQ29uZmlndXJhdGlvbjoNCj4gQkJfVkVSU0lPTiAgICAgICAgPSAiMS4x
Ny4wIg0KPiBUQVJHRVRfQVJDSCAgICAgICA9ICJhcm0iDQo+IFRBUkdFVF9PUyAgICAgICAgID0g
ImxpbnV4LWdudWVhYmkiDQo+IE1BQ0hJTkUgICAgICAgICAgID0gInRjaTY2MTQtZXZtIg0KPiBE
SVNUUk8gICAgICAgICAgICA9ICJhcmFnbyINCj4gRElTVFJPX1ZFUlNJT04gICAgPSAiMjAxMy4w
NCINCj4gVFVORV9GRUFUVVJFUyAgICAgPSAiYXJtdjdhIHZmcCBuZW9uIHRodW1iIGNhbGxjb252
ZW50aW9uLWhhcmQgY29ydGV4YTgiDQo+IFRBUkdFVF9GUFUgICAgICAgID0gInZmcC1uZW9uIg0K
PiBtZXRhLWFyYWdvLWRpc3Rybw0KPiBtZXRhLWFyYWdvLWV4dHJhcyA9ICJ0Y2k2NjE0LWV2bTpk
NjhjMzNhNzEwYjQ0NWZkZDA2MmM0YjZlNmNkNDBiNDNhZWUzN2I3Ig0KPiB0b29sY2hhaW4tbGF5
ZXINCj4gbWV0YS1vZSAgICAgICAgICAgPSAiKG5vYnJhbmNoKTpmMDAwMjhjYWYyNTdlMzg2YzBm
M2FlNDZiZDRiM2JhNTNkZDA3MjlkIg0KPiBtZXRhLXRpICAgICAgICAgICA9ICJ0Y2k2NjE0LWV2
bTpjNzY0YmZjMWNjMDRiMzc2YTUyY2Y0ZmJiY2U2MDIxZjliOTkwYWFhIg0KPiBtZXRhLWxpbmFy
byAgICAgICA9ICIobm9icmFuY2gpOmQwNTU4ZmE0MzA0NTkyNjIyNDIzNTgyZjhiNDY0ZTFjMjJj
ZmU2ZjEiDQo+IG1ldGEgICAgICAgICAgICAgID0gIihub2JyYW5jaCk6MDc4NTQ4OWQ1NThjMzRj
YWNmNWNiMzQ5OTQ5YTE1ZTI3MDg0ZWZiZiINCj4gDQo+IE5PVEU6IFJlc29sdmluZyBhbnkgbWlz
c2luZyB0YXNrIHF1ZXVlIGRlcGVuZGVuY2llcw0KPiBOT1RFOiBQcmVwYXJpbmcgcnVucXVldWUN
Cj4gTk9URTogRXhlY3V0aW5nIFNldFNjZW5lIFRhc2tzDQo+IE5PVEU6IEV4ZWN1dGluZyBSdW5R
dWV1ZSBUYXNrcw0KPiBFUlJPUjogRnVuY3Rpb24gZmFpbGVkOiBwb3B1bGF0ZV9zZGtfaW1hZ2Ug
KHNlZSAvaG9tZS9hMDI3MTI4My95b2N0by9vZS1sYXllcnNldHVwLW1jc2RrL2J1aWxkL2FyYWdv
LXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3dvcmsvYXJtdjdhaGYtdmZwLW5lb24tb2Ut
bGludXgtZ251ZWFiaS9tZXRhLXRvb2xjaGFpbi1hcmFnby1zYy1tY3Nkay0xLjAtcjEvdGVtcC9s
b2cuZG9fcG9wdWxhdGVfc2RrLjE1OTAwIGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uKQ0KPiANCj4g
SSBoYXZlIGF0dGFjaGVkIHRoZSBsb2cgZmlsZSB3aXRoIHRoaXMgZW1haWwuDQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcmVwbHkuDQo+IEFsc28gbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBp
bmZvcm1hdGlvbiBvbiBteSBzZXR1cC9zY3JpcHRzLg0KPiANCj4gVGhhbmtzDQo+IFByYWJodQ0K
PiANCg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiBtZXRhLWFyYWdvIG1haWxpbmcgbGlzdA0KPiBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3Jn
DQo+IGh0dHA6Ly9hcmFnby1wcm9qZWN0Lm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vbWV0
YS1hcmFnbw0KDQo=

