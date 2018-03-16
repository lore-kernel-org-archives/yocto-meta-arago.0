Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8D99D52994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 13:00:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GD00o9012225
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521205200;
	bh=MTXQcF/o/9dnd8m9CxTJk+PNtwfXce4Zu3xG+LZb89c=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Bx5yxlGhQXLVkLhGwa698vVKzB01WGc0XlGGPj99CzHqr0QqN9ljY7TqCDqL8QUcZ
	60QQ/TSXd6os4CVRqVQfsu6chUp3F7o6ssdCNd1ZU+vx/SSiTUO/pPISuO3msNIwWd
	bi0RI1Bp/t2jhJWX+j3zz0dWR3CzIpvFCw5uUIhk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GD00oR001426
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:00:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 07:59:59 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Fri, 16 Mar 2018 07:59:59 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH v3]
	video-graphics-test: bump SRCREV to pick up the latest version
Thread-Index: AQHTvSSmEyQ+Ap3wqkmrvRdt9YWUN6PTJrUA//+sTRA=
Date: Fri, 16 Mar 2018 12:59:59 +0000
Message-ID: <b330dc3cb06e428fb49ac43192ba0529@ti.com>
References: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
	<6d774a67-674a-9615-5e81-d0500faef810@ti.com>
	<f8e51ccdc7a048d59712f5deca3abd9d@ti.com>
