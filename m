Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 74396529A4
	for <meta-arago@arago-project.org>;
	Fri,  3 Aug 2012 16:18:42 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q73GIfS2023740
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2012 11:18:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q73GIfhS025139
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2012 11:18:41 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 3 Aug 2012 11:18:41 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHES] Porting sysvinit changes from arago to
	meta-arago
Thread-Index: AQHNcX4aA/h2KND7IkyKZalJwSWZWZdIRAmA
Date: Fri, 3 Aug 2012 16:18:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C280F3D@DFLE30.ent.ti.com>
References: <8F29D6B095ED194EA1980491A5E029710C27EAD2@DFLE30.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015917808A@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015917808A@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCHES] Porting sysvinit changes from arago to	meta-arago
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
X-List-Received-Date: Fri, 03 Aug 2012 16:18:43 -0000
X-Groupsio-MsgNum: 70
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_005_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_"

--_005_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please use these updated patches instead.

From: Maupin, Chase
Sent: Friday, August 03, 2012 8:44 AM
To: Cooper Jr., Franklin; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCHES] Porting sysvinit changes from arago to =
meta-arago

Use : in the commit message instead of -.



Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Cooper Jr., Franklin
Sent: Wednesday, August 01, 2012 5:26 PM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago] [PATCHES] Porting sysvinit changes from arago to meta=
-arago



Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:rtc=3D"http://m=
icrosoft.com/officenet/conferencing" xmlns:D=3D"DAV:" xmlns:Repl=3D"http://=
schemas.microsoft.com/repl/" xmlns:mt=3D"http://schemas.microsoft.com/share=
point/soap/meetings/" xmlns:x2=3D"http://schemas.microsoft.com/office/excel=
/2003/xml" xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" xmlns:ois=
=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://=
schemas.microsoft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3=
.org/2000/09/xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint=
/dsp" xmlns:udc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http=
://www.w3.org/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sha=
repoint/soap/2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#"=
 xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://=
schemas.microsoft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001=
/XMLSchema-instance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/so=
ap" xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udc=
p2p=3D"http://schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http:/=
/schemas.microsoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://sche=
mas.microsoft.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.mi=
crosoft.com/office/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformat=
s.org/package/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlf=
ormats.org/markup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.c=
om/office/2004/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/pa=
ckage/2006/relationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/web=
partpages" xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/20=
06/types" xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/200=
6/messages" xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/Sli=
deLibrary/" xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortal=
Server/PublishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:=
st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Please use these updat=
ed patches instead.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Maupin, =
Chase
<br>
<b>Sent:</b> Friday, August 03, 2012 8:44 AM<br>
<b>To:</b> Cooper Jr., Franklin; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: [meta-arago] [PATCHES] Porting sysvinit changes from ar=
ago to meta-arago<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Use : in the commit me=
ssage instead of -.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#1F497D">Since=
rely,<br>
Chase Maupin<br>
Software Applications<br>
ARM MPU<br>
e-mail: chase.maupin@ti.com<br>
phone: (214) 567-2950<br>
<br>
For support:<br>
Forums - </span><a href=3D"http://community.ti.com/forums/"><span style=3D"=
font-size:10.0pt">http://community.ti.com/forums/</span></a><span style=3D"=
font-size:10.0pt;color:#1F497D"><br>
Wiki - </span><a href=3D"http://wiki.davincidsp.com/"><span style=3D"font-s=
ize:
10.0pt">http://wiki.davincidsp.com/</span></a><span style=3D"color:#1F497D"=
>
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Cooper Jr., Franklin<br>
<b>Sent:</b> Wednesday, August 01, 2012 5:26 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Cc:</b> Cooper Jr., Franklin<br>
<b>Subject:</b> [meta-arago] [PATCHES] Porting sysvinit changes from arago =
to meta-arago<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_--

--_005_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_
Content-Type: application/octet-stream;
	name="0001-sysvinit-Port-from-arago-to-meta-arago.patch"
