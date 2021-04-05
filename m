Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 28BCC52BB8
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 21:37:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135LbTFr031340;
	Mon, 5 Apr 2021 16:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617658649;
	bh=kardt5ONIsVPS/nCCuqIW/N6usqGFNOmbLeDiPTjtZw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=n+ZCMAFTKLY5r+pXI9qSEYb28UvkaYl+9AmwGH4Zo+p6Y5xSROH78kqcoc8ksgvkD
	jP7pC7TigQEGMKBKT3VOfAcSZn5q4mCZdbnUXnsC9SZRdQspxJFXAW0Sus59TQtZ5u
	zoO1GYr9675KI/lyIO/RhOT93F+8ndeq8uLZi+9U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135LbTC9088970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 16:37:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 16:37:29 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 5 Apr 2021 16:37:29 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [EXTERNAL] Re: [meta-arago] [dunfell][PATCH v2 0/3] qtwebkit:
	Fix no x11 build
Thread-Index: AQHXKmFt6VqKLtaCd0Ow9IsHNmxDz6qmcnbg
Date: Mon, 5 Apr 2021 21:37:29 +0000
Message-ID: <cc8f6f696e614ec1a148d138497d9ae2@ti.com>
References: <20210405203928.7783-1-g-tammana@ti.com>
	<20210405211948.GB15937@denix.org>
In-Reply-To: <20210405211948.GB15937@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"denys@konsulko.com" <denys@konsulko.com>, "Bhargav,
	Krunal" <k-bhargav@ti.com>
