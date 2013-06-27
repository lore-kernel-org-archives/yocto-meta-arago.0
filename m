Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2464552A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 13:28:53 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RDSowk031635
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 08:28:51 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RDSlw9025642
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 08:28:49 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 21:28:47 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Help needed- error locating kernel headers
Thread-Index: Ac5zOkDRg+0N58sMQ+6ZHdND0toohw==
Date: Thu, 27 Jun 2013 13:28:46 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D543CF0A@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Help needed- error locating kernel headers
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
X-List-Received-Date: Thu, 27 Jun 2013 13:28:54 -0000
X-Groupsio-MsgNum: 1533
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_"

--_004_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to create a recipe for a firmware that includes some of the ker=
nel header files.
I have these headers present in the sysroots directory, but still the build=
 fails saying unable to locate these header files.

In the asocfw.inc file I have :
EXTRA_OECONF +=3D "$(STAGING_KERNEL_DIR)"

Any suggestions? I have attached the error log for more details.

Regards,
Mrinmayee


--_000_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to create a recipe for a firmware that i=
ncludes some of the kernel header files.
<o:p></o:p></p>
<p class=3D"MsoNormal">I have these headers present in the sysroots directo=
ry, but still the build fails saying unable to locate these header files.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the asocfw.inc file I have :<o:p></o:p></p>
<p class=3D"MsoNormal">EXTRA_OECONF &#43;=3D &quot;$(STAGING_KERNEL_DIR)&qu=
ot; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions? I have attached the error log for m=
ore details. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_--

--_004_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_
Content-Type: application/octet-stream; name="do_compile.log"
Content-Description: do_compile.log
Content-Disposition: attachment; filename="do_compile.log"; size=5363;
	creation-date="Thu, 27 Jun 2013 13:27:15 GMT";
	modification-date="Thu, 27 Jun 2013 13:27:15 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IFNJVEUgZmlsZXMgWydlbmRpYW4tbGl0dGxlJywgJ2JpdC0zMicsICdhcm0tY29tbW9u