Content-Description: 0001-sysvinit-Port-from-arago-to-meta-arago.patch
Content-Disposition: attachment;
	filename="0001-sysvinit-Port-from-arago-to-meta-arago.patch"; size=3172;
	creation-date="Fri, 03 Aug 2012 16:17:47 GMT";
	modification-date="Fri, 03 Aug 2012 16:19:15 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1OGFiYjJjNzczMzM3MmM3MmUzNTc5YWU4YzE5NDJmNzlmMzMzMDQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTE6NDk6MDkgLTA1MDAKU3ViamVjdDogW1BBVENIIDEv
Ml0gc3lzdmluaXQ6IFBvcnQgZnJvbSBhcmFnbyB0byBtZXRhLWFyYWdvCgoqIFBvcnQgY2hhbmdl
cyBmcm9tIGFyYWdvIHRvIG1ldGEtYXJhZ28KKiBDb3B5IHJjUy1kZWZhdWx0IGZyb20gb2UtY29y
ZSAvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQKClNpZ25lZC1vZmYtYnk6IEZy
YW5rbGluIFMgQ29vcGVyIEpyIDxmY29vcGVyQHRpLmNvbT4KLS0tCiAuLi4vcmVjaXBlcy1jb3Jl
L3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0ICAgICB8ICAgMjUgKysrKysrKysrKysrKysr
KysrKysKIC4uLi9zeXN2aW5pdC9zeXN2aW5pdF8yLjg4ZHNmLmJiYXBwZW5kICAgICAgICAgICAg
IHwgICAyNCArKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlv
bnMoKyksIDAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcmFnby1leHRy
YXMvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0CiBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0
XzIuODhkc2YuYmJhcHBlbmQKCmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVz
LWNvcmUvc3lzdmluaXQvc3lzdmluaXQvcmNTLWRlZmF1bHQgYi9tZXRhLWFyYWdvLWV4dHJhcy9y
ZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQvcmNTLWRlZmF1bHQKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uZmM2ZDQxNQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtYXJh
Z28tZXh0cmFzL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdApAQCAt
MCwwICsxLDI1IEBACisjCisjCURlZmF1bHRzIGZvciB0aGUgYm9vdCBzY3JpcHRzIGluIC9ldGMv
cmNTLmQKKyMKKworIyBUaW1lIGZpbGVzIGluIC90bXAgYXJlIGtlcHQgaW4gZGF5cy4KK1RNUFRJ
TUU9MAorIyBTZXQgdG8geWVzIGlmIHlvdSB3YW50IHN1bG9naW4gdG8gYmUgc3Bhd25lZCBvbiBi
b290dXAKK1NVTE9HSU49bm8KKyMgU2V0IHRvIG5vIGlmIHlvdSB3YW50IHRvIGJlIGFibGUgdG8g
bG9naW4gb3ZlciB0ZWxuZXQvcmxvZ2luCisjIGJlZm9yZSBzeXN0ZW0gc3RhcnR1cCBpcyBjb21w
bGV0ZSAoYXMgc29vbiBhcyBpbmV0ZCBpcyBzdGFydGVkKQorREVMQVlMT0dJTj1ubworIyBTZXQg
VVRDPXllcyBpZiB5b3VyIHN5c3RlbSBjbG9jayBpcyBzZXQgdG8gVVRDIChHTVQpLCBhbmQgVVRD
PW5vIGlmIG5vdC4KKyMgVVRDPXllcworIyBTZXQgVkVSQk9TRSB0byAibm8iIGlmIHlvdSB3b3Vs
ZCBsaWtlIGEgbW9yZSBxdWlldCBib290dXAuCitWRVJCT1NFPW5vCisjIFNldCBFRElUTU9URCB0
byAibm8iIGlmIHlvdSBkb24ndCB3YW50IC9ldGMvbW90ZCB0byBiZSBlZGl0ZWQgYXV0b21hdGlj
YWxseQorRURJVE1PVEQ9bm8KKyMgV2hldGhlciB0byBmc2NrIHJvb3Qgb24gYm9vdAorRU5BQkxF
X1JPT1RGU19GU0NLPW5vCisjIFNldCBGU0NLRklYIHRvICJ5ZXMiIGlmIHlvdSB3YW50IHRvIGFk
ZCAiLXkiIHRvIHRoZSBmc2NrIGF0IHN0YXJ0dXAuCitGU0NLRklYPXllcworIyBTZXQgVElDS0FE
SiB0byB0aGUgY29ycmVjdCB0aWNrIHZhbHVlIGZvciB0aGlzIHNwZWNpZmljIG1hY2hpbmUKKyNU
SUNLQURKPTEwMDAwCisjIEVuYWJsZSBjYWNoaW5nIGluIHBvcHVsYXRlLXZvbGF0aWxlLnNoCitW
T0xBVElMRV9FTkFCTEVfQ0FDSEU9eWVzCmRpZmYgLS1naXQgYS9tZXRhLWFyYWdvLWV4dHJhcy9y
ZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRfMi44OGRzZi5iYmFwcGVuZCBiL21ldGEtYXJh
Z28tZXh0cmFzL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9zeXN2aW5pdF8yLjg4ZHNmLmJiYXBwZW5k
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjA3YzgyMmIKLS0tIC9kZXYvbnVs
bAorKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXRf
Mi44OGRzZi5iYmFwcGVuZApAQCAtMCwwICsxLDI0IEBACisjIEFyYWdvLXNwZWNpZmljIGFtZW5k
bWVudHMgdG8gdGhlIHN0YW5kYXJkIE9FIFN5c1Zpbml0IHJlY2lwZQorCisjIGxvb2sgZm9yIGZp
bGVzIGluIHRoaXMgbGF5ZXIgZmlyc3QKK0ZJTEVTRVhUUkFQQVRIU19wcmVwZW5kIDo9ICIke1RI
SVNESVJ9LyR7UE59OiIKKworUFJfYXBwZW5kID0gIi1hcmFnbzAiCisKKyMgV2hlbiBidWlsZGlu
ZyBmb3IgInVuaWZpZWQiIGFyYWdvIG1hY2hpbmUsIHN0YXJ0IGdldHR5cyBvbiBmaXJzdCAzIHNl
cmlhbCBjb25zb2xlcyAodHR5Uz8vdHR5Tz8pCithZGRfYXJhZ29fZ2V0dHlzICgpIHsKKwllY2hv
ICJTMDoyMzQ1OnJlc3Bhd246JHtiYXNlX3NiaW5kaXJ9L2dldHR5IDExNTIwMCB0dHlTMCIgPj4g
JHtEfSR7c3lzY29uZmRpcn0vaW5pdHRhYgorCWVjaG8gIlMxOjIzNDU6cmVzcGF3bjoke2Jhc2Vf
c2JpbmRpcn0vZ2V0dHkgMTE1MjAwIHR0eVMxIiA+PiAke0R9JHtzeXNjb25mZGlyfS9pbml0dGFi
CisJZWNobyAiUzI6MjM0NTpyZXNwYXduOiR7YmFzZV9zYmluZGlyfS9nZXR0eSAxMTUyMDAgdHR5
UzIiID4+ICR7RH0ke3N5c2NvbmZkaXJ9L2luaXR0YWIKKwllY2hvICJPMDoyMzQ1OnJlc3Bhd246
JHtiYXNlX3NiaW5kaXJ9L2dldHR5IDExNTIwMCB0dHlPMCIgPj4gJHtEfSR7c3lzY29uZmRpcn0v
aW5pdHRhYgorCWVjaG8gIk8xOjIzNDU6cmVzcGF3bjoke2Jhc2Vfc2JpbmRpcn0vZ2V0dHkgMTE1
MjAwIHR0eU8xIiA+PiAke0R9JHtzeXNjb25mZGlyfS9pbml0dGFiCisJZWNobyAiTzI6MjM0NTpy
ZXNwYXduOiR7YmFzZV9zYmluZGlyfS9nZXR0eSAxMTUyMDAgdHR5TzIiID4+ICR7RH0ke3N5c2Nv
bmZkaXJ9L2luaXR0YWIKK30KKworZG9faW5zdGFsbF9hcHBlbmRfYXJhZ28tYXJtdjUgKCkgewor
CWFkZF9hcmFnb19nZXR0eXMKK30KKworZG9faW5zdGFsbF9hcHBlbmRfYXJhZ28tYXJtdjcgKCkg
eworCWFkZF9hcmFnb19nZXR0eXMKK30KLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_
Content-Type: application/octet-stream;
	name="0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch"