Subject: Re: [EXTERNAL] Re: [dunfell][PATCH v2 0/3] qtwebkit: Fix no x11 build
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
X-List-Received-Date: Mon, 05 Apr 2021 21:37:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IERlbnlzIERteXRyaXllbmtv
IDxkZW5pc0BkZW5peC5vcmc+DQo+U2VudDogTW9uZGF5LCBBcHJpbCAwNSwgMjAyMSA0OjIwIFBN
DQo+VG86IFRhbW1hbmEsIEdvd3RoYW0gPGctdGFtbWFuYUB0aS5jb20+DQo+Q2M6IG1ldGEtYXJh
Z29AYXJhZ28tcHJvamVjdC5vcmc7IEJhamp1cmksIFByYW5lZXRoIDxwcmFuZWV0aEB0aS5jb20+
Ow0KPmRlbnlzQGtvbnN1bGtvLmNvbTsgQmhhcmdhdiwgS3J1bmFsIDxrLWJoYXJnYXZAdGkuY29t
Pg0KPlN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFttZXRhLWFyYWdvXSBbZHVuZmVsbF1bUEFUQ0gg
djIgMC8zXSBxdHdlYmtpdDogRml4DQo+bm8geDExIGJ1aWxkDQo+DQo+T24gTW9uLCBBcHIgMDUs
IDIwMjEgYXQgMDM6Mzk6MjVQTSAtMDUwMCwgR293dGhhbSBUYW1tYW5hIHdyb3RlOg0KPj4gcXR3
ZWJraXQgYnVpbGQgd2FzIGZhaWxpbmcgd2hlbiB4MTEgaXMgZW5hYmxlZCBmb3IgdGhlIHBsYXRm
b3JtLg0KPg0KPkkgZ3Vlc3MgYW5vdGhlciB0eXBvIGVuYWJsZWQvZGlzYWJsZWQgaGVyZT8NCg0K
WWVzIGFub3RoZXIgdHlwbyDimLkgc2hvdWxkIGhhdmUgYmVlbiBkaXNhYmxlZC4NCg0KPklmIHNv
LCBJIGRvbid0IHRoaW5rIGl0IHJlcXVpcmVzIGFub3RoZXIgcmV2aXNpb24sIGFzIHRoaXMgaXMg
anVzdCBhIGNvdmVyDQo+bGV0dGVyIGFuZCBhY3R1YWwgcGF0Y2hlcyBzZWVtIGZpbmUuIFRoYW5r
cy4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KR293dGhhbQ0KDQo+PiBUaGlzIHdhcyBkdWUg
dG8NCj4+IHF0d2Via2l0IGJ1aWxkIG5vdCBwaWNraW5nIHVwIHRoZSBFR0xfTk9fWDExIGZsYWcg
ZnJvbSB0aGUNCj5wYWNrYWdlY29uZmlnLiBUaGlzDQo+PiB3YXMgZWFybGllciBmaXhlZCBieSBl
bmFibGluZyB0aGUgZmxhZyBkaXJlY3RseSBpbiB0aGUga2hycGxhdGZvcm0NCj5oZWFkZXIgZmls
ZS4NCj4+IEZpeGluZyB1cCB0byBwYXNzIHRoZSBmbGFnIHRvIGJ1aWxkIGVudmlyb25tZW50IGl0
c2VsZi4NCj4+DQo+PiBBbHNvIGNsZWFuZWQgdXAgc29tZSBvZiB0aGUgb2xkIHBhdGNoZXMuDQo+
Pg0KPj4gdjI6DQo+PiAgIC0gZml4ZWQgdHlwbyBpbiBwYXRjaCAyLzMgKHF0d2Via2l0OiBGaXgg
bm8gWDExIGJ1aWxkKQ0KPj4NCj4+IEdvd3RoYW0gVGFtbWFuYSAoMyk6DQo+PiAgIFJldmVydCAi
SEFDSzogcXR3ZWJraXQ6IGRlZmluZSBNRVNBX0VHTF9OT19YMTFfSEVBREVSUyBhdA0KPj4gICAg
IEFOR0xFL2tocnBsYXRmb3JtLmgiDQo+PiAgIHF0d2Via2l0OiBGaXggbm8gWDExIGJ1aWxkDQo+
PiAgIHF0d2Via2l0OiBDbGVhbnVwIG9sZCBwYXRjaGVzDQo+Pg0KPj4gIC4uLmF0Zm9ybS5oLWFk
ZC1kZWZpbmUtTUVTQV9FR0xfTk9fWDExXy5wYXRjaCB8IDMwIC0tLS0tLS0tLS0tLQ0KPj4gIC4u
LmUtdG8tdXNlLUdMX05vWC12ZXJzaW9uLW9mLUdyYXBoaWNzUy5wYXRjaCB8IDI5IC0tLS0tLS0t
LS0tLQ0KPj4gIC4uLnJlLVBsYXRmb3JtUXQuY21ha2UtRml4LW5vLXgxMS1idWlsZC5wYXRjaCB8
IDQ2ICsrKysrKysrKysrKysrKysrKysNCj4+ICAuLi4vcXQ1L3F0d2Via2l0L0dyYXBoaWNzU3Vy
ZmFjZVRva2VuLmgucGF0Y2ggfCAzMyAtLS0tLS0tLS0tLS0tDQo+PiAgLi4uL3JlY2lwZXMtcXQv
cXQ1L3F0d2Via2l0L1dlYkNvcmUucHJpLnBhdGNoIHwgMTcgLS0tLS0tLQ0KPj4gIC4uLi9yZWNp
cGVzLXF0L3F0NS9xdHdlYmtpdF8lLmJiYXBwZW5kICAgICAgICB8ICA4ICstLS0NCj4+ICA2IGZp
bGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDExNSBkZWxldGlvbnMoLSkNCj4+ICBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1xdC9xdDUvcXR3ZWJraXQv
MDAwMS1IQUNLLQ0KPkFOR0xFLWtocnBsYXRmb3JtLmgtYWRkLWRlZmluZS1NRVNBX0VHTF9OT19Y
MTFfLnBhdGNoDQo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJhZ28tZGlzdHJvL3JlY2lw
ZXMtcXQvcXQ1L3F0d2Via2l0LzAwMDEtDQo+VGFyZ2V0LnByaS11cGRhdGUtdG8tdXNlLUdMX05v
WC12ZXJzaW9uLW9mLUdyYXBoaWNzUy5wYXRjaA0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
LWFyYWdvLWRpc3Ryby9yZWNpcGVzLXF0L3F0NS9xdHdlYmtpdC8wMDAxLQ0KPldlYkNvcmUtUGxh
dGZvcm1RdC5jbWFrZS1GaXgtbm8teDExLWJ1aWxkLnBhdGNoDQo+PiAgZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtDQo+cXQvcXQ1L3F0d2Via2l0L0dyYXBoaWNz
U3VyZmFjZVRva2VuLmgucGF0Y2gNCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1k
aXN0cm8vcmVjaXBlcy0NCj5xdC9xdDUvcXR3ZWJraXQvV2ViQ29yZS5wcmkucGF0Y2gNCj4+DQo+
PiAtLQ0KPj4gMi4zMS4xDQo+Pg0KPg0KPi0tDQo+UmVnYXJkcywNCj5EZW55cyBEbXl0cml5ZW5r
byA8ZGVuaXNAZGVuaXgub3JnPg0KPlBHUDogMHg0MjA5MDI3MjlBOTJDOTY0IC0gaHR0cHM6Ly9k
ZW5peC5vcmcvMHg0MjA5MDI3MjlBOTJDOTY0DQo+RmluZ2VycHJpbnQ6IDI1RkMgRTRBNSA4QTcy
IDJGNjkgMTE4NiAgNkQ3NiA0MjA5IDAyNzIgOUE5MiBDOTY0DQo=

