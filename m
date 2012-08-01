Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D7B1852986
	for <meta-arago@arago-project.org>;
	Wed,  1 Aug 2012 22:25:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q71MPel6026374
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2012 17:25:40 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q71MPeQa025505
	for <meta-arago@arago-project.org>; Wed, 1 Aug 2012 17:25:40 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 1 Aug 2012 17:25:39 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCHES] Porting sysvinit changes from arago to meta-arago
Thread-Index: Ac1wNJO500+KIoe7Qy+fdCut5SXD5Q==
Date: Wed, 1 Aug 2012 22:25:39 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C27EAD2@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: [PATCHES] Porting sysvinit changes from arago to meta-arago
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
X-List-Received-Date: Wed, 01 Aug 2012 22:25:41 -0000
X-Groupsio-MsgNum: 65
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_005_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_"

--_005_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_--

--_005_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_
Content-Type: application/octet-stream;
	name="0001-sysvinit-Port-from-arago-to-meta-arago.patch"
Content-Description: 0001-sysvinit-Port-from-arago-to-meta-arago.patch
Content-Disposition: attachment;
	filename="0001-sysvinit-Port-from-arago-to-meta-arago.patch"; size=3173;
	creation-date="Wed, 01 Aug 2012 22:20:05 GMT";
	modification-date="Wed, 01 Aug 2012 22:07:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyOWUyMDY4Y2MxNWFjNjUzMzE2ODRhNjdkMDY4MThmM2FhNWRjMTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTE6NDk6MDkgLTA1MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gc3lzdmluaXQgLSBQb3J0IGZyb20gYXJhZ28gdG8gbWV0YS1hcmFnbwoKKiBQb3J0IGNoYW5n
