Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8255A529ED
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 20:48:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFKmLWP015488
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:48:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513370902;
	bh=+LGzCTCzZrPGlfo6e4AQmto2mNEMaCNWTAxqHp0aW2U=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=Qwd+ptJ95urnAr7hvh4K97j1O5pYtTdeRe0VmSA+7Y6vOsQZKdMt35xjdkS3xIZaX
	YobBhgNDCpWF+sA4qdEneLGTMzZon4HwWWdIVW52feLIwLIbBxGI99TN1WL0krJXv3
	bV9hYr8TlxtBNCtG22LC/ktkKjiE7r/WAXgner0E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKmLM9001777
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 14:48:21 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 14:48:21 -0600
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1261.035; Fri, 15 Dec 2017 14:48:21 -0600
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	usb-lld-rtos: Update to version 1.0.0.12B & add omapl1 support
Thread-Index: AQHTdeWoOIraNkB4fkyMtHOiBxMReaNE4DHQ
Date: Fri, 15 Dec 2017 20:48:21 +0000
Message-ID: <f6fed871382745a2a82e0f64615ac857@ti.com>
References: <1513370196-15761-1-git-send-email-m-radhakrishnan2@ti.com>
	<2a36b340-a184-613a-e79a-c1f7136e7c9a@ti.com>
In-Reply-To: <2a36b340-a184-613a-e79a-c1f7136e7c9a@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.157]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] usb-lld-rtos: Update to version 1.0.0.12B & add omapl1 support
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
X-List-Received-Date: Fri, 15 Dec 2017 20:48:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnkgZm9yIHRoYXQuIEkganVzdCBzdWJtaXR0ZWQgYSB2Mg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogU3RpZmZsZXIsIEphY29iIA0KU2VudDogRnJpZGF5LCBEZWNlbWJl
ciAxNSwgMjAxNyAzOjQ2IFBNDQpUbzogUmFkaGFrcmlzaG5hbiwgTWFoZXNoOyBtZXRhLWFyYWdv
QGFyYWdvLXByb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBbbWV0YS1hcmFnb10g
W21vcnR5XVttZXRhLXByb2Nlc3Nvci1zZGtdW1BBVENIXSB1c2ItbGxkLXJ0b3M6IFVwZGF0ZSB0
byB2ZXJzaW9uIDEuMC4wLjEyQiAmIGFkZCBvbWFwbDEgc3VwcG9ydA0KDQpOQUsuIFRoaXMgbmVl
ZHMgdG8gYmUgYSBiYmFwcGVuZC4NCg0KDQpPbiAxMi8xNS8yMDE3IDM6MzYgUE0sIE1haGVzaCBS
YWRoYWtyaXNobmFuIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5OiBNYWhlc2ggUmFkaGFrcmlzaG5h
biA8bS1yYWRoYWtyaXNobmFuMkB0aS5jb20+DQo+IC0tLQ0KPiAgIHJlY2lwZXMtYnNwL3VzYi1s
bGQvdXNiLWxsZC1ydG9zX2dpdC5iYiB8IDcgKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBlcy1ic3AvdXNiLWxs
ZC91c2ItbGxkLXJ0b3NfZ2l0LmJiDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWJzcC91c2It
bGxkL3VzYi1sbGQtcnRvc19naXQuYmIgYi9yZWNpcGVzLWJzcC91c2ItbGxkL3VzYi1sbGQtcnRv
c19naXQuYmINCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uMDQwN2Uw
Ng0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3JlY2lwZXMtYnNwL3VzYi1sbGQvdXNiLWxsZC1y
dG9zX2dpdC5iYg0KPiBAQCAtMCwwICsxLDcgQEANCj4gK0NPTVBBVElCTEVfTUFDSElORV9hcHBl
bmQgPSAifG9tYXBsMSINCj4gKw0KPiArIyBCZWxvdyBjb21taXQgSUQgY29ycmVzcG9uZHMgdG8g
IkRFVi5VU0JfTExELjAxLjAwLjAwLjEyQiINCj4gK1VTQl9MTERfU1JDUkVWID0gImMwNTVlZGJj
MmU2YmY2YWFkOTVhYTZlODNlNDZhOWZmMDNlZTAyNmIiDQo+ICsNCj4gK1BWID0gIjAxLjAwLjAw
LjEyQiINCj4gK1BSID0gInIwIg0KDQo=

