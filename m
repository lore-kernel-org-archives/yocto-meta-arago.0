Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EA13252998
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:13:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JICXhI022078
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521483153;
	bh=zSNvV27LQBFUqYvRpiCkEBqIvPGA9G9vQbMQezZ13J0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gQaMDNAqgdk9wpIve+0PrMN45EGwPjbnOgD6qktFuJLyqKds016JFj8lAff/vIRmz
	UTXNdfpLlSbEwlynodU/JdqKkSHku/80vWOzSxBGCMxdOkmNG+WhYM94z83Q/ff5yi
	pWKOmgdWuQkkp+2kXnIGkvm35MG6x0f5RZFe4YG0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JICXQw009205
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:12:33 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:12:33 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Mon, 19 Mar 2018 13:12:33 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	posix-smp-demo: Updating to version 01.01.00.00
Thread-Index: AQHTv6pS4zhKSajtAk+JNRVWFxiZZqPX3DnA
Date: Mon, 19 Mar 2018 18:12:33 +0000
Message-ID: <b88aab8d72a1490fa39c4a52aa274fdb@ti.com>
References: <1521475559-24416-1-git-send-email-m-radhakrishnan2@ti.com>
	<b3fa7880-b496-04e1-0701-bd9a0413d741@ti.com>
In-Reply-To: <b3fa7880-b496-04e1-0701-bd9a0413d741@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.180]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Mon, 19 Mar 2018 18:13:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnkgYWJvdXQgdGhhdC4gSXQgd2FzIG1lYW50IGZvciBtZXRhLWFyYWdvLiBJIGhhdmUgc3Vi
bWl0dGVkIHRoZSBwYXRjaCB0aGVyZSBub3cuDQpQbGVhc2UgaWdub3JlIHRoaXMgb25lLg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RpZmZsZXIsIEphY29iIA0KU2VudDog
TW9uZGF5LCBNYXJjaCAxOSwgMjAxOCAxOjQ3IFBNDQpUbzogUmFkaGFrcmlzaG5hbiwgTWFoZXNo
OyBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBb
bWV0YS1hcmFnb10gW21vcnR5XVttZXRhLXByb2Nlc3Nvci1zZGtdW1BBVENIXSBwb3NpeC1zbXAt
ZGVtbzogVXBkYXRpbmcgdG8gdmVyc2lvbiAwMS4wMS4wMC4wMA0KDQoNCg0KT24gMy8xOS8yMDE4
IDEyOjA1IFBNLCBNYWhlc2ggUmFkaGFrcmlzaG5hbiB3cm90ZToNCj4gU2lnbmVkLW9mZi1ieTog
TWFoZXNoIFJhZGhha3Jpc2huYW4gPG0tcmFkaGFrcmlzaG5hbjJAdGkuY29tPg0KPiAtLS0NCj4g
ICBtZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8vcG9zaXgtc21w
LWRlbW8uaW5jIHwgNiArKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVj
aXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLmluYyBiL21ldGEtYXJhZ28t
ZXh0cmFzL3JlY2lwZXMtYXBwcy9wb3NpeC1zbXAtZGVtby9wb3NpeC1zbXAtZGVtby5pbmMNCj4g
aW5kZXggYjBhYmQyYi4uM2Q3ODcyNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hcmFnby1leHRyYXMv
cmVjaXBlcy1hcHBzL3Bvc2l4LXNtcC1kZW1vL3Bvc2l4LXNtcC1kZW1vLmluYw0KPiArKysgYi9t
ZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWFwcHMvcG9zaXgtc21wLWRlbW8vcG9zaXgtc21wLWRl
bW8uaW5jDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5eXl5eXl5eXl5eXl5eXl5e
DQpUaGlzIGRvZXMgbm90IGFwcGVhciB0byBiZSBmb3IgbWV0YS1wcm9jZXNzb3Itc2RrLg0KDQo+
IEBAIC03LDE0ICs3LDE0IEBAIFBPU0lYX1NNUF9HSVRfVVJJID0gImdpdDovL2dpdC50aS5jb20v
a2V5c3RvbmUtZGVtb3MvcG9zaXgtc21wLmdpdCINCj4gICBQT1NJWF9TTVBfR0lUX1BST1RPQ09M
ID0gImdpdCINCj4gICBQT1NJWF9TTVBfR0lUX0JSQU5DSCA9ICJtYXN0ZXIiDQo+ICAgDQo+IC0j
IEJlbG93IGNvbW1pdCBJRCBjb3JyZXNwb25kcyB0byAiREVWLlBPU0lYLVNNUC4wMS4wMC4wMS4w
NyINCj4gLVBPU0lYX1NNUF9TUkNSRVYgPSAiMjYxNGQ0Y2JlOWQ4M2M4MzQ1ZTA1MWM3ZjM3Njdm
ODYyMjYzOThlYSINCj4gKyMgQmVsb3cgY29tbWl0IElEIGNvcnJlc3BvbmRzIHRvICJERVYuUE9T
SVgtU01QLjAxLjAxLjAwLjAwIg0KPiArUE9TSVhfU01QX1NSQ1JFViA9ICIxMzlmZTdlYzU4OTM5
ZGMyNzQzMzU1ZTVmZWRlMDczNWY4NjkzZWJkIg0KPiAgIA0KPiAgIEJSQU5DSCA9ICIke1BPU0lY
X1NNUF9HSVRfQlJBTkNIfSINCj4gICBTUkNfVVJJID0gIiR7UE9TSVhfU01QX0dJVF9VUkl9O3By
b3RvY29sPSR7UE9TSVhfU01QX0dJVF9QUk9UT0NPTH07YnJhbmNoPSR7QlJBTkNIfSINCj4gICAN
Cj4gICBTUkNSRVYgPSAiJHtQT1NJWF9TTVBfU1JDUkVWfSINCj4gLVBWID0gIjAxLjAwLjAxLjA3
Ig0KPiArUFYgPSAiMDEuMDEuMDAuMDAiDQo+ICAgSU5DX1BSID0gInIwIg0KPiAgIA0KPiAgIFMg
PSAiJHtXT1JLRElSfS9naXQiDQoNCg==