JywgJ2NvbW1vbi1saW51eCcsICdjb21tb24tZ2xpYmMnLCAnYXJtLWxpbnV4JywgJ2FybS1saW51
eC1nbnVlYWJpJywgJ2NvbW1vbiddDQpERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1bmN0aW9uIGRv
X2NvbXBpbGUNCk5PVEU6IG1ha2UgLWogOA0KTWFraW5nIGFsbCBpbiBzcmMNCm1ha2VbMV06IEVu
dGVyaW5nIGRpcmVjdG9yeSBgL3Byb2ovcHJvZHVjdGl6YXRpb24vd29ya2Rpci9tcmlubWF5ZWUv
eW9jdG8vdGlzZGsvYnVpbGQvYXJhZ28tdG1wLWV4dGVybmFsLWxpbmFyby10b29sY2hhaW4vd29y
ay9hcm12N2FoZi12ZnAtbmVvbi1vZS1saW51eC1nbnVlYWJpL2Fzb2Nmdy1naXQtcjAvZ2l0L3Ny
YycNCi4uL2FybS1vZS1saW51eC1nbnVlYWJpLWxpYnRvb2wgLS10YWc9Q0MgICAtLW1vZGU9Y29t
cGlsZSBhcm0tbGludXgtZ251ZWFiaWhmLWdjYyAgLW1hcmNoPWFybXY3LWEgICAgLW1hcm0gLW10
aHVtYi1pbnRlcndvcmsgLW1mbG9hdC1hYmk9aGFyZCAtbWZwdT1uZW9uIC1tdHVuZT1jb3J0ZXgt
YTE1IC0tc3lzcm9vdD0vcHJvai9wcm9kdWN0aXphdGlvbi93b3JrZGlyL21yaW5tYXllZS95b2N0
by90aXNkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290
cy9vbWFwNS1ldm0gLXN0ZD1nbnU5OSAtRFBBQ0tBR0VfTkFNRT1cInNvY2Z3XCIgLURQQUNLQUdF
X1RBUk5BTUU9XCJzb2Nmd1wiIC1EUEFDS0FHRV9WRVJTSU9OPVwiMC4xXCIgLURQQUNLQUdFX1NU
UklORz1cInNvY2Z3XCAwLjFcIiAtRFBBQ0tBR0VfQlVHUkVQT1JUPVwiXCIgLURQQUNLQUdFX1VS
TD1cIlwiIC1EUEFDS0FHRT1cInNvY2Z3XCIgLURWRVJTSU9OPVwiMC4xXCIgLURTVERDX0hFQURF
UlM9MSAtREhBVkVfU1lTX1RZUEVTX0g9MSAtREhBVkVfU1lTX1NUQVRfSD0xIC1ESEFWRV9TVERM
SUJfSD0xIC1ESEFWRV9TVFJJTkdfSD0xIC1ESEFWRV9NRU1PUllfSD0xIC1ESEFWRV9TVFJJTkdT
X0g9MSAtREhBVkVfSU5UVFlQRVNfSD0xIC1ESEFWRV9TVERJTlRfSD0xIC1ESEFWRV9VTklTVERf
SD0xIC1EX19FWFRFTlNJT05TX189MSAtRF9BTExfU09VUkNFPTEgLURfR05VX1NPVVJDRT0xIC1E
X1BPU0lYX1BUSFJFQURfU0VNQU5USUNTPTEgLURfVEFOREVNX1NPVVJDRT0xIC1ESEFWRV9ETEZD
Tl9IPTEgLURMVF9PQkpESVI9XCIubGlicy9cIiAtRFNURENfSEVBREVSUz0xIC1JLiAgIC1pc3lz
dGVtL3Byb2ovcHJvZHVjdGl6YXRpb24vd29ya2Rpci9zaWQveW9jdG8vZ2NjLWxpbmFyby1hcm0t
bGludXgtZ251ZWFiaWhmLTQuNy0yMDEzLjAzLTIwMTMwMzEzX2xpbnV4L2FybS1saW51eC1nbnVl
YWJpaGYvaW5jbHVkZSAgLWZzdGFjay1wcm90ZWN0b3IgLURfRk9SVElGWV9TT1VSQ0U9MSAtSS4u
L3NyYyAtV2FsbCAtV2Vycm9yIC1EIF9fRVhQT1JURURfSEVBREVSU19fIC1JIH4vc291cmNlL2xp
bnV4LmdpdC9pbmNsdWRlL3VhcGkgLUkgfi9zb3VyY2UvbGludXguZ2l0L2luY2x1ZGUgLWlzeXN0
ZW0vcHJvai9wcm9kdWN0aXphdGlvbi93b3JrZGlyL3NpZC95b2N0by9nY2MtbGluYXJvLWFybS1s
aW51eC1nbnVlYWJpaGYtNC43LTIwMTMuMDMtMjAxMzAzMTNfbGludXgvYXJtLWxpbnV4LWdudWVh
YmloZi9pbmNsdWRlICAtZnN0YWNrLXByb3RlY3RvciAtRF9GT1JUSUZZX1NPVVJDRT0xIC1PMiAt
cGlwZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWMgLW8gbGliLmxvIGxpYi5j
DQphcm0tbGludXgtZ251ZWFiaWhmLWdjYyAgLW1hcmNoPWFybXY3LWEgICAgLW1hcm0gLW10aHVt
Yi1pbnRlcndvcmsgLW1mbG9hdC1hYmk9aGFyZCAtbWZwdT1uZW9uIC1tdHVuZT1jb3J0ZXgtYTE1
IC0tc3lzcm9vdD0vcHJvai9wcm9kdWN0aXphdGlvbi93b3JrZGlyL21yaW5tYXllZS95b2N0by90
aXNkay9idWlsZC9hcmFnby10bXAtZXh0ZXJuYWwtbGluYXJvLXRvb2xjaGFpbi9zeXNyb290cy9v
bWFwNS1ldm0gLXN0ZD1nbnU5OSAtRFBBQ0tBR0VfTkFNRT1cInNvY2Z3XCIgLURQQUNLQUdFX1RB
Uk5BTUU9XCJzb2Nmd1wiIC1EUEFDS0FHRV9WRVJTSU9OPVwiMC4xXCIgLURQQUNLQUdFX1NUUklO
Rz1cInNvY2Z3XCAwLjFcIiAtRFBBQ0tBR0VfQlVHUkVQT1JUPVwiXCIgLURQQUNLQUdFX1VSTD1c
IlwiIC1EUEFDS0FHRT1cInNvY2Z3XCIgLURWRVJTSU9OPVwiMC4xXCIgLURTVERDX0hFQURFUlM9
MSAtREhBVkVfU1lTX1RZUEVTX0g9MSAtREhBVkVfU1lTX1NUQVRfSD0xIC1ESEFWRV9TVERMSUJf
SD0xIC1ESEFWRV9TVFJJTkdfSD0xIC1ESEFWRV9NRU1PUllfSD0xIC1ESEFWRV9TVFJJTkdTX0g9
MSAtREhBVkVfSU5UVFlQRVNfSD0xIC1ESEFWRV9TVERJTlRfSD0xIC1ESEFWRV9VTklTVERfSD0x
IC1EX19FWFRFTlNJT05TX189MSAtRF9BTExfU09VUkNFPTEgLURfR05VX1NPVVJDRT0xIC1EX1BP
U0lYX1BUSFJFQURfU0VNQU5USUNTPTEgLURfVEFOREVNX1NPVVJDRT0xIC1ESEFWRV9ETEZDTl9I
PTEgLURMVF9PQkpESVI9XCIubGlicy9cIiAtRFNURENfSEVBREVSUz0xIC1JLiAgIC1pc3lzdGVt
L3Byb2ovcHJvZHVjdGl6YXRpb24vd29ya2Rpci9zaWQveW9jdG8vZ2NjLWxpbmFyby1hcm0tbGlu
dXgtZ251ZWFiaWhmLTQuNy0yMDEzLjAzLTIwMTMwMzEzX2xpbnV4L2FybS1saW51eC1nbnVlYWJp
aGYvaW5jbHVkZSAgLWZzdGFjay1wcm90ZWN0b3IgLURfRk9SVElGWV9TT1VSQ0U9MSAtSS4uL3Ny
YyAtV2FsbCAtV2Vycm9yIC1EIF9fRVhQT1JURURfSEVBREVSU19fIC1JIH4vc291cmNlL2xpbnV4
LmdpdC9pbmNsdWRlL3VhcGkgLUkgfi9zb3VyY2UvbGludXguZ2l0L2luY2x1ZGUgLWlzeXN0ZW0v
cHJvai9wcm9kdWN0aXphdGlvbi93b3JrZGlyL3NpZC95b2N0by9nY2MtbGluYXJvLWFybS1saW51
eC1nbnVlYWJpaGYtNC43LTIwMTMuMDMtMjAxMzAzMTNfbGludXgvYXJtLWxpbnV4LWdudWVhYmlo
Zi9pbmNsdWRlICAtZnN0YWNrLXByb3RlY3RvciAtRF9GT1JUSUZZX1NPVVJDRT0xIC1PMiAtcGlw
ZSAtZyAtZmVsaW1pbmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWMgLW8gc29jZnctc29jZncubyBg
dGVzdCAtZiAnc29jZncuYycgfHwgZWNobyAnLi8nYHNvY2Z3LmMNCmFybS1vZS1saW51eC1nbnVl
YWJpLWxpYnRvb2w6IGNvbXBpbGU6ICBhcm0tbGludXgtZ251ZWFiaWhmLWdjYyAtbWFyY2g9YXJt
djctYSAtbWFybSAtbXRodW1iLWludGVyd29yayAtbWZsb2F0LWFiaT1oYXJkIC1tZnB1PW5lb24g
LW10dW5lPWNvcnRleC1hMTUgLS1zeXNyb290PS9wcm9qL3Byb2R1Y3RpemF0aW9uL3dvcmtkaXIv
bXJpbm1heWVlL3lvY3RvL3Rpc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9v
bGNoYWluL3N5c3Jvb3RzL29tYXA1LWV2bSAtc3RkPWdudTk5IC1EUEFDS0FHRV9OQU1FPVwic29j
ZndcIiAtRFBBQ0tBR0VfVEFSTkFNRT1cInNvY2Z3XCIgLURQQUNLQUdFX1ZFUlNJT049XCIwLjFc
IiAiLURQQUNLQUdFX1NUUklORz1cInNvY2Z3IDAuMVwiIiAtRFBBQ0tBR0VfQlVHUkVQT1JUPVwi
XCIgLURQQUNLQUdFX1VSTD1cIlwiIC1EUEFDS0FHRT1cInNvY2Z3XCIgLURWRVJTSU9OPVwiMC4x
XCIgLURTVERDX0hFQURFUlM9MSAtREhBVkVfU1lTX1RZUEVTX0g9MSAtREhBVkVfU1lTX1NUQVRf
SD0xIC1ESEFWRV9TVERMSUJfSD0xIC1ESEFWRV9TVFJJTkdfSD0xIC1ESEFWRV9NRU1PUllfSD0x
IC1ESEFWRV9TVFJJTkdTX0g9MSAtREhBVkVfSU5UVFlQRVNfSD0xIC1ESEFWRV9TVERJTlRfSD0x
IC1ESEFWRV9VTklTVERfSD0xIC1EX19FWFRFTlNJT05TX189MSAtRF9BTExfU09VUkNFPTEgLURf
R05VX1NPVVJDRT0xIC1EX1BPU0lYX1BUSFJFQURfU0VNQU5USUNTPTEgLURfVEFOREVNX1NPVVJD
RT0xIC1ESEFWRV9ETEZDTl9IPTEgLURMVF9PQkpESVI9XCIubGlicy9cIiAtRFNURENfSEVBREVS
Uz0xIC1JLiAtaXN5c3RlbS9wcm9qL3Byb2R1Y3RpemF0aW9uL3dvcmtkaXIvc2lkL3lvY3RvL2dj
Yy1saW5hcm8tYXJtLWxpbnV4LWdudWVhYmloZi00LjctMjAxMy4wMy0yMDEzMDMxM19saW51eC9h
cm0tbGludXgtZ251ZWFiaWhmL2luY2x1ZGUgLWZzdGFjay1wcm90ZWN0b3IgLURfRk9SVElGWV9T
T1VSQ0U9MSAtSS4uL3NyYyAtV2FsbCAtV2Vycm9yIC1EIF9fRVhQT1JURURfSEVBREVSU19fIC1J
IC91c2VyL2EwMTMyMTYzL3NvdXJjZS9saW51eC5naXQvaW5jbHVkZS91YXBpIC1JIC91c2VyL2Ew
MTMyMTYzL3NvdXJjZS9saW51eC5naXQvaW5jbHVkZSAtaXN5c3RlbS9wcm9qL3Byb2R1Y3RpemF0
aW9uL3dvcmtkaXIvc2lkL3lvY3RvL2djYy1saW5hcm8tYXJtLWxpbnV4LWdudWVhYmloZi00Ljct
MjAxMy4wMy0yMDEzMDMxM19saW51eC9hcm0tbGludXgtZ251ZWFiaWhmL2luY2x1ZGUgLWZzdGFj
ay1wcm90ZWN0b3IgLURfRk9SVElGWV9TT1VSQ0U9MSAtTzIgLXBpcGUgLWcgLWZlbGltaW5hdGUt
dW51c2VkLWRlYnVnLXR5cGVzIC1jIGxpYi5jICAtZlBJQyAtRFBJQyAtbyAubGlicy9saWIubw0K
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIHNvY2Z3LmM6MzI6MDoNCnNvY2Z3Lmg6MjI6MjQ6IGZhdGFs
IGVycm9yOiBzb3VuZC9hc29jLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCmNvbXBpbGF0
aW9uIHRlcm1pbmF0ZWQuDQptYWtlWzFdOiAqKiogW3NvY2Z3LXNvY2Z3Lm9dIEVycm9yIDENCm1h
a2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQpJbiBmaWxlIGluY2x1
ZGVkIGZyb20gbGliLmM6MzM6MDoNCnNvY2Z3Lmg6MjI6MjQ6IGZhdGFsIGVycm9yOiBzb3VuZC9h
c29jLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
DQptYWtlWzFdOiAqKiogW2xpYi5sb10gRXJyb3IgMQ0KbWFrZVsxXTogTGVhdmluZyBkaXJlY3Rv
cnkgYC9wcm9qL3Byb2R1Y3RpemF0aW9uL3dvcmtkaXIvbXJpbm1heWVlL3lvY3RvL3Rpc2RrL2J1
aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5hcm8tdG9vbGNoYWluL3dvcmsvYXJtdjdhaGYtdmZw
LW5lb24tb2UtbGludXgtZ251ZWFiaS9hc29jZnctZ2l0LXIwL2dpdC9zcmMnDQptYWtlOiAqKiog
W2FsbC1yZWN1cnNpdmVdIEVycm9yIDENCkVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZA0KRVJST1I6
IEZ1bmN0aW9uIGZhaWxlZDogZG9fY29tcGlsZSAoc2VlIC9wcm9qL3Byb2R1Y3RpemF0aW9uL3dv
cmtkaXIvbXJpbm1heWVlL3lvY3RvL3Rpc2RrL2J1aWxkL2FyYWdvLXRtcC1leHRlcm5hbC1saW5h
cm8tdG9vbGNoYWluL3dvcmsvYXJtdjdhaGYtdmZwLW5lb24tb2UtbGludXgtZ251ZWFiaS9hc29j
ZnctZ2l0LXIwL3RlbXAvbG9nLmRvX2NvbXBpbGUuMzEyMjQgZm9yIGZ1cnRoZXIgaW5mb3JtYXRp
b24pDQo=

--_004_CF956B779D819D41BBC043B7082161D543CF0ADBDE04entticom_--
