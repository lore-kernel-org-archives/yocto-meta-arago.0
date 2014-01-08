Return-Path: <nageswari@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D964E52A67
	for <meta-arago@arago-project.org>;
	Wed,  8 Jan 2014 05:08:03 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s08581Y9027727
	for <meta-arago@arago-project.org>; Tue, 7 Jan 2014 23:08:02 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0857xxx019539
	for <meta-arago@arago-project.org>; Wed, 8 Jan 2014 10:38:00 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 8 Jan 2014 13:07:59 +0800
From: "Srinivasan, Nageswari" <nageswari@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] FW: Do_rootfs failure with tools-sdk in
	EXTRA_IMAGE_FEATURES
Thread-Index: Ac8MLtpvB3o0HfeJRxWFbqiCDrzzOgAACMtwAAAYZDA=
Date: Wed, 8 Jan 2014 05:07:58 +0000
Message-ID: <464859D4BE03A84686BA47749242C1D03EFEFCFE@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: FW: Do_rootfs failure with tools-sdk in	EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Wed, 08 Jan 2014 05:08:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_464859D4BE03A84686BA47749242C1D03EFEFCFEDBDE04entticom_"

--_000_464859D4BE03A84686BA47749242C1D03EFEFCFEDBDE04entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Mrinmayee,

I am also facing similar issues while building for EPOS SDK.

Installing packagegroup-arago-tisdk-amsdk-sdk-host (1.0-r17) to root...
| Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago=
-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arag=
o-tisdk-amsdk-sdk-host_1.0-r17_am438x_epos_evm.ipk.
| Installing packagegroup-arago-tisdk-epossdk-sdk-host (1.0-r1) to root...
| Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago=
-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arag=
o-tisdk-epossdk-sdk-host_1.0-r1_am438x_epos_evm.ipk.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-arago-tisdk-addons-sdk-host:
|  *    arm-benchmarks-src *    am-sysinfo-src *        ti-linux-secure-exa=
mples-src *  oprofile-example-src *
|  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-addo=
ns-sdk-host.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-arago-tisdk-matrix-sdk-host:
|  *    matrix-gui-src *
|  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-matr=
ix-sdk-host.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-arago-tisdk-amsdk-sdk-host:
|  *    u-boot-am43xx-src *     linux-am43xx-src *      oe-layersetup-src *
|  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-amsd=
k-sdk-host.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r packagegroup-arago-tisdk-epossdk-sdk-host:
|  *    starterware-src *       examples-src *  ppa-am438x-epos-evm-src *
|  * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-epos=
sdk-sdk-host.

Regards,
Nageswari


From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Hingolikar, Mrinmayee
Sent: Wednesday, January 08, 2014 10:34 AM
To: meta-arago@arago-project.org
Cc: R, Karthik
Subject: [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_F=
EATURES


Hi all,

I am trying to add development tools in the filesystem. After adding tools-=
sdk in EXTRA_IMAGE_FEATURES, the build failed in the rootfs task. Snapshot =
of the log:
Collected errors:
* satisfy_dependencies_for: Cannot satisfy the following dependencies for p=
ackagegroup-core-sdk:
*      ldd *
* opkg_install_cmd: Cannot install package packagegroup-core-sdk.

Ldd package provided by eglibc is not getting built.

Similar errors was seen when I built arago-console-image with the arago-dyl=
an-config.
Is this a known issue and any pointers to resolve it?

Regards,
Mrinmayee


--_000_464859D4BE03A84686BA47749242C1D03EFEFCFEDBDE04entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Mrinmayee,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I am also facing simil=
ar issues while building for EPOS SDK.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Installing packagegrou=
p-arago-tisdk-amsdk-sdk-host (1.0-r17) to root...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| Downloading file:/db=
/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-t=
oolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-amsdk-sdk-host=
_1.0-r17_am438x_epos_evm.ipk.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| Installing packagegr=
oup-arago-tisdk-epossdk-sdk-host (1.0-r1) to root...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| Downloading file:/db=
/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-t=
oolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-epossdk-sdk-ho=
st_1.0-r1_am438x_epos_evm.ipk.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">| Collected errors:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * satisfy_depe=
ndencies_for: Cannot satisfy the following dependencies for packagegroup-ar=
ago-tisdk-addons-sdk-host:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; *&nbsp;&nbsp;&=
nbsp; arm-benchmarks-src *&nbsp;&nbsp;&nbsp; am-sysinfo-src *&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-linux-secure-examples-src *&nbsp; oprofile-=
example-src *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * opkg_install=
_cmd: Cannot install package packagegroup-arago-tisdk-addons-sdk-host.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * satisfy_depe=
ndencies_for: Cannot satisfy the following dependencies for packagegroup-ar=
ago-tisdk-matrix-sdk-host:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; *&nbsp;&nbsp;&=
nbsp; matrix-gui-src *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * opkg_install=
_cmd: Cannot install package packagegroup-arago-tisdk-matrix-sdk-host.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * satisfy_depe=
ndencies_for: Cannot satisfy the following dependencies for packagegroup-ar=
ago-tisdk-amsdk-sdk-host:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; *&nbsp;&nbsp;&=
nbsp; u-boot-am43xx-src *&nbsp;&nbsp;&nbsp;&nbsp; linux-am43xx-src *&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; oe-layersetup-src *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * opkg_install=
_cmd: Cannot install package packagegroup-arago-tisdk-amsdk-sdk-host.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * satisfy_depe=
ndencies_for: Cannot satisfy the following dependencies for packagegroup-ar=
ago-tisdk-epossdk-sdk-host:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; *&nbsp;&nbsp;&=
nbsp; starterware-src *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; examples-src *&=
nbsp; ppa-am438x-epos-evm-src *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">|&nbsp; * opkg_install=
_cmd: Cannot install package packagegroup-arago-tisdk-epossdk-sdk-host.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Nageswari<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
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
<b>On Behalf Of </b>Hingolikar, Mrinmayee<br>
<b>Sent:</b> Wednesday, January 08, 2014 10:34 AM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Cc:</b> R, Karthik<br>
<b>Subject:</b> [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_=
IMAGE_FEATURES<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to add development tools in the filesyst=
em. After adding tools-sdk in EXTRA_IMAGE_FEATURES, the build failed in the=
 rootfs task. Snapshot of the log:<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:red">Collected errors:<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">* satisfy_dependencies_for=
: Cannot satisfy the following dependencies for packagegroup-core-sdk:<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">*&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ldd *<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red">* opkg_install_cmd: Cannot=
 install package packagegroup-core-sdk.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:red"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal">Ldd package provided by eglibc is not getting built.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Similar errors was seen when I built arago-console-i=
mage with the
<b>arago-dylan-config.<o:p></o:p></b></p>
<p class=3D"MsoNormal">Is this a known issue and any pointers to resolve it=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_464859D4BE03A84686BA47749242C1D03EFEFCFEDBDE04entticom_--
