Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9408752979
	for <meta-arago@arago-project.org>;
	Fri, 26 Apr 2013 23:04:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3QN4cwf001945
	for <meta-arago@arago-project.org>; Fri, 26 Apr 2013 18:04:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3QN4cCT025642
	for <meta-arago@arago-project.org>; Fri, 26 Apr 2013 18:04:38 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 26 Apr 2013 18:04:38 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 26 Apr 2013 18:04:38 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [nightly] Core TISDK 2013.04 build
	2013-04-25_16-46-49
Thread-Index: AQHOQg12tSXR2RiPZEWNZnIAuaQ64pjpIB2A
Date: Fri, 26 Apr 2013 23:04:37 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E7CA717@DLEE08.ent.ti.com>
References: <1208189893.53.1366932535809.JavaMail.jenkins@puget>
In-Reply-To: <1208189893.53.1366932535809.JavaMail.jenkins@puget>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [nightly] Core TISDK 2013.04 build 2013-04-25_16-46-49
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
X-List-Received-Date: Fri, 26 Apr 2013 23:04:40 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E7CA717DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E7CA717DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

BTW, there was a github outage yesterday:

Error: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: remote error:
  Storage server temporarily offline. See http://status.github.com for GitH=
ub system status.

A more recent nightly build was successful.

--
Denys

________________________________
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Dmytriyenko, Denys
Sent: Thursday, April 25, 2013 7:29 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] [nightly] Core TISDK 2013.04 build 2013-04-25_16-46-4=
9

Status for 04/25/13
BUILD_ID: build-2013-04-25_16-47-54
Clean Build: true
Clean Sources: false
Repository Revisions
Repository

Git URL

Branch

Commit ID

Layers

bitbake

git://git.openembedded.org/bitbake

master

1.17.0

layers=3D

meta-arago

git://arago-project.org/git/meta-arago.git

master

HEAD

layers=3Dmeta-arago-distro:meta-arago-extras

meta-openembedded

git://git.openembedded.org/meta-openembedded

danny

HEAD

layers=3Dtoolchain-layer:meta-oe

meta-ti

git://arago-project.org/git/meta-ti.git

danny

HEAD

layers=3D

meta-linaro

git://git.linaro.org/openembedded/meta-linaro.git

danny

HEAD

layers=3D

oe-core

git://git.openembedded.org/openembedded-core

danny

HEAD

layers=3Dmeta

Build and Target Test Results
Machine

Build Result

Target Test Result

am335x-evm

PASSED

FAILED

am37x-evm

FAILED

SKIPPED

omap5-evm

FAILED

SKIPPED

beagleboard

FAILED

SKIPPED

am3517-evm

FAILED

SKIPPED

am180x-evm

FAILED

SKIPPED


These builds were performed using the build-oesdk.sh script at:

git://arago-project.org/git/projects/tisdk-build-scripts.git

The configuration file passed to this script had the contents:

