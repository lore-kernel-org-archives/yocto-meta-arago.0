Return-Path: <zhoujt@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9F18952A1C
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 21:15:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r16LFH0v008724
	for <meta-arago@arago-project.org>; Wed, 6 Feb 2013 15:15:17 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r16LFHa4001599
	for <meta-arago@arago-project.org>; Wed, 6 Feb 2013 15:15:17 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 6 Feb 2013 15:15:17 -0600
From: "Zhou, Jingting" <zhoujt@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: lldpd recipe 
Thread-Index: Ac4ErwgIELQDXc23QTSZpUsNSo2mdQ==
Date: Wed, 6 Feb 2013 21:15:17 +0000
Message-ID: <3C08AEEB3C731745938BC83D029FE5E3917A18@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Feb 2013 19:51:16 +0000
Subject: lldpd recipe
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
X-List-Received-Date: Wed, 06 Feb 2013 21:15:18 -0000
X-Groupsio-MsgNum: 846
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_"

--_004_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_
Content-Type: multipart/alternative;
	boundary="_000_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_"

--_000_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey all, attached is the recipe for lldpd. Please take a look. Thanks~

Jingting Zhou


--_000_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_
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
<p class=3D"MsoNormal">Hey all, attached is the recipe for lldpd. Please ta=
ke a look. Thanks~<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jingting Zhou<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_--

--_004_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_
Content-Type: application/octet-stream; name="0001-lldpd-recipe.patch"
Content-Description: 0001-lldpd-recipe.patch
Content-Disposition: attachment; filename="0001-lldpd-recipe.patch";
	size=1974; creation-date="Wed, 06 Feb 2013 21:14:43 GMT";
	modification-date="Wed, 06 Feb 2013 21:01:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBiNDMxZmM3YmEyMWJjZTk3YzZjYTRiOTRmZTQ2Nzg2NGYzNzNmY2YzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKaW5ndGluZyBaaG91IDxhMDIyMTAwNEBhcmVzLXVidW50dT4K
RGF0ZTogV2VkLCA2IEZlYiAyMDEzIDE2OjAwOjQxIC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gbGxk
cGQgcmVjaXBlCgotLS0KIC4uLi9yZWNpcGVzLWNvbm5lY3Rpdml0eS9sbGRwZC9sbGRwZF8wLjUu
Ny5iYiAgICAgIHwgICAzOCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSBtZXRhLWFyYWdvLWRpc3Ryby9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9sbGRwZC9sbGRwZF8wLjUuNy5iYgoKZGlmZiAtLWdpdCBhL21ldGEt
YXJhZ28tZGlzdHJvL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xsZHBkL2xsZHBkXzAuNS43LmJiIGIv
bWV0YS1hcmFnby1kaXN0cm8vcmVjaXBlcy1jb25uZWN0aXZpdHkvbGxkcGQvbGxkcGRfMC41Ljcu
YmIKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMC4uYjdiZWYyMgotLS0gL2Rldi9u
dWxsCisrKyBiL21ldGEtYXJhZ28tZGlzdHJvL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xsZHBkL2xs
ZHBkXzAuNS43LmJiCkBAIC0wLDAgKzEsMzggQEAKK0RFU0NSSVBUSU9OID0gIkxMRFAgKExpbmsg
TGF5ZXIgRGlzY292ZXJ5IFByb3RvY29sKSAoYS5rLmEgODAyLjFhYikgaXMgYW4gaW5kdXN0cnkg
c3RhbmRhcmQgcHJvdG9jb2wgZGVzaWduZWQgdG8gc3VwcGxhbnQgcHJvcHJpZXRhcnkgTGluay1M
YXllciBwcm90b2NvbHMgc3VjaCBhcyBFeHRyZW1lJ3MgRURQIChFeHRyZW1lIERpc2NvdmVyeSBQ
cm90b2NvbCkgYW5kIENEUCAoQ2lzY28gRGlzY292ZXJ5IFByb3RvY29sKS4gTExEUEQgaXMgYSBs
bGRwIGRhZW1vbiBmb3IgR05VL0xpbnV4IGFuZCBpbXBsZW1lbnRzIGJvdGggcmVjZXB0aW9uIGFu
ZCBzZW5kaW5nIgorSE9NRVBBR0UgPSAiIgorU0VDVElPTiA9ICIiCitMSUNFTlNFID0gIiIKK0xJ
Q19GSUxFU19DSEtTVU0gPSAiIgorI0RFUEVORFMgPSAibGliZXZlbnQiCitERVBFTkRTID0gIiIK
KworUFIgPSAicjEiCitQViA9ICIwLjUuNyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL01h
a2VmaWxlLmluO2VuZGxpbmU9MTQ7bWQ1PWQ0YWU0NmNkZDgzYzlkZWI1ODg5NzhkMzI3NWZmOGVl
IgorU1JDX1VSSSA9ICJodHRwOi8vbWVkaWEubHVmZnkuY3gvZmlsZXMvbGxkcGQvbGxkcGQtJHtQ
Vn0udGFyLmd6IgorU1JDX1VSSVttZDVzdW1dID0gIjNkYjNhODBmYTZhMzg0Y2Q1OWU5ZDZhNDJj
ZTdiNjMwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4YzNkYTE5ZTkxZjg0MTZhYWZiMDRlZWQ1
N2M1NDAzODRhN2RlYTFmZjk4ZTI2YjliYjI5MDdjNzJlOWEwZTgiCisKK2luaGVyaXQgYXV0b3Rv
b2xzCisKK1MgPSAiJHtXT1JLRElSfS9sbGRwZC0ke1BWfSIKKworIyBUaGlzIGlzIG5lZWRlZCBv
bmx5IGZvciBjb2RlIHNvdXJjZXJ5IHRvb2xjaGFpbgorZG9fY29uZmlndXJlKCkgeworCW9lX3J1
bmNvbmYgYWNfY3ZfY2ZsYWdzX2djY19vcHRpb25fX2ZzdGFja19wcm90ZWN0b3I9bm8KK30KKwor
ZG9faW5zdGFsbCAoKSB7CisgICBERVNURElSPSR7RH0gb2VfcnVubWFrZSBpbnN0YWxsCit9CisK
K3BrZ19wb3N0aW5zdCgpIHsKKyAgICAgICAgaWYgWyAieCREIiAhPSAieCIgXTsgdGhlbgorICAg
ICAgICAgICAgICAgIGV4aXQgMQorICAgICAgICBmaQorICAgICAgICBhZGRncm91cCBfbGxkcGQK
KyAgICAgICAgYWRkdXNlciAtLXN5c3RlbSAtLWhvbWUgL3Zhci9saWIvX2xsZHBkIC0tbm8tY3Jl
YXRlLWhvbWUgLS1pbmdyb3VwIF9sbGRwZCAtLWRpc2FibGVkLXBhc3N3b3JkIC1zIC9iaW4vZmFs
c2UgX2xsZHBkCisgICAgICAgIG1rZGlyIC1wICR7bG9jYWxzdGF0ZWRpcn0vc2hhcmUvZW1wdHkK
K30KKworU0VDVElPTiA9ICJuZXQiIAotLSAKMS43LjkuNQoK

--_004_3C08AEEB3C731745938BC83D029FE5E3917A18DFLE09entticom_--
