Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BBDB252A1C
	for <meta-arago@arago-project.org>;
	Mon,  2 May 2016 18:59:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u42IxlgG017847
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 13:59:47 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u42Ixljn005091
	for <meta-arago@arago-project.org>; Mon, 2 May 2016 13:59:47 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Mon, 2 May 2016 13:59:47 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: k2 build failures
Thread-Index: AdGknwkd99uUCvbuTRSxk3OTvKx+Gg==
Date: Mon, 2 May 2016 18:59:47 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: k2 build failures
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
X-List-Received-Date: Mon, 02 May 2016 18:59:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4B26FB5A64EBA14C87266869E037F9581426AF5ADFLE09entticom_"

--_000_4B26FB5A64EBA14C87266869E037F9581426AF5ADFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With migrating to krogoth, the k2 build failures are due to conflicts betwe=
en the ocl-gl-headers and mesa, and I've discovered why mesa is being pulle=
d in.

In the opencv recipe, we are inheriting "cmake_qt5". This bbclass was chang=
ed to add the dependency on qtbase, and this brings in mesa for keystone.

I'm not sure of the best way to handle this. The easiest hack is the remove=
 qtbase from the opencv dependencies for keystone only.

Would it be possible to replace opencl's dependency on "ocl-gl-headers" wit=
h "mesa-gl"? In the past, I made some attempts to use "mesa", but with the =
SGX platforms, there was always a conflict with the ti sgx drivers, as both=
 were installing common gles files. I do not remember mesa-gl being an opti=
on before.

Thank you,
Jake

--_000_4B26FB5A64EBA14C87266869E037F9581426AF5ADFLE09entticom_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
<p class=3D"MsoNormal">With migrating to krogoth, the k2 build failures are=
 due to conflicts between the ocl-gl-headers and mesa, and I&#8217;ve disco=
vered why mesa is being pulled in.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the opencv recipe, we are inheriting &#8220;cmake=
_qt5&#8221;. This bbclass was changed to add the dependency on qtbase, and =
this brings in mesa for keystone.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m not sure of the best way to handle this. T=
he easiest hack is the remove qtbase from the opencv dependencies for keyst=
one only.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Would it be possible to replace opencl&#8217;s depen=
dency on &#8220;ocl-gl-headers&#8221; with &#8220;mesa-gl&#8221;? In the pa=
st, I made some attempts to use &#8220;mesa&#8221;, but with the SGX platfo=
rms, there was always a conflict with the ti sgx drivers, as both were inst=
alling
 common gles files. I do not remember mesa-gl being an option before.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,<o:p></o:p></p>
<p class=3D"MsoNormal">Jake <o:p></o:p></p>
</div>
</body>
</html>

--_000_4B26FB5A64EBA14C87266869E037F9581426AF5ADFLE09entticom_--