MANDATORY_INPUTS=3D"MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCR=
IPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER SDK_FILTE=
R FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT CONFIG_FILE LOG_DIR TISDK_VERSION"
TISDK_VERSION=3D"2013.04"
MACHINES=3D"am335x-evm am37x-evm omap5-evm beagleboard am3517-evm am180x-ev=
m"
NUM_ARM9_BUILDS=3D"1"
NUM_CORTEX_BUILDS=3D"1"
TOOLCHAIN_ROOT_ARM9=3D"/opt/arago-2011.09/armv5te/bin/"
TOOLCHAIN_ROOT_CORTEX=3D"/opt/arago-2011.09/armv7a/bin/"
BUILD_ID=3D"`date +build-%F_%H-%M-%S`"
SCRIPTS_ROOT=3D"$PWD"
BUILD_ROOT=3D"/home/jenkins/tisdk-build"
TEST_ROOT=3D"$BUILD_ROOT/testing"
PACKAGE_ROOT=3D"$BUILD_ROOT/packaging"
DEPLOY_ROOT=3D"$BUILD_ROOT/deploy/$TISDK_VERSION"
FS_FILTER=3D"tisdk-rootfs-"
FS_IMAGE_TYPE=3D"tar.gz"
SDK_FILTER=3D"arago-core-tisdk-image-"
SDK_IMAGE_TYPE=3D"tar.gz"
NFS_ROOT=3D"/home/jenkins/nfs-root"
SOURCE_DIR=3D"${BUILD_ROOT}/sources"
CLEAN_BUILD=3D"true"
CLEAN_ALL=3D"false"
CONFIG_FILE=3D"${BUILD_ROOT}/configs/arago-danny-config.txt"
LOG_DIR=3D"${BUILD_ROOT}/log-files"
DL_DIR=3D"/OE/downloads"
INSTALLER_EXTRAS_ROOT=3D"/home/jenkins/extra-files/installer_content"
TEST_SCRIPTS=3D"$SCRIPTS_ROOT/test-scripts"
TEST_SCRIPTS_TGT=3D"home/root/test-scripts"
TEST_LOCAL_IFACE=3D"eth1"
OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
OPENTEST_TEE_IP=3D"10.218.102.142"
RUN_BUILD_TESTS=3D"true"
STAF_ROOT=3D"/usr/local/staf"
SKIP_TEST_FAILURES=3D"false"
PRODUCTIZE_SDK=3D"false"
BITBAKE_COMMAND=3D"arago-core-tisdk-image"
RESULTS_CONFIG_COMMENTS=3D"false"
INSTALL_JAMMER=3D"/home/jenkins/installjammer"
INSTALLER_ROOT=3D"$BUILD_ROOT/installer"
MPI_FILE=3D"$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi"
SD_CARD_CONTENT=3D"/home/jenkins/extra-files/sd_content"
WEBGEN_ROOT=3D"/home/jenkins/webgen"
WEB_EXTRAS_ROOT=3D"/home/jenkins/extra-files/web_content"
WEBGEN_MAK_ROOT=3D"$SCRIPTS_ROOT/publish-sdk-data"
COPY_TO_WEB=3D"true"
WEB_HOST=3D""
CLEAN_AFTER_COPY=3D"true"
BACKUP_RESULTS=3D"/home/jenkins/jobs/arago-core-tisdk-nightly/workspace"

--_000_B0581B5571079145BA1CD78C126DBDE72E7CA717DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:ns0=3D"urn:schemas-microsof=
t-com:office:smarttags">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<title>Status for 04/25/13</title>
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
h2
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:18.0pt;
	font-family:"Times New Roman";
	font-weight:bold;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">BTW, there was a github outage yesterd=
ay:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Courier New"=
><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:=
navy">Error: Fetcher failure: Fetch command failed with exit code 128, outp=
ut:<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Courier New"=
><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:=
navy">fatal: remote error:
<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Courier New"=
><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;color:=
navy">&nbsp; Storage server temporarily offline. See http://status.github.c=
om for GitHub system status.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">A more recent nightly build was succes=
sful.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy"><o:p>&nbsp;</o:p></span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">--
</span></font><font color=3D"navy"><span style=3D"color:navy"><o:p></o:p></=
span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" color=3D"navy" face=3D"Arial"><span=
 style=3D"font-size:
10.0pt;font-family:Arial;color:navy">Denys</span></font><font color=3D"navy=
"><span style=3D"color:navy"><o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"navy" face=3D"Times New Ro=
man"><span style=3D"font-size:12.0pt;color:navy">&nbsp;</span></font><o:p><=
/o:p></p>
</div>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><font=
 size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt">
<hr size=3D"2" width=3D"100%" align=3D"center" tabindex=3D"-1">
</span></font></div>
<p class=3D"MsoNormal"><b><font size=3D"2" face=3D"Tahoma"><span style=3D"f=
ont-size:10.0pt;
font-family:Tahoma;font-weight:bold">From:</span></font></b><font size=3D"2=
" face=3D"Tahoma"><span style=3D"font-size:10.0pt;font-family:Tahoma"> meta=
-arago-bounces@arago-project.org
 [mailto:meta-arago-bounces@arago-project.org] <b><span style=3D"font-weigh=
