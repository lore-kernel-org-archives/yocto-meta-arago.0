Return-Path: <yuanzhao@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5696652993
	for <meta-arago@arago-project.org>;
	Tue, 17 Dec 2019 15:55:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHFrvEr127803
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 09:53:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576598037;
	bh=N/dAvQzqEhcmQH7zHJWSiEnOam3s9GuQeCH1bGJGlc0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gF7dDXOwlSxF5LDWIQ6K/XSnt1ckYlwiIUnmhM5qlh26snOokmkpeDLNFDQOrW1qW
	V63yQZjiKuYWb2nsaZFEiii8qm4IYtwgVKRiOuQBPJYJAV18r9KinaKnqfLIBt2CKX
	ga8qvwfCojHageCkhe9LcE5GnKUtUpP/hxBh78CI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBHFrvID126500
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Dec 2019 09:53:57 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Dec 2019 09:53:57 -0600
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1847.003; Tue, 17 Dec 2019 09:53:56 -0600
From: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: update
	version to 01.05.06.00
Thread-Index: AQHVtPE2Do6E6s/iHEmcL3RmfWqlw6e+eK9Q
Date: Tue, 17 Dec 2019 15:53:56 +0000
Message-ID: <48bd70a3eb774652b8a9f60c78a58a7b@ti.com>
References: <20191217144411.19000-1-yuanzhao@ti.com>
	<0f5d473bc7f54045a25b6297bb6c379e@ti.com>
In-Reply-To: <0f5d473bc7f54045a25b6297bb6c379e@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.48.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [master/thud/ti2019.05][PATCH v3] openmpacc: update	version to 01.05.06.00
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
X-List-Received-Date: Tue, 17 Dec 2019 15:55:34 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_48bd70a3eb774652b8a9f60c78a58a7bticom_"

--_000_48bd70a3eb774652b8a9f60c78a58a7bticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The changes are highlighted in red below.  These two lines are added from p=
atch v2 to patch v3.  It is more like a recipe/python script bug in the rec=
ipe update than the purpose of the recipe update.  It is probably a scope t=
hing, without these two lines, "cc_name"/"cxx_name" are empty after the if/=
else statement.



Do we need PATCH v4 to explain this?



- Yuan



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Tuesday, December 17, 2019 9:47 AM
To: Zhao (Compiler), Yuan; meta-arago@arago-project.org
Subject: RE: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: upda=
te version to 01.05.06.00



What are the changes? Please don't forget to summarize the changes between =
patch revisions. Thanks.



> -----Original Message-----

> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-

> bounces@arago-project.org] On Behalf Of Zhao (Compiler), Yuan

> Sent: Tuesday, December 17, 2019 9:44 AM

> To: meta-arago@arago-project.org

> Subject: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: update

> version to 01.05.06.00

>

> - Changes for openmpacc examples: Removed vecadd_lib, edmabw

> - Changes for clacc host_cc and host_link_cc parameters: Determine target

>   compiler name directly from CMake

> - Documentation update regarding no support for variadic functions in

>   target regions

>

> Signed-off-by: Gaurav Mitra <gaurav@ti.com>

> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>

> ---

>  .../recipes-ti/openmpacc/clacc_git.bb              | 34 ++++++++++++++++=
++----

>  .../recipes-ti/openmpacc/openmpacc-examples_git.bb |  8 +----

>  .../recipes-ti/openmpacc/openmpacc.inc             |  4 +--

>  .../recipes-ti/openmpacc/openmpacc_git.bb          |  4 ---

>  4 files changed, 31 insertions(+), 19 deletions(-)

>

> diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-

> arago-extras/recipes-ti/openmpacc/clacc_git.bb

> index 75ce4628..cecffa02 100644

> --- a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb

> +++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb

> @@ -2,7 +2,7 @@ SUMMARY =3D "TI OpenMP-Acc C compiler"

>

>  include openmpacc.inc

>

> -PR =3D "${INC_PR}.1"

> +PR =3D "${INC_PR}.0"

>

>  DEPENDS =3D "boost elfutils"

>  RDEPENDS_${PN} +=3D "clocl"

> @@ -18,16 +18,38 @@ export X86_HOST_ROOT =3D "${STAGING_DIR_HOST}"

>

>  PARALLEL_MAKE =3D ""

>

> +# The variables CLACC_CC and CLACC_CXX are used to point clacc to set it=
s

> +# host_cc and host_link_cc variables which were previously hardcoded in

> clacc.h.

> +# This adds support for different toolchain configurations to build clac=
c by

