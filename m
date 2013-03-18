Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A194252961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 09:19:23 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2I9JNmQ014045
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:19:23 -0500
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2I9JM5d014728
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 04:19:22 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE71.ent.ti.com ([fe80::3dd1:4b04:86e6:bfd0%29]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 10:19:22 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: arago conf: add rule for selecting between wilink chips
Thread-Index: Ac4juYgmF7KrX630R4eCeK+E6ycmeQ==
Date: Mon, 18 Mar 2013 09:19:21 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C4FEB6@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: arago conf: add rule for selecting between wilink chips
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
X-List-Received-Date: Mon, 18 Mar 2013 09:19:23 -0000
X-Groupsio-MsgNum: 1001
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEB6DNCE04entticom_"

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEB6DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The attached patch add a configuration variable for selecting between wilin=
k6 and
wilink8 support into arago.conf

Based on this variable the right version will be picked for the
recipes which are different between wilink versions.

The default is currently set to "WILINK-6" until the next SDK release
which is going to switch to using WILINK-8.

Best Regards,
Eyal Reizer

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEB6DNCE04entticom_
Content-Type: application/octet-stream;
	name="0008-arago-conf-add-rule-for-selecting-between-wilink-chi.patch"
Content-Description: 0008-arago-conf-add-rule-for-selecting-between-wilink-chi.patch
Content-Disposition: attachment;
	filename="0008-arago-conf-add-rule-for-selecting-between-wilink-chi.patch";
	size=1946; creation-date="Mon, 18 Mar 2013 08:41:26 GMT";
	modification-date="Mon, 18 Mar 2013 09:17:55 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2YzY2NTgwMjBmYzdlNjkwOGQ4YjgyZTAwMjEyZWRmZWRiZjczOTFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogRXlhbCBSZWl6ZXIgPGV5YWxyQHRpLmNvbT4NCkRhdGU6IE1v
biwgMTEgTWFyIDIwMTMgMDA6NTU6MDkgLTA3MDANClN1YmplY3Q6IFtQQVRDSCA4LzldIGFyYWdv
IGNvbmY6IGFkZCBydWxlIGZvciBzZWxlY3RpbmcgYmV0d2VlbiB3aWxpbmsgY2hpcHMNCg0KQWRk
IGEgY29uZmlndXJhdGlvbiB2YXJpYWJsZSBmb3Igc2VsZWN0aW5nIGJldHdlZW4gd2lsaW5rNiBh
bmQNCndpbGluazggc3VwcG9ydC4NCg0KQmFzZWQgb24gdGhpcyB2YXJpYWJsZSB0aGUgcmlnaHQg
dmVyc2lvbiB3aWxsIGJlIHBpY2tlZCBmb3IgdGhlDQpyZWNpcGVzIHdoaWNoIGFyZSBkaWZmZXJl
bnQgYmV0d2VlbiB3aWxpbmsgdmVyc2lvbnMuDQoNClRoZSBkZWZhdWx0IGlzIGN1cnJlbnRseSBz
ZXQgdG8gIldJTElOSy02IiB1bnRpbCB0aGUgbmV4dCBTREsgcmVsZWFzZQ0Kd2hpY2ggaXMgZ29p
bmcgdG8gc3dpdGNoIHRvIHVzaW5nIFdJTElOSy04Lg0KDQpTaWduZWQtb2ZmLWJ5OiBFeWFsIFJl
aXplciA8ZXlhbHJAdGkuY29tPg0KLS0tDQogbWV0YS1hcmFnby1kaXN0cm8vY29uZi9kaXN0cm8v
YXJhZ28uY29uZiB8ICAgIDcgKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZGlzdHJvL2NvbmYvZGlzdHJvL2FyYWdvLmNv
bmYgYi9tZXRhLWFyYWdvLWRpc3Ryby9jb25mL2Rpc3Ryby9hcmFnby5jb25mDQppbmRleCA0NDE0
MWMxLi40ODM1MTYwIDEwMDY0NA0KLS0tIGEvbWV0YS1hcmFnby1kaXN0cm8vY29uZi9kaXN0cm8v
YXJhZ28uY29uZg0KKysrIGIvbWV0YS1hcmFnby1kaXN0cm8vY29uZi9kaXN0cm8vYXJhZ28uY29u
Zg0KQEAgLTQzLDYgKzQzLDEzIEBAIFBSRUZFUlJFRF9WRVJTSU9OX25hdGl2ZXNkay1xdDQtdG9v
bHMgPSAiNC44LjMiDQogUFJFRkVSUkVEX1ZFUlNJT05fd3BhLXN1cHBsaWNhbnQgPSAiMi4wLWRl
dmVsLXRpIg0KIFBSRUZFUlJFRF9WRVJTSU9OX2hvc3RhcC1kYWVtb24gPSAiMi4wLWRldmVsLXRp
Ig0KIA0KK1dJTElOS19WRVJTSU9OID0gIldJTElOSy02Ig0KK1BSRUZFUlJFRF9QUk9WSURFUl93
bDEyeHgtZmlybXdhcmUgPSAiJHtAYmFzZV9jb250YWlucygnV0lMSU5LX1ZFUlNJT04nLCdXSUxJ
TkstOCcsJ3dsMTh4eC1maXJtd2FyZScsJ3dsMTJ4eC1maXJtd2FyZScsZCl9Ig0KK1BSRUZFUlJF
RF9QUk9WSURFUl90aS1jb21wYXQtd2lyZWxlc3Mtd2wxMnh4ID0gIiR7QGJhc2VfY29udGFpbnMo
J1dJTElOS19WRVJTSU9OJywnV0lMSU5LLTgnLCd0aS1jb21wYXQtd2lyZWxlc3Mtd2wxOHh4Jywn
dGktY29tcGF0LXdpcmVsZXNzLXdsMTJ4eCcsZCl9Ig0KK1BSRUZFUlJFRF9QUk9WSURFUl9ob3N0
YXAtZGFlbW9uID0gIiR7QGJhc2VfY29udGFpbnMoJ1dJTElOS19WRVJTSU9OJywnV0lMSU5LLTgn
LCdob3N0YXAtZGFlbW9uLXdsMTh4eCcsJ2hvc3RhcC1kYWVtb24nLGQpfSINCitQUkVGRVJSRURf
UFJPVklERVJfd3BhLXN1cHBsaWNhbnQgPSAiJHtAYmFzZV9jb250YWlucygnV0lMSU5LX1ZFUlNJ
T04nLCdXSUxJTkstOCcsJ3dwYS1zdXBwbGljYW50LXdsMTh4eCcsJ3dwYS1zdXBwbGljYW50Jyxk
KX0iDQorUFJFRkVSUkVEX1BST1ZJREVSX3RpLXdpZmktdXRpbHMgPSAiJHtAYmFzZV9jb250YWlu
cygnV0lMSU5LX1ZFUlNJT04nLCdXSUxJTkstOCcsJ3RpLXdpZmktdXRpbHMtd2wxOHh4JywndGkt
d2lmaS11dGlscycsZCl9Ig0KKw0KICMgVXNlIHY0LjA4LjAwLjAyIG9mIHRoZSBHcmFwaGljcyBT
REsNCiBQUkVGRVJSRURfVkVSU0lPTl9vbWFwMy1zZ3gtbW9kdWxlcyA9ICI0LjA4LjAwLjAyIg0K
IFBSRUZFUlJFRF9WRVJTSU9OX2xpYmdsZXMtb21hcDMgPSAiNC4wOC4wMC4wMiINCi0tIA0KMS43
LjkuNQ0KDQo=

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FEB6DNCE04entticom_--
