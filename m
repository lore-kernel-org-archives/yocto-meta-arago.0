Return-Path: <eyalr@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D136752961
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 08:47:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2I8lVrT014893
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 03:47:31 -0500
Received: from DNCE70.ent.ti.com (dnce70.ent.ti.com [137.167.131.19])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2I8lToI006050
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2013 03:47:30 -0500
Received: from DNCE04.ent.ti.com ([fe80::1df0:dc7c:d06:77a3]) by
	DNCE70.ent.ti.com ([fe80::70c9:b447:24a2:dddc%30]) with mapi id
	14.01.0323.003; Mon, 18 Mar 2013 09:47:29 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: wl18xx-firmware: install Wilink8 wlan firmware files
Thread-Index: Ac4jtSu5fm6Qdz6hTHaIXv9ytTh9hQ==
Date: Mon, 18 Mar 2013 08:47:29 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17C4FD64@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: wl18xx-firmware: install Wilink8 wlan firmware files
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
X-List-Received-Date: Mon, 18 Mar 2013 08:47:32 -0000
X-Groupsio-MsgNum: 995
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8665E2433BC68541A24DFFCA87B70F5B17C4FD64DNCE04entticom_"

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FD64DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The attached patch add a recipe for installing the Wilink8 wlan firmware fi=
les into
the target file system.

Best Regards,
Eyal Reizer

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FD64DNCE04entticom_
Content-Type: application/octet-stream;
	name="0002-wl18xx-firmware-install-Wilink8-wlan-firmware-files.patch"
Content-Description: 0002-wl18xx-firmware-install-Wilink8-wlan-firmware-files.patch
Content-Disposition: attachment;
	filename="0002-wl18xx-firmware-install-Wilink8-wlan-firmware-files.patch";
	size=2203; creation-date="Sun, 17 Mar 2013 15:57:13 GMT";
	modification-date="Sun, 17 Mar 2013 15:57:13 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkMDdjMzM3NGYwMzg3ZTgwNDQ1NDY2YmFmZGVkZGE2ZWExYzI1YTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFeWFsIFJlaXplciA8ZXlhbHJAdGkuY29tPgpEYXRlOiBTdW4s
IDEwIE1hciAyMDEzIDA4OjUwOjM0IC0wNzAwClN1YmplY3Q6IFtQQVRDSCAyLzldIHdsMTh4eC1m
aXJtd2FyZTogaW5zdGFsbCBXaWxpbms4IHdsYW4gZmlybXdhcmUgZmlsZXMKCkFkZCBhIHJlY2lw
ZSBmb3IgaW5zdGFsbGluZyB0aGUgV2lsaW5rOCB3bGFuIGZpcm13YXJlIGZpbGVzIGludG8KdGhl
IHRhcmdldCBmaWxlIHN5c3RlbS4KClNpZ25lZC1vZmYtYnk6IEV5YWwgUmVpemVyIDxleWFsckB0
aS5jb20+Ci0tLQogLi4uL3dsMTh4eC1maXJtd2FyZS93bDE4eHgtZmlybXdhcmUvTWFrZWZpbGUg
ICAgICAgfCAgICA3ICsrKysrCiAuLi4vd2wxOHh4LWZpcm13YXJlL3dsMTh4eC1maXJtd2FyZV9n
aXQuYmIgICAgICAgICB8ICAgMjggKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJhZ28tZXh0cmFz
L3JlY2lwZXMtYnNwL3dsMTh4eC1maXJtd2FyZS93bDE4eHgtZmlybXdhcmUvTWFrZWZpbGUKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC93bDE4eHgtZmly
bXdhcmUvd2wxOHh4LWZpcm13YXJlX2dpdC5iYgoKZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0
cmFzL3JlY2lwZXMtYnNwL3dsMTh4eC1maXJtd2FyZS93bDE4eHgtZmlybXdhcmUvTWFrZWZpbGUg
Yi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC93bDE4eHgtZmlybXdhcmUvd2wxOHh4LWZp
cm13YXJlL01ha2VmaWxlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjBiYjdh
YjgKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC93bDE4
eHgtZmlybXdhcmUvd2wxOHh4LWZpcm13YXJlL01ha2VmaWxlCkBAIC0wLDAgKzEsNyBAQAorIyBJ
bnN0YWxscyB0aGUgdGhlIHRpLWNvbm5lY3Rpdml5IHdsYW4gZmlybXdhcmUgZmlsZXMgaW50byB0
aGUgcm9vdCBmaWxlIHN5c3RlbQorCitpbnN0YWxsOgorCWluc3RhbGwgLWQgICQoREVTVF9ESVIp
L2xpYi9maXJtd2FyZS90aS1jb25uZWN0aXZpdHkKKwljcCAtUnBQICogJChERVNUX0RJUikvbGli
L2Zpcm13YXJlL3RpLWNvbm5lY3Rpdml0eS8KKwlybSAtZiAkKERFU1RfRElSKS9saWIvZmlybXdh
cmUvdGktY29ubmVjdGl2aXR5L01ha2VmaWxlCisKZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0
cmFzL3JlY2lwZXMtYnNwL3dsMTh4eC1maXJtd2FyZS93bDE4eHgtZmlybXdhcmVfZ2l0LmJiIGIv
bWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1ic3Avd2wxOHh4LWZpcm13YXJlL3dsMTh4eC1maXJt
d2FyZV9naXQuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNDNjNDBiYgot
LS0gL2Rldi9udWxsCisrKyBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtYnNwL3dsMTh4eC1m
aXJtd2FyZS93bDE4eHgtZmlybXdhcmVfZ2l0LmJiCkBAIC0wLDAgKzEsMjggQEAKK0RFU0NSSVBU
SU9OID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBUSSB3bDE4eHgiCitMSUNFTlNFID0g
IlRJLVRTUEEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT1iMjgxMjJm
ZDY2NzhlODlmZDNhOGQ0YmM4MDkyMjk2OSIKKworUEFDS0FHRV9BUkNIID0gImFsbCIKKworUFIg
PSAicjErZ2l0ciR7U1JDUkVWfSIKKworUFJPVklERVMgKz0gIndsMTJ4eC1maXJtd2FyZSIKK1JQ
Uk9WSURFUyArPSAid2wxMnh4LWZpcm13YXJlIiAKKworU1JDUkVWID0gIm9sX3I4LmE2LjAxIgor
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL1RJLU9wZW5MaW5rL3dsMTh4eF9mdy5naXQ7cHJv
dG9jb2w9Z2l0IFwKKyAgICAgICAgICAgZmlsZTovL01ha2VmaWxlIFwKKyAgICAgICAgICAiCisK
K1MgPSAiJHtXT1JLRElSfS9naXQiCisKK2RvX2NvbXBpbGUoKSB7CisgICAgOgorfQorCitkb19p
bnN0YWxsKCkgeworICAgIGNwICR7V09SS0RJUn0vTWFrZWZpbGUgJHtTfQorICAgIG9lX3J1bm1h
a2UgJ0RFU1RfRElSPSR7RH0nIGluc3RhbGwKK30KKworRklMRVNfJHtQTn0gPSAiL2xpYi9maXJt
d2FyZS90aS1jb25uZWN0aXZpdHkvKiIKLS0gCjEuNy45LjUKCg==

--_002_8665E2433BC68541A24DFFCA87B70F5B17C4FD64DNCE04entticom_--
