Return-Path: <zhoujt@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EF5F652A1C
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 21:15:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r16LFj30010132
	for <meta-arago@arago-project.org>; Wed, 6 Feb 2013 15:15:45 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r16LFjBs001965
	for <meta-arago@arago-project.org>; Wed, 6 Feb 2013 15:15:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 6 Feb 2013 15:15:44 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: lzo recipe
Thread-Index: Ac4ErxbwEGmwxkLfT4GyTjlraUvw8A==
Date: Wed, 6 Feb 2013 21:15:44 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E3917A22@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Feb 2013 19:51:16 +0000
Subject: lzo recipe
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
X-List-Received-Date: Wed, 06 Feb 2013 21:15:46 -0000
X-Groupsio-MsgNum: 847
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_"

--_004_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey all, attached is the recipe for lzo. Please take a look. Thanks~

Jingting Zhou


--_000_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">Hey all, attached is the recipe for lzo. Please take=
 a look. Thanks~<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jingting Zhou<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_--

--_004_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_
Content-Type: application/octet-stream; name="0001-lzo-recipe.patch"
Content-Description: 0001-lzo-recipe.patch
Content-Disposition: attachment; filename="0001-lzo-recipe.patch"; size=2213;
	creation-date="Wed, 06 Feb 2013 21:15:26 GMT";
	modification-date="Wed, 06 Feb 2013 21:01:57 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2NzcxYmU3NDEyNDhjOWQ3MWZiODYzNjAwMWNkZWM2NTE0YzRjMDY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKaW5ndGluZyBaaG91IDxhMDIyMTAwNEBhcmVzLXVidW50dT4K
RGF0ZTogV2VkLCA2IEZlYiAyMDEzIDE2OjAxOjM2IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gbHpv
IHJlY2lwZQoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkvbHpvL2x6bzJfMi4wMy5iYiAg
ICAgICAgICB8ICAgMjMgKysrKysrKysrKysrKysrKysrKysKIC4uLi9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9sem8vbHpvXzEuMDguYmIgICAgICAgICAgIHwgICAxOSArKysrKysrKysrKysrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSBtZXRh
LWFyYWdvLWRpc3Ryby9yZWNpcGVzLWNvbm5lY3Rpdml0eS9sem8vbHpvMl8yLjAzLmJiCiBjcmVh
dGUgbW9kZSAxMDA3NTUgbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb25uZWN0aXZpdHkvbHpv
L2x6b18xLjA4LmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbHpvL2x6bzJfMi4wMy5iYiBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2x6by9sem8yXzIuMDMuYmIKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAw
MDAwMC4uZWU1NDBiMQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2x6by9sem8yXzIuMDMuYmIKQEAgLTAsMCArMSwyMyBAQAorREVTQ1JJ
UFRJT04gPSAiTG9zc2xlc3MgZGF0YSBjb21wcmVzc2lvbiBsaWJyYXJ5IgorSE9NRVBBR0UgPSAi
aHR0cDovL3d3dy5vYmVyaHVtZXIuY29tL29wZW5zb3VyY2UvbHpvLyIKK0xJQ0VOU0UgPSAiR1BM
djIrIgorU0VDVElPTiA9ICJsaWJzIgorUFJJT1JJVFkgPSAib3B0aW9uYWwiCisKK1NSQ19VUkkg
PSAiaHR0cDovL3d3dy5vYmVyaHVtZXIuY29tL29wZW5zb3VyY2UvbHpvL2Rvd25sb2FkL2x6by0k
e1BWfS50YXIuZ3oiCitTUkNfVVJJW21kNXN1bV0gPSAiMGMzZDA3OGMyZThlYTVhODg5NzEwODlh
MmYwMmE3MjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGIxYjBkYThmNzU3YjlhYzMxOGUxYzE1
YTBlYWM4YmRiNTZjYTkwMmEyZGQyNWJlZGEwNmMwZjI2NWYyMjU5MSIKKworUyA9ICIke1dPUktE
SVJ9L2x6by0ke1BWfSIKKworaW5oZXJpdCBhdXRvdG9vbHMKKworRVhUUkFfT0VDT05GID0gIi0t
ZW5hYmxlLXNoYXJlZCIKKworZG9fY29uZmlndXJlKCkgeworCWdudS1jb25maWdpemUgLS1mb3Jj
ZQorCW9lX3J1bmNvbmYKK30KKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCisKZGlmZiAtLWdp
dCBhL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29ubmVjdGl2aXR5L2x6by9sem9fMS4wOC5i
YiBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29ubmVjdGl2aXR5L2x6by9sem9fMS4wOC5i
YgpuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwLi5lMjE4YTZjCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb25uZWN0aXZpdHkvbHpvL2x6b18x
LjA4LmJiCkBAIC0wLDAgKzEsMTkgQEAKK0RFU0NSSVBUSU9OID0gIkxvc3NsZXNzIGRhdGEgY29t
cHJlc3Npb24gbGlicmFyeSIKK0hPTUVQQUdFID0gImh0dHA6Ly93d3cub2Jlcmh1bWVyLmNvbS9v
cGVuc291cmNlL2x6by8iCitMSUNFTlNFID0gIkdQTHYyIgorU0VDVElPTiA9ICJsaWJzIgorUFJJ
T1JJVFkgPSAib3B0aW9uYWwiCitQUiA9ICJyMTUiCisKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL01ha2VmaWxlLmluO2VuZGxpbmU9MTQ7bWQ1PTc2NGQyMjc1ZjQwZjFhNjcyMDU1NThkZDJh
ZjkxNzA4IgorCitTUkNfVVJJID0gImh0dHA6Ly93d3cub2Jlcmh1bWVyLmNvbS9vcGVuc291cmNl
L2x6by9kb3dubG9hZC9sem8tJHtQVn0udGFyLmd6IgorCitpbmhlcml0IGF1dG90b29scworCitF
WFRSQV9PRUNPTkYgPSAiLS1lbmFibGUtc2hhcmVkIgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2
ZSIKKworU1JDX1VSSVttZDVzdW1dID0gImFiOTRkM2RhMzY0YzdjYmQ1Yjc4ZDc2ZjE4NzViMGY2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJjZWFkNDZiMGJkODg3YzM5ODdlOTc3YTBhN2Q0YzU0
N2IwZjcwZjkyNmQ0NWUyNTM3ODQxMzc1NjlmNTdiOWEiCi0tIAoxLjcuOS41Cgo=

--_004_3C08AEEB3C731745938BC83D029FE5E3917A22DFLE09entticom_--
