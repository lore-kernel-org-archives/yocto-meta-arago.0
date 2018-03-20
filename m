Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9645452998
	for <meta-arago@arago-project.org>;
	Tue, 20 Mar 2018 14:58:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KEv76j005850
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 09:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521557827;
	bh=yzGUD4z0dptnXHla0SOFRK6zsT5d4Q259H/K7LnvvyI=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qPX4AxrNfF3m5/UxFNVlBdii4pXV967AjrM1HAjZrNUsKwvPh165zIVuexl8gFciD
	qM/slfzHBUdypQTbj27O1aOqNOaXmRbexTougobQqeKUpWScPRtI6ioFk06f28VOs9
	rLkIgClMJ3JRD8oTYRw9TyqqjgCFh/io+Jyd5pxE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KEv6fo017093
	for <meta-arago@arago-project.org>; Tue, 20 Mar 2018 09:57:07 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 09:57:05 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Tue, 20 Mar 2018 09:57:05 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk] [PATCH]
	tiovx-sys-iface: use update-alternatives for the firmware
Thread-Index: AQHTv88aQtQwUulrkkqt6ZX30vu1haPZM4Vg
Date: Tue, 20 Mar 2018 14:57:05 +0000
Message-ID: <c48a1039abce4abb8784f1df98f43201@ti.com>
References: <1521496586-2283-1-git-send-email-a0271529@ti.com>
	<295654e8-83e3-be2f-3863-f151f6bbc572@ti.com>
