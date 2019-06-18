Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B98DA52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:38:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICbeZM085347
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861460;
	bh=iAR5NDu4G6tjvLHUgcrDkA00Z9pdme7aJ02y4lohimY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=LxU33rS4EdzhH8qXzVbaVZa0lLjSnc9OgU28ymrBQBt2uoiSkgeETelB9bUdu86LX
	FRKpfJoitbPn4Kg/U2XMflN8+eqhKiwbhb7R+Ne5Ga2a9/s8nZW3NhgIGkoKeNlfqm
	NPhcLO7w8pUQZENiipkHF55JLc5KonwHEeUkT6AU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICber2126004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:37:40 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:37:40 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1713.004; Tue, 18 Jun 2019 07:37:40 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH 2/2] matrix-gui-apps-git:bump
	SRCREV to put deform back to full-screen mode
Thread-Index: AQHVIRJJyPxE8kMtrUKrVBvmObE++qahtjgA//+slZA=
Date: Tue, 18 Jun 2019 12:37:40 +0000
Message-ID: <339b2f4c40884ef0ad6fe9e4f6d737a4@ti.com>
References: <20190607140503.29694-1-e-ruei1@ti.com>
	<20190607140503.29694-2-e-ruei1@ti.com>
	<997ffbfd-cd22-f126-6ead-e8608ad4143d@ti.com>
	<a94ace22-bf40-c945-e2f2-8fdf4cc97d60@ti.com>
In-Reply-To: <a94ace22-bf40-c945-e2f2-8fdf4cc97d60@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
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
X-List-Received-Date: Tue, 18 Jun 2019 12:38:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBoYXZlIGFub3RoZXIgb25lIG9uIHRvcCBvZiB0aGlzIG9uZSBmb3IgcmV2ZXJ0aW5nIHRoZSB2
aWRlby1hbmFseXRpYyB3b3JrYXJvdW5kLiANCg0KRXJpYw0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpTZW50OiBUdWVzZGF5LCBKdW5lIDE4
LCAyMDE5IDg6MzUgQU0NClRvOiBSdWVpLCBFcmljOyBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qu
b3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10gW1BBVENIIDIvMl0gbWF0
cml4LWd1aS1hcHBzLWdpdDpidW1wIFNSQ1JFViB0byBwdXQgZGVmb3JtIGJhY2sgdG8gZnVsbC1z
Y3JlZW4gbW9kZQ0KDQpQaW5nLg0KDQpPbiA2LzEyLzIwMTkgNzozMCBBTSwgSmFjb2IgU3RpZmZs
ZXIgd3JvdGU6DQo+IERlbnlzLA0KPg0KPiBDYW4geW91IHBsZWFzZSBiYWNrcG9ydCB0aGlzIHRv
IHRoZSB0aTIwMTkuMDEgYnJhbmNoPw0KPg0KPg0KPiBUaGFuayB5b3UsDQo+DQo+IEpha2UNCj4N
Cj4gT24gNi83LzIwMTkgMTA6MDUgQU0sIEVyaWMgUnVlaSB3cm90ZToNCj4+IFJlc3RvcmUgZGVm
b3JtIHRvIGZ1bGwtc2NyZWVuIG1vZGUgYmVjYXVzZSB0aGUgZGlzcGxheSBwcm9ibGVtIGhhcyBi
ZWVuDQo+PiBmaXhlZCBhdCBXZXN0b24gNS4wDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRXJpYyBS
dWVpIDxlLXJ1ZWkxQHRpLmNvbT4NCj4+IC0tLQ0KPj4gwqAgbWV0YS1hcmFnby1leHRyYXMvcmVj
aXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLWFwcHMtZ2l0LmluYyB8IDQgKystLQ0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IA0KPj4gYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21h
dHJpeC1ndWktYXBwcy1naXQuaW5jIA0KPj4gYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNv
cmUvbWF0cml4L21hdHJpeC1ndWktYXBwcy1naXQuaW5jDQo+PiBpbmRleCAxZWYxZTliOS4uNDg3
ZjE1NDQgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0
cml4L21hdHJpeC1ndWktYXBwcy1naXQuaW5jDQo+PiArKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9y
ZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1ndWktYXBwcy1naXQuaW5jDQo+PiBAQCAtNCw5ICs0
LDkgQEAgTElDRU5TRV9DSEVDS1NVTSA9IA0KPj4gIkxJQ0VOU0U7bWQ1PTZlMGFlNzIxNGY2Yzc0
YzE0OWNiMjVmMzczMDU3ZmE5Ig0KPj4gwqAgTElDX0ZJTEVTX0NIS1NVTSA6PSAiZmlsZTovLy4u
LyR7TElDRU5TRV9DSEVDS1NVTX0iDQo+PiDCoCDCoCBTUkNfVVJJID0gDQo+PiAiZ2l0Oi8vZ2l0
LnRpLmNvbS9tYXRyaXgtZ3VpLXYyL21hdHJpeC1ndWktdjItYXBwcy5naXQ7cHJvdG9jb2w9Z2l0
O2JyYW5jaD0ke0JSQU5DSH0iDQo+PiAtU1JDUkVWID0gIjQyY2NkOTc4MDA0ZWM3NWI0ZTA1MzEz
NDY2YWJlOTI4MDZkMTRhMjkiDQo+PiArU1JDUkVWID0gIjJiNDFlZTFmOGUwZGZlNmI1Zjc4ZDU2
ZTEzYTUxYWFiMTE1YWFmZjAiDQo+PiDCoCBCUkFOQ0ggPSAibWFzdGVyIg0KPj4gLUlOQ19QUiA9
ICJyNjkiDQo+PiArSU5DX1BSID0gInI3MCINCj4+IMKgIMKgICMgUHVsbCBpbiB0aGUgYmFzZSBw
YWNrYWdlIGZvciBpbnN0YWxsaW5nIG1hdHJpeCBhcHBsaWNhdGlvbnMNCj4+IMKgIHJlcXVpcmUg
bWF0cml4LWd1aS1hcHBzLmluYw0K