> +# passing in the compiler names at the build stage and removes correspon=
ding

> +# string replacement requirements in yocto recipes.

> +python __anonymous() {

> +    cc_name =3D ""

> +    cxx_name =3D ""

> +    if d.getVar("TOOLCHAIN_PREFIX"):

> +        cc_name =3D d.getVar("TOOLCHAIN_PREFIX") + "gcc"

> +        cxx_name =3D d.getVar("TOOLCHAIN_PREFIX") + "g++"

> +    else:

> +        cc_name =3D d.getVar("TARGET_PREFIX") + "gcc"

> +        cxx_name =3D d.getVar("TARGET_PREFIX") + "g++"

> +

> +    # Convert to upper case to workaround GCC preprocessor bug where the

> word

> +    # 'linux' is defined to be 1. This results in arm-linux-gnueabihf- b=
eing

> +    # stringized to arm-1-gnueabihf- by the GCC preprocessor. To workaro=
und

> this

> +    # bug, convert the names to upper case and send through. Clacc will =
convert

> +    # to lower case before usage.

> +    d.setVar("CLACC_CC_NAME", cc_name.upper())

> +    d.setVar("CLACC_CXX_NAME", cxx_name.upper())

> +}

> +

> +

>  EXTRA_OEMAKE =3D " -C ${S}/clacc \

>                    ${TARGET} \

>                    CXX=3D"${CXX}" \

> +                  CLACC_CC=3D"${CLACC_CC_NAME}" \

> +                  CLACC_CXX=3D"${CLACC_CXX_NAME}" \

>  "

>

> -do_configure() {

> -    sed "s|arm-linux-gnueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g" -i

> clacc/clacc.h

> -    sed "s|arm-linux-gnueabihf-g++|${TOOLCHAIN_PREFIX}g++|g" -i

> clacc/clacc.h

> -}

> -

>  do_compile() {

>      oe_runmake

>  }

> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-

> examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-

> examples_git.bb

> index b2f4122c..39902f8f 100644

> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb

> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb

> @@ -21,8 +21,6 @@ OMPACC_EXAMPLE_LIST =3D " target_update \

>                          local \

>                          null \

>                          dsplib_fft \

> -                        vecadd_lib \

> -                        edmabw \

>                          sub_section \

>  "

>

> @@ -35,7 +33,6 @@ python do_unpack_append() {

>      os.makedirs(s)

>      shutil.copy(os.path.join(git_dir,"Makefile"),s)

>      shutil.copy(os.path.join(git_dir,"make.inc"),s)

> -    shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)

>      for example in d.getVar("OMPACC_EXAMPLE_LIST").split():

>          shutil.copytree(os.path.join(git_dir,example), os.path.join(s,ex=
ample))

>  }

> @@ -47,11 +44,9 @@ EXTRA_OEMAKE =3D "

> TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \

>  MKFILELIST =3D "vecadd/Makefile vecadd_complex/Makefile dsplib_fft/Makef=
ile \

>  null/Makefile dspheap/Makefile target_implicit_map/Makefile

> printf_debug/Makefile \

>  edmamgr/Makefile vecadd_t/Makefile target_orphan_call/Makefile

> target_update/Makefile \

> -edmabw/Makefile sub_section/Makefile vecadd_lib/Makefile local/Makefile"

> +sub_section/Makefile local/Makefile"

>

>  do_configure() {

> -    sed "s|arm-linux-gnueabihf-gcc|${CC}|g" -i make.inc

> -    sed "s|arm-linux-gnueabihf-g++|${CXX}|g" -i make.inc

>      for f in ${MKFILELIST}; do

>          sed "s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|g"

> -i $f

>      done

> @@ -66,7 +61,6 @@ do_install() {

>

>      install -m 644 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc

>      install -m 644 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc

> -    install -m 644 ${B}/ompacc_env.sh ${D}${datadir}/ti/examples/openmpa=
cc

>

>      for ompacc_example in ${OMPACC_EXAMPLE_LIST}; do

>          install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example=
}

> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-

> arago-extras/recipes-ti/openmpacc/openmpacc.inc

> index ce0236d4..d33a156b 100644

> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc

> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc

> @@ -2,7 +2,7 @@ SUMMARY =3D "TI OpenMP Accelerator Model"

>  HOMEPAGE =3D "http://downloads.ti.com/mctools/esd/docs/openmpacc/"

>  LICENSE =3D "BSD"

>

> -PV =3D "1.5.4.0"

> +PV =3D "1.5.6.0"

>  INC_PR =3D "r0"

>

>  LIC_FILES_CHKSUM =3D

> "file://../debian/copyright;md5=3Daaa2a0939d08197132fc382e97b62eb0"

> @@ -13,7 +13,7 @@ OMPACC_GIT_URI =3D "git://git.ti.com/openmp/ti-

> openmpacc.git"

>  OMPACC_GIT_PROTOCOL =3D "git"

>  OMPACC_GIT_BRANCH =3D "master"

>

> -OMPACC_SRCREV =3D "808cef58b4ed196a9ced2310d419dbaf63dfbeb6"

> +OMPACC_SRCREV =3D "7c4e68a0bf73ec193edff9dfc23ea764ae6ad434"

>

>  BRANCH =3D "${OMPACC_GIT_BRANCH}"

>  SRC_URI =3D

> "${OMPACC_GIT_URI};protocol=3D${OMPACC_GIT_PROTOCOL};branch=3D${BRANC

> H}"

> diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

> b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

> index a28a9225..44b59a4f 100644

> --- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

> +++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb

> @@ -18,7 +18,3 @@ export LINUX_DEVKIT_ROOT =3D "${STAGING_DIR_HOST}"

>  EXTRA_OECMAKE +=3D "-DVERSION=3D"${PV}" -DBUILD_OUTPUT=3Dlib"

>

>  FILES_${PN} +=3D "/usr/share/ti/openmpacc/*"

> -

> -do_configure_prepend() {

> -          sed -i -e 's/-march=3Darmv7-a//' ${S}/libompacc/CMakeLists.txt

> -}

> --

> 2.14.1

>

> _______________________________________________

> meta-arago mailing list

> meta-arago@arago-project.org

> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_48bd70a3eb774652b8a9f60c78a58a7bticom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoPlainText">The changes are highlighted in <span style=3D"col=
or:red">red</span> below.&nbsp; These two lines are added from patch v2 to =
patch v3.&nbsp; It is more like a recipe/python script bug in the recipe up=
date than the purpose of the recipe update.&nbsp; It
 is probably a scope thing, without these two lines, &#8220;cc_name&#8221;/=
&#8221;cxx_name&#8221; are empty after the if/else statement.<o:p></o:p></p=
>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Do we need PATCH v4 to explain this?<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">- Yuan<o:p></o:p></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><o:p>&nbsp;</o:p></a>=
</p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Tuesday, December 17, 2019 9:47 AM<br>
To: Zhao (Compiler), Yuan; meta-arago@arago-project.org<br>
Subject: RE: [meta-arago] [master/thud/ti2019.05][PATCH v3] openmpacc: upda=
te version to 01.05.06.00</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">What are the changes? Please don't forget to summ=
arize the changes between patch revisions. Thanks.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; -----Original Message-----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; From: meta-arago-bounces@arago-project.org [=
mailto:meta-arago-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; bounces@arago-project.org] On Behalf Of Zhao=
 (Compiler), Yuan<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Sent: Tuesday, December 17, 2019 9:44 AM<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; To: meta-arago@arago-project.org<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; Subject: [meta-arago] [master/thud/ti2019.05=
][PATCH v3] openmpacc: update<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; version to 01.05.06.00<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; - Changes for openmpacc examples: Removed ve=
cadd_lib, edmabw<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; - Changes for clacc host_cc and host_link_cc=
 parameters: Determine target<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; compiler name directly from CMak=