ZXMgZnJvbSBhcmFnbyB0byBtZXRhLWFyYWdvCiogQ29weSByY1MtZGVmYXVsdCBmcm9tIG9lLWNv
cmUgL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0CgpTaWduZWQtb2ZmLWJ5OiBG
cmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+Ci0tLQogLi4uL3JlY2lwZXMtY29y
ZS9zeXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdCAgICAgfCAgIDI1ICsrKysrKysrKysrKysr
KysrKysrCiAuLi4vc3lzdmluaXQvc3lzdmluaXRfMi44OGRzZi5iYmFwcGVuZCAgICAgICAgICAg
ICB8ICAgMjQgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRp
b25zKCspLCAwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJhZ28tZXh0
cmFzL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IG1ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5p
dF8yLjg4ZHNmLmJiYXBwZW5kCgpkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBl
cy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0IGIvbWV0YS1hcmFnby1leHRyYXMv
cmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAuLmZjNmQ0MTUKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLWFy
YWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQvcmNTLWRlZmF1bHQKQEAg
LTAsMCArMSwyNSBAQAorIworIwlEZWZhdWx0cyBmb3IgdGhlIGJvb3Qgc2NyaXB0cyBpbiAvZXRj
L3JjUy5kCisjCisKKyMgVGltZSBmaWxlcyBpbiAvdG1wIGFyZSBrZXB0IGluIGRheXMuCitUTVBU
SU1FPTAKKyMgU2V0IHRvIHllcyBpZiB5b3Ugd2FudCBzdWxvZ2luIHRvIGJlIHNwYXduZWQgb24g
Ym9vdHVwCitTVUxPR0lOPW5vCisjIFNldCB0byBubyBpZiB5b3Ugd2FudCB0byBiZSBhYmxlIHRv
IGxvZ2luIG92ZXIgdGVsbmV0L3Jsb2dpbgorIyBiZWZvcmUgc3lzdGVtIHN0YXJ0dXAgaXMgY29t
cGxldGUgKGFzIHNvb24gYXMgaW5ldGQgaXMgc3RhcnRlZCkKK0RFTEFZTE9HSU49bm8KKyMgU2V0
IFVUQz15ZXMgaWYgeW91ciBzeXN0ZW0gY2xvY2sgaXMgc2V0IHRvIFVUQyAoR01UKSwgYW5kIFVU
Qz1ubyBpZiBub3QuCisjIFVUQz15ZXMKKyMgU2V0IFZFUkJPU0UgdG8gIm5vIiBpZiB5b3Ugd291
bGQgbGlrZSBhIG1vcmUgcXVpZXQgYm9vdHVwLgorVkVSQk9TRT1ubworIyBTZXQgRURJVE1PVEQg
dG8gIm5vIiBpZiB5b3UgZG9uJ3Qgd2FudCAvZXRjL21vdGQgdG8gYmUgZWRpdGVkIGF1dG9tYXRp
Y2FsbHkKK0VESVRNT1REPW5vCisjIFdoZXRoZXIgdG8gZnNjayByb290IG9uIGJvb3QKK0VOQUJM
RV9ST09URlNfRlNDSz1ubworIyBTZXQgRlNDS0ZJWCB0byAieWVzIiBpZiB5b3Ugd2FudCB0byBh
ZGQgIi15IiB0byB0aGUgZnNjayBhdCBzdGFydHVwLgorRlNDS0ZJWD15ZXMKKyMgU2V0IFRJQ0tB
REogdG8gdGhlIGNvcnJlY3QgdGljayB2YWx1ZSBmb3IgdGhpcyBzcGVjaWZpYyBtYWNoaW5lCisj
VElDS0FESj0xMDAwMAorIyBFbmFibGUgY2FjaGluZyBpbiBwb3B1bGF0ZS12b2xhdGlsZS5zaAor
Vk9MQVRJTEVfRU5BQkxFX0NBQ0hFPXllcwpkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMv
cmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0XzIuODhkc2YuYmJhcHBlbmQgYi9tZXRhLWFy
YWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMi44OGRzZi5iYmFwcGVu
ZApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4wN2M4MjJiCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0
XzIuODhkc2YuYmJhcHBlbmQKQEAgLTAsMCArMSwyNCBAQAorIyBBcmFnby1zcGVjaWZpYyBhbWVu
ZG1lbnRzIHRvIHRoZSBzdGFuZGFyZCBPRSBTeXNWaW5pdCByZWNpcGUKKworIyBsb29rIGZvciBm
aWxlcyBpbiB0aGlzIGxheWVyIGZpcnN0CitGSUxFU0VYVFJBUEFUSFNfcHJlcGVuZCA6PSAiJHtU
SElTRElSfS8ke1BOfToiCisKK1BSX2FwcGVuZCA9ICItYXJhZ28wIgorCisjIFdoZW4gYnVpbGRp
bmcgZm9yICJ1bmlmaWVkIiBhcmFnbyBtYWNoaW5lLCBzdGFydCBnZXR0eXMgb24gZmlyc3QgMyBz
ZXJpYWwgY29uc29sZXMgKHR0eVM/L3R0eU8/KQorYWRkX2FyYWdvX2dldHR5cyAoKSB7CisJZWNo
byAiUzA6MjM0NTpyZXNwYXduOiR7YmFzZV9zYmluZGlyfS9nZXR0eSAxMTUyMDAgdHR5UzAiID4+
ICR7RH0ke3N5c2NvbmZkaXJ9L2luaXR0YWIKKwllY2hvICJTMToyMzQ1OnJlc3Bhd246JHtiYXNl
X3NiaW5kaXJ9L2dldHR5IDExNTIwMCB0dHlTMSIgPj4gJHtEfSR7c3lzY29uZmRpcn0vaW5pdHRh
YgorCWVjaG8gIlMyOjIzNDU6cmVzcGF3bjoke2Jhc2Vfc2JpbmRpcn0vZ2V0dHkgMTE1MjAwIHR0
eVMyIiA+PiAke0R9JHtzeXNjb25mZGlyfS9pbml0dGFiCisJZWNobyAiTzA6MjM0NTpyZXNwYXdu
OiR7YmFzZV9zYmluZGlyfS9nZXR0eSAxMTUyMDAgdHR5TzAiID4+ICR7RH0ke3N5c2NvbmZkaXJ9
L2luaXR0YWIKKwllY2hvICJPMToyMzQ1OnJlc3Bhd246JHtiYXNlX3NiaW5kaXJ9L2dldHR5IDEx
NTIwMCB0dHlPMSIgPj4gJHtEfSR7c3lzY29uZmRpcn0vaW5pdHRhYgorCWVjaG8gIk8yOjIzNDU6
cmVzcGF3bjoke2Jhc2Vfc2JpbmRpcn0vZ2V0dHkgMTE1MjAwIHR0eU8yIiA+PiAke0R9JHtzeXNj
b25mZGlyfS9pbml0dGFiCit9CisKK2RvX2luc3RhbGxfYXBwZW5kX2FyYWdvLWFybXY1ICgpIHsK
KwlhZGRfYXJhZ29fZ2V0dHlzCit9CisKK2RvX2luc3RhbGxfYXBwZW5kX2FyYWdvLWFybXY3ICgp
IHsKKwlhZGRfYXJhZ29fZ2V0dHlzCit9Ci0tIAoxLjcuMC40Cgo=