In-Reply-To: <295654e8-83e3-be2f-3863-f151f6bbc572@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.131]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] tiovx-sys-iface: use update-alternatives for the firmware
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
X-List-Received-Date: Tue, 20 Mar 2018 14:58:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGlmZmxlciwgSmFjb2INCj4g
U2VudDogTW9uZGF5LCBNYXJjaCAxOSwgMjAxOCA2OjExIFBNDQo+IFRvOiBHb3UsIEhvbmdtZWk7
IG1ldGEtYXJhZ29AYXJhZ28tcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtFWFRFUk5BTF0g
W21ldGEtYXJhZ29dIFttZXRhLXByb2Nlc3Nvci1zZGtdIFtQQVRDSF0gdGlvdngtDQo+IHN5cy1p
ZmFjZTogdXNlIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgZm9yIHRoZSBmaXJtd2FyZQ0KPiANCj4gDQo+
IA0KPiBPbiAzLzE5LzIwMTggNTo1NiBQTSwgSG9uZ21laSBHb3Ugd3JvdGU6DQo+ID4gU2lnbmVk
LW9mZi1ieTogSG9uZ21laSBHb3UgPGEwMjcxNTI5QHRpLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHJl
Y2lwZXMtdGkvdGlvdngvdGlvdngtc3lzLWlmYWNlLmJiIHwgMTEgKysrKysrKysrKy0NCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy10aS90aW92eC90aW92eC1zeXMtaWZhY2UuYmINCj4gPiBi
L3JlY2lwZXMtdGkvdGlvdngvdGlvdngtc3lzLWlmYWNlLmJiDQo+ID4gaW5kZXggNDQ2Mjc0OS4u
YmNmYmNjOSAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLXRpL3Rpb3Z4L3Rpb3Z4LXN5cy1pZmFj
ZS5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtdGkvdGlvdngvdGlvdngtc3lzLWlmYWNlLmJiDQo+ID4g
QEAgLTcsMTEgKzcsMTMgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vaWZhY2UvVlNESy9k
b2NzL1RJT1ZYLQ0KPiBTWVMtSUZBQ0VfMS4wLjAuMF9tYW5pZmVzdC5odG1sDQo+ID4gICByZXF1
aXJlIHJlY2lwZXMtdGkvaW5jbHVkZXMvdGlzZGstcGF0aHMuaW5jDQo+ID4gICByZXF1aXJlIHRp
b3Z4LXN5cy5pbmMNCj4gPg0KPiA+IC1QUiA9ICJyMSINCj4gPiArUFIgPSAicjAiDQo+IA0KPiBU
aGUgUFIgdmFsdWUgc2hvdWxkIG5vdCBiZSBkZWNyZWFzZWQuDQo+IA0KUFYgaW4gdGlvdngtc3lz
LmluYyBoYXMgYmVlbiBjaGFuZ2VkIGZyb20gMDEuMDAuMDAuMDAgdG8gMDEuMDAuMDEuMDAuIFNv
LCBzdGFydGluZyBmcm9tIHIwIGhlcmUuDQoNCj4gPg0KPiA+ICAgQ09NUEFUSUJMRV9NQUNISU5F
ID0gImRyYTd4eCINCj4gPiAgIFBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iDQo+ID4N
Cj4gPiAraW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzDQo+ID4gKw0KPiA+ICAgUyA9ICIke1dP
UktESVJ9L2dpdCINCj4gPg0KPiA+ICAgZG9faW5zdGFsbCAoKSB7DQo+ID4gQEAgLTI0LDYgKzI2
LDEzIEBAIGRvX2luc3RhbGwgKCkgew0KPiA+ICAgICAgIGluc3RhbGwgLW0gMDY0NCAke1N9L2Zp
cm13YXJlL3Rpb3Z4X2RzcDIueGU2Ng0KPiAke0R9LyR7YmFzZV9saWJkaXJ9L2Zpcm13YXJlL2Ry
YTctZHNwMi1mdy54ZTY2Lm9wZW52eA0KPiA+ICAgfQ0KPiA+DQo+ID4gK0FMVEVSTkFUSVZFXyR7
UE59ID0gImRyYTctZHNwMS1mdy54ZTY2IGRyYTctZHNwMi1mdy54ZTY2Ig0KPiA+ICtBTFRFUk5B
VElWRV9MSU5LX05BTUVbZHJhNy1kc3AxLWZ3LnhlNjZdID0NCj4gIiR7YmFzZV9saWJkaXJ9L2Zp
cm13YXJlL2RyYTctZHNwMS1mdy54ZTY2Ig0KPiA+ICtBTFRFUk5BVElWRV9UQVJHRVRbZHJhNy1k
c3AxLWZ3LnhlNjZdID0NCj4gIiR7YmFzZV9saWJkaXJ9L2Zpcm13YXJlL2RyYTctZHNwMS1mdy54
ZTY2Lm9wZW52eCINCj4gPiArQUxURVJOQVRJVkVfTElOS19OQU1FW2RyYTctZHNwMi1mdy54ZTY2
XSA9DQo+ICIke2Jhc2VfbGliZGlyfS9maXJtd2FyZS9kcmE3LWRzcDItZncueGU2NiINCj4gPiAr
QUxURVJOQVRJVkVfVEFSR0VUW2RyYTctZHNwMi1mdy54ZTY2XSA9DQo+ICIke2Jhc2VfbGliZGly
fS9maXJtd2FyZS9kcmE3LWRzcDItZncueGU2Ni5vcGVudngiDQo+IA0KPiBUaGlzIGxvb2tzIGZp
bmUsIGJ1dCBpdCBtYXkgYmUgYmV0dGVyIHRvIGZvbGxvdyB0aGUgZXhhbXBsZXMgaW4gb3BlbmNs
LW1vbml0b3INCj4gdG8gdXNlICR7QlBOfSBpbnN0ZWFkIG9mIHRoZSBoYXJkLWNvZGVkICJvcGVu
dngiLg0KPiANCj4gRS5nLjoNCj4gDQo+IEFMVEVSTkFUSVZFX0xJTktfTkFNRVtkcmE3LWRzcDEt
ZncueGU2Nl0gPQ0KPiAiJHtiYXNlX2xpYmRpcn0vZmlybXdhcmUvZHJhNy1kc3AxLWZ3LnhlNjYi
DQo+IEFMVEVSTkFUSVZFX1RBUkdFVFtkcmE3LWRzcDEtZncueGU2Nl0gPSAiJHtiYXNlX2xpYmRp
cn0vZmlybXdhcmUvZHJhNy0NCj4gZHNwMS1mdy54ZTY2LiR7QlBOfSINCj4gQUxURVJOQVRJVkVf
TElOS19OQU1FW2RyYTctZHNwMi1mdy54ZTY2XSA9DQo+ICIke2Jhc2VfbGliZGlyfS9maXJtd2Fy
ZS9kcmE3LWRzcDItZncueGU2NiINCj4gQUxURVJOQVRJVkVfVEFSR0VUW2RyYTctZHNwMi1mdy54
ZTY2XSA9ICIke2Jhc2VfbGliZGlyfS9maXJtd2FyZS9kcmE3LQ0KPiBkc3AyLWZ3LnhlNjYuJHtC
UE59Ig0KPiANCg0KVGhlIHJlY2lwZSBuYW1lIGlzIHRpb3Z4LXN5cy1pZmFjZSwgaW5zdGVhZCBv
ZiBvcGVudnguDQogDQo+ID4gK0FMVEVSTkFUSVZFX1BSSU9SSVRZID0gIjIwIg0KPiA+ICsNCj4g
PiAgIEZJTEVTXyR7UE59ICs9ICIke1RJT1ZYX0lOU1RBTExfRElSX1JFQ0lQRX0vc3lzLWlmYWNl
LyogIg0KPiA+ICAgUEFDS0FHRVMgPSsgIiR7UE59LWZpcm13YXJlIg0KPiA+ICAgRklMRVNfJHtQ
Tn0tZmlybXdhcmUgPSAiJHtiYXNlX2xpYmRpcn0vZmlybXdhcmUvKiINCg0K