t:bold">On Behalf Of
</span></b>Dmytriyenko, Denys<br>
<b><span style=3D"font-weight:bold">Sent:</span></b> Thursday, April 25, 20=
13 7:29 PM<br>
<b><span style=3D"font-weight:bold">To:</span></b> meta-arago@arago-project=
.org<br>
<b><span style=3D"font-weight:bold">Subject:</span></b> [meta-arago] [night=
ly] Core TISDK 2013.04 build 2013-04-25_16-46-49</span></font><o:p></o:p></=
p>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:
12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Status for 04/25/13<o:p></o:p></span></font></b></h2>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">BUILD_ID: build-2013-04-25_16-47-54<o:p></o:p></span></font></b></h2=
>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Clean Build: true<o:p></o:p></span></font></b></h2>
<h2><b><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-size:1=
8.0pt">Clean Sources: false<o:p></o:p></span></font></b></h2>
<h2><b><u><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-siz=
e:18.0pt">Repository Revisions</span></font></u><o:p></o:p></b></h2>
<table class=3D"MsoNormalTable" border=3D"1" cellspacing=3D"1" cellpadding=
=3D"0">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Repository<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Git URL<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Branch<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Commit ID<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Layers<o:p></o:p></span></font></b></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">bitbake<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.openembedded.org/bitbake<o:p></o:p></span>=
</font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">master<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">1.17.0<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3D<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">meta-arago<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://arago-project.org/git/meta-arago.git<o:p></o:p=
></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">master<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3Dmeta-arago-distro:meta-arago-extras<o:p></o=
:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">meta-openembedded<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.openembedded.org/meta-openembedded<o:p></o=
:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">danny<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3Dtoolchain-layer:meta-oe<o:p></o:p></span></=
font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">meta-ti<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://arago-project.org/git/meta-ti.git<o:p></o:p></=
span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">danny<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3D<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">meta-linaro<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.linaro.org/openembedded/meta-linaro.git<o:=
p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">danny<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3D<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">oe-core<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">git://git.openembedded.org/openembedded-core<o:p></o=
:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">danny<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">HEAD<o:p></o:p></span></font></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">layers=3Dmeta<o:p></o:p></span></font></p>
</td>
</tr>
</tbody>
</table>
<h2><b><u><font size=3D"5" face=3D"Times New Roman"><span style=3D"font-siz=
e:18.0pt">Build and Target Test Results</span></font></u><o:p></o:p></b></h=
2>
<table class=3D"MsoNormalTable" border=3D"1" cellspacing=3D"1" cellpadding=
=3D"0">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Machine<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Build Result<o:p></o:p></span></font></b></p>
</td>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><b><fon=
t size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0pt;font-=
weight:bold">Target Test Result<o:p></o:p></span></font></b></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am335x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"lime" style=3D"background:lime;padding:.75pt .75pt .75pt .75=
pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">PASSED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am37x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">omap5-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">beagleboard<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am3517-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">am180x-evm<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"red" style=3D"background:red;padding:.75pt .75pt .75pt .75pt=
">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">FAILED<o:p></o:p></span></font></p>
</td>
<td bgcolor=3D"yellow" style=3D"background:yellow;padding:.75pt .75pt .75pt=
 .75pt">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Times New Roman"><span styl=
e=3D"font-size:12.0pt">SKIPPED<o:p></o:p></span></font></p>
</td>
</tr>
</tbody>
</table>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">These builds were performed using the build-oesdk.sh script at:
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">git://arago-project.org/git/projects/tisdk-build-scripts.git
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">The configuration file passed to this script had the contents:
<o:p></o:p></span></font></p>
<p><font size=3D"3" face=3D"Times New Roman"><span style=3D"font-size:12.0p=
t">MANDATORY_INPUTS=3D&quot;MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUIL=
D_ID SCRIPTS_ROOT BUILD_ROOT TEST_ROOT PACKAGE_ROOT DEPLOY_ROOT FS_FILTER S=
DK_FILTER FS_IMAGE_TYPE SDK_IMAGE_TYPE NFS_ROOT
 CONFIG_FILE LOG_DIR TISDK_VERSION&quot;<br>
