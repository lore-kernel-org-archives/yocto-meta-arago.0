Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9A2A6529E7
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:41:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICfCht121840
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861672;
	bh=ERaYdsHVRQJpy+D7E1kydVZZw7/EGOXLaPCn+0Aq8tE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=vuw7xJE6NWNSkopcmae5T3oNzFvpAqJxek1nqe/mrxYqdeQ0LUiTX22MSRZMyKlGk
	QWoJubAM/P8rxgMrO4vLfW7KGaIx8PT8Yifq90prqmj26z7DC8aj3KK0E8DZDL/AI2
	C5QDq+frdF3C4goukOa8E3lRk8jZn6SxPbVvU8uE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICfCrQ105599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:41:12 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:41:12 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1713.004; Tue, 18 Jun 2019 07:41:12 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH 2/2] matrix-gui-apps-git:bump
	SRCREV to put deform back to full-screen mode
Thread-Index: AQHVHToTaaU3LBA68kqtcSv4oeOwu6aX6hwAgAl/+wCAAFSCAP//rISA
Date: Tue, 18 Jun 2019 12:41:11 +0000
Message-ID: <f13885b12ea14dd2938df860ba8f93aa@ti.com>
References: <20190607140503.29694-1-e-ruei1@ti.com>
	<20190607140503.29694-2-e-ruei1@ti.com>
	<997ffbfd-cd22-f126-6ead-e8608ad4143d@ti.com>
	<a94ace22-bf40-c945-e2f2-8fdf4cc97d60@ti.com>
	<339b2f4c40884ef0ad6fe9e4f6d737a4@ti.com>
In-Reply-To: <339b2f4c40884ef0ad6fe9e4f6d737a4@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH 2/2] matrix-gui-apps-git:bump SRCREV to put deform back to full-screen mode
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
X-List-Received-Date: Tue, 18 Jun 2019 12:41:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RG8gd2UgbmVlZCB0aGlzIHBhdGNoPw0KDQotIEpha2UNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBSdWVpLCBFcmljDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIw
MTkgODozOCBBTQ0KPiBUbzogU3RpZmZsZXIsIEphY29iOyBtZXRhLWFyYWdvQGFyYWdvLXByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFttZXRhLWFyYWdvXSBbUEFUQ0ggMi8y
XSBtYXRyaXgtZ3VpLWFwcHMtZ2l0OmJ1bXANCj4gU1JDUkVWIHRvIHB1dCBkZWZvcm0gYmFjayB0
byBmdWxsLXNjcmVlbiBtb2RlDQo+IA0KPiBJIGhhdmUgYW5vdGhlciBvbmUgb24gdG9wIG9mIHRo
aXMgb25lIGZvciByZXZlcnRpbmcgdGhlIHZpZGVvLWFuYWx5dGljDQo+IHdvcmthcm91bmQuDQo+
IA0KPiBFcmljDQo+IA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
U3RpZmZsZXIsIEphY29iDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIwMTkgODozNSBBTQ0K
PiBUbzogUnVlaSwgRXJpYzsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0
OiBSZTogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10gW1BBVENIIDIvMl0gbWF0cml4LWd1aS1hcHBz
LQ0KPiBnaXQ6YnVtcCBTUkNSRVYgdG8gcHV0IGRlZm9ybSBiYWNrIHRvIGZ1bGwtc2NyZWVuIG1v
ZGUNCj4gDQo+IFBpbmcuDQo+IA0KPiBPbiA2LzEyLzIwMTkgNzozMCBBTSwgSmFjb2IgU3RpZmZs
ZXIgd3JvdGU6DQo+ID4gRGVueXMsDQo+ID4NCj4gPiBDYW4geW91IHBsZWFzZSBiYWNrcG9ydCB0
aGlzIHRvIHRoZSB0aTIwMTkuMDEgYnJhbmNoPw0KPiA+DQo+ID4NCj4gPiBUaGFuayB5b3UsDQo+
ID4NCj4gPiBKYWtlDQo+ID4NCj4gPiBPbiA2LzcvMjAxOSAxMDowNSBBTSwgRXJpYyBSdWVpIHdy
b3RlOg0KPiA+PiBSZXN0b3JlIGRlZm9ybSB0byBmdWxsLXNjcmVlbiBtb2RlIGJlY2F1c2UgdGhl
IGRpc3BsYXkgcHJvYmxlbSBoYXMNCj4gYmVlbg0KPiA+PiBmaXhlZCBhdCBXZXN0b24gNS4wDQo+
ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEVyaWMgUnVlaSA8ZS1ydWVpMUB0aS5jb20+DQo+ID4+
IC0tLQ0KPiA+PiDCoCBtZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJp
eC1ndWktYXBwcy1naXQuaW5jIHwgNCArKy0tDQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4g
YS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktYXBwcy1n
aXQuaW5jDQo+ID4+IGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRy
aXgtZ3VpLWFwcHMtZ2l0LmluYw0KPiA+PiBpbmRleCAxZWYxZTliOS4uNDg3ZjE1NDQgMTAwNjQ0
DQo+ID4+IC0tLSBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29yZS9tYXRyaXgvbWF0cml4
LWd1aS1hcHBzLWdpdC5pbmMNCj4gPj4gKysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1j
b3JlL21hdHJpeC9tYXRyaXgtZ3VpLWFwcHMtZ2l0LmluYw0KPiA+PiBAQCAtNCw5ICs0LDkgQEAg
TElDRU5TRV9DSEVDS1NVTSA9DQo+ID4+ICJMSUNFTlNFO21kNT02ZTBhZTcyMTRmNmM3NGMxNDlj
YjI1ZjM3MzA1N2ZhOSINCj4gPj4gwqAgTElDX0ZJTEVTX0NIS1NVTSA6PSAiZmlsZTovLy4uLyR7
TElDRU5TRV9DSEVDS1NVTX0iDQo+ID4+IMKgIMKgIFNSQ19VUkkgPQ0KPiA+PiAiZ2l0Oi8vZ2l0
LnRpLmNvbS9tYXRyaXgtZ3VpLXYyL21hdHJpeC1ndWktdjItDQo+IGFwcHMuZ2l0O3Byb3RvY29s
PWdpdDticmFuY2g9JHtCUkFOQ0h9Ig0KPiA+PiAtU1JDUkVWID0gIjQyY2NkOTc4MDA0ZWM3NWI0
ZTA1MzEzNDY2YWJlOTI4MDZkMTRhMjkiDQo+ID4+ICtTUkNSRVYgPSAiMmI0MWVlMWY4ZTBkZmU2
YjVmNzhkNTZlMTNhNTFhYWIxMTVhYWZmMCINCj4gPj4gwqAgQlJBTkNIID0gIm1hc3RlciINCj4g
Pj4gLUlOQ19QUiA9ICJyNjkiDQo+ID4+ICtJTkNfUFIgPSAicjcwIg0KPiA+PiDCoCDCoCAjIFB1
bGwgaW4gdGhlIGJhc2UgcGFja2FnZSBmb3IgaW5zdGFsbGluZyBtYXRyaXggYXBwbGljYXRpb25z
DQo+ID4+IMKgIHJlcXVpcmUgbWF0cml4LWd1aS1hcHBzLmluYw0K