--_005_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_
Content-Type: application/octet-stream;
	name="0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch"
Content-Description: 0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch
Content-Disposition: attachment;
	filename="0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch";
	size=1184; creation-date="Wed, 01 Aug 2012 22:20:05 GMT";
	modification-date="Wed, 01 Aug 2012 22:07:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxZmI3MDQ0OTYxOWMwMWI2YTNlNWFmMjNmNzk3ZGYxY2IyZWM1N2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTE6NTM6MjcgLTA1MDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gc3lzdmluaXQgLSBQb3J0IGNoYW5nZXMgdG8gcmNTLWRlZmF1bHQgZnJvbSBhcmFnbwoKKiBN
b2RpZnkgdGhlIGJhc2UgcmNTLWRlZmF1bHQgZmlsZSB3aGljaCB3YXMgdGFrZW4gZnJvbSBvZS1j
b3JlCiAgYW5kIHR3ZWFrIHRoZSBmaWxlIGJhc2VkIG9uIHRoZSByY1MtZGVmYXVsdCBmaWxlIGxv
Y2F0ZWQgaW4gYXJhZ28KClNpZ25lZC1vZmYtYnk6IEZyYW5rbGluIFMgQ29vcGVyIEpyIDxmY29v
cGVyQHRpLmNvbT4KLS0tCiAuLi4vcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1k
ZWZhdWx0ICAgICB8ICAgIDIgKysKIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29y
ZS9zeXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdCBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lw
ZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdAppbmRleCBmYzZkNDE1Li45MTA0
M2YyIDEwMDY0NAotLS0gYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvc3lzdmluaXQv
c3lzdmluaXQvcmNTLWRlZmF1bHQKKysrIGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3Jl
L3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0CkBAIC0xMSw2ICsxMSw4IEBAIFNVTE9HSU49
bm8KIERFTEFZTE9HSU49bm8KICMgU2V0IFVUQz15ZXMgaWYgeW91ciBzeXN0ZW0gY2xvY2sgaXMg
c2V0IHRvIFVUQyAoR01UKSwgYW5kIFVUQz1ubyBpZiBub3QuCiAjIFVUQz15ZXMKKyMgU2V0IHRv
IG5vIHRvIG5vdCBydW4gaHdjbG9jayBmb3IgcnRjCitIV0NMT0NLQUNDRVNTPW5vCiAjIFNldCBW
RVJCT1NFIHRvICJubyIgaWYgeW91IHdvdWxkIGxpa2UgYSBtb3JlIHF1aWV0IGJvb3R1cC4KIFZF
UkJPU0U9bm8KICMgU2V0IEVESVRNT1REIHRvICJubyIgaWYgeW91IGRvbid0IHdhbnQgL2V0Yy9t
b3RkIHRvIGJlIGVkaXRlZCBhdXRvbWF0aWNhbGx5Ci0tIAoxLjcuMC40Cgo=

--_005_8F29D6B095ED194EA1980491A5E029710C27EAD2DFLE30entticom_--
