Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8E548529C9
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2013 15:17:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6HFHX1J022710
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 10:17:33 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6HFHXRr009297
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2013 10:17:33 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 17 Jul 2013 10:17:33 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Saran, Sajesh Kumar" <sajesh@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: Linux kernel headers in devkit
Thread-Index: Ac6CbZanwD+jVx3xQqSynQYTwrspJAAgHixgAAOfncAAAOcsQA==
Date: Wed, 17 Jul 2013 15:17:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015965C404@DLEE11.ent.ti.com>
References: <8EAE6244CE843044A42356038645C855157360F8@DFLE12.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015965BAE4@DLEE11.ent.ti.com>
	<8EAE6244CE843044A42356038645C85515736400@DFLE12.ent.ti.com>
In-Reply-To: <8EAE6244CE843044A42356038645C85515736400@DFLE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: Linux kernel headers in devkit
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
X-List-Received-Date: Wed, 17 Jul 2013 15:17:35 -0000
X-Groupsio-MsgNum: 1656
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_"

--_004_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Usually you use linux-libc-headers as I recall from an application space ra=
ther than the kernel headers since the kernel headers are not formatted for=
 inclusion in an application.  There was a similar discussion on the meta-a=
rago list last week.  I have attached that here for reference.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

From: Saran, Sajesh Kumar
Sent: Wednesday, July 17, 2013 9:59 AM
To: Maupin, Chase; meta-arago@arago-project.org
Subject: RE: Linux kernel headers in devkit

Chase,

The kernel source is not packaged in the release. Moreover, the Yocto/Arago=
 puts the header files in an src directory of sysroot. Sometimes applicatio=
ns want to include kernel header files to get IOCTL definitions and develop=
 kernel objects. If we add kernel source in devkit it will be similar devel=
opment environment.

I will try out kernel-dev package.

Regards,
Sajesh

From: Maupin, Chase
Sent: Wednesday, July 17, 2013 9:07 AM
To: Saran, Sajesh Kumar; meta-arago@arago-project.org<mailto:meta-arago@ara=
go-project.org>
Subject: RE: Linux kernel headers in devkit

From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Sar=
an, Sajesh Kumar
Sent: Tuesday, July 16, 2013 4:46 PM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] Linux kernel headers in devkit

Hi,

We want to package kernel header files in the devkit.
Is there any recipe/package which could pull in usr/src of the sysroot to a=
 package?

[CEM] Any particular reason why?  Do you not already have the kernel source=
s packaged in your sdk?  The kernel-dev package has the headers so you coul=
d play with installing that, but I=92m not sure why you want to tie your to=
olchain and libraries to the kernel headers.



Regards,
Sajesh


--_000_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle22
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Usually you use linux-=
libc-headers as I recall from an application space rather than the kernel h=
eaders since the kernel headers are not formatted for inclusion in an appli=
cation. &nbsp;There was a similar discussion
 on the meta-arago list last week.&nbsp; I have attached that here for refe=
rence.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;color:#1F497D">Since=
rely,<br>
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
/a></span><span style=3D"color:#1F497D">
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
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Saran, S=
ajesh Kumar
<br>
<b>Sent:</b> Wednesday, July 17, 2013 9:59 AM<br>
<b>To:</b> Maupin, Chase; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: Linux kernel headers in devkit<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Chase,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The kernel source is n=
ot packaged in the release. Moreover, the Yocto/Arago puts the header files=
 in an src directory of sysroot. Sometimes applications want to include ker=
nel header files to get IOCTL definitions
 and develop kernel objects. If we add kernel source in devkit it will be s=
imilar development environment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I will try out kernel-=
dev package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Sajesh<o:p></o:p></spa=
n></p>
</div>
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
<b>Sent:</b> Wednesday, July 17, 2013 9:07 AM<br>
<b>To:</b> Saran, Sajesh Kumar; <a href=3D"mailto:meta-arago@arago-project.=
org">meta-arago@arago-project.org</a><br>
<b>Subject:</b> RE: Linux kernel headers in devkit<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@=
arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">mailto:meta-arago-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Saran, Sajesh Kumar<br>
<b>Sent:</b> Tuesday, July 16, 2013 4:46 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
<b>Subject:</b> [meta-arago] Linux kernel headers in devkit<o:p></o:p></spa=
n></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We want to package kernel header files in the devkit=
.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any recipe/package which could pull in usr/=
src of the sysroot to a package?<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">[CEM] Any particular r=
eason why?&nbsp; Do you not already have the kernel sources packaged in you=
r sdk?&nbsp; The kernel-dev package has the headers so you could play with =
installing that, but I=92m not sure why you want
 to tie your toolchain and libraries to the kernel headers.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_--

--_004_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 17 Jul 2013 15:17:32 GMT";
	modification-date="Wed, 17 Jul 2013 15:17:32 GMT"

Received: from dflp51.itg.ti.com (128.247.22.94) by DLEE71.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server id 14.2.342.3; Tue, 9 Jul 2013
 11:07:18 -0500
Received: from red.ext.ti.com (red.ext.ti.com [192.94.93.37])	by
 dflp51.itg.ti.com (8.13.7/8.13.8) with ESMTP id r69G7G7G013036;	Tue, 9 Jul
 2013 11:07:16 -0500 (CDT)
Received: from mail6.bemta8.messagelabs.com (mail6.bemta8.messagelabs.com
 [216.82.243.55])	by red.ext.ti.com (8.13.7/8.13.7) with ESMTP id
 r69G7AEG001052;	Tue, 9 Jul 2013 11:07:15 -0500
