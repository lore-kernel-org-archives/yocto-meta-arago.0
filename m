Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 0F30952C11
	for <meta-arago@arago-project.org>;
	Tue,  6 Apr 2021 14:45:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 136Ejx63127087;
	Tue, 6 Apr 2021 09:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617720359;
	bh=pFqfucoFnm27o+yfj8lEMyJkAABiLuo8CcljE6ffb8c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=mqAmqfeEaWpoYet2stWujEkRgSVt3LCITM/LfKQ4JHw3kgxigCVce00TSqW+67seR
	HSjMSKWyxxvORMDnlF7k8JPd5OKtiADSg5glCKR2quwICFMV5bVDouzYVyBFKQefCH
	4fzMKQA+ttbIFK5gBifN71PibozFd2s+aelaB950=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 136EjxrJ039151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Apr 2021 09:45:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 6 Apr 2021 09:45:59 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Tue, 6 Apr 2021 09:45:59 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "denys@konsulko.com" <denys@konsulko.com>
Thread-Topic: [meta-arago][dunfell][PATCH 1/3] Revert "HACK: qtwebkit: define
	MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h"
Thread-Index: AQHXJxTPrVg/woRM+UiGiRcr97UHZKqnPUGAgABbhIA=
Date: Tue, 6 Apr 2021 14:45:59 +0000
Message-ID: <3dfc831cc3d744019d718c4ae2320e3d@ti.com>
References: <20210401163340.12248-1-g-tammana@ti.com>
	<20210401163340.12248-2-g-tammana@ti.com>
	<9e35e9c1-748a-e96e-642f-ec2344fc87a4@ti.com>
