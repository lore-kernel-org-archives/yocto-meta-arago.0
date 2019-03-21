Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4D11A52976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 13:40:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDeITJ078685
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553175618;
	bh=7UhbC6fzQi1ageRZdIS07z4bGYRHEvi2NR0rbKumE2E=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=f9wkdp4Q4f1u6SXYQUfTla+zZbbjhNxVCbnEXC857U0+hh82JB995idcVQ5kfqyQL
	HMsCYA+eKfnHsEqZWgc3i4fJcCLX5Y/dJ6hG5xgwBWE0MJuougFmq79Vl8FAMc/vPb
	+OXtW6lkTby4kvJlKZRkzhEDVOgZ0NwLARdhN1Ws=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDeHOo073802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 08:40:18 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:40:17 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1713.004; Thu, 21 Mar 2019 08:40:17 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][meta-processor-sdk][PATCH 1/7]
	board-rtos: Superseded by meta-ti update
Thread-Index: AQHU3+nmZcLsx1VuCkeKS6KeyY/yMKYWaxMA//+sP1A=
Date: Thu, 21 Mar 2019 13:40:17 +0000
Message-ID: <6575e23c0e42410abbbe54ee6ff33292@ti.com>
References: <1553174865-28991-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553174865-28991-2-git-send-email-m-radhakrishnan2@ti.com>
	<f0979472-73ea-670a-5ec7-aab74bab8da5@ti.com>
In-Reply-To: <f0979472-73ea-670a-5ec7-aab74bab8da5@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [master][meta-processor-sdk][PATCH 1/7] board-rtos: Superseded by meta-ti update
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
X-List-Received-Date: Thu, 21 Mar 2019 13:40:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIHdhaXQgZm9yIHRoZSBtZXRhLXRpIHBhdGNoZXMgdG8gYmUgYXBwbGllZC4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN0aWZmbGVyLCBKYWNvYiANClNlbnQ6IFRo
dXJzZGF5LCBNYXJjaCAyMSwgMjAxOSA5OjQwIEFNDQpUbzogUmFkaGFrcmlzaG5hbiwgTWFoZXNo
OyBtZXRhLWFyYWdvQGFyYWdvLXByb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBb
bWV0YS1hcmFnb10gW21hc3Rlcl1bbWV0YS1wcm9jZXNzb3Itc2RrXVtQQVRDSCAxLzddIGJvYXJk
LXJ0b3M6IFN1cGVyc2VkZWQgYnkgbWV0YS10aSB1cGRhdGUNCg0KVGhhbmsgeW91IQ0KDQpDYW4g
dGhlc2UgYmUgYXBwbGllZCBub3csIG9yIGRvIHRoZXkgbmVlZCB0byB3YWl0IGZvciB0aGUgbWV0
YS10aSANCnBhdGNoZXMgdG8gYmUgYXBwbGllZD8NCg0KDQotIEpha2UNCg0KT24gMy8yMS8yMDE5
IDk6MjcgQU0sIE1haGVzaCBSYWRoYWtyaXNobmFuIHdyb3RlOg0KPiAtLS0NCj4gICByZWNpcGVz
LWJzcC9ib2FyZC1ydG9zL2JvYXJkLXJ0b3NfZ2l0LmJiYXBwZW5kIHwgNSAtLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCByZWNp
cGVzLWJzcC9ib2FyZC1ydG9zL2JvYXJkLXJ0b3NfZ2l0LmJiYXBwZW5kDQo+DQo+IGRpZmYgLS1n
aXQgYS9yZWNpcGVzLWJzcC9ib2FyZC1ydG9zL2JvYXJkLXJ0b3NfZ2l0LmJiYXBwZW5kIGIvcmVj
aXBlcy1ic3AvYm9hcmQtcnRvcy9ib2FyZC1ydG9zX2dpdC5iYmFwcGVuZA0KPiBkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggZjZjMjE4Mi4uMDAwMDAwMA0KPiAtLS0gYS9yZWNpcGVz
LWJzcC9ib2FyZC1ydG9zL2JvYXJkLXJ0b3NfZ2l0LmJiYXBwZW5kDQo+ICsrKyAvZGV2L251bGwN
Cj4gQEAgLTEsNSArMCwwIEBADQo+IC0jIEJlbG93IGNvbW1pdCBJRCBjb3JyZXNwb25kcyB0byAi
REVWLkJPQVJELjAxLjAwLjEwLjAzQSINCj4gLUJPQVJEX1NSQ1JFViA9ICIxMWMzMGI1YWNhYzNm
ZjYxNzU3OTgxYTM4MmQ3ZGE1YzUxNGNkM2ZmIg0KPiAtDQo+IC1QViA9ICIwMS4wMC4xMC4wM0Ei
DQo+IC1QUiA9ICJyMSINCg==