Received: from [216.82.242.147:44897] by server-16.bemta-8.messagelabs.com id
 25/FF-01682-3353CD15; Tue, 09 Jul 2013 16:07:15 +0000
Received: (qmail 10903 invoked from network); 9 Jul 2013 16:07:14 -0000
Received: from ec2-184-73-161-183.compute-1.amazonaws.com (HELO
 arago-project.org) (184.73.161.183)  by server-16.tower-95.messagelabs.com
 with SMTP; 9 Jul 2013 16:07:14 -0000
Received: from ip-10-46-145-36.ec2.internal (localhost [127.0.0.1])	by
 arago-project.org (Postfix) with ESMTP id C5A9552A5E;	Tue,  9 Jul 2013
 16:07:13 +0000 (UTC)
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])	by
 arago-project.org (Postfix) with ESMTPS id CE56C529D3	for
 <meta-arago@arago-project.org>;	Tue,  9 Jul 2013 16:07:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])	by arroyo.ext.ti.com
 (8.13.7/8.13.7) with ESMTP id r69G7BSK017023	for
 <meta-arago@arago-project.org>; Tue, 9 Jul 2013 11:07:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])	by
 dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69G7B6H008892	for
 <meta-arago@arago-project.org>; Tue, 9 Jul 2013 11:07:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;	Tue, 9 Jul 2013
 11:07:10 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r69G7Aui010195;	Tue, 9 Jul
 2013 11:07:10 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
CC: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Karicheri, Muralidharan" <m-karicheri2@ti.com>, "Shilimkar, Santosh"
	<santosh.shilimkar@ti.com>
Subject: Re: [meta-arago] Help needed: Devkit header files not upto date
 with kernel headers
Thread-Topic: [meta-arago] Help needed: Devkit header files not upto date
 with kernel headers
Thread-Index: AQHOfL5isNumDFUefk253+GOss7F7w==
Sender: "meta-arago-bounces@arago-project.org"
	<meta-arago-bounces@arago-project.org>
Date: Tue, 9 Jul 2013 16:07:10 +0000
Message-ID: <20130709160710.GF14185@edge>
References: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
	<20130709154017.GD14185@edge>
	<4F9216F96E5DF9428610502835A9F49054937C6E@DLEE11.ent.ti.com>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>,
 	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>,
 	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054937C6E@DLEE11.ent.ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DLEE71.ent.ti.com
X-MS-Has-Attach: 
X-Auto-Response-Suppress: All
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.20 (2009-06-14)
x-originating-ip: [184.73.161.183]
list-post: <mailto:meta-arago@arago-project.org>
errors-to: meta-arago-bounces@arago-project.org
list-id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
delivered-to: meta-arago@arago-project.org
list-archive: <http://arago-project.org/pipermail/meta-arago>
x-beenthere: meta-arago@arago-project.org
x-mailman-version: 2.1.12
x-original-to: meta-arago@arago-project.org
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62F76DC7127DB0469CE13523EDA2F76B@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Sam,

Please see my last comment - there's a separate recipe for user-space kerne=
l
headers. The headers need to be properly exported, you cannot just use the
ones from the kernel directly. Hence they are detached - updating the heade=
r
in the kernel tree does not automatically update exported headers for the u=
ser
space in linux-libc-headers.

--
Denys


On Tue, Jul 09, 2013 at 12:00:34PM -0400, Nelson, Sam wrote:
> Understand the user space headers and kernel space headers are different =
in
> general. But in this case, I am comparing the files under "uapi" director=
y.
> Which I assume is actually meant for user space api. Am I wrong on this?
> Given that , I expected the header file will be updated in building the
> devkit.
>
> For example if we have update on an "uapi" header file , as part of a ker=
nel
> patch, Don't we expect the corresponding header file in devkit to be
> updated? Appreciate your comments.
>
> With regards,
> Sam
>
>
> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, July 09, 2013 11:40 AM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, San=
tosh
> Subject: Re: Help needed: Devkit header files not upto date with kernel h=
eaders
>
> On Tue, Jul 09, 2013 at 11:30:35AM -0400, Nelson, Sam wrote:
> >    Hello all,
> >
> >    The header files under sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi d=
oes
> >    not match the same file from the kernel tree.
>
> That's normal. There's a difference between kernel and user-space facing =
headers.
>
> http://kernelnewbies.org/KernelHeaders
>
>
> >    For example
> >
> >    Comparing the following 2 files, they are different.
> >
> >
> > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/include/linux/ethtool.
> > h
> >
> >    and
> >
> >
> > sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/src/kernel/include/uap
> > i/linux/ethtool.h
> >
> >
> >
> >    Looking into some details, the /usr/include/linux/ethtool.h, seems t=
o come
> >    from the libc package.
>
> Yes, those are different even on my host machine. The first is marked as =
_LINUX_ETHTOOL_H and the second one as _UAPI_LINUX_ETHTOOL_H
>
> http://lwn.net/Articles/113349/
> http://lwn.net/Articles/507794/
>
>
> >    Any ideas on what can be wrong in the recipes will be helpful.  Is t=
here
> >    any way to update the user space header files to match the kernel he=
ader
> >    files?
>
> There is a special recipe for that - linux-libc-headers.
>
> --
> Denys
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_004_7D46E86EC0A8354091174257B2FED1015965C404DLEE11entticom_--
