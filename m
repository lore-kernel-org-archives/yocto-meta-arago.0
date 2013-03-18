Return-Path: <eyalr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4494952A19
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 09:25:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2I9PqNl019105
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:25:52 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2I9PpLj021970
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:25:52 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 10:25:51 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: connectivity packagegroup: add wlconf for wilink8
Thread-Index: Ac4jum2UhylcKwKBTp2rbSCOvPZpfw==
Date: Mon, 18 Mar 2013 09:25:50 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C4FEF0@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: connectivity packagegroup: add wlconf for wilink8
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
X-List-Received-Date: Mon, 18 Mar 2013 09:25:53 -0000
X-Groupsio-MsgNum: 1002
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEF0DNCE04entticom_"

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEF0DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Add the wlconf configuration utility which is used for wilink8 only.
The package is added based on the WILINK_VERSION switch added to arago.conf

Best Regards,
Eyal Reizer

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEF0DNCE04entticom_
Content-Type: application/octet-stream;
	name="0009-connectivity-packagegroup-add-wlconf-for-wilink8.patch"
Content-Description: 0009-connectivity-packagegroup-add-wlconf-for-wilink8.patch
Content-Disposition: attachment;
	filename="0009-connectivity-packagegroup-add-wlconf-for-wilink8.patch";
	size=1348; creation-date="Mon, 18 Mar 2013 08:41:27 GMT";
	modification-date="Mon, 18 Mar 2013 09:24:12 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3NTA2ZDI4ZWZjNTA2MTQzYzQwZWY3NzlmM2NmMDY5ZjcyOGM3OWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogRXlhbCBSZWl6ZXIgPGV5YWxyQHRpLmNvbT4NCkRhdGU6IE1v
biwgMTEgTWFyIDIwMTMgMDI6MTU6NTcgLTA3MDANClN1YmplY3Q6IFtQQVRDSCA5LzldIGNvbm5l
Y3Rpdml0eSBwYWNrYWdlZ3JvdXA6IGFkZCB3bGNvbmYgZm9yIHdpbGluazgNCg0KQWRkIHRoZSB3
bGNvbmYgY29uZmlndXJhdGlvbiB1dGlsaXR5IHdoaWNoIGlzIHVzZWQgZm9yIHdpbGluazgNCm9u
bHkuDQpUaGUgcGFja2FnZSBpcyBhZGRlZCBiYXNlZCBvbiB0aGUgV0lMSU5LX1ZFUlNJT04gc3dp
dGNoIGFkZGVkIHRvIA0KYXJhZ28uY29uZg0KDQpTaWduZWQtb2ZmLWJ5OiBFeWFsIFJlaXplciA8
ZXlhbHJAdGkuY29tPg0KLS0tDQogLi4uL3BhY2thZ2Vncm91cC1hcmFnby10aXNkay1jb25uZWN0
aXZpdHkuYmIgICAgICAgfCAgICAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lw
ZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1hcmFnby10aXNkay1jb25uZWN0aXZp
dHkuYmIgYi9tZXRhLWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNr
YWdlZ3JvdXAtYXJhZ28tdGlzZGstY29ubmVjdGl2aXR5LmJiDQppbmRleCBkOTM2ZjgzLi5lZWRh
ZDVkIDEwMDY0NA0KLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vn
cm91cHMvcGFja2FnZWdyb3VwLWFyYWdvLXRpc2RrLWNvbm5lY3Rpdml0eS5iYg0KKysrIGIvbWV0
YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWFy
YWdvLXRpc2RrLWNvbm5lY3Rpdml0eS5iYg0KQEAgLTEsNiArMSw2IEBADQogREVTQ1JJUFRJT04g
PSAiVGFzayB0byBpbnN0YWxsIHdsYW4gYW5kIGJsdWV0b290aCBwYWNrYWdlcyBpbnRvIHRoZSB0
YXJnZXQgRlMiDQogTElDRU5TRSA9ICJNSVQiDQotUFIgPSAicjUiDQorUFIgPSAicjYiDQogDQog
aW5oZXJpdCBwYWNrYWdlZ3JvdXANCiANCkBAIC0yOCw2ICsyOCw3IEBAIFdMQU5fQ09NTU9OID0g
IlwNCiAgICAgcHVsc2VhdWRpby1tb2R1bGUtYmx1ZXRvb3RoLWRldmljZSBcDQogICAgIGV2ZW50
ZHVtcCBcDQogICAgIHdwYS1zdXBwbGljYW50IFwNCisgICAgJHtAYmFzZV9jb250YWlucygnV0lM
SU5LX1ZFUlNJT04nLCdXSUxJTkstOCcsJ3dsY29uZicsJycsZCl9IFwNCiAiDQogDQogRklSTVdB
UkVfQU5EX0RSSVZFUlMgPSAiXA0KLS0gDQoxLjcuOS41DQoNCg==

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEF0DNCE04entticom_--
