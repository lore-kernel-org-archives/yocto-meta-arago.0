Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4467852A01
	for <meta-arago@arago-project.org>;
	Wed,  1 Aug 2012 22:35:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71MZptK027410
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2012 17:35:51 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71MZpo9002315
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2012 17:35:51 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 1 Aug 2012 17:35:51 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] opkg: Port opkg patch from arago to meta-arago
Thread-Index: Ac1wNfwTFiT9KcRLQFKxEqFoJ/V6IA==
Date: Wed, 1 Aug 2012 22:35:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27EB14@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: [PATCH] opkg: Port opkg patch from arago to meta-arago
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
X-List-Received-Date: Wed, 01 Aug 2012 22:35:52 -0000
X-Groupsio-MsgNum: 66
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_"

--_004_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

The sole purpose of this patch is to port over a patch that you created in =
arago. I didn't see any comments or change of status to your patch submissi=
on (http://code.google.com/p/opkg/issues/detail?id=3D63). I did see a brief=
 discussion of your patch here (https://groups.google.com/forum/?fromgroups=
#!topic/opkg-devel/6ZIXY8ESwek)  Do you want to drop this patch, keep carry=
ing this patch in meta-arago or maybe push it to oe-core?

Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_
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
<style>
<!--
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
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Denys,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The sole purpose of this patch is to port over a pat=
ch that you created in arago. I didn&#8217;t see any comments or change of =
status to your patch submission (<a href=3D"http://code.google.com/p/opkg/i=
ssues/detail?id=3D63">http://code.google.com/p/opkg/issues/detail?id=3D63</=
a>).
 I did see a brief discussion of your patch here (<a href=3D"https://groups=
.google.com/forum/?fromgroups#!topic/opkg-devel/6ZIXY8ESwek">https://groups=
.google.com/forum/?fromgroups#!topic/opkg-devel/6ZIXY8ESwek</a>) &nbsp;Do y=
ou want to drop this patch, keep carrying
 this patch in meta-arago or maybe push it to oe-core?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_--

--_004_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_
Content-Type: application/octet-stream;
	name="0001-opkg-Port-opkg-patch-from-arago-to-meta-arago.patch"
Content-Description: 0001-opkg-Port-opkg-patch-from-arago-to-meta-arago.patch
Content-Disposition: attachment;
	filename="0001-opkg-Port-opkg-patch-from-arago-to-meta-arago.patch";
	size=2597; creation-date="Wed, 01 Aug 2012 22:20:05 GMT";
	modification-date="Wed, 01 Aug 2012 22:08:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzZDY0YjA5NTQyNTkxZjFhOWE3YmJhNzU3NjVlOGQ4NzhhODY1MGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IFdlZCwgMSBBdWcgMjAxMiAxMToxNzoyNyAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
a2c6IFBvcnQgb3BrZyBwYXRjaCBmcm9tIGFyYWdvIHRvIG1ldGEtYXJhZ28KClNpZ25lZC1vZmYt
Ynk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4KLS0tCiAuLi5lLXNlbmQt
Q29sbGVjdGVkLWVycm9ycy1tZXNzYWdlcy10by1zdGRlci5wYXRjaCB8ICAgMzIgKysrKysrKysr
KysrKysrKysrKysKIC4uLi9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ19zdm4uYmJhcHBlbmQg
ICAgICAgIHwgICAgNiArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDAg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1leHRyYXMvcmVjaXBl
cy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS1vcGtnX21lc3NhZ2Utc2VuZC1Db2xsZWN0ZWQtZXJy
b3JzLW1lc3NhZ2VzLXRvLXN0ZGVyLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFn
by1leHRyYXMvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2dfc3ZuLmJiYXBwZW5kCgpkaWZmIC0t
Z2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS1v
cGtnX21lc3NhZ2Utc2VuZC1Db2xsZWN0ZWQtZXJyb3JzLW1lc3NhZ2VzLXRvLXN0ZGVyLnBhdGNo
IGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2cvMDAwMS1vcGtn
X21lc3NhZ2Utc2VuZC1Db2xsZWN0ZWQtZXJyb3JzLW1lc3NhZ2VzLXRvLXN0ZGVyLnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmRkODI5MWMKLS0tIC9kZXYvbnVsbAor
KysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZy8wMDAxLW9w
a2dfbWVzc2FnZS1zZW5kLUNvbGxlY3RlZC1lcnJvcnMtbWVzc2FnZXMtdG8tc3RkZXIucGF0Y2gK
QEAgLTAsMCArMSwzMiBAQAorRnJvbSA0OWU0OWNhNzZkMmMxODE3NzJlNzQ0NDdiNGYyMzFmZjI2
MDEwMmQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRGVueXMgRG15dHJpeWVua28g
PGRlbnlzQHRpLmNvbT4KK0RhdGU6IE1vbiwgOCBBdWcgMjAxMSAxNjo1OToxNiAtMDQwMAorU3Vi
amVjdDogW1BBVENIXSBvcGtnX21lc3NhZ2U6IHNlbmQgIkNvbGxlY3RlZCBlcnJvcnM6IiBtZXNz
YWdlcyB0byBzdGRlcnIgbm90IHN0ZG91dAorCitVcHN0cmVhbS1zdGF0dXM6IFN1Ym1pdHRlZCBb
aHR0cDovL2NvZGUuZ29vZ2xlLmNvbS9wL29wa2cvaXNzdWVzL2RldGFpbD9pZD02M10KKworU2ln
bmVkLW9mZi1ieTogRGVueXMgRG15dHJpeWVua28gPGRlbnlzQHRpLmNvbT4KKy0tLQorIGxpYm9w
a2cvb3BrZ19tZXNzYWdlLmMgfCAgICA0ICsrLS0KKyAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2xpYm9wa2cvb3BrZ19tZXNz
YWdlLmMgYi9saWJvcGtnL29wa2dfbWVzc2FnZS5jCitpbmRleCA3MTE0ZTNhLi4yODYyZWE2IDEw
MDY0NAorLS0tIGEvbGlib3BrZy9vcGtnX21lc3NhZ2UuYworKysrIGIvbGlib3BrZy9vcGtnX21l
c3NhZ2UuYworQEAgLTY0LDEwICs2NCwxMCBAQCBwcmludF9lcnJvcl9saXN0KHZvaWQpCisgCXN0
cnVjdCBlcnJsaXN0ICplcnIgPSBlcnJvcl9saXN0X2hlYWQ7CisgCisgCWlmIChlcnIpIHsKKy0J
CXByaW50ZigiQ29sbGVjdGVkIGVycm9yczpcbiIpOworKwkJZnByaW50ZihzdGRlcnIsICJDb2xs
ZWN0ZWQgZXJyb3JzOlxuIik7CisgCQkvKiBIZXJlIHdlIHByaW50IHRoZSBlcnJvcnMgY29sbGVj
dGVkIGFuZCBmcmVlIHRoZSBsaXN0ICovCisgCQl3aGlsZSAoZXJyICE9IE5VTEwpIHsKKy0JCQlw
cmludGYoIiAqICVzIiwgZXJyLT5lcnJtc2cpOworKwkJCWZwcmludGYoc3RkZXJyLCAiICogJXMi
LCBlcnItPmVycm1zZyk7CisgCQkJZXJyID0gZXJyLT5uZXh0OworIAkJfQorIAl9CistLSAKKzEu
Ny4wLjQKKwpkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1kZXZ0b29scy9v
cGtnL29wa2dfc3ZuLmJiYXBwZW5kIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1kZXZ0b29s
cy9vcGtnL29wa2dfc3ZuLmJiYXBwZW5kCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAuLmIyMTViNWUKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVz
LWRldnRvb2xzL29wa2cvb3BrZ19zdm4uYmJhcHBlbmQKQEAgLTAsMCArMSw2IEBACisjIGxvb2sg
Zm9yIGZpbGVzIGluIHRoaXMgbGF5ZXIgZmlyc3QKK0ZJTEVTRVhUUkFQQVRIU19wcmVwZW5kIDo9
ICIke1RISVNESVJ9LyR7UE59OiIKKworUFJfYXBwZW5kID0gIi1hcmFnbzAiCisKK1NSQ19VUkkg
Kz0gImZpbGU6Ly8wMDAxLW9wa2dfbWVzc2FnZS1zZW5kLUNvbGxlY3RlZC1lcnJvcnMtbWVzc2Fn
ZXMtdG8tc3RkZXIucGF0Y2giCi0tIAoxLjcuMC40Cgo=

--_004_8F29D6B095ED194EA1980491A5E029710C27EB14DFLE30entticom_--
