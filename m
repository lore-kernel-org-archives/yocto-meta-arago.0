Return-Path: <eyalr@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 536D352A8E
	for <meta-arago@arago-project.org>;
	Sun, 10 Nov 2013 13:24:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAADOsGK007582
	for <meta-arago@arago-project.org>; Sun, 10 Nov 2013 07:24:54 -0600
Received: from DNCE71.ent.ti.com (dnce71.ent.ti.com [137.167.131.20])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAADOrKV011197
	for <meta-arago@arago-project.org>; Sun, 10 Nov 2013 07:24:53 -0600
Received: from DNCE04.ent.ti.com ([fe80::50a2:cda3:1471:a76]) by
	DNCE71.ent.ti.com ([fe80::7d60:3983:a688:ea7d%20]) with mapi id
	14.02.0342.003; Sun, 10 Nov 2013 14:24:53 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] wl18xx-firmware: fix p2p issues
Thread-Index: Ac7eGDwe8FEzTplfR1SIlGWZ6RS6wA==
Date: Sun, 10 Nov 2013 13:24:53 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B17DA2B97@DNCE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH] wl18xx-firmware: fix p2p issues
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
X-List-Received-Date: Sun, 10 Nov 2013 13:24:55 -0000
X-Groupsio-MsgNum: 2451
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_"

--_004_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_
Content-Type: multipart/alternative;
	boundary="_000_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_"

--_000_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

wifi-direct did not work with the previous firmware released for R8.2 (ol_r=
8.07.02)
update the recipe to use a fixed firmware.

This fix is important for the next coming glsdk release for J6/omap5

Best Regards,
Eyal

--_000_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">wifi-direct did not work with the previous firmware =
released for R8.2 (ol_r8.07.02)<o:p></o:p></p>
<p class=3D"MsoNormal">update the recipe to use a fixed firmware.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This fix is important for the next coming glsdk rele=
ase for J6/omap5<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Eyal<o:p></o:p></p>
</div>
</body>
</html>

--_000_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_--

--_004_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_
Content-Type: application/octet-stream;
	name="0001-wl18xx-firmware-fix-p2p-issues.patch"
Content-Description: 0001-wl18xx-firmware-fix-p2p-issues.patch
Content-Disposition: attachment;
	filename="0001-wl18xx-firmware-fix-p2p-issues.patch"; size=1432;
	creation-date="Sun, 10 Nov 2013 11:25:29 GMT";
	modification-date="Sun, 10 Nov 2013 11:25:29 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkYjYwZGI2M2I0YzMzYjgxYjgyOTU4NTVhMGYyZTI4NTdjNTg1MTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBleWFscmVpemVyIDxleWFsckB0aS5jb20+CkRhdGU6IFN1biwg
MTAgTm92IDIwMTMgMTM6MTI6MjUgKzAyMDAKU3ViamVjdDogW1BBVENIXSB3bDE4eHgtZmlybXdh
cmU6IGZpeCBwMnAgaXNzdWVzCgp3aWZpLWRpcmVjdCBkaWQgbm90IHdvcmsgd2l0aCB0aGUgcHJl
dmlvdXMgZmlybXdhcmUgcmVsZWFzZWQKdXBkYXRlIHRoZSByZWNpcGUgdG8gdXNlIHRoZSBmaXhl
ZCBmaXJtd2FyZS4KClNpZ25lZC1vZmYtYnk6IGV5YWxyZWl6ZXIgPGV5YWxyQHRpLmNvbT4KLS0t
CiAuLi4vd2wxOHh4LWZpcm13YXJlL3dsMTh4eC1maXJtd2FyZV9yOC5hNy4wMi5iYiAgICB8ICAg
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJzcC93bDE4eHgtZmlybXdh
cmUvd2wxOHh4LWZpcm13YXJlX3I4LmE3LjAyLmJiIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBl
cy1ic3Avd2wxOHh4LWZpcm13YXJlL3dsMTh4eC1maXJtd2FyZV9yOC5hNy4wMi5iYgppbmRleCAw
ZjhkZDlkLi4yYzVjZDQ0IDEwMDY0NAotLS0gYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWJz
cC93bDE4eHgtZmlybXdhcmUvd2wxOHh4LWZpcm13YXJlX3I4LmE3LjAyLmJiCisrKyBiL21ldGEt
YXJhZ28tZXh0cmFzL3JlY2lwZXMtYnNwL3dsMTh4eC1maXJtd2FyZS93bDE4eHgtZmlybXdhcmVf
cjguYTcuMDIuYmIKQEAgLTQsNyArNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOQ0U7bWQ1PWIyODEyMmZkNjY3OGU4OWZkM2E4ZDRiYzgwOTIyOTY5IgogCiBQQUNLQUdFX0FS
Q0ggPSAiYWxsIgogCi1QUiA9ICJyMitnaXRyJHtTUkNQVn0iCitQUiA9ICJyMytnaXRyJHtTUkNQ
Vn0iCiAKIFBST1ZJREVTICs9ICJ3bDEyeHgtZmlybXdhcmUiCiBSUFJPVklERVNfJHtQTn0gKz0g
IndsMTJ4eC1maXJtd2FyZSIKQEAgLTE0LDcgKzE0LDcgQEAgUkNPTkZMSUNUU18ke1BOfSArPSAi
d2wxMnh4LWZpcm13YXJlIgogQ09NUEFUSUJMRV9NQUNISU5FID0gIihvbWFwLWExNSkiCiAKICMg
VGFnOiBvbF9yOC5hNy4wMl9wZF9maXggKHdvcmthcm91bmQgcG93ZXJkb3duIHJlY292ZXJ5IGZp
eCkKLVNSQ1JFViA9ICIzZmIzYmQzMjFmODlmOTkxMGYyNWQzMDA2NjY4YjgzMWRmOTQ0YTdmIgor
U1JDUkVWID0gIjVkZjJjMDhhNDA1ZTZhNDYzMDY3ZTQwNmM3Mzk0ZWM1NDM1YzUxNzkiCiBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vVEktT3Blbkxpbmsvd2wxOHh4X2Z3LmdpdDtwcm90b2Nv
bD1naXQgXAogICAgICAgICAgICBmaWxlOi8vTWFrZWZpbGUgXAogICAgICAgICAgICIKLS0gCjEu
Ny45LjUKCg==

--_004_8665E2433BC68541A24DFFCA87B70F5B17DA2B97DNCE04entticom_--
