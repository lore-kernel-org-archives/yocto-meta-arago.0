Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3AEB6529C6
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 17:45:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACHfxcb051850;
	Thu, 12 Nov 2020 11:41:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605202919;
	bh=HRafDn682vhyfNE2GyVa9DT6saBOgXhg8ygFrxnp7AE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Oq+ihye/5XqDT96lLefh7bj0TihNY9jMsZOj1GinWgqwofI56VriDMrtHeBR9D6ww
	6Udk+f7olVGcF0O9JC6Gpb8PqYc7KB51HukNt++1o9FCCRl2z8EzfE9U/1/dqUWedQ
	Ei/fDXbD2DK+LKzIOZ3WjT1wUGmscdni8fGsragM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACHfxpR098186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2020 11:41:59 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 12 Nov 2020 11:41:59 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Thu, 12 Nov 2020 11:41:59 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Thread-Topic: [EXTERNAL] [meta-arago] [master/dunfell PATCH]
	matrix-gui-pm-demos: Allow empty package
Thread-Index: AQHWs1/fJtY5Eu0j7kieBz/loz3GDam6I15AgAEScQCAABXMUIAISWaA//+nxZA=
Date: Thu, 12 Nov 2020 17:41:59 +0000
Message-ID: <3a19d70d925149708e184809dbdd83dc@ti.com>
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
	<bcf4433b6a8d4758a56eb570f1e84695@ti.com>
	<CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
