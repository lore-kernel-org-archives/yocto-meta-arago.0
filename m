Return-Path: <sjmolfetta@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7BA8B529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 18:37:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26IakKK019342
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:36:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520361406;
	bh=WcCif7AEzaZPVgB3EESvK/2ErGIo6jNq49gNv8vanA0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=ZQeZ1R0/COMOEWVKXPfhew69Kdi4QbYnCeXRS6v+kWiPlbjP9QkXu8CfAW+FOgjVV
	D/xlZG8QjQtgyucxxiDtus7nDeE4G290FzzQryeuoMmXSZ0X9xrGQUvX2dTWDmq3dB
	MwDsBzmjg5Te/fnn3hxBWVQun5CtJT2VK8LW0hec=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26IaksR025545
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 12:36:46 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 12:36:46 -0600
Received: from DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0]) by
	DLEE104.ent.ti.com ([fe80::1b8:1a58:6ede:b6f0%17]) with mapi id
	15.01.1261.035; Tue, 6 Mar 2018 12:36:45 -0600
From: "Molfetta, Stephen" <sjmolfetta@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][master][PATCH]
	dra7xx: pdk: updating build install step
Thread-Index: AQHTtW9IQ0nJgqBs7k+K6CBl6gSI1aPD6hSA//+d6BA=
Date: Tue, 6 Mar 2018 18:36:45 +0000
Message-ID: <64637ec1c32842dfb7068ea6fe240e4a@ti.com>
References: <1520356764-17285-1-git-send-email-sjmolfetta@ti.com>
	<a16b7b7e-3f03-cc16-1d38-329d9e7e88cc@ti.com>