In-Reply-To: <f8e51ccdc7a048d59712f5deca3abd9d@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v3] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 13:00:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBuZWVkZWQgdG8gdXBkYXRlIG1ldGEtdGkgZm9yIHRoaXMuIEkgYW0gdHJ5aW5nIGFnYWluIG5v
dy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSdWVpLCBFcmljDQo+
IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTYsIDIwMTggODo1OSBBTQ0KPiBUbzogU3RpZmZsZXIsIEph
Y29iOyBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbRVhURVJO
QUxdIFttZXRhLWFyYWdvXSBbbW9ydHldW21ldGEtcHJvY2Vzc29yLXNka11bUEFUQ0gNCj4gdjNd
IHZpZGVvLWdyYXBoaWNzLXRlc3Q6IGJ1bXAgU1JDUkVWIHRvIHBpY2sgdXAgdGhlIGxhdGVzdCB2
ZXJzaW9uDQo+IA0KPiBIaSwgSmFrZToNCj4gDQo+IFdlIGhhdmUgc3VibWl0dGVkIGEgZ2MzMjAg
cGF0Y2ggdG8gbWV0YS1hcmFnbyBsb25nIGJhY2suIEkgdGhvdWdodCB0aGF0IGl0DQo+IHdhcyBp
biwgbGV0IG1lIGNoZWNrIGFnYWluLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCj4gRXJpYw0K
PiANCj4gDQo+IA0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3Rp
ZmZsZXIsIEphY29iDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTYsIDIwMTggODo0NSBBTQ0KPiBU
bzogUnVlaSwgRXJpYzsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBS
ZTogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10gW21vcnR5XVttZXRhLXByb2Nlc3Nvci1zZGtdW1BB
VENIDQo+IHYzXSB2aWRlby1ncmFwaGljcy10ZXN0OiBidW1wIFNSQ1JFViB0byBwaWNrIHVwIHRo
ZSBsYXRlc3QgdmVyc2lvbg0KPiANCj4gSSBnZXQgYW4gZGlmZmVyZW50IGVycm9yIG5vdy4NCj4g
DQo+IA0KPiB8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9naXQvZ2MzMjAuY3BwOjM5OjA6DQo+
IHwgLi4vZ2l0L2djMzIwLmg6Mzg6MjA6IGZhdGFsIGVycm9yOiBnY19oYWwuaDogTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeQ0KPiB8wqAgI2luY2x1ZGUgPGdjX2hhbC5oPg0KPiB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+IHwgY29tcGlsYXRpb24gdGVybWlu
YXRlZC4NCj4gfCBNYWtlZmlsZTo5NDI6IHJlY2lwZSBmb3IgdGFyZ2V0ICdnYzMyMC5vJyBmYWls
ZWQNCj4gfCBtYWtlOiAqKiogW2djMzIwLm9dIEVycm9yIDENCj4gfCBtYWtlOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPiB8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9n
aXQvdmlkZW9fZ3JhcGhpY3NfdGVzdC5jcHA6NDY6MDoNCj4gfCAuLi9naXQvZ2MzMjAuaDozODoy
MDogZmF0YWwgZXJyb3I6IGdjX2hhbC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+IHzC
oCAjaW5jbHVkZSA8Z2NfaGFsLmg+DQo+IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF4NCj4gfCBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLg0KPiB8IE1ha2VmaWxlOjkz
NzogcmVjaXBlIGZvciB0YXJnZXQgJ3ZpZGVvX2dyYXBoaWNzX3Rlc3QubycgZmFpbGVkDQo+IHwg
bWFrZTogKioqIFt2aWRlb19ncmFwaGljc190ZXN0Lm9dIEVycm9yIDENCj4gDQo+IA0KPiANCj4g
T24gMy8xNS8yMDE4IDU6MjQgUE0sIEVyaWMgUnVlaSB3cm90ZToNCj4gPiAtIGluY2x1ZGUgZ2Mz
MjANCj4gPiAtIFFQQSBpbnRlcmZhY2UgY2hhbmdlcw0KPiA+IC0gZHVhbC1zY3JlZW4gc3VwcG9y
dA0KPiA+IC0gYWRkIG1vcmUgZGVwZW5kZW5jaWVzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBF
cmljIFJ1ZWkgPGUtcnVlaTFAdGkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgcmVjaXBlcy1tdWx0aW1l
ZGlhL3ZpZGVvLWdyYXBoaWNzLXRlc3QvdmlkZW8tZ3JhcGhpY3MtdGVzdF8xLjAuYmIgfCA2DQo+
ICsrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9yZWNpcGVzLW11bHRpbWVkaWEvdmlkZW8tZ3Jh
cGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy0NCj4gdGVzdF8xLjAuYmIgYi9yZWNpcGVzLW11bHRp
bWVkaWEvdmlkZW8tZ3JhcGhpY3MtdGVzdC92aWRlby1ncmFwaGljcy0NCj4gdGVzdF8xLjAuYmIN
Cj4gPiBpbmRleCBjMTlhZjE2Li4zMDgwNWE1IDEwMDY0NA0KPiA+IC0tLSBhL3JlY2lwZXMtbXVs
dGltZWRpYS92aWRlby1ncmFwaGljcy10ZXN0L3ZpZGVvLWdyYXBoaWNzLXRlc3RfMS4wLmJiDQo+
ID4gKysrIGIvcmVjaXBlcy1tdWx0aW1lZGlhL3ZpZGVvLWdyYXBoaWNzLXRlc3QvdmlkZW8tZ3Jh
cGhpY3MtdGVzdF8xLjAuYmINCj4gPiBAQCAtNCwxMiArNCwxMiBAQCBTRUNUSU9OID0gIm11bHRp
bWVkaWEiDQo+ID4gICBMSUNFTlNFID0gIkdQTHYyIg0KPiA+ICAgTElDX0ZJTEVTX0NIS1NVTSA9
DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9YzdjYTcwNzcwNGQzMzU0YTY0ZmVlYjRmMTlmNTJlYjUi
DQo+ID4NCj4gPiAtREVQRU5EUyArPSAibGliZHJtIg0KPiA+ICtERVBFTkRTICs9ICJsaWJkcm0g
dGktZ2MzMjAtbGlicyBjbWVtIHF0ZGVjbGFyYXRpdmUiDQo+ID4NCj4gPiAtUFIgPSAicjAiDQo+
ID4gK1BSID0gInIxIg0KPiA+DQo+ID4gICBCUkFOQ0ggPSAibWFzdGVyIg0KPiA+IC1TUkNSRVYg
PSAiM2IzMDA3NjgwODQ1ZDM5Nzg0MTQ2Mzk2YTJkZDJhNjhhYTFhMjI4MyINCj4gPiArU1JDUkVW
ID0gImJkZmJjNDE3OWQ4ZDE3NmZlZWMxZGYxNDg3MjhiMTg4MmZjYTc0MTYiDQo+ID4NCj4gPiAg
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRpLmNvbS9zaXRhcmEtbGludXgvdmlkZW8tZ3JhcGhpY3Mt
DQo+IHRlc3QuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9JHtCUkFOQ0h9IFwNCj4gPiAgICINCg0K