Content-Description: 0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch
Content-Disposition: attachment;
	filename="0002-sysvinit-Port-changes-to-rcS-default-from-arago.patch";
	size=1183; creation-date="Fri, 03 Aug 2012 16:17:47 GMT";
	modification-date="Fri, 03 Aug 2012 16:19:15 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmY2Y4NTQ5ODMzNmFiMzQ1NGM2N2ZlNDYwNDhhODkyYjE1ZjdmN2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGcmFua2xpbiBTIENvb3BlciBKciA8ZmNvb3BlckB0aS5jb20+
CkRhdGU6IE1vbiwgMzAgSnVsIDIwMTIgMTE6NTM6MjcgLTA1MDAKU3ViamVjdDogW1BBVENIIDIv
Ml0gc3lzdmluaXQ6IFBvcnQgY2hhbmdlcyB0byByY1MtZGVmYXVsdCBmcm9tIGFyYWdvCgoqIE1v
ZGlmeSB0aGUgYmFzZSByY1MtZGVmYXVsdCBmaWxlIHdoaWNoIHdhcyB0YWtlbiBmcm9tIG9lLWNv
cmUKICBhbmQgdHdlYWsgdGhlIGZpbGUgYmFzZWQgb24gdGhlIHJjUy1kZWZhdWx0IGZpbGUgbG9j
YXRlZCBpbiBhcmFnbwoKU2lnbmVkLW9mZi1ieTogRnJhbmtsaW4gUyBDb29wZXIgSnIgPGZjb29w
ZXJAdGkuY29tPgotLS0KIC4uLi9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQvcmNTLWRl
ZmF1bHQgICAgIHwgICAgMiArKwogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3Jl
L3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0IGIvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBl
cy1jb3JlL3N5c3Zpbml0L3N5c3Zpbml0L3JjUy1kZWZhdWx0CmluZGV4IGZjNmQ0MTUuLjkxMDQz
ZjIgMTAwNjQ0Ci0tLSBhL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29yZS9zeXN2aW5pdC9z
eXN2aW5pdC9yY1MtZGVmYXVsdAorKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUv
c3lzdmluaXQvc3lzdmluaXQvcmNTLWRlZmF1bHQKQEAgLTExLDYgKzExLDggQEAgU1VMT0dJTj1u
bwogREVMQVlMT0dJTj1ubwogIyBTZXQgVVRDPXllcyBpZiB5b3VyIHN5c3RlbSBjbG9jayBpcyBz
ZXQgdG8gVVRDIChHTVQpLCBhbmQgVVRDPW5vIGlmIG5vdC4KICMgVVRDPXllcworIyBTZXQgdG8g
bm8gdG8gbm90IHJ1biBod2Nsb2NrIGZvciBydGMKK0hXQ0xPQ0tBQ0NFU1M9bm8KICMgU2V0IFZF
UkJPU0UgdG8gIm5vIiBpZiB5b3Ugd291bGQgbGlrZSBhIG1vcmUgcXVpZXQgYm9vdHVwLgogVkVS
Qk9TRT1ubwogIyBTZXQgRURJVE1PVEQgdG8gIm5vIiBpZiB5b3UgZG9uJ3Qgd2FudCAvZXRjL21v
dGQgdG8gYmUgZWRpdGVkIGF1dG9tYXRpY2FsbHkKLS0gCjEuNy4wLjQKCg==

--_005_8F29D6B095ED194EA1980491A5E029710C280F3DDFLE30entticom_--