TISDK_VERSION=3D&quot;2013.04&quot;<br>
MACHINES=3D&quot;am335x-evm am37x-evm omap5-evm beagleboard am3517-evm am18=
0x-evm&quot;<br>
NUM_ARM9_BUILDS=3D&quot;1&quot;<br>
NUM_CORTEX_BUILDS=3D&quot;1&quot;<br>
TOOLCHAIN_ROOT_ARM9=3D&quot;/opt/arago-2011.09/armv5te/bin/&quot;<br>
TOOLCHAIN_ROOT_CORTEX=3D&quot;/opt/arago-2011.09/armv7a/bin/&quot;<br>
BUILD_ID=3D&quot;`date &#43;build-%F_%H-%M-%S`&quot;<br>
SCRIPTS_ROOT=3D&quot;$PWD&quot;<br>
BUILD_ROOT=3D&quot;/home/jenkins/tisdk-build&quot;<br>
TEST_ROOT=3D&quot;$BUILD_ROOT/testing&quot;<br>
PACKAGE_ROOT=3D&quot;$BUILD_ROOT/packaging&quot;<br>
DEPLOY_ROOT=3D&quot;$BUILD_ROOT/deploy/$TISDK_VERSION&quot;<br>
FS_FILTER=3D&quot;tisdk-rootfs-&quot;<br>
FS_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
SDK_FILTER=3D&quot;arago-core-tisdk-image-&quot;<br>
SDK_IMAGE_TYPE=3D&quot;tar.gz&quot;<br>
NFS_ROOT=3D&quot;/home/jenkins/nfs-root&quot;<br>
SOURCE_DIR=3D&quot;${BUILD_ROOT}/sources&quot;<br>
CLEAN_BUILD=3D&quot;true&quot;<br>
CLEAN_ALL=3D&quot;false&quot;<br>
CONFIG_FILE=3D&quot;${BUILD_ROOT}/configs/arago-danny-config.txt&quot;<br>
LOG_DIR=3D&quot;${BUILD_ROOT}/log-files&quot;<br>
DL_DIR=3D&quot;/OE/downloads&quot;<br>
INSTALLER_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/installer_content&q=
uot;<br>
TEST_SCRIPTS=3D&quot;$SCRIPTS_ROOT/test-scripts&quot;<br>
TEST_SCRIPTS_TGT=3D&quot;home/root/test-scripts&quot;<br>
TEST_LOCAL_IFACE=3D&quot;eth1&quot;<br>
OPENTEST_CLI=3D&quot;$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz&quot;<br>
OPENTEST_TEE_IP=3D&quot;10.218.102.142&quot;<br>
RUN_BUILD_TESTS=3D&quot;true&quot;<br>
STAF_ROOT=3D&quot;/usr/local/staf&quot;<br>
SKIP_TEST_FAILURES=3D&quot;false&quot;<br>
PRODUCTIZE_SDK=3D&quot;false&quot;<br>
BITBAKE_COMMAND=3D&quot;arago-core-tisdk-image&quot;<br>
RESULTS_CONFIG_COMMENTS=3D&quot;false&quot;<br>
INSTALL_JAMMER=3D&quot;/home/jenkins/installjammer&quot;<br>
INSTALLER_ROOT=3D&quot;$BUILD_ROOT/installer&quot;<br>
MPI_FILE=3D&quot;$SCRIPTS_ROOT/mpi-files/ti-sdk-base.mpi&quot;<br>
SD_CARD_CONTENT=3D&quot;/home/jenkins/extra-files/sd_content&quot;<br>
WEBGEN_ROOT=3D&quot;/home/jenkins/webgen&quot;<br>
WEB_EXTRAS_ROOT=3D&quot;/home/jenkins/extra-files/web_content&quot;<br>
WEBGEN_MAK_ROOT=3D&quot;$SCRIPTS_ROOT/publish-sdk-data&quot;<br>
COPY_TO_WEB=3D&quot;true&quot;<br>
WEB_HOST=3D&quot;&quot;<br>
CLEAN_AFTER_COPY=3D&quot;true&quot;<br>
BACKUP_RESULTS=3D&quot;/home/jenkins/jobs/arago-core-tisdk-nightly/workspac=
e&quot;<o:p></o:p></span></font></p>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E7CA717DLEE08entticom_--
