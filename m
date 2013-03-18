Return-Path: <eyalr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0D6C952961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 09:14:50 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2I9EnMB017899
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:14:49 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2I9Emvl009248
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:14:49 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 10:14:48 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: bt-firmware: update for including the wl18xx bt firmware
Thread-Index: Ac4juP0DziKXBiMkTguxzHN9NWTDUQ==
Date: Mon, 18 Mar 2013 09:14:47 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C4FE7F@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: bt-firmware: update for including the wl18xx bt firmware
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
X-List-Received-Date: Mon, 18 Mar 2013 09:14:50 -0000
X-Groupsio-MsgNum: 1000
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE7FDNCE04entticom_"

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE7FDNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The attached patch update the Bluetooth firmware recipe for including the w=
l18xx bluetooth firmware
files from SP-2.8 into the root file system

Best Regards,
Eyal Reizer

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE7FDNCE04entticom_
Content-Type: application/octet-stream;
	name="0007-bt-firmware-update-for-including-the-wl18xx-bt-firmw.patch"
Content-Description: 0007-bt-firmware-update-for-including-the-wl18xx-bt-firmw.patch
Content-Disposition: attachment;
	filename="0007-bt-firmware-update-for-including-the-wl18xx-bt-firmw.patch";
	size=1348; creation-date="Mon, 18 Mar 2013 08:41:26 GMT";
	modification-date="Mon, 18 Mar 2013 09:14:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0OTNlNzJlZWY1NzQ4ZGMyYTdiZmUzOWZlZWUzNTA4NWRmMWZkOGNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogRXlhbCBSZWl6ZXIgPGV5YWxyQHRpLmNvbT4NCkRhdGU6IE1v
biwgMTggRmViIDIwMTMgMDE6MzY6NTQgLTA4MDANClN1YmplY3Q6IFtQQVRDSCA3LzldIGJ0LWZp
cm13YXJlOiB1cGRhdGUgZm9yIGluY2x1ZGluZyB0aGUgd2wxOHh4IGJ0IGZpcm13YXJlDQoNClVw
ZGF0ZSB0aGUgcmVjaXBlIGZvciBpbmNsdWRpbmcgdGhlIHdsMTh4eCBibHVldG9vdGggZmlybXdh
cmUNCmZpbGVzIGZyb20gU1AtMi44IGludG8gdGhlIHRhcmdldCByb290IGZpbGUgc3lzdGVtDQoN
ClNpZ25lZC1vZmYtYnk6IEV5YWwgUmVpemVyIDxleWFsckB0aS5jb20+DQotLS0NCiAuLi4vcmVj
aXBlcy1ic3AvYnQtZmlybXdhcmUvYnQtZmlybXdhcmVfZ2l0LmJiICAgICB8ICAgIDQgKystLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC9idC1maXJtd2FyZS9idC1maXJt
d2FyZV9naXQuYmIgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC9idC1maXJtd2FyZS9i
dC1maXJtd2FyZV9naXQuYmINCmluZGV4IDU2OWM2OTAuLjcyYmNjNmMgMTAwNjQ0DQotLS0gYS9t
ZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC9idC1maXJtd2FyZS9idC1maXJtd2FyZV9naXQu
YmINCisrKyBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtYnNwL2J0LWZpcm13YXJlL2J0LWZp
cm13YXJlX2dpdC5iYg0KQEAgLTEzLDExICsxMywxMSBAQCBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNI
SU5FX0FSQ0h9Ig0KIFJDT05GTElDVFNfJHtQTn0gPSAibGludXgtZmlybXdhcmUtd2wxMnh4Ig0K
IFJSRVBMQUNFU18ke1BOfSAgPSAibGludXgtZmlybXdhcmUtd2wxMnh4Ig0KIA0KLVBSID0gInIw
K2dpdHIke1NSQ1JFVn0iDQorUFIgPSAicjErZ2l0ciR7U1JDUkVWfSINCiANCiBDT01QQVRJQkxF
X01BQ0hJTkUgPSAib21hcDN8b21hcGwxMzh8ZGE4NTAtb21hcGwxMzgtZXZtfHRpMzN4Ig0KIA0K
LVNSQ1JFViA9ICJkYjQzZDFmMDVlZmRhOTc3N2Q3YWMxYWMzNjY2MzdlMjllMjFmNzdmIg0KK1NS
Q1JFViA9ICJhZGJjMjdjMTFkNWM1YzhjMjBhOTNhOGJlY2E2NDdiNGE2YWFhMDNiIg0KIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9USS1FQ1MvYnQtZmlybXdhcmUuZ2l0O3Byb3RvY29sPWdp
dCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlZmlsZS1hbGxvdy1idWlsZGluZy13aXRo
aW4tdGhlLU9FLnBhdGNoIg0KIA0KLS0gDQoxLjcuOS41DQoNCg==

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FE7FDNCE04entticom_--
