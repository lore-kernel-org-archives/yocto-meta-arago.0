Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CCDA0529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 13:02:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HD1taD017388
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537189315;
	bh=IbWOn39wUJCf9ucbheYLfgXNVJ2I5MerNEmBXz/fyBE=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=HeY7XtP9sdW0asrF/li7GHnB3iuAIrVzlmsEKJ21sc2S9CV7ms3RxT2qUpxtu+UUB
	arOZpF2Q/Jc36ynglkDlprIowl+ddMgVusSjDF3lI2LoeEb+w7PUNAIONtaE3qXyKg
	Rj7UFmY07Y6Vhy96hOkrJaId4K7ReRat4MjVJyWM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HD1t4s021266
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:01:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:01:54 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Mon, 17 Sep 2018 08:01:55 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH]
	packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3
	devices
Thread-Index: AQHUToJ61UJ7OOucfkaOgblaqb0NsKT0b9KA
Date: Mon, 17 Sep 2018 13:01:55 +0000
Message-ID: <e5ef0d1414df4afdad1d9c8a333ee5aa@ti.com>
References: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
	<4b65438d-1403-33ad-d980-a900c29d06e2@ti.com>
In-Reply-To: <4b65438d-1403-33ad-d980-a900c29d06e2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH] packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3 devices
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
X-List-Received-Date: Mon, 17 Sep 2018 13:02:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEpha2U6DQoNCkkgaGF2ZSBzdWJtaXR0ZWQgdGhlIG1ldGEtcHJvY2Vzc29yLXNkayBwYXRj
aC4gRG8gd2UgcGxhbiB0byB1cHN0cmVhbSB0aG9zZSBtYWtlZmlsZSBjaGFuZ2VzIG9mIG11bHRp
cGxlIG5ldyBkZW1vcz8NCg0KQmVzdCByZWdhcmRzLA0KDQpFcmljDQoNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IE1vbmRheSwgU2Vw
dGVtYmVyIDE3LCAyMDE4IDg6MzIgQU0NClRvOiBSdWVpLCBFcmljOyBtZXRhLWFyYWdvQGFyYWdv
LXByb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10gW1BBVENI
XSBwYWNrYWdlZ3JvdXAtYXJhZ28tdGlkc2staG1pLXNkay1ob3N0OiBhZGQgZXZzZSBkZW1vIHNv
dXJjZSBmb3IgazMgZGV2aWNlcw0KDQpQbGVhc2UgYWxzbyBhZGQgdGhlIHRpLXRpc2RrLW1ha2Vm
aWxlIGZyYWdtZW50IGFuZCB2ZXJpZnkgdGhhdCBpdCB3b3JrcyANCmNvcnJlY3RseS4NCg0KLSBK
YWtlDQoNCg0KT24gOS8xNy8yMDE4IDg6MzAgQU0sIEVyaWMgUnVlaSB3cm90ZToNCj4gU2lnbmVk
LW9mZi1ieTogRXJpYyBSdWVpIDxlLXJ1ZWkxQHRpLmNvbT4NCj4gLS0tDQo+ICAgLi4uL3BhY2th
Z2Vncm91cHMvcGFja2FnZWdyb3VwLWFyYWdvLXRpc2RrLWhtaS1zZGstaG9zdC5iYiAgICAgICAg
ICB8IDYgKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3Jl
L3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWFyYWdvLXRpc2RrLWhtaS1zZGstaG9zdC5iYiBi
L21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91
cC1hcmFnby10aXNkay1obWktc2RrLWhvc3QuYmINCj4gaW5kZXggNDkyMTE0Ny4uZGQzNDA3ZCAx
MDA2NDQNCj4gLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91
cHMvcGFja2FnZWdyb3VwLWFyYWdvLXRpc2RrLWhtaS1zZGstaG9zdC5iYg0KPiArKysgYi9tZXRh
LWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtYXJh
Z28tdGlzZGstaG1pLXNkay1ob3N0LmJiDQo+IEBAIC0xLDYgKzEsNiBAQA0KPiAgIFNVTU1BUlkg
PSAiVGFzayB0byBhZGQgSE1JIHJlbGF0ZWQgc291cmNlcyBpbnRvIHRoZSBTREsiDQo+ICAgTElD
RU5TRSA9ICJNSVQiDQo+IC1QUiA9ICJyMCINCj4gK1BSID0gInIxIg0KPiAgIA0KPiAgIFBBQ0tB
R0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iDQo+ICAgDQo+IEBAIC0yMiw2ICsyMiwxMCBAQCBI
TUlfYXBwZW5kX29tYXAtYTE1ID0gIiBcDQo+ICAgICAgIGV2c2UtaG1pLXNyYyBcDQo+ICAgIg0K
PiAgIA0KPiArSE1JX2FwcGVuZF9rMyA9ICIgXA0KPiArICAgIGV2c2UtaG1pLXNyYyBcDQo+ICsi
DQo+ICsNCj4gICBSREVQRU5EU18ke1BOfSA9ICJcDQo+ICAgICAgICR7SE1JfSBcDQo+ICAgIg0K
DQo=