In-Reply-To: <a16b7b7e-3f03-cc16-1d38-329d9e7e88cc@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.49.164]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][master][PATCH] dra7xx: pdk: updating build install step
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
X-List-Received-Date: Tue, 06 Mar 2018 18:37:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGZpbGVzIGFyZSBhbHJlYWR5IHByZXNlbnQgaW4gdGhlIGN1cnJlbnQgY29tbWl0IElELiAg
V2UganVzdCBuZWVkIHRoZSByZWNpcGUgdXBkYXRlIHRvIHB1bGwgaW4gdGhlc2UgZmlsZXMuICBP
bmx5IGlmIHdlIGNoYW5nZSB0aGUgcmVjaXBlIHRvIHVzZSB0aGUgJ21ha2UgaW5zdGFsbCcgd2ls
bCB3ZSBuZWVkIHRvIGJ1bXAgdGhlIGNvbW1pdCBJRC4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDA2LCAy
MDE4IDEyOjIzIFBNDQpUbzogTW9sZmV0dGEsIFN0ZXBoZW47IG1ldGEtYXJhZ29AYXJhZ28tcHJv
amVjdC5vcmcNClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFttZXRhLWFyYWdvXSBbbWV0YS1wcm9j
ZXNzb3Itc2RrXVttYXN0ZXJdW1BBVENIXSBkcmE3eHg6IHBkazogdXBkYXRpbmcgYnVpbGQgaW5z
dGFsbCBzdGVwDQoNCkRvZXMgdGhpcyByZXF1aXJlIGEgY29tbWl0IElEIGJ1bXA/DQoNCg0KT24g
My82LzIwMTggMTI6MTkgUE0sIFN0ZXBoZW4gTW9sZmV0dGEgd3JvdGU6DQo+IERSQTd4eCBQREsg
aW50cm9kdWNlZCBhIG5ldyBidWlsZC1yZWxhdGVkIGZpbGUgYW5kIG5lZWRzIHRvIGluc3RhbGwg
DQo+IHRoaXMgZmlsZSBpbnRvIHRoZSBwYWNrYWdlIGxvY2F0aW9uDQo+IC0tLQ0KPiAgIHJlY2lw
ZXMtdGkvdGktcGRrLWJ1aWxkL3RpLXBkay1idWlsZC1ydG9zX2dpdC5iYiB8IDUgKysrLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvcmVjaXBlcy10aS90aS1wZGstYnVpbGQvdGktcGRrLWJ1aWxkLXJ0b3NfZ2l0
LmJiIA0KPiBiL3JlY2lwZXMtdGkvdGktcGRrLWJ1aWxkL3RpLXBkay1idWlsZC1ydG9zX2dpdC5i
Yg0KPiBpbmRleCBiMDI4ZThjLi4zZTgxNTdkIDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLXRpL3Rp
LXBkay1idWlsZC90aS1wZGstYnVpbGQtcnRvc19naXQuYmINCj4gKysrIGIvcmVjaXBlcy10aS90
aS1wZGstYnVpbGQvdGktcGRrLWJ1aWxkLXJ0b3NfZ2l0LmJiDQo+IEBAIC01LDcgKzUsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9tYWtlcnVsZXMvZW52Lm1rO2JlZ2lubGluZT0xO2Vu
ZGxpbmU9MzE7bWQ1PTEwNTAzZThkZQ0KPiAgIHJlcXVpcmUgcmVjaXBlcy10aS9pbmNsdWRlcy90
aS1wYXRocy5pbmMNCj4gICANCj4gICBQViA9ICIwMS4wMC4wMC4wOCINCj4gLVBSID0gInIwIg0K
PiArUFIgPSAicjEiDQo+ICAgDQo+ICAgUERLX0JVSUxEX0dJVF9VUkkgPSAiZ2l0Oi8vZ2l0LnRp
LmNvbS9rZXlzdG9uZS1ydG9zL3Byb2Nlc3Nvci1wZGstYnVpbGQuZ2l0Ig0KPiAgIFBES19CVUlM
RF9HSVRfUFJPVE9DT0wgPSAiZ2l0Ig0KPiBAQCAtMTUzLDYgKzE1Myw3IEBAIGRvX2luc3RhbGxf
YXBwZW5kX2FtNTd4eC1ocy1ldm0oKSB7DQo+ICAgfQ0KPiAgIA0KPiAgIGRvX2luc3RhbGxfYXBw
ZW5kX2RyYTd4eCgpIHsNCj4gKyAgICBpbnN0YWxsIC1kICR7RH0ke1BES19JTlNUQUxMX0RJUl9S
RUNJUEV9L3BhY2thZ2VzL3RpL2J1aWxkL2RyYTd4eA0KPiAgICAgICBpbnN0YWxsIC1kICR7RH0k
e1BES19JTlNUQUxMX0RJUl9SRUNJUEV9L3BhY2thZ2VzL3RpL2J1aWxkL3RkYTJ4eA0KPiAgICAg
ICBpbnN0YWxsIC1kICR7RH0ke1BES19JTlNUQUxMX0RJUl9SRUNJUEV9L3BhY2thZ2VzL3RpL2J1
aWxkL3RkYTN4eA0KPiAgICAgICBpbnN0YWxsIC1kIA0KPiAke0R9JHtQREtfSU5TVEFMTF9ESVJf
UkVDSVBFfS9wYWNrYWdlcy90aS9idWlsZC90ZGEyZXgNCj4gQEAgLTE2NSw2ICsxNjYsNyBAQCBk
b19pbnN0YWxsX2FwcGVuZF9kcmE3eHgoKSB7DQo+ICAgICAgIGluc3RhbGwgLW0gMDc1NSBtYWtl
cnVsZXMvcnVsZXNfYXJwMzIubWsgJHtEfSR7UERLX0lOU1RBTExfRElSX1JFQ0lQRX0vcGFja2Fn
ZXMvdGkvYnVpbGQvbWFrZXJ1bGVzDQo+ICAgICAgIGluc3RhbGwgLW0gMDc1NSBtYWtlcnVsZXMv
cnVsZXNfdGlfY2d0X2FybS5tayANCj4gJHtEfSR7UERLX0lOU1RBTExfRElSX1JFQ0lQRX0vcGFj
a2FnZXMvdGkvYnVpbGQvbWFrZXJ1bGVzDQo+ICAgDQo+ICsgICAgaW5zdGFsbCAtbSAwNzU1IGRy
YTd4eC9saW5rY21kLnhkdCANCj4gKyAke0R9JHtQREtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNr
YWdlcy90aS9idWlsZC9kcmE3eHgNCj4gICAgICAgaW5zdGFsbCAtbSAwNzU1IHRkYTJ4eC9jb25m
aWdfdGRhMnh4LmJsZCAke0R9JHtQREtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNrYWdlcy90aS9i
dWlsZC90ZGEyeHgNCj4gICAgICAgaW5zdGFsbCAtbSAwNzU1IHRkYTJ4eC9jb25maWdfdGRhMnh4
X2ExNS5ibGQgJHtEfSR7UERLX0lOU1RBTExfRElSX1JFQ0lQRX0vcGFja2FnZXMvdGkvYnVpbGQv
dGRhMnh4DQo+ICAgICAgIGluc3RhbGwgLW0gMDc1NSB0ZGEyeHgvY29uZmlnX3RkYTJ4eF9jNjYu
YmxkIA0KPiAke0R9JHtQREtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNrYWdlcy90aS9idWlsZC90
ZGEyeHgNCj4gQEAgLTE3NSw3ICsxNzcsNiBAQCBkb19pbnN0YWxsX2FwcGVuZF9kcmE3eHgoKSB7
DQo+ICAgICAgIGluc3RhbGwgLW0gMDc1NSB0ZGEyZXgvY29uZmlnX3RkYTJleF9hMTUuYmxkICR7
RH0ke1BES19JTlNUQUxMX0RJUl9SRUNJUEV9L3BhY2thZ2VzL3RpL2J1aWxkL3RkYTJleA0KPiAg
ICAgICBpbnN0YWxsIC1tIDA3NTUgdGRhMmV4L2NvbmZpZ190ZGEyZXhfYzY2LmJsZCAke0R9JHtQ
REtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNrYWdlcy90aS9idWlsZC90ZGEyZXgNCj4gICAgICAg
aW5zdGFsbCAtbSAwNzU1IHRkYTJleC9tZW1fc2VnbWVudF9kZWZpbml0aW9uXzEwMjRtYl9iaW9z
LnhzIA0KPiAke0R9JHtQREtfSU5TVEFMTF9ESVJfUkVDSVBFfS9wYWNrYWdlcy90aS9idWlsZC90
ZGEyZXgNCj4gLQ0KPiAgIH0NCj4gICANCj4gICBkb19pbnN0YWxsX2FwcGVuZF9rZXlzdG9uZSgp
IHsNCg0K