In-Reply-To: <CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.34.199]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
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
X-List-Received-Date: Thu, 12 Nov 2020 17:45:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBhdWwgQmFya2VyIDxwYmFy
a2VyQGtvbnN1bGtvLmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDExLCAyMDIwIDEw
OjU2IEFNDQo+VG86IFRhbW1hbmEsIEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+DQo+Q2M6IG1l
dGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj5TdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBbbWV0
YS1hcmFnb10gW21hc3Rlci9kdW5mZWxsIFBBVENIXSBtYXRyaXgtZ3VpLXBtLQ0KPmRlbW9zOiBB
bGxvdyBlbXB0eSBwYWNrYWdlDQo+DQo+T24gRnJpLCA2IE5vdiAyMDIwIGF0IDIyOjQ1LCBUYW1t
YW5hLCBHb3d0aGFtIDxnLXRhbW1hbmFAdGkuY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+ID4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gPkZyb206IFBhdWwgQmFya2VyIDxwYmFya2Vy
QGtvbnN1bGtvLmNvbT4NCj4+ID5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDA2LCAyMDIwIDM6MDYg
QU0NCj4+ID5UbzogVGFtbWFuYSwgR293dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT4NCj4+ID5DYzog
bWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPj4gPlN1YmplY3Q6IFJlOiBbRVhURVJOQUxd
IFttZXRhLWFyYWdvXSBbbWFzdGVyL2R1bmZlbGwgUEFUQ0hdIG1hdHJpeC1ndWktDQo+cG0tDQo+
PiA+ZGVtb3M6IEFsbG93IGVtcHR5IHBhY2thZ2UNCj4+ID4NCj4+ID5PbiBUaHUsIDUgTm92IDIw
MjAgYXQgMjI6NTQsIFRhbW1hbmEsIEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+IHdyb3RlOg0K
Pj4gPj4NCj4+ID4+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gPj4gPkZyb206IG1l
dGEtYXJhZ28tYm91bmNlc0BhcmFnby1wcm9qZWN0Lm9yZyA8bWV0YS1hcmFnby0NCj5ib3VuY2Vz
QGFyYWdvLQ0KPj4gPj4gPnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUGF1bCBCYXJrZXINCj4+
ID4+ID5TZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMDUsIDIwMjAgNDozOCBBTQ0KPj4gPj4gPlRv
OiBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQo+PiA+PiA+U3ViamVjdDogW0VYVEVSTkFM
XSBbbWV0YS1hcmFnb10gW21hc3Rlci9kdW5mZWxsIFBBVENIXSBtYXRyaXgtZ3VpLQ0KPnBtLQ0K
Pj4gPj4gPmRlbW9zOiBBbGxvdyBlbXB0eSBwYWNrYWdlDQo+PiA+PiA+DQo+PiA+PiA+VGhlIG1h
dHJpeC1ndWktcG0tZGVtb3MgcmVjaXBlIHNwbGl0cyBpdHMgYmluYXJpZXMgaW50byBzZXZlcmFs
DQo+PiA+PiA+c3VicGFja2FnZXMgbGVhdmluZyB0aGUgZGVmYXVsdCBwYWNrYWdlIGVtcHR5LiBU
aGUgZGVwZW5kZW5jaWVzIGZvcg0KPnRoZQ0KPj4gPj4gPmRlZmF1bHQgcGFja2FnZSBhcmUgc2V0
IHNvIGl0IG1ha2VzIHNlbnNlIHRvIGFsbG93IHRoaXMgZW1wdHkNCj5wYWNrYWdlDQo+PiA+dG8N
Cj4+ID4+ID5iZSBjcmVhdGVkLg0KPj4gPj4gPg0KPj4gPj4gPlNpZ25lZC1vZmYtYnk6IFBhdWwg
QmFya2VyIDxwYmFya2VyQGtvbnN1bGtvLmNvbT4NCj4+ID4+ID4tLS0NCj4+ID4+ID4gbWV0YS1h
cmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLXBtLWRlbW9zXzIuMC5i
YiB8DQo+MSArDQo+PiA+PiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4gPj4g
Pg0KPj4gPj4gPmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0
cml4L21hdHJpeC1ndWktcG0tDQo+PiA+PiA+ZGVtb3NfMi4wLmJiIGIvbWV0YS1hcmFnby1leHRy
YXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLXBtLQ0KPj4gPj4gPmRlbW9zXzIuMC5i
Yg0KPj4gPj4gPmluZGV4IDAxMTZmNWVhLi5hOWViYjg0ZiAxMDA2NDQNCj4+ID4+ID4tLS0gYS9t
ZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktcG0tDQo+ZGVt
b3NfMi4wLmJiDQo+PiA+PiA+KysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21h
dHJpeC9tYXRyaXgtZ3VpLXBtLQ0KPmRlbW9zXzIuMC5iYg0KPj4gPj4gPkBAIC0xMCw2ICsxMCw3
IEBAIFMgPSAiJHtXT1JLRElSfS9naXQvcG93ZXJfYXBwcyINCj4+ID4+ID4NCj4+ID4+ID4gIyBN
YWtlIHN1cmUgcG93ZXIgc3VibWVudSBhbmQgYXBwIGltYWdlcyBoYXMgYmVlbiBpbnN0YWxsZWQN
Cj4+ID4+ID4gUkRFUEVORFNfJHtQTn0gKz0gIm1hdHJpeC1ndWktYXBwcy1pbWFnZXMgbWF0cml4
LWd1aS1zdWJtZW51cy1wb3dlcg0KPj4gPj4gPm1hdHJpeC1ndWktZ2VuZXJpYy1wbSINCj4+ID4+
ID4rQUxMT1dfRU1QVFlfJHtQTn0gPSAiMSINCj4+ID4+DQo+PiA+PiBKdXN0IGN1cmlvdXMsIEkg
YXNzdW1lIHRoYXQgdGhlIGRlcGxveW1lbnQgb2YgdGhlIGRlcGVuZGVudCBwYWNrYWdlcw0KPmlz
DQo+PiA+c3RpbGwNCj4+ID4+IGVuc3VyZWQgZXZlbiB3aXRob3V0IHRoaXMgY2hhbmdlLiBUaGlz
IGp1c3QgbWFrZXMgaXQgYXBwYXJlbnQgdG8gdGhlDQo+PiA+dXNlciB0aGF0DQo+PiA+PiB0aGUg
ZGVmYXVsdCBwYWNrYWdlIGlzIGVtcHR5LiBPciBpcyBpdCB0aGF0IHRoZSBkZXBsb3ltZW50IG9m
DQo+ZGVwZW5kZW50DQo+PiA+cGFja2FnZXMNCj4+ID4+IGlzIGJyb2tlbiB3aXRob3V0IHRoaXMu
DQo+PiA+DQo+PiA+V2l0aG91dCB0aGlzIGNoYW5nZSB0aGUgbWF0cml4LWd1aS1wbS1kZW1vcyBw
YWNrYWdlIGlzIG5vdCBjcmVhdGVkIGFuZA0KPj4gPmNhbm5vdCBiZSBpbnN0YWxsZWQuDQo+Pg0K
Pj4gWWVzLCBidXQgYXMgdGhlIHBhY2thZ2UgaGVyZSBpcyBlbXB0eSB0cnlpbmcgdG8gdW5kZXJz
dGFuZCB3aHkgaXQgbmVlZHMNCj50bw0KPj4gYmUgaW5zdGFsbGVkIGluIHRoZSBmaXJzdCBwbGFj
ZS4NCj4+DQo+PiBOb3cgdGhhdCB0aGUgcGFja2FnZSBpcyBjcmVhdGVkLCB3b25kZXJpbmcgaWYg
dGhlIGRlcGVuZGVuY2llcyB3aXRoIHRoZQ0KPj4gc3ViLXBhY2thZ2VzIG5lZWRzIHRvIGJlIGxp
c3RlZCBhcyB3ZWxsIHNvbWV0aGluZyBsaWtlDQo+Pg0KPj4gUkRFUEVORFNfJHtQTn0gKz0gJHtQ
Tn0tPHN1YnBhY2thZ2VzfSBvcg0KPj4NCj4+IFJERVBFTkRTXyR7UE59LTxzdWJwYWNrYWdlcz4g
PSAke1BOfQ0KPg0KPkknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgeW91ciBjb21tZW50IGhlcmUu
IFJERVBFTkRTXyR7UE59IGlzIHNldCBvbg0KPnRoZSBsaW5lIGFib3ZlIG15IGNoYW5nZS4gU28g
ZWZmZWN0aXZlbHkgJHtQTn0gaXMgYSBwYWNrYWdlZ3JvdXAgd2hpY2gNCj53aWxsIGluc3RhbGwg
dGhlIGxpc3RlZCBkZXBlbmRlbmNpZXMuIEJ1dCB3aXRob3V0IEFMTE9XX0VNUFRZIGJlaW5nDQo+
c2V0IGl0IHdvbid0IGJlIGNyZWF0ZWQuDQo+DQo+VGhlIG90aGVyIHRoaW5nIHRvIGNvbnNpZGVy
IGlzIHRoYXQgJHtQTn0gaXMgYSBkZWZhdWx0IGRlcGVuZGVuY3kgb2YNCj4ke1BOfS1kZXYgYW5k
IHNvIG5vdCBjcmVhdGluZyBhICR7UE59IHBhY2thZ2UgY2FuIHJlc3VsdCBpbiBpbWFnZQ0KPmZl
YXR1cmVzIGxpa2UgZGV2LXBrZ3MgYnJlYWtpbmcuDQoNClRoZSBjb21tZW50IHdhcyBmb3IgdGhl
IGRlcGVuZGVuY2llcyBmb3IgdGhlIHN1Yi1wYWNrYWdlcyAke1BOfS1jb3VudA0KYW5kIG90aGVy
cyBoZXJlLiBJIGRvbid0IHRoaW5rICR7UE59IGJlY29tZXMgYSBkZWZhdWx0IGRlcGVuZGVuY3kg
Zm9yDQpzdWItcGFja2FnZXMuIEF0bGVhc3QgdGhlIGBvcGtnIGluc3RhbGxgIG9uIHN1Yi1wYWNr
YWdlcyBpcyBub3QgY2hlY2tpbmcNCm9uIHRoZSAke1BOfSBkZXBlbmRlbmNpZXMuIEdpdmVuIHRo
ZXkgYXJlIGRlcGVuZGVuY2llcyBJIHJlYXNvbmVkIHRoYXQNCnRoZXkgY2FuIGJlIGFkZGVkIHRv
IHRoZSBzdWItcGFja2FnZXMgd2l0aCANCg0KUkRFUEVORFMtJHtQTn0tY291bnQgKz0gJHtQTn0N
Cg0Kc28gdGhhdCAke1BOfSBsaXN0ZWQgZGVwZW5kZW5jaWVzIGFyZSBpbnN0YWxsZWQgb24gaW5z
dGFsbGF0aW9uIG9mIGFueSBvZg0KdGhlIHN1Yi1wYWNrYWdlIHdoaWNoIHNlZW1zIHRvIGJlIHdo
YXQgdGhlIHJlY2lwZSB3YW50cy4NCg0KSSBzZWUgdGhhdCB0aGlzIHBhdGNoIGhhcyBiZWVuIG1l
cmdlZC4gVGhpcyBjYW4gYmUgYSBzZXBhcmF0ZSBwYXRjaC4gSSANCmNhbiBwdXNoIHRoaXMgY2hh
bmdlIGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvLg0KDQpUaGFua3MsDQpHb3d0aGFtDQoNCg==

