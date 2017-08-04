Return-Path: <aparnab@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B181F52093
	for <meta-arago@arago-project.org>;
	Fri,  4 Aug 2017 14:51:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v74EpCtK011030;
	Fri, 4 Aug 2017 09:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501858272;
	bh=mekKQEXPw3+YEBHPK3bynHYDHqiMP/YFgm9Y2l5Qe/8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=hiUvtzCDPFn+DuJm33aP8LMZg8QIFIZmyF8MfisLrk6agDNUlKaO+a/4F5z6LB/OD
	eEtsuSe8vghAZcaUdjcwd/dQs3eAhd0shwVsyXYwpjLEJ9SPLBPLJvOID7FR2P4n4Z
	YS2u6Nbgjjlovy1lz/d7GQ0vfqBW/3Rk+JuPJ2lQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v74EpCuR018230;
	Fri, 4 Aug 2017 09:51:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 4 Aug 2017 09:51:11 -0500
From: "Balasubramanian, Aparna" <aparnab@ti.com>
To: "Hiblot, Jean-Jacques" <jjhiblot@ti.com>, Denys Dmytriyenko
	<denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [krogoth][PATCH 2/2] u-boot-ti-staging 2016.05: update to the
	latest for ti2016.08-rc1
Thread-Index: AQHTDR7iR7s913F29E25QmuOJ3tOQKJ0R7xg
Date: Fri, 4 Aug 2017 14:51:10 +0000
Message-ID: <2A65B2F666A33943B1CA476CCB3F99FE1D867F91@DFLE08.ent.ti.com>
References: <1501782104-134658-1-git-send-email-denis@denix.org>
	<1501782104-134658-2-git-send-email-denis@denix.org>
	<6a129594-48d8-ad97-7909-0236c4d85d71@ti.com>
In-Reply-To: <6a129594-48d8-ad97-7909-0236c4d85d71@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Subject: Re: [krogoth][PATCH 2/2] u-boot-ti-staging 2016.05: update to the latest for ti2016.08-rc1
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
X-List-Received-Date: Fri, 04 Aug 2017 14:51:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SkosDQpEb2VzIHRoZSB1Ym9vdCBiaW5hcnkgaW4gbmlnaHRseSBidWlsZCBoYXZlIHlvdXIgbGF0
ZXN0IGNoYW5nZXM/DQoNCkRlbnlzLA0KRG9lcyBEYW4gbmVlZCB0byBtb3ZlIHRoZSByYzEgdGFn
IGJlZm9yZSB5b3UgcmVidWlsZCB1Ym9vdD8NCg0KVGhhbmtzLA0KQXBhcm5hDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBIaWJsb3QsIEplYW4tSmFjcXVlcyANClNlbnQ6IEZy
aWRheSwgQXVndXN0IDQsIDIwMTcgNzo0MSBBTQ0KVG86IERlbnlzIERteXRyaXllbmtvOyBtZXRh
LWFyYWdvQGFyYWdvLXByb2plY3Qub3JnOyBNdXJwaHksIERhbg0KQ2M6IEJhbGFzdWJyYW1hbmlh
biwgQXBhcm5hDQpTdWJqZWN0OiBSZTogW2tyb2dvdGhdW1BBVENIIDIvMl0gdS1ib290LXRpLXN0
YWdpbmcgMjAxNi4wNTogdXBkYXRlIHRvIHRoZSBsYXRlc3QgZm9yIHRpMjAxNi4wOC1yYzENCg0K
SGkgRGVueXMsIERhbiwNCg0KdGhhbmtzIGZvciBtYWtpbmcgdGhlIG1lcmdlIGFuZCB0aGUgYnVp
bGRzLg0KDQpJIG5vdGljZWQgYSBwcm9ibGVtIHdpdGggdS1ib290OiB0aGUgdGFnIGhhcyBiZWVu
IGFwcGxpZWQgYmVmb3JlIHRoZSANCkRSQTc2IHN1cHBvcnQgaGFzIGJlZW4gbWVyZ2VkIGFuZCB0
aGUgYmIgcmVjaXBlcyBuZWVkcyB0byBiZSB1cGRhdGVkLg0KDQpUYWcgaGFzIGJlZW4gYXBwbGll
ZCB0byA0MmEzMzQ3YWE1NDdlODc4MjNlODk0MTM4YjE2ZTQ2N2MxMjA2ZTE3LCB0aGUgDQpyaWdo
dCBjb21taXQgaXMgYjFiMGIwYjQ5NDA3YjA3M2VkMGUxODY1YzU4YTNkZmE5ZGM4MDQ1Mi4NCg0K
SmVhbi1KYWNxdWVzDQoNCg0KDQpPbiAwMy8wOC8yMDE3IDE5OjQxLCBEZW55cyBEbXl0cml5ZW5r
byB3cm90ZToNCj4gRnJvbTogRGVueXMgRG15dHJpeWVua28gPGRlbnlzQHRpLmNvbT4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogRGVueXMgRG15dHJpeWVua28gPGRlbnlzQHRpLmNvbT4NCj4gQ2M6IEpl
YW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4NCj4gLS0tDQo+ICAgcmVjaXBlcy1i
c3AvdS1ib290L3UtYm9vdC10aS1zdGFnaW5nXzIwMTYuMDUuYmIgfCA0ICsrLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10aS1zdGFnaW5nXzIwMTYuMDUuYmIgYi9y
ZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRpLXN0YWdpbmdfMjAxNi4wNS5iYg0KPiBpbmRleCAz
NjUwZGRhLi4zNTdlNzhmIDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290
LXRpLXN0YWdpbmdfMjAxNi4wNS5iYg0KPiArKysgYi9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290
LXRpLXN0YWdpbmdfMjAxNi4wNS5iYg0KPiBAQCAtNywxNCArNywxNCBAQCBERVNDUklQVElPTiA9
ICJ1LWJvb3QgYm9vdGxvYWRlciBmb3IgVEkgZGV2aWNlcyINCj4gICANCj4gICBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MaWNlbnNlcy9SRUFETUU7bWQ1PWEyYzY3OGNmZDRhNGQ5NzEzNTU4
NWNhZDkwODU0MWM2Ig0KPiAgIA0KPiAtUFIgPSAicjMxIg0KPiArUFIgPSAicjMyIg0KPiAgIFBW
X2FwcGVuZCA9ICIrZ2l0JHtTUkNQVn0iDQo+ICAgDQo+ICAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQu
dGkuY29tL3RpLXUtYm9vdC90aS11LWJvb3QuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9JHtCUkFO
Q0h9Ig0KPiAgIA0KPiAgIEJSQU5DSCA/PSAidGktdS1ib290LTIwMTYuMDUiDQo+ICAgDQo+IC1T
UkNSRVYgPSAiZTY0NjU5OTQ1MDgzNDgwN2ZkMzM0ZGQ5NTkzMTEyZTg5YWVlMTFjNyINCj4gK1NS
Q1JFViA9ICI0MmEzMzQ3YWE1NDdlODc4MjNlODk0MTM4YjE2ZTQ2N2MxMjA2ZTE3Ig0KPiAgIA0K
PiAgICMgU3VwcG9ydCBmb3Igc2VjdXJlIGRldmljZXMgLSBkZXRhaWxlZCBpbmZvIGlzIGluIGRv
Yy9SRUFETUUudGktc2VjdXJlDQo+ICAgVElfU0VDVVJFX0RFVl9QS0cgPz0gIiINCg0K