In-Reply-To: <9e35e9c1-748a-e96e-642f-ec2344fc87a4@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.28.28]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "Bhargav, Krunal" <k-bhargav@ti.com>
Subject: Re: [dunfell][PATCH 1/3] Revert "HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h"
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
X-List-Received-Date: Tue, 06 Apr 2021 14:45:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEJhamp1cmksIFByYW5lZXRo
DQo+U2VudDogTW9uZGF5LCBBcHJpbCAwNSwgMjAyMSAxMToxOCBQTQ0KPlRvOiBUYW1tYW5hLCBH
b3d0aGFtIDxnLXRhbW1hbmFAdGkuY29tPjsgbWV0YS1hcmFnb0BhcmFnby1wcm9qZWN0Lm9yZzsN
Cj5kZW55c0Brb25zdWxrby5jb20NCj5DYzogQmhhcmdhdiwgS3J1bmFsIDxrLWJoYXJnYXZAdGku
Y29tPg0KPlN1YmplY3Q6IFJlOiBbbWV0YS1hcmFnb11bZHVuZmVsbF1bUEFUQ0ggMS8zXSBSZXZl
cnQgIkhBQ0s6IHF0d2Via2l0Og0KPmRlZmluZSBNRVNBX0VHTF9OT19YMTFfSEVBREVSUyBhdCBB
TkdMRS9raHJwbGF0Zm9ybS5oIg0KPg0KPg0KPg0KPk9uIDQvMS8yMDIxIDExOjMzIEFNLCBHb3d0
aGFtIFRhbW1hbmEgd3JvdGU6DQo+PiBUaGlzIHJldmVydHMgY29tbWl0IDFlODNlYmY2MWJkMjJj
YThhZDA0ZDU1MzhkYjA0NGQ4MTMzMGRmMmMuIEl0IGlzIG5vDQo+PiBsb25nZXIgbmVlZGVkIGFz
IGl0IGlzIGhhbmRsZWQgdGhyb3VnaCBidWlsZCBkZXBlbmRlbmNpZXMuDQo+DQo+bm8gc2lnbmVk
LW9mZi1ieSA/DQoNCkFuIG92ZXJzaWdodCBmcm9tIG15IHNpZGUgd2hpbGUgZG9pbmcgcmV2ZXJ0
Lg0KDQo+V2lsbCBhcHBlbmQgYmVmb3JlIG1lcmdpbmcgdG8gZHVuZmVsbA0KDQpUaGFua3MhDQpH
b3d0aGFtDQoNCj4+IC0tLQ0KPj4gICAuLi5hdGZvcm0uaC1hZGQtZGVmaW5lLU1FU0FfRUdMX05P
X1gxMV8ucGF0Y2ggfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIC4uLi9yZWNpcGVzLXF0
L3F0NS9xdHdlYmtpdF8lLmJiYXBwZW5kICAgICAgICB8ICAzICstDQo+PiAgIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMyIGRlbGV0aW9ucygtKQ0KPj4gICBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3ZWJraXQvMDAwMS0NCj5I
QUNLLUFOR0xFLWtocnBsYXRmb3JtLmgtYWRkLWRlZmluZS1NRVNBX0VHTF9OT19YMTFfLnBhdGNo
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0
d2Via2l0LzAwMDEtSEFDSy1BTkdMRS0NCj5raHJwbGF0Zm9ybS5oLWFkZC1kZWZpbmUtTUVTQV9F
R0xfTk9fWDExXy5wYXRjaCBiL21ldGEtYXJhZ28tDQo+ZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0
d2Via2l0LzAwMDEtSEFDSy1BTkdMRS1raHJwbGF0Zm9ybS5oLWFkZC1kZWZpbmUtDQo+TUVTQV9F
R0xfTk9fWDExXy5wYXRjaA0KPj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAy
OTUyMWE4ZS4uMDAwMDAwMDANCj4+IC0tLSBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQv
cXQ1L3F0d2Via2l0LzAwMDEtSEFDSy1BTkdMRS0NCj5raHJwbGF0Zm9ybS5oLWFkZC1kZWZpbmUt
TUVTQV9FR0xfTk9fWDExXy5wYXRjaA0KPj4gKysrIC9kZXYvbnVsbA0KPj4gQEAgLTEsMzAgKzAs
MCBAQA0KPj4gLUZyb20gNGEyMWZjZWRkODg2NzcyYjdlMWJkNDA4NjE4MzVmMWI0ZjMzYzdmZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IC1Gcm9tOiBFcmljIFJ1ZWkgPGUtcnVlaTFAdGku
Y29tPg0KPj4gLURhdGU6IEZyaSwgMzAgQXVnIDIwMTkgMTc6NDE6MTMgLTA0MDANCj4+IC1TdWJq
ZWN0OiBbUEFUQ0hdIEhBQ0s6IEFOR0xFL2tocnBsYXRmb3JtLmg6IGFkZCAjZGVmaW5lDQo+PiAt
IE1FU0FfRUdMX05PX1gxMV9IRUFERVJTDQo+PiAtDQo+PiAtTm90ZTogT25seSB0aGUgS0hSL2to
cnBsYXRmb3JtLmggYXQgc3lzcm9vdC91c3IvaW5jbHVkZSBzaG91bGQgYmUgdXNlZC4NCj4+IC0g
ICAgICBUaGlzIHBhdGNoIGlzIGEgdGVudGF0aXZlIHdvcmthcm91bmQgdG8gbWFrZSBib3RoIGZp
bGVzDQo+Y29tcGF0aWJsZQ0KPj4gLQ0KPj4gLVVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbdGVudGF0aXZlIHdvcmthcm91bmQgb25seV0NCj4+IC0NCj4+IC1TaWduZWQtb2ZmLWJ5OiBF
cmljIFJ1ZWkgPGUtcnVlaTFAdGkuY29tPg0KPj4gLS0tLQ0KPj4gLSBTb3VyY2UvVGhpcmRQYXJ0
eS9BTkdMRS9pbmNsdWRlL0tIUi9raHJwbGF0Zm9ybS5oIHwgMiArKw0KPj4gLSAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+PiAtDQo+PiAtZGlmZiAtLWdpdCBhL1NvdXJjZS9UaGly
ZFBhcnR5L0FOR0xFL2luY2x1ZGUvS0hSL2tocnBsYXRmb3JtLmgNCj5iL1NvdXJjZS9UaGlyZFBh
cnR5L0FOR0xFL2luY2x1ZGUvS0hSL2tocnBsYXRmb3JtLmgNCj4+IC1pbmRleCBjOWU2ZjE3ZDMu
LjRlM2ZmNjlhOCAxMDA2NDQNCj4+IC0tLS0gYS9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9pbmNs
dWRlL0tIUi9raHJwbGF0Zm9ybS5oDQo+PiAtKysrIGIvU291cmNlL1RoaXJkUGFydHkvQU5HTEUv
aW5jbHVkZS9LSFIva2hycGxhdGZvcm0uaA0KPj4gLUBAIC0yNzksNCArMjc5LDYgQEAgdHlwZWRl
ZiBlbnVtIHsNCj4+IC0gICAgIEtIUk9OT1NfQk9PTEVBTl9FTlVNX0ZPUkNFX1NJWkUgPSBLSFJP
Tk9TX01BWF9FTlVNDQo+PiAtIH0ga2hyb25vc19ib29sZWFuX2VudW1fdDsNCj4+IC0NCj4+IC0r
I2RlZmluZSBNRVNBX0VHTF9OT19YMTFfSEVBREVSUw0KPj4gLSsNCj4+IC0gI2VuZGlmIC8qIF9f
a2hycGxhdGZvcm1faF8gKi8NCj4+IC0tLQ0KPj4gLTIuMTcuMQ0KPj4gLQ0KPj4gZGlmZiAtLWdp
dCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2Via2l0XyUuYmJhcHBlbmQN
Cj5iL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2Via2l0XyUuYmJhcHBlbmQN
Cj4+IGluZGV4IDFkYmU0MGQxLi43NTIxMzQ4NyAxMDA2NDQNCj4+IC0tLSBhL21ldGEtYXJhZ28t
ZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2Via2l0XyUuYmJhcHBlbmQNCj4+ICsrKyBiL21ldGEt
YXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2Via2l0XyUuYmJhcHBlbmQNCj4+IEBAIC02
LDEwICs2LDkgQEAgRklMRVNFWFRSQVBBVEhTX3ByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06
Ig0KPj4NCj4+ICAgU1JDX1VSSSArPSAiIFwNCj4+ICAgCWZpbGU6Ly9HcmFwaGljc1N1cmZhY2VH
TF9Ob1guY3BwLnBhdGNoIFwNCj4+IC0JZmlsZTovLzAwMDEtSEFDSy1BTkdMRS1raHJwbGF0Zm9y
bS5oLWFkZC1kZWZpbmUtDQo+TUVTQV9FR0xfTk9fWDExXy5wYXRjaCBcDQo+PiAgICINCj4+DQo+
PiAtUFJfYXBwZW5kID0gIi5hcmFnbzgiDQo+PiArUFJfYXBwZW5kID0gIi5hcmFnbzciDQo+Pg0K
Pj4gICBFWFRSQV9PRUNNQUtFX2FwcGVuZCA9ICIgLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2Ui
DQo+Pg0KPj4NCg==

