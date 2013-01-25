Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id ACC6B52ACA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 14:59:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0PExq37012542;
	Fri, 25 Jan 2013 08:59:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0PExqG1008783;
	Fri, 25 Jan 2013 08:59:52 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 25 Jan 2013 08:59:52 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] newbie question: license.manifest vs.
	package.manifest	vs. opkg list
Thread-Index: AQHN+pmKN7FL4Bh1VEyGqN6R8lq0CZhaI+rw
Date: Fri, 25 Jan 2013 14:59:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101593A25DB@DLEE12.ent.ti.com>
References: <CA+edY+Tw5JtFgevWy8hWNA7wH8ykuKV=W4Eq1yqo1Vq0jMtyLw@mail.gmail.com>
In-Reply-To: <CA+edY+Tw5JtFgevWy8hWNA7wH8ykuKV=W4Eq1yqo1Vq0jMtyLw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: newbie question: license.manifest vs. package.manifest	vs. opkg list
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
X-List-Received-Date: Fri, 25 Jan 2013 14:59:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED101593A25DBDLEE12entticom_"

--_000_7D46E86EC0A8354091174257B2FED101593A25DBDLEE12entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Paul,

Can you give some examples of a package listed in the package.manifest that=
 is not in the license.manifest file?

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Paul Kovitz
Sent: Thursday, January 24, 2013 7:15 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] newbie question: license.manifest vs. package.manifes=
t vs. opkg list

I am using the 05.06.00.00 baseline. I have an image recipe that I created =
by removing some packages from tisdk-rootfs-image.bb<http://tisdk-rootfs-im=
age.bb>, changing the ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to qt=
4-embedded and making edits to task-arago-tisdk-graphics.bb<http://task-ara=
go-tisdk-graphics.bb> and task-arago-tisdk-matrix.bb<http://task-arago-tisd=
k-matrix.bb> to not use packages that rely on opengl-es to run. The image w=
orked as expected on the target hardware for the tests I ran.

I wanted to understand the licenses this build used, so I looked in build/a=
rago-tmp-external-arago-toolchain/deploy/licenses/[my new image name] and s=
aw the license.manifest and package.manifest files. To verify package.manif=
est, I looked at the packages the target displayed as a result of opkg list=
 and compared the output package.manifest. The opkg list command listed two=
 packages that are not in package.manifest. The other 288 package names mat=
ch exactly. The same build has 69 more  package names in package.manifest t=
han there are in license.manaifest. The other 219 package names match exact=
ly.

I thought I must have done something wrong, so I built base-arago-image fro=
m the 05.06.00.00 release and looked at the arago-tmp-external-arago-toolch=
ain/deploy/licenses/arago-base-image-am335x-evm-20130124231158 directory. T=
here are 11 more package names in package.manifest than there are in licens=
e.manifest. The other 40 names match exactly.

Am I doing something wrong, or is this expected behavior, or perhaps both? =
Thanks in advance for the help.

--
Paul Kovitz


--_000_7D46E86EC0A8354091174257B2FED101593A25DBDLEE12entticom_
Content-Type: text/html; charset="Windows-1252"
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
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Paul,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Can you give some example=
s of a package listed in the package.manifest that is not in the license.ma=
nifest file?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sincerely,<br>
Chase Maupin<br>
Integration Team Manager<br>
Linux Core Product Development<br>
e-mail: chase.maupin@ti.com<br>
phone: (214) 567-2950<br>
<br>
For support:<br>
Forums - <a href=3D"http://community.ti.com/forums/">http://community.ti.co=
m/forums/</a><br>
Wiki - <a href=3D"http://wiki.davincidsp.com/">http://wiki.davincidsp.com/<=
/a></span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&=
quot;sans-serif&quot;;color:#1F497D">
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Paul Kovitz<br>
<b>Sent:</b> Thursday, January 24, 2013 7:15 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] newbie question: license.manifest vs. package.=
manifest vs. opkg list<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">I am using the 05.06.00.00 baseline. I have an image=
 recipe that I created by removing some packages from
<a href=3D"http://tisdk-rootfs-image.bb" target=3D"_blank">tisdk-rootfs-ima=
ge.bb</a>, changing the ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to =
qt4-embedded and making edits to
<a href=3D"http://task-arago-tisdk-graphics.bb" target=3D"_blank">task-arag=
o-tisdk-graphics.bb</a> and
<a href=3D"http://task-arago-tisdk-matrix.bb" target=3D"_blank">task-arago-=
tisdk-matrix.bb</a> to not use packages that rely on opengl-es to run. The =
image worked as expected on the target hardware for the tests I ran.&nbsp;<=
o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I wanted to understand the licenses this build used,=
 so I looked in&nbsp;build/arago-tmp-external-arago-toolchain/deploy/licens=
es/[my new image name] and saw the license.manifest and package.manifest fi=
les. To verify package.manifest, I looked
 at the packages the target displayed as a result of opkg list and compared=
 the output package.manifest. The opkg list command listed two packages tha=
t are not in package.manifest. The other 288 package names match exactly. T=
he same build has 69 more &nbsp;package
 names in package.manifest than there are in license.manaifest. The other 2=
19 package names match exactly.<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I thought I must have done something wrong, so I bui=
lt base-arago-image from the 05.06.00.00 release and looked at the arago-tm=
p-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-2013=
0124231158 directory. There are 11
 more package names in package.manifest than there are in license.manifest.=
 The other 40 names match exactly.<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Am I doing something wrong, or is this expected beha=
vior, or perhaps both? Thanks in advance for the help.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">-- <br>
Paul Kovitz<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED101593A25DBDLEE12entticom_--
