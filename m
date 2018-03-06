Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7A95B529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 16:40:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26GdT47032656
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:39:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520354369;
	bh=okB3ygLJ+TIX20FxonIZc9/xiYdD7cxQqBKg8dBjetM=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=accGw786g1Ul9e/D43eFgyBNclJQWbc9Xil5Es9KaP+FbJuDeljTKsZVJNx6ooUtA
	VPCk4Y1Qy6U2hbNlMNyNuqrywjtPrN9YlhwcsAl20QtKuwAyaQ9ZKTePj31rL7cB+D
	onJsLWF5Z+5zZ4yDwOb8kiHyvXB3LvKKUgc/2y3k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GdTnl014404
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:39:29 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:39:29 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Tue, 6 Mar 2018 10:39:29 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	video-graphics-test: bump SRCREV to pick up the latest version
Thread-Index: AQHTtWTJEtUF7+Rk1kKK9isJmdroxqPDaHfQ
Date: Tue, 6 Mar 2018 16:39:29 +0000
Message-ID: <028b0ed9b2af4c1281ee27fd54ffdc7d@ti.com>
References: <1520348769-6194-1-git-send-email-e-ruei1@ti.com>
	<bc25f3fd-05f7-2991-6fbb-9ad20c1540d1@ti.com>
In-Reply-To: <bc25f3fd-05f7-2991-6fbb-9ad20c1540d1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Tue, 06 Mar 2018 16:40:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzISBJIGp1c3Qgc3VibWl0dGVkIHBhdGNoIHYyLg0KDQpCZXN0IHJlZ2FyZHMsDQoNCkVy
aWMNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RpZmZsZXIsIEphY29i
IA0KU2VudDogVHVlc2RheSwgTWFyY2ggMDYsIDIwMTggMTE6MDQgQU0NClRvOiBSdWVpLCBFcmlj
OyBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBb
bWV0YS1hcmFnb10gW21vcnR5XVttZXRhLXByb2Nlc3Nvci1zZGtdW1BBVENIXSB2aWRlby1ncmFw
aGljcy10ZXN0OiBidW1wIFNSQ1JFViB0byBwaWNrIHVwIHRoZSBsYXRlc3QgdmVyc2lvbg0KDQpU
aGlzIHBhdGNoIGRvZXMgbm90IGFwcGx5LiBQbGVhc2UgcmViYXNlIGFuZCBzZW5kIGEgdjIuDQoN
Cg0KT24gMy82LzIwMTggMTA6MDYgQU0sIEVyaWMgUnVlaSB3cm90ZToNCj4gLSBpbmNsdWRlIGdj
MzIwDQo+IC0gUVBBIGludGVyZmFjZSBjaGFuZ2VzDQo+IC0gZHVhbC1zY3JlZW4gc3VwcG9ydA0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pc2hhIEFncmF3YWwgPG1hbmlzaGEuYWdyYXdhbEB0aS5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEVyaWMgUnVlaSA8ZS1ydWVpMUB0aS5jb20+DQo+IC0tLQ0K
PiAgIHJlY2lwZXMtbXVsdGltZWRpYS92aWRlby1ncmFwaGljcy10ZXN0L3ZpZGVvLWdyYXBoaWNz
LXRlc3RfMS4wLmJiIHwgNiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1tdWx0aW1lZGlh
L3ZpZGVvLWdyYXBoaWNzLXRlc3QvdmlkZW8tZ3JhcGhpY3MtdGVzdF8xLjAuYmIgYi9yZWNpcGVz
LW11bHRpbWVkaWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy10ZXN0XzEuMC5i
Yg0KPiBpbmRleCAyOGFhY2RmLi5lYzY3NmU3IDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLW11bHRp
bWVkaWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy10ZXN0XzEuMC5iYg0KPiAr
KysgYi9yZWNpcGVzLW11bHRpbWVkaWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGlj
cy10ZXN0XzEuMC5iYg0KPiBAQCAtNCwxMiArNCwxMiBAQCBTRUNUSU9OID0gIm11bHRpbWVkaWEi
DQo+ICAgTElDRU5TRSA9ICJHUEx2MiINCj4gICBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT1jN2NhNzA3NzA0ZDMzNTRhNjRmZWViNGYxOWY1MmViNSINCj4gICANCj4gLURF
UEVORFMgKz0gImxpYmRybSINCj4gK0RFUEVORFMgKz0gImxpYmRybSB0aS1nYzMyMC1saWJzIg0K
PiAgIA0KPiAtUFIgPSAicjAiDQo+ICtQUiA9ICJyMSINCj4gICANCj4gICBCUkFOQ0ggPSAibWFz
dGVyIg0KPiAtU1JDUkVWID0gImViYzdhYjQ0ZDA1ZmM3MjZiMGRkYzdmNGI0NWQ3MWQ3NTA5MzEz
ZjUiDQo+ICtTUkNSRVYgPSAiYmRmYmM0MTc5ZDhkMTc2ZmVlYzFkZjE0ODcyOGIxODgyZmNhNzQx
NiINCj4gICANCj4gICBTUkNfVVJJID0gImdpdDovL2dpdC50aS5jb20vc2l0YXJhLWxpbnV4L3Zp
ZGVvLWdyYXBoaWNzLXRlc3QuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9JHtCUkFOQ0h9IFwNCj4g
ICAiDQoNCg==