e<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; - Documentation update regarding no support =
for variadic functions in<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp; target regions<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Gaurav Mitra &lt;gaurav@ti.co=
m&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Yuan Zhao &lt;yuanzhao@ti.com=
&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; .../recipes-ti/openmpacc/clacc_git.bb&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 34 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; .../recipes-ti/openmpacc/openmpacc-exa=
mples_git.bb |&nbsp; 8 &#43;----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; .../recipes-ti/openmpacc/openmpacc.inc=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp; 4 &#43;--<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; .../recipes-ti/openmpacc/openmpacc_git=
.bb&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp; 4 ---<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 4 files changed, 31 insertions(&#43;),=
 19 deletions(-)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/meta-arago-extras/recipes-ti/op=
enmpacc/clacc_git.bb b/meta-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; arago-extras/recipes-ti/openmpacc/clacc_git.=
bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 75ce4628..cecffa02 100644<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; --- a/meta-arago-extras/recipes-ti/openmpacc=
/clacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-=
ti/openmpacc/clacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -2,7 &#43;2,7 @@ SUMMARY =3D &quot;TI Ope=
nMP-Acc C compiler&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; include openmpacc.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -PR =3D &quot;${INC_PR}.1&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; DEPENDS =3D &quot;boost elfutils&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; RDEPENDS_${PN} &#43;=3D &quot;clocl&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -18,16 &#43;18,38 @@ export X86_HOST_ROOT=
 =3D &quot;${STAGING_DIR_HOST}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; PARALLEL_MAKE =3D &quot;&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# The variables CLACC_CC and CLACC_CXX =
are used to point clacc to set its<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# host_cc and host_link_cc variables wh=
ich were previously hardcoded in<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; clacc.h.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# This adds support for different toolc=
hain configurations to build clacc by<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# passing in the compiler names at the =
build stage and removes corresponding<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# string replacement requirements in yo=
cto recipes.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;python __anonymous() {<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:red">&gt; &#43;&nbsp;&nbsp;&=
nbsp; cc_name =3D &quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:red">&gt; &#43;&nbsp;&nbsp;&=
nbsp; cxx_name =3D &quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; if d.getVar(&quot;TO=
OLCHAIN_PREFIX&quot;):<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cc_name =3D d.getVar(&quot;TOOLCHAIN_PREFIX&quot;) &#43; &quot;gcc&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cxx_name =3D d.getVar(&quot;TOOLCHAIN_PREFIX&quot;) &#43; &quot;g&#43;&=
#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; else:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cc_name =3D d.getVar(&quot;TARGET_PREFIX&quot;) &#43; &quot;gcc&quot;<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cxx_name =3D d.getVar(&quot;TARGET_PREFIX&quot;) &#43; &quot;g&#43;&#43=
;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # Convert to upper c=
ase to workaround GCC preprocessor bug where the<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; word<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # 'linux' is defined=
 to be 1. This results in arm-linux-gnueabihf- being<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # stringized to arm-=
1-gnueabihf- by the GCC preprocessor. To workaround<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; this<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # bug, convert the n=
ames to upper case and send through. Clacc will convert<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # to lower case befo=
re usage.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; d.setVar(&quot;CLACC=
_CC_NAME&quot;, cc_name.upper())<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; d.setVar(&quot;CLACC=
_CXX_NAME&quot;, cxx_name.upper())<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; EXTRA_OEMAKE =3D &quot; -C ${S}/clacc =
\<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${TAR=
GET} \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CXX=
=3D&quot;${CXX}&quot; \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CLACC_CC=3D=
&quot;${CLACC_CC_NAME}&quot; \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CLACC_CXX=
=3D&quot;${CLACC_CXX_NAME}&quot; \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -do_configure() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; sed &quot;s|arm-linux-gn=
ueabihf-gcc|${TOOLCHAIN_PREFIX}gcc|g&quot; -i<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; clacc/clacc.h<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; sed &quot;s|arm-linux-gn=
ueabihf-g&#43;&#43;|${TOOLCHAIN_PREFIX}g&#43;&#43;|g&quot; -i<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; clacc/clacc.h<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; do_compile() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe_runmake<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/meta-arago-extras/recipes-ti/op=
enmpacc/openmpacc-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; examples_git.bb b/meta-arago-extras/recipes-=
ti/openmpacc/openmpacc-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; examples_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index b2f4122c..39902f8f 100644<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; --- a/meta-arago-extras/recipes-ti/openmpacc=
/openmpacc-examples_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-=
ti/openmpacc/openmpacc-examples_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -21,8 &#43;21,6 @@ OMPACC_EXAMPLE_LIST =
=3D &quot; target_update \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; local \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; null \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dsplib_fft \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; vecadd_lib \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; edmabw \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sub_section \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -35,7 &#43;33,6 @@ python do_unpack_appen=
d() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.makedirs(s)=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shutil.copy(os=
.path.join(git_dir,&quot;Makefile&quot;),s)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shutil.copy(os=
.path.join(git_dir,&quot;make.inc&quot;),s)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; shutil.copy(os.path.join=
(git_dir,&quot;ompacc_env.sh&quot;),s)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for example in=
 d.getVar(&quot;OMPACC_EXAMPLE_LIST&quot;).split():<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; shutil.copytree(os.path.join(git_dir,example), os.path.join(s,exa=
mple))<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -47,11 &#43;44,9 @@ EXTRA_OEMAKE =3D &quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; TARGET_ROOTDIR=3D${STAGING_DIR_HOST} \<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; MKFILELIST =3D &quot;vecadd/Makefile v=
ecadd_complex/Makefile dsplib_fft/Makefile \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; null/Makefile dspheap/Makefile target_=
implicit_map/Makefile<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; printf_debug/Makefile \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; edmamgr/Makefile vecadd_t/Makefile tar=
get_orphan_call/Makefile<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; target_update/Makefile \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -edmabw/Makefile sub_section/Makefile vecadd=
_lib/Makefile local/Makefile&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;sub_section/Makefile local/Makefile&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; do_configure() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; sed &quot;s|arm-linux-gn=
ueabihf-gcc|${CC}|g&quot; -i make.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; sed &quot;s|arm-linux-gn=
ueabihf-g&#43;&#43;|${CXX}|g&quot; -i make.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for f in ${MKF=
ILELIST}; do<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; sed &quot;s|-fopenmp|-fopenmp ${TUNE_CCARGS}${TOOLCHAIN_OPTIONS}|=
g&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -i $f<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; @@ -66,7 &#43;61,6 @@ do_install() {<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 644=
 ${B}/Makefile ${D}${datadir}/ti/examples/openmpacc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -m 644=
 ${B}/make.inc ${D}${datadir}/ti/examples/openmpacc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp; install -m 644 ${B}/ompa=
cc_env.sh ${D}${datadir}/ti/examples/openmpacc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for ompacc_exa=
mple in ${OMPACC_EXAMPLE_LIST}; do<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; install -d ${D}${datadir}/ti/examples/openmpacc/${ompacc_example}=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/meta-arago-extras/recipes-ti/op=
enmpacc/openmpacc.inc b/meta-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; arago-extras/recipes-ti/openmpacc/openmpacc.=
inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index ce0236d4..d33a156b 100644<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; --- a/meta-arago-extras/recipes-ti/openmpacc=
/openmpacc.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-=
ti/openmpacc/openmpacc.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -2,7 &#43;2,7 @@ SUMMARY =3D &quot;TI Ope=
nMP Accelerator Model&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; HOMEPAGE =3D &quot;http://downloads.ti=
.com/mctools/esd/docs/openmpacc/&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; LICENSE =3D &quot;BSD&quot;<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -PV =3D &quot;1.5.4.0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;1.5.6.0&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt;&nbsp; INC_PR =3D &quot;r0&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; LIC_FILES_CHKSUM =3D<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &quot;file://../debian/copyright;md5=3Daaa2a=
0939d08197132fc382e97b62eb0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -13,7 &#43;13,7 @@ OMPACC_GIT_URI =3D &qu=
ot;git://git.ti.com/openmp/ti-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; openmpacc.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; OMPACC_GIT_PROTOCOL =3D &quot;git&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; OMPACC_GIT_BRANCH =3D &quot;master&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -OMPACC_SRCREV =3D &quot;808cef58b4ed196a9ce=
d2310d419dbaf63dfbeb6&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;OMPACC_SRCREV =3D &quot;7c4e68a0bf73ec1=
93edff9dfc23ea764ae6ad434&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; BRANCH =3D &quot;${OMPACC_GIT_BRANCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; SRC_URI =3D<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &quot;${OMPACC_GIT_URI};protocol=3D${OMPACC_=
GIT_PROTOCOL};branch=3D${BRANC<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; H}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/meta-arago-extras/recipes-ti/op=
enmpacc/openmpacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/meta-arago-extras/recipes-ti/openmpacc/ope=
nmpacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index a28a9225..44b59a4f 100644<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; --- a/meta-arago-extras/recipes-ti/openmpacc=
/openmpacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-=
ti/openmpacc/openmpacc_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -18,7 &#43;18,3 @@ export LINUX_DEVKIT_RO=
OT =3D &quot;${STAGING_DIR_HOST}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; EXTRA_OECMAKE &#43;=3D &quot;-DVERSION=
=3D&quot;${PV}&quot; -DBUILD_OUTPUT=3Dlib&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; FILES_${PN} &#43;=3D &quot;/usr/share/=
ti/openmpacc/*&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -do_configure_prepend() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; sed -i -e 's/-march=3Darmv7-a//' ${S}/libompacc/CMakeLists.txt<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 2.14.1<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ____________________________________________=
___<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-arago mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-arago@arago-project.org<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; http://arago-project.org/cgi-bin/mailman/lis=
tinfo/meta-arago<o:p></o:p></p>
</div>
</body>
</html>

--_000_48bd70a3eb774652b8a9f60c78a58a7bticom_--
