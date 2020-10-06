Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 49582520E5
	for <meta-arago@arago-project.org>;
	Tue,  6 Oct 2020 16:06:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096G36kl006229
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 11:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602000186;
	bh=nKZNRi20VzgTphM/LuEY7FC8oDGXmvVHbGvcuqQjUSw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TPq8N9ddEXaHP/7pv2IRAKI72JDkKbG+Wa2X/9LAej7FFiL1ovXv1Mc+Zh3MMTzfY
	YVhDwVgFNAxqsHTDQlyOYVxvpuPg+eLzP1tzHO60LivTiuA/3Ue0UjnyKMW0Bx3ikJ
	6HD0D9XJDQVPcn+MgofbQW9SiObITQ0ivGmk/ILI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096G36J8129245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 11:03:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 6 Oct 2020 11:03:05 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1979.003; Tue, 6 Oct 2020 11:03:05 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago][dunfell][PATCH] qtwayland: backport
	texture-sharing/custom-compositor fix
Thread-Index: AQHWm92m+RIgmM3Y1UuTI6ydEEnDBamLCZEA//+yeUA=
Date: Tue, 6 Oct 2020 16:03:05 +0000
Message-ID: <c2cd6cc902dd4934bb1987e429c2dfb4@ti.com>
References: <20201006123840.26473-1-g-tammana@ti.com>
	<20201006153830.GB7434@beryl>
