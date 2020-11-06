Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7E520529BD
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 22:49:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6Mjpxo057215;
	Fri, 6 Nov 2020 16:45:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604702751;
	bh=IG07xC78fPp9uGcYiKs3yIJcJ7XxL0k25RleBjXkeV0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=zLZlUoHPAkQkPKVRDsUTSUDDz11a/VU1MYTywGBHpe4Emp0juAvm6mLqukKlpgR/I
	q3eNS4QuT7NJyxKUbytonrRPeWSyWniXzRoNgznTMvTZsUiMEMVg//KsrSavh1FoKL
	v2l/nSQMegw5+HTpIuGbMFAb9JE9uxpQNRC6dlWU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6MjpRr054887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2020 16:45:51 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 6 Nov 2020 16:45:51 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Fri, 6 Nov 2020 16:45:51 -0600
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Paul Barker <pbarker@konsulko.com>
Thread-Topic: [EXTERNAL] [meta-arago] [master/dunfell PATCH]
	matrix-gui-pm-demos: Allow empty package
Thread-Index: AQHWs1/fJtY5Eu0j7kieBz/loz3GDam6I15AgAEScQCAABXMUA==
Date: Fri, 6 Nov 2020 22:45:51 +0000
Message-ID: <bcf4433b6a8d4758a56eb570f1e84695@ti.com>
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
In-Reply-To: <CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.73.35]
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
X-List-Received-Date: Fri, 06 Nov 2020 22:49:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBhdWwgQmFya2VyIDxwYmFy
a2VyQGtvbnN1bGtvLmNvbT4NCj5TZW50OiBGcmlkYXksIE5vdmVtYmVyIDA2LCAyMDIwIDM6MDYg
QU0NCj5UbzogVGFtbWFuYSwgR293dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT4NCj5DYzogbWV0YS1h
cmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPlN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRhLWFy
YWdvXSBbbWFzdGVyL2R1bmZlbGwgUEFUQ0hdIG1hdHJpeC1ndWktcG0tDQo+ZGVtb3M6IEFsbG93
IGVtcHR5IHBhY2thZ2UNCj4NCj5PbiBUaHUsIDUgTm92IDIwMjAgYXQgMjI6NTQsIFRhbW1hbmEs
IEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+IHdyb3RlOg0KPj4NCj4+ID4tLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4gPkZyb206IG1ldGEtYXJhZ28tYm91bmNlc0BhcmFnby1wcm9qZWN0
Lm9yZyA8bWV0YS1hcmFnby1ib3VuY2VzQGFyYWdvLQ0KPj4gPnByb2plY3Qub3JnPiBPbiBCZWhh
bGYgT2YgUGF1bCBCYXJrZXINCj4+ID5TZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMDUsIDIwMjAg
NDozOCBBTQ0KPj4gPlRvOiBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQo+PiA+U3ViamVj
dDogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10gW21hc3Rlci9kdW5mZWxsIFBBVENIXSBtYXRyaXgt
Z3VpLXBtLQ0KPj4gPmRlbW9zOiBBbGxvdyBlbXB0eSBwYWNrYWdlDQo+PiA+DQo+PiA+VGhlIG1h
dHJpeC1ndWktcG0tZGVtb3MgcmVjaXBlIHNwbGl0cyBpdHMgYmluYXJpZXMgaW50byBzZXZlcmFs
DQo+PiA+c3VicGFja2FnZXMgbGVhdmluZyB0aGUgZGVmYXVsdCBwYWNrYWdlIGVtcHR5LiBUaGUg
ZGVwZW5kZW5jaWVzIGZvciB0aGUNCj4+ID5kZWZhdWx0IHBhY2thZ2UgYXJlIHNldCBzbyBpdCBt
YWtlcyBzZW5zZSB0byBhbGxvdyB0aGlzIGVtcHR5IHBhY2thZ2UNCj50bw0KPj4gPmJlIGNyZWF0
ZWQuDQo+PiA+DQo+PiA+U2lnbmVkLW9mZi1ieTogUGF1bCBCYXJrZXIgPHBiYXJrZXJAa29uc3Vs
a28uY29tPg0KPj4gPi0tLQ0KPj4gPiBtZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0
cml4L21hdHJpeC1ndWktcG0tZGVtb3NfMi4wLmJiIHwgMSArDQo+PiA+IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPj4gPg0KPj4gPmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWV4dHJh
cy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktcG0tDQo+PiA+ZGVtb3NfMi4wLmJiIGIv
bWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLXBtLQ0KPj4g
PmRlbW9zXzIuMC5iYg0KPj4gPmluZGV4IDAxMTZmNWVhLi5hOWViYjg0ZiAxMDA2NDQNCj4+ID4t
LS0gYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktcG0t
ZGVtb3NfMi4wLmJiDQo+PiA+KysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21h
dHJpeC9tYXRyaXgtZ3VpLXBtLWRlbW9zXzIuMC5iYg0KPj4gPkBAIC0xMCw2ICsxMCw3IEBAIFMg
PSAiJHtXT1JLRElSfS9naXQvcG93ZXJfYXBwcyINCj4+ID4NCj4+ID4gIyBNYWtlIHN1cmUgcG93
ZXIgc3VibWVudSBhbmQgYXBwIGltYWdlcyBoYXMgYmVlbiBpbnN0YWxsZWQNCj4+ID4gUkRFUEVO
RFNfJHtQTn0gKz0gIm1hdHJpeC1ndWktYXBwcy1pbWFnZXMgbWF0cml4LWd1aS1zdWJtZW51cy1w
b3dlcg0KPj4gPm1hdHJpeC1ndWktZ2VuZXJpYy1wbSINCj4+ID4rQUxMT1dfRU1QVFlfJHtQTn0g
PSAiMSINCj4+DQo+PiBKdXN0IGN1cmlvdXMsIEkgYXNzdW1lIHRoYXQgdGhlIGRlcGxveW1lbnQg
b2YgdGhlIGRlcGVuZGVudCBwYWNrYWdlcyBpcw0KPnN0aWxsDQo+PiBlbnN1cmVkIGV2ZW4gd2l0
aG91dCB0aGlzIGNoYW5nZS4gVGhpcyBqdXN0IG1ha2VzIGl0IGFwcGFyZW50IHRvIHRoZQ0KPnVz
ZXIgdGhhdA0KPj4gdGhlIGRlZmF1bHQgcGFja2FnZSBpcyBlbXB0eS4gT3IgaXMgaXQgdGhhdCB0
aGUgZGVwbG95bWVudCBvZiBkZXBlbmRlbnQNCj5wYWNrYWdlcw0KPj4gaXMgYnJva2VuIHdpdGhv
dXQgdGhpcy4NCj4NCj5XaXRob3V0IHRoaXMgY2hhbmdlIHRoZSBtYXRyaXgtZ3VpLXBtLWRlbW9z
IHBhY2thZ2UgaXMgbm90IGNyZWF0ZWQgYW5kDQo+Y2Fubm90IGJlIGluc3RhbGxlZC4NCg0KWWVz
LCBidXQgYXMgdGhlIHBhY2thZ2UgaGVyZSBpcyBlbXB0eSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3
aHkgaXQgbmVlZHMgdG8NCmJlIGluc3RhbGxlZCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNCk5vdyB0
aGF0IHRoZSBwYWNrYWdlIGlzIGNyZWF0ZWQsIHdvbmRlcmluZyBpZiB0aGUgZGVwZW5kZW5jaWVz
IHdpdGggdGhlIA0Kc3ViLXBhY2thZ2VzIG5lZWRzIHRvIGJlIGxpc3RlZCBhcyB3ZWxsIHNvbWV0
aGluZyBsaWtlDQoNClJERVBFTkRTXyR7UE59ICs9ICR7UE59LTxzdWJwYWNrYWdlc30gb3INCg0K
UkRFUEVORFNfJHtQTn0tPHN1YnBhY2thZ2VzPiA9ICR7UE59DQoNClRoYW5rcywNCkdvd3RoYW0N
Cg0K

