Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6242152961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 09:06:55 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2I96sRT007775
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:06:54 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2I96sH4032290
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:06:54 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 10:06:53 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: ti-wifi-utils-wl18xx: build the calibrator tool for wilink8
Thread-Index: Ac4jt+449beMk4G9TKaLzdaEKAY1Ug==
Date: Mon, 18 Mar 2013 09:06:53 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C4FE1F@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: ti-wifi-utils-wl18xx: build the calibrator tool for wilink8
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
X-List-Received-Date: Mon, 18 Mar 2013 09:06:55 -0000
X-Groupsio-MsgNum: 998
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE1FDNCE04entticom_"

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE1FDNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The attached patch add a recipe for building and installing the calibrator =
tool used with the wilink8 family of chips.

This package replace the wilink6 package which is provided by the ti-wifi-u=
tils.=20
Selection between the two is done using a "WILINK_VERSION" switch added to =
arago.conf

Best Regards,
Eyal Reizer

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE1FDNCE04entticom_
Content-Type: application/octet-stream;
	name="0005-ti-wifi-utils-wl18xx-build-the-calibrator-tool-for-w.patch"
Content-Description: 0005-ti-wifi-utils-wl18xx-build-the-calibrator-tool-for-w.patch
Content-Disposition: attachment;
	filename="0005-ti-wifi-utils-wl18xx-build-the-calibrator-tool-for-w.patch";
	size=1807; creation-date="Mon, 18 Mar 2013 08:41:24 GMT";
	modification-date="Mon, 18 Mar 2013 09:06:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2ODU1MGE5ZGZjN2E5MjM3NzdkMDQyMGMyYWJiNjNiODViNjE5YjI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogRXlhbCBSZWl6ZXIgPGV5YWxyQHRpLmNvbT4NCkRhdGU6IFN1
biwgMTAgTWFyIDIwMTMgMDk6Mzg6MDYgLTA3MDANClN1YmplY3Q6IFtQQVRDSCA1LzldIHRpLXdp
ZmktdXRpbHMtd2wxOHh4OiBidWlsZCB0aGUgY2FsaWJyYXRvciB0b29sIGZvcg0KIHdpbGluOA0K
DQpBZGQgYSByZWNpcGUgZm9yIGJ1aWxkaW5nIGFuZCBpbnN0YWxsaW5nIHRoZSBjYWxpYnJhdG9y
IHRvb2wNCnVzZWQgd2l0aCB0aGUgd2lsaW5rOCBmYW1pbHkgb2YgY2hpcHMuDQoNClRoaXMgcGFj
a2FnZSByZXBsYWNlIHRoZSB3aWxpbms2IHBhY2thZ2Ugd2hpY2ggaXMgcHJvdmlkZWQgYnkgdGhl
DQp0aS13aWZpLXV0aWxzLiBTZWxlY3Rpb24gYmV0d2VlbiB0aGUgdHdvIGlzIGRvbmUgdXNpbmcg
YSANCiJXSUxJTktfVkVSU0lPTiIgc3dpdGNoIGFkZGVkIHRvIGFyYWdvLmNvbmYNCg0KU2lnbmVk
LW9mZi1ieTogRXlhbCBSZWl6ZXIgPGV5YWxyQHRpLmNvbT4NCi0tLQ0KIC4uLi90aS13aWZpLXV0
aWxzL3RpLXdpZmktdXRpbHMtd2wxOHh4X2dpdC5iYiAgICAgIHwgICAyNiArKysrKysrKysrKysr
KysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtZGV2dG9vbHMvdGktd2lmaS11dGlscy90
aS13aWZpLXV0aWxzLXdsMTh4eF9naXQuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0
cmFzL3JlY2lwZXMtZGV2dG9vbHMvdGktd2lmaS11dGlscy90aS13aWZpLXV0aWxzLXdsMTh4eF9n
aXQuYmIgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWRldnRvb2xzL3RpLXdpZmktdXRpbHMv
dGktd2lmaS11dGlscy13bDE4eHhfZ2l0LmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXgg
MDAwMDAwMC4uM2QyZDZmMQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1hcmFnby1leHRyYXMv
cmVjaXBlcy1kZXZ0b29scy90aS13aWZpLXV0aWxzL3RpLXdpZmktdXRpbHMtd2wxOHh4X2dpdC5i
Yg0KQEAgLTAsMCArMSwyNiBAQA0KK0RFU0NSSVBUSU9OID0gIlRoZSBjYWxpYnJhdG9yIGFuZCBv
dGhlciB1c2VmdWwgdXRpbGl0aWVzIGZvciBUSSB3aXJlbGVzcyBzb2x1dGlvbiBiYXNlZCBvbiB3
bDEyeHggZHJpdmVyIg0KK0xJQ0VOU0UgPSAiQlNEIg0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0NPUFlJTkc7bWQ1PTQ3MjUwMTVjYjBiZTdiZTM4OWNmMDZkZWVhZTM2ODNkIg0KKw0KK0RF
UEVORFMgPSAibGlibmwiDQorUkRFUEVORFMgPSAidGktY29tcGF0LXdpcmVsZXNzLXdsMTJ4eCB3
bDEyeHgtZmlybXdhcmUiDQorDQorUFIgPSJyMStnaXRyJHtTUkNSRVZ9Ig0KK1BWID0iMC4wIg0K
Kw0KK1NSQ1JFViA9ICJvbF9yOC5hNi4wMSINCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
VEktT3BlbkxpbmsvMTh4eC10aS11dGlscy5naXQgXA0KKyINCisNCitQUk9WSURFUyArPSAidGkt
d2lmaS11dGlscyINCitSUFJPVklERVMgKz0gInRpLXdpZmktdXRpbHMiDQorDQorUyA9ICIke1dP
UktESVJ9L2dpdCINCisNCitleHBvcnQgQ1JPU1NfQ09NUElMRSA9ICIke1RBUkdFVF9QUkVGSVh9
Ig0KK0NGTEFHUyArPSAiIC1EQ09ORklHX0xJQk5MMjAiDQorDQorZG9faW5zdGFsbCgpIHsNCisg
ICAgaW5zdGFsbCAtZCAke0R9JHtiaW5kaXJ9DQorICAgIGluc3RhbGwgLW0gMDc1NSBjYWxpYnJh
dG9yICR7RH0ke2JpbmRpcn0vDQorfQ0KLS0gDQoxLjcuOS41DQoNCg==

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE1FDNCE04entticom_--
