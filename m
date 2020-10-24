Return-Path: <aparnab@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D93CE52999
	for <meta-arago@arago-project.org>;
	Sat, 24 Oct 2020 21:40:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09OLbOXh095283
	for <meta-arago@arago-project.org>; Sat, 24 Oct 2020 16:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603575444;
	bh=ncGTsYL2wEKJwGgT70kJaztUBgaeqWsJfAHpAz8CHl0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=uw/aBQRDTO15N04Qle8wTS/dPc4Hpv/qBIT6O9//5sOfobSgvdYsakWjrIYOmJZMx
	PwlkTwB+mNW0TF2j83u07/DeKt9xjeNWxttPmscJMZTAFzwzRyepzyc4G3UPkJ1U2Y
	chrKWEwHayggcY+sltV9tEgPxl+U6+8u/jWVIE4g=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09OLbOAJ080832
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 24 Oct 2020 16:37:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 24 Oct 2020 16:37:24 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
	DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
	15.01.1979.003; Sat, 24 Oct 2020 16:37:23 -0500
From: "Balasubramanian, Aparna" <aparnab@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [PATCH] ltp-ddt: Update to latest
Thread-Index: AQHWqYEdUGIiK5L/O0amDJOiZsQrdKmnnEuA//+sVEA=
Date: Sat, 24 Oct 2020 21:37:23 +0000
Message-ID: <c8801511582e462582f95bcce32a551b@ti.com>
References: <20201023211141.19571-1-aparnab@ti.com>
	<ca797022-fbf4-9526-0d1a-415cd28c4cb7@ti.com>
In-Reply-To: <ca797022-fbf4-9526-0d1a-415cd28c4cb7@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.32.205]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Sat, 24 Oct 2020 21:40:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIG1pc3NlZCB0aGF0LiBUaGFua3MsIERhbi4NClJlZ2FyZHMsDQpBcGFybmENCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE11cnBoeSwgRGFuIA0KU2VudDogU2F0dXJk
YXksIE9jdG9iZXIgMjQsIDIwMjAgNDozNyBQTQ0KVG86IEJhbGFzdWJyYW1hbmlhbiwgQXBhcm5h
IDxhcGFybmFiQHRpLmNvbT47IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmc7IERteXRyaXll
bmtvLCBEZW55cyA8ZGVueXNAdGkuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbHRwLWRkdDog
VXBkYXRlIHRvIGxhdGVzdA0KDQpBcGFybmENCg0KT24gMTAvMjMvMjAgNDoxMSBQTSwgQXBhcm5h
IEJhbGFzdWJyYW1hbmlhbiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTogQXBhcm5hIEJhbGFzdWJy
YW1hbmlhbiA8YXBhcm5hYkB0aS5jb20+DQo+IC0tLQ0KPiAgIG1ldGEtYXJhZ28tZXh0cmFzL3Jl
Y2lwZXMtZGV2dG9vbHMvbHRwLWRkdC9sdHAtZGR0XzIwMjAwMTIwLmJiIHwgMiArLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1kZXZ0b29scy9sdHAtZGR0L2x0cC1kZHRf
MjAyMDAxMjAuYmIgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWRldnRvb2xzL2x0cC1kZHQv
bHRwLWRkdF8yMDIwMDEyMC5iYg0KPiBpbmRleCBmYjAzODJkYS4uYmNjOGY5NTggMTAwNjQ0DQo+
IC0tLSBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtZGV2dG9vbHMvbHRwLWRkdC9sdHAtZGR0
XzIwMjAwMTIwLmJiDQo+ICsrKyBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtZGV2dG9vbHMv
bHRwLWRkdC9sdHAtZGR0XzIwMjAwMTIwLmJiDQo+IEBAIC0xNCw3ICsxNCw3IEBAIFBFID0gIjEi
DQo+ICAgUFIgPSAicjYiDQoNCkdlbmVyYWxseSB3aGVuIHlvdSB1cGRhdGUgdGhlIFNIQSB5b3Ug
c2hvdWxkIHVwZGF0ZSB0aGUgUFIgdmVyc2lvbg0KDQpJIHdpbGwgZml4IGl0IHVwDQoNCkRhbg0K
DQoNCg==

