Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F321452998
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2013 10:20:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r72AK9Yx030293
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2013 05:20:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r72AK9cU031556
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2013 05:20:09 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 2 Aug 2013 05:20:09 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: help needed: Top nightly failure
Thread-Index: Ac6PaQWKy78HI/DYT4asbnLR1Jblhg==
Date: Fri, 2 Aug 2013 10:20:08 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905493EC54@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: help needed: Top nightly failure
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
X-List-Received-Date: Fri, 02 Aug 2013 10:20:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4F9216F96E5DF9428610502835A9F4905493EC54DLEE11entticom_"

--_000_4F9216F96E5DF9428610502835A9F4905493EC54DLEE11entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All

We are encountering a lot of nightly failures with fetch failure like the f=
ollowing from the arago-project git.  The error happens randomly and unpred=
ictably.
Is this something to do with git servers going down/offline?
Any ideas in tracking this type of issue will be appreciated.

With regards,
Sam

ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository '/home/gtbldadm/yocto/mcsdk-3_00_01_12/oe-laye=
rsetup-mcsdk/downloads/git2/arago-project.org.git.projects.linux-keystone.g=
it'...

fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

ERROR: Function failed: Fetcher failure for URL: 'git://arago-project.org/g=
it/projects/linux-keystone.git;protocol=3Dgit;branch=3Djuly-2013b/master'. =
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/gtbldadm/yocto/mcsdk-3_00_01_12/=
oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain/work/keystone=
_evm-oe-linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do_fetch.14929


--_000_4F9216F96E5DF9428610502835A9F4905493EC54DLEE11entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Hello All<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">We are encountering a lot of nightly failures with fetch f=
ailure like the following from the arago-project git.&nbsp; The error happe=
ns randomly and unpredictably.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Is this something to do with git servers going down/offlin=
e?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Any ideas in tracking this type of issue will be appreciat=
ed.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">With regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Sam<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Fetcher failure: Fetch command failed with exit cod=
e 128, output:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Cloning into bare repository '/home/gtbldadm/yocto/mcsdk-3=
_00_01_12/oe-layersetup-mcsdk/downloads/git2/arago-project.org.git.projects=
.linux-keystone.git'...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">fatal: The remote end hung up unexpectedly<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">fatal: early EOF<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">fatal: index-pack failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Function failed: Fetcher failure for URL: 'git://ar=
ago-project.org/git/projects/linux-keystone.git;protocol=3Dgit;branch=3Djul=
y-2013b/master'. Unable to fetch URL from any source.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Logfile of failure stored in: /home/gtbldadm/yocto/=
mcsdk-3_00_01_12/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolch=
ain/work/keystone_evm-oe-linux-gnueabi/linux-keystone-3.8.4-r6a/temp/log.do=
_fetch.14929<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_4F9216F96E5DF9428610502835A9F4905493EC54DLEE11entticom_--
