Return-Path: <j-lance1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 31A0152988
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2012 16:59:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB4GxowN017722
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2012 10:59:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB4Gxof4018448
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2012 10:59:50 -0600
Received: from DFLE08.ent.ti.com ([fe80::c43d:3917:90fe:a5ef]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 4 Dec 2012 10:59:50 -0600
From: "Lance, Jeff" <j-lance1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: matrix-gui-apps-git: PATCH
Thread-Index: Ac3SQMIBUjetruTxRM++B+ypVNkK0Q==
Date: Tue, 4 Dec 2012 16:59:49 +0000
Message-ID: <9E1FDC891332154F8CE644C57219F7DA14A9931A@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Dec 2012 16:07:05 +0000
Subject: matrix-gui-apps-git: PATCH
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
X-List-Received-Date: Tue, 04 Dec 2012 16:59:58 -0000
X-Groupsio-MsgNum: 656
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_"

--_004_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_
Content-Type: multipart/alternative;
	boundary="_000_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_"

--_000_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please consider this patch for the amsdk-05.06.00.00-integration branch.
This patch is a work around for opcontrol not recognizing '+' characters in=
 the vmlinux file name.

This patch pulls in a new Oprofile Init script file which creates a hard li=
nk to the vmlinux file and removes the '+' from the file name and appends "=
_oprofile_copy" to the end of the vmlinux file.

Regards,

Jeff Lance

--_000_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_
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
<p class=3D"MsoNormal">Please consider this patch for the amsdk-05.06.00.00=
-integration branch.<o:p></o:p></p>
<p class=3D"MsoNormal">This patch is a work around for opcontrol not recogn=
izing &#8216;&#43;&#8217; characters in the vmlinux file name.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This patch pulls in a new Oprofile Init script file =
which creates a hard link to the vmlinux file and removes the &#8216;&#43;&=
#8217; from the file name and appends &#8220;_oprofile_copy&#8221; to the e=
nd of the vmlinux file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jeff Lance<o:p></o:p></p>
</div>
</body>
</html>

--_000_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_--

--_004_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_
Content-Type: application/octet-stream;
	name="0001-Updated-Oprofile-Init-launch-script.patch"
Content-Description: 0001-Updated-Oprofile-Init-launch-script.patch
Content-Disposition: attachment;
	filename="0001-Updated-Oprofile-Init-launch-script.patch"; size=1313;
	creation-date="Tue, 04 Dec 2012 16:56:51 GMT";
	modification-date="Tue, 04 Dec 2012 17:00:11 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1MGZiYWRhMGRlM2RmMDc3ZmI2OTk2NGMxNGNlN2JkOGZlOGUyNjdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZWZmIExhbmNlIDxqLWxhbmNlMUB0aS5jb20+CkRhdGU6IFR1
ZSwgNCBEZWMgMjAxMiAxMDo0MDozMyAtMDYwMApTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZWQgT3By
b2ZpbGUgSW5pdCBsYXVuY2ggc2NyaXB0CiAqIGJ1bXBlZCB1cCByZXZpc2lvbgogKiB1cGRhdGVk
ICBTUkMgUkVWIHRvIHB1bGwgYSBtb2QgdG8gdGhlIG9wcm9maWxlIGluaXQgc2NyaXB0IHRvIHdv
cmsgYXJvdW5kIG9wY29udHJvbCBub3QgYWxsb3dpbmcgJysnIGNoYXJhY3RlciBpbiBmaWxlIG5h
bWUKClNpZ25lZC1vZmYtYnk6IEplZmYgTGFuY2UgPGotbGFuY2UxQHRpLmNvbT4KLS0tCiAuLi4v
cmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLWFwcHMtZ2l0LmluYyAgICB8ICAgIDQgKyst
LQogMSBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3Vp
LWFwcHMtZ2l0LmluYyBiL21ldGEtYXJhZ28tZXh0cmFzL3JlY2lwZXMtY29yZS9tYXRyaXgvbWF0
cml4LWd1aS1hcHBzLWdpdC5pbmMKaW5kZXggMDUwYWQyYi4uY2YwYmU0MSAxMDA2NDQKLS0tIGEv
bWV0YS1hcmFnby1leHRyYXMvcmVjaXBlcy1jb3JlL21hdHJpeC9tYXRyaXgtZ3VpLWFwcHMtZ2l0
LmluYworKysgYi9tZXRhLWFyYWdvLWV4dHJhcy9yZWNpcGVzLWNvcmUvbWF0cml4L21hdHJpeC1n
dWktYXBwcy1naXQuaW5jCkBAIC00LDkgKzQsOSBAQCBMSUNFTlNFX0NIRUNLU1VNID0gIkxJQ0VO
U0U7bWQ1PTZlMGFlNzIxNGY2Yzc0YzE0OWNiMjVmMzczMDU3ZmE5IgogTElDX0ZJTEVTX0NIS1NV
TSA6PSAiZmlsZTovLy4uLyR7TElDRU5TRV9DSEVDS1NVTX0iCiAKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0b3Jpb3VzLm9yZy9tYXRyaXgtZ3VpLXYyL21hdHJpeC1ndWktdjItYXBwcy5naXQ7cHJvdG9j
b2w9Z2l0O2JyYW5jaD0ke0JSQU5DSH0iCi1TUkNSRVYgPSAiZTczOTk3OTEwMDgxMGEwOWEyMTU3
NjgyZTkwMDBlNDBlOTllZGJjMyIKK1NSQ1JFViA9ICI4MmQ0MjAzYjBkOTY0MjU0ZTNjYTQwN2Q2
MWQ4MTQ5YmVmMTU0NDMzIgogQlJBTkNIID0gIm1hc3RlciIKLUlOQ19QUiA9ICJyOCIKK0lOQ19Q
UiA9ICJyOSIKIAogIyBQdWxsIGluIHRoZSBiYXNlIHBhY2thZ2UgZm9yIGluc3RhbGxpbmcgbWF0
cml4IGFwcGxpY2F0aW9ucwogcmVxdWlyZSBtYXRyaXgtZ3VpLWFwcHMuaW5jCi0tIAoxLjcuMC40
Cgo=

--_004_9E1FDC891332154F8CE644C57219F7DA14A9931ADFLE08entticom_--
