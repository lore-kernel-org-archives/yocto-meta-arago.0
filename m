Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7F5BB52979
	for <meta-arago@arago-project.org>;
	Tue, 28 May 2013 23:10:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4SNA17k025644
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 18:10:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4SNA0Bv030542
	for <meta-arago@arago-project.org>; Tue, 28 May 2013 18:10:00 -0500
Received: from DLEE09.ent.ti.com ([fe80::d03e:3cf4:73ad:d589]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 28 May 2013 18:10:00 -0500
From: "Zhang, Hao" <hzhang@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: QA Issue warnings in the Yocto build
Thread-Index: Ac5b+Hoa5EJtwzVzRAWWhqcLYd27uQ==
Date: Tue, 28 May 2013 23:09:59 +0000
Message-ID: <ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3@DLEE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: QA Issue warnings in the Yocto build
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
X-List-Received-Date: Tue, 28 May 2013 23:10:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3DLEE09entticom_"

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3DLEE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We found a lot of QA issues in the nightly Yocto build, are these warnings =
causing any real problems? And how can we fix these warnings:

WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-audio/usr/lib/python2.7/lib-dynload/ossaudiodev.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-audio/usr/lib/python2.7/lib-dynload/audioop.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-bsddb/usr/lib/python2.7/lib-dynload/_bsddb.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_locale.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_tw.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/unicodedata.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_jp.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_multibytecodec.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_kr.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_cn.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_hk.so'
WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/gtbldadm/yocto/mcs=
dk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external-linaro-toolchain=
/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3/packages-split/p=
ython-codecs/usr/lib/python2.7/lib-dynload/_codecs_iso2022.so'

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3DLEE09entticom_
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
	{font-family:Verdana;
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
<pre><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,&quot;s=
ans-serif&quot;">We found a lot of QA issues in the nightly Yocto build, ar=
e these warnings causing any real problems? And how can we fix these warnin=
gs: <br><br></span>WARNING: QA Issue: No GNU_HASH in the elf binary: '/home=
/gtbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-extern=
al-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0=
.3/packages-split/python-audio/usr/lib/python2.7/lib-dynload/ossaudiodev.so=
'<o:p></o:p></pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-audio/usr/lib/python2.7/lib-dynload/audioop.so'<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-bsddb/usr/lib/python2.7/lib-dynload/_bsddb.so'<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_locale.so'<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_tw.so'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/unicodedata.so'=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_jp.so'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_multibytecodec=
.so'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_kr.so'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_cn.so'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_hk.so'<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: QA Issue: No GNU_HASH in the elf binary: '/home/g=
tbldadm/yocto/mcsdk-3_00_00_11/oe-layersetup-mcsdk/build/arago-tmp-external=
-linaro-toolchain/work/armv7ahf-vfp-neon-oe-linux-gnueabi/python-2.7.3-r0.3=
/packages-split/python-codecs/usr/lib/python2.7/lib-dynload/_codecs_iso2022=
.so'<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_ECA334CFBA16F74DB2C66A2F1181F4D63C2BACD3DLEE09entticom_--