In-Reply-To: <20201006153830.GB7434@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.37.175]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [dunfell][PATCH] qtwayland: backport texture-sharing/custom-compositor fix
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
X-List-Received-Date: Tue, 06 Oct 2020 16:06:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERteXRyaXllbmtvLCBEZW55
cw0KPlNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMDYsIDIwMjAgMTA6MzkgQU0NCj5UbzogVGFtbWFu
YSwgR293dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT4NCj5DYzogbWV0YS1hcmFnb0BhcmFnby1wcm9q
ZWN0Lm9yZw0KPlN1YmplY3Q6IFJlOiBbbWV0YS1hcmFnb11bZHVuZmVsbF1bUEFUQ0hdIHF0d2F5
bGFuZDogYmFja3BvcnQgdGV4dHVyZS0NCj5zaGFyaW5nL2N1c3RvbS1jb21wb3NpdG9yIGZpeA0K
Pg0KPkdvd3RoYW0sDQo+DQo+R3JlYXQsIHRoYW5rcyBmb3IgZmluZGluZyB0aGUgZml4IHVwc3Ry
ZWFtIQ0KPldvdWxkIHlvdSBiZSB3aWxsaW5nIHRvIHN1Ym1pdCBpdCB0byBtZXRhLXF0NSBsYXll
cj8NCj5odHRwczovL2dpdGh1Yi5jb20vbWV0YS1xdDUvbWV0YS1xdDUvdHJlZS9kdW5mZWxsDQo+
DQo+VGhleSBwcmVmZXIgZ2l0aHViIHB1bGwgcmVxdWVzdHMsIGJ1dCB3b3VsZCBhbHNvIHRha2Ug
YSBwYXRjaCBmcm9tIG1ldGEtb2UNCj5saXN0LiBMb29rcyBsaWtlIGl0IGlzIG9ubHkgbmVlZGVk
IGZvciBkdW5mZWxsLCBhcyBpdCdzIGFscmVhZHkgZml4ZWQgaW4NCj5uZXcNCj52ZXJzaW9uLg0K
DQpTdXJlLCB3YXMgdGFraW5nIGEgbG9vayBhdCBob3cgdG8gcHVzaCBjaGFuZ2VzIGZvciBxdC4g
VGhhbmtzIGZvciB0aGUgcG9pbnRlcnMuIFdpbGwgcHVzaCBpdCB0aGVyZSBhcyB3ZWxsLg0KDQpU
aGFua3MsDQpHb3d0aGFtDQoNCj5FaXRoZXIgd2F5LCBmb3IgbWV0YS1hcmFnbyBjaGFuZ2U6DQo+
DQo+UmV2aWV3ZWQtYnk6IERlbnlzIERteXRyaXllbmtvIDxkZW55c0B0aS5jb20+DQo+DQo+DQo+
T24gVHVlLCBPY3QgMDYsIDIwMjAgYXQgMDc6Mzg6NDBBTSAtMDUwMCwgR293dGhhbSBUYW1tYW5h
IHdyb3RlOg0KPj4gU2lnbmVkLW9mZi1ieTogR293dGhhbSBUYW1tYW5hIDxnLXRhbW1hbmFAdGku
Y29tPg0KPj4gLS0tDQo+PiAgLi4ubGFuZC10ZXh0dXJlLXNoYXJpbmctY3VzdG9tLWNvbXBvc2l0
LnBhdGNoIHwgNTIgKysrKysrKysrKysrKysrKysrKw0KPj4gIC4uLi9yZWNpcGVzLXF0L3F0NS9x
dHdheWxhbmRfZ2l0LmJiYXBwZW5kICAgICB8ICAzICstDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA1
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2F5bGFuZC8wMDAxLQ0KPmV4YW1wbGVz
LWZpeC13YXlsYW5kLXRleHR1cmUtc2hhcmluZy1jdXN0b20tY29tcG9zaXQucGF0Y2gNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3YXlsYW5k
LzAwMDEtZXhhbXBsZXMtDQo+Zml4LXdheWxhbmQtdGV4dHVyZS1zaGFyaW5nLWN1c3RvbS1jb21w
b3NpdC5wYXRjaCBiL21ldGEtYXJhZ28tDQo+ZGlzdHJvL3JlY2lwZXMtcXQvcXQ1L3F0d2F5bGFu
ZC8wMDAxLWV4YW1wbGVzLWZpeC13YXlsYW5kLXRleHR1cmUtc2hhcmluZy0NCj5jdXN0b20tY29t
cG9zaXQucGF0Y2gNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMC4u
YzIwOWRmYzQNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL21ldGEtYXJhZ28tZGlzdHJvL3Jl
Y2lwZXMtcXQvcXQ1L3F0d2F5bGFuZC8wMDAxLWV4YW1wbGVzLWZpeC0NCj53YXlsYW5kLXRleHR1
cmUtc2hhcmluZy1jdXN0b20tY29tcG9zaXQucGF0Y2gNCj4+IEBAIC0wLDAgKzEsNTIgQEANCj4+
ICtGcm9tIDFkMTg1OTFkOWU3ZWQ5YjM1ODBlMDZjMzdiZTIzYmZkZTI0YmMzMGMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxDQo+PiArRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgu
bmV0Pg0KPj4gK0RhdGU6IEZyaSwgMyBBcHIgMjAyMCAyMjo0MDoyOSArMDIwMA0KPj4gK1N1Ympl
Y3Q6IFtQQVRDSF0gZXhhbXBsZXM6IGZpeCB3YXlsYW5kL3RleHR1cmUtc2hhcmluZy9jdXN0b20t
Y29tcG9zaXRvcg0KPj4gK01JTUUtVmVyc2lvbjogMS4wDQo+PiArQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04DQo+PiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dA0KPj4gKw0KPj4gK0ZpeGVzOg0KPj4gKw0KPj4gKyAgbWFpbi5jcHA6ODM6MzM6IGVycm9yOiDi
gJhHTF9SR0JBOOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZA0KPnlvdSBt
ZWFuIOKAmEdMX1JHQkE04oCZPw0KPj4gKyAgICAgODMgfCAgICAgICAgICAgICAqZ2xJbnRlcm5h
bEZvcm1hdCA9IEdMX1JHQkE4Ow0KPj4gKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+DQo+PiArICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgR0xfUkdCQTQNCj4+ICsgIG1haW4uY3BwOjEyMDozMzogZXJyb3I6IOKAmEdMX1JH
QkE44oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkDQo+eW91IG1lYW4g4oCY
R0xfUkdCQTTigJk/DQo+PiArICAgIDEyMCB8ICAgICAgICAgICAgICpnbEludGVybmFsRm9ybWF0
ID0gR0xfUkdCQTg7DQo+PiArICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn4NCj4+ICsgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBHTF9SR0JBNA0KPj4gKw0KPj4gK1Rhc2stbnVtYmVyOiBRVEJVRy04MzMwNA0KPj4gK0NoYW5n
ZS1JZDogSTA1MTVmMzMwM2IwOGM0MDVkMTYyOTg2ZTI4MGU5YTdiZDM1ZTI4ZjcNCj4+ICtSZXZp
ZXdlZC1ieTogTGFzemxvIEFnb2NzIDxsYXN6bG8uYWdvY3NAcXQuaW8+DQo+PiArUmV2aWV3ZWQt
Ynk6IEVza2lsIEFicmFoYW1zZW4gQmxvbWZlbGR0IDxlc2tpbC5hYnJhaGFtc2VuLQ0KPmJsb21m
ZWxkdEBxdC5pbz4NCj4+ICsNCj4+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFsxZDE4NTkx
ZDllN2VkOWIzNTgwZTA2YzM3YmUyM2JmZGUyNGJjMzBjXQ0KPj4gKw0KPj4gK1RoZSBwYXRjaCBp
cyBiYWNrcG9ydCBmcm9tIHVwc3RyZWFtIGNvbW1pdCAtDQo+PiArMWQxODU5MWQ5ZTdlZDliMzU4
MGUwNmMzN2JlMjNiZmRlMjRiYzMwYw0KPj4gKw0KPj4gK1NpZ25lZC1vZmYtYnk6IEdvd3RoYW0g
VGFtbWFuYSA8Zy10YW1tYW5hQHRpLmNvbT4NCj4+ICstLS0NCj4+ICsgZXhhbXBsZXMvd2F5bGFu
ZC90ZXh0dXJlLXNoYXJpbmcvY3VzdG9tLWNvbXBvc2l0b3IvbWFpbi5jcHAgfCA0ICsrKysNCj4+
ICsgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4gKw0KPj4gK2RpZmYgLS1naXQg
YS9leGFtcGxlcy93YXlsYW5kL3RleHR1cmUtc2hhcmluZy9jdXN0b20tY29tcG9zaXRvci9tYWlu
LmNwcA0KPmIvZXhhbXBsZXMvd2F5bGFuZC90ZXh0dXJlLXNoYXJpbmcvY3VzdG9tLWNvbXBvc2l0
b3IvbWFpbi5jcHANCj4+ICtpbmRleCBhMzljOGMzOC4uYWYzNzUwMjQgMTAwNjQ0DQo+PiArLS0t
IGEvZXhhbXBsZXMvd2F5bGFuZC90ZXh0dXJlLXNoYXJpbmcvY3VzdG9tLWNvbXBvc2l0b3IvbWFp
bi5jcHANCj4+ICsrKysgYi9leGFtcGxlcy93YXlsYW5kL3RleHR1cmUtc2hhcmluZy9jdXN0b20t
Y29tcG9zaXRvci9tYWluLmNwcA0KPj4gK0BAIC02Myw2ICs2MywxMCBAQA0KPj4gKw0KPj4gKyAj
aW5jbHVkZSAiUXRXYXlsYW5kQ29tcG9zaXRvci9wcml2YXRlL3F3bHRleHR1cmVzaGFyaW5nZXh0
ZW5zaW9uX3AuaCINCj4+ICsNCj4+ICsrI2lmbmRlZiBHTF9SR0JBOA0KPj4gKysjZGVmaW5lIEdM
X1JHQkE4IDB4ODA1OA0KPj4gKysjZW5kaWYNCj4+ICsrDQo+PiArIGNsYXNzIEN1c3RvbVNoYXJp
bmdFeHRlbnNpb24gOiBwdWJsaWMgUVdheWxhbmRUZXh0dXJlU2hhcmluZ0V4dGVuc2lvbg0KPj4g
KyB7DQo+PiArICAgICBRX09CSkVDVA0KPj4gKy0tDQo+PiArMi4xNy4xDQo+PiArDQo+PiBkaWZm
IC0tZ2l0IGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3YXlsYW5kX2dpdC5i
YmFwcGVuZA0KPmIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3YXlsYW5kX2dp
dC5iYmFwcGVuZA0KPj4gaW5kZXggYmQ1MjlkMmUuLmM2MDI4MTNjIDEwMDY0NA0KPj4gLS0tIGEv
bWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3YXlsYW5kX2dpdC5iYmFwcGVuZA0K
Pj4gKysrIGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3YXlsYW5kX2dpdC5i
YmFwcGVuZA0KPj4gQEAgLTEsNiArMSw3IEBADQo+PiAgRklMRVNFWFRSQVBBVEhTX3ByZXBlbmQg
Oj0gIiR7VEhJU0RJUn0vJHtQTn06Ig0KPj4gLVBSX2FwcGVuZCA9ICIuYXJhZ28xIg0KPj4gK1BS
X2FwcGVuZCA9ICIuYXJhZ28yIg0KPj4NCj4+ICBTUkNfVVJJICs9ICIgXA0KPj4gICAgICBmaWxl
Oi8vMDAwMS1wbHVnaW5zLWRlY29yYXRpb25zLWJyYWRpZW50LWRpc3BsYXktd2luZG93LWljb24t
DQo+b25sLnBhdGNoIFwNCj4+ICsgICAgZmlsZTovLzAwMDEtZXhhbXBsZXMtZml4LXdheWxhbmQt
dGV4dHVyZS1zaGFyaW5nLWN1c3RvbS0NCj5jb21wb3NpdC5wYXRjaCBcDQo+PiAgIg0KPj4gLS0N
Cj4+IDIuMTcuMQ0KPj4NCg==

