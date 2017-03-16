Return-Path: <manisha.agrawal@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 51506520E4
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 19:16:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GJGmcj013507
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489691808;
	bh=mcK6/vposmSwfwcDzP2jCAxvwxXbi+b8B4VgNM0vQHU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GYQMcAu/mbgDW60miaGkbJJX9AmIOlp/XPkoPHgCz1tjwCi4mXG99vi6Wtw8k4V6w
	Lyx0Ky2XrL0ha2dw1rcvo1a7uhBUqsQMMTkCibHrJpJV39tdNTIe7dp12un60GU6aK
	fXuua4N3k3n9ha5CtsZg9DPlbrUlhhS+9N6ZkaUg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GJGhTt009687
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:16:43 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 16 Mar 2017 14:16:42 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master/morty][PATCH] recipes-multimedia :
	video-graphics-test : new demo
Thread-Index: AQHSnCu79an4JXTH8USMqnoDUAsQdaGVP9QAgAKaIAA=
Date: Thu, 16 Mar 2017 19:16:41 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EB84BC5@DFLE12.ent.ti.com>
References: <20170313185755.12918-1-manisha.agrawal@ti.com>
	<20170314222734.GR578@edge>
In-Reply-To: <20170314222734.GR578@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master/morty][PATCH] recipes-multimedia : video-graphics-test : new demo
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
X-List-Received-Date: Thu, 16 Mar 2017 19:16:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I can make separate patches. What do you suggest for changes in meta-arago-=
distro/conf/distro/arago-source-ipk.conf??

Regards,
Manisha


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, March 14, 2017 5:28 PM
To: Agrawal, Manisha
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [master/morty][PATCH] recipes-multimedia : video-=
graphics-test : new demo

Manisha,

Thanks for the patch.

This should rather be 2 or 3 patches - adding the new recipe, adding src-ip=
k and then patching the tisdk-makefile.

Moreover, this won't apply to morty/master due to this change:
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3Dd28779a=
38e75bf3e096a5a7b0cf160d7520f4aca

--
Denys


On Mon, Mar 13, 2017 at 01:57:55PM -0500, Manisha Agrawal wrote:
> Add new demo to Processor Linux SDK. This demo is package along with
> source code in PLSDK and binary available under /usr/bin folder of the
> filesystem. The demo is target to showcase AM57x Display Sub System
> capabilities, 2D graphics accelerator GC320 video API usage for overlay
> and QT drawing using 3D graphics accelerator. In this particular release
> the demo is showing the DRM API usage for scaling and overlaying using
> DSS and special QT QPA eglfs-kms for rendering using SGX. QT is the
> master of the drm resource but shares the handle with application too.
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |  3 +++
>  .../ti-tisdk-makefile/Makefile_video-graphics-test | 24 ++++++++++++++++=
+++
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  1 +
>  .../video-graphics-test/video-graphics-test_1.0.bb | 28 ++++++++++++++++=
++++++
>  4 files changed, 56 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_video-graphics-test
>  create mode 100644 meta-arago-extras/recipes-multimedia/video-graphics-t=
est/video-graphics-test_1.0.bb
>=20
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-a=
rago-distro/conf/distro/arago-source-ipk.conf
> index 96f2db2..5941519 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-application=
s/${PN}-${PV}"
>  CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
>  SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${PN}-$=
{PV}"
> =20
> +CREATE_SRCIPK_pn-video-graphics-test =3D "1"
> +SRCIPK_INSTALL_DIR_pn-video-graphics-test =3D "example-applications/${PN=
}-${PV}"
> +
>  CREATE_SRCIPK_pn-image-gallery =3D "1"
>  SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
> =20
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_video-graphics-test b/meta-arago-distro/recipes-tisdk/ti-t=
isdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
> new file mode 100644
> index 0000000..1ffc395
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_video-graphics-test
> @@ -0,0 +1,24 @@
> +# QT Video Graphics build targets
> +video-graphics-test:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building Video Graphics Test
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; ma=
ke -f Makefile.build
> +
> +video-graphics-test_clean:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@echo    Building Video Graphics Test
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; ma=
ke -f Makefile.build clean
> +
> +video-graphics-test_install:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@echo   Installing Video Graphics Test - Release version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; ma=
ke -f Makefile.build install
> +
> +video-graphics-test_install_debug:
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@echo   Installing Video Graphics Test - Debug version
> +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; ma=
ke -f Makefile.build install_debug
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk=
-makefile_1.0.bb
> index 202078c..40ba3be 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
> @@ -31,6 +31,7 @@ SRC_URI =3D "\
>      file://Makefile_omapconf \
>      file://Makefile_oprofile-example \
>      file://Makefile_dual-camera-demo \
> +    file://Makefile_video-graphics-test \
>      file://Makefile_image-gallery \
>      file://Makefile_cryptodev \
>      file://Makefile_cmem-mod \
> diff --git a/meta-arago-extras/recipes-multimedia/video-graphics-test/vid=
eo-graphics-test_1.0.bb b/meta-arago-extras/recipes-multimedia/video-graphi=
cs-test/video-graphics-test_1.0.bb
> new file mode 100644
> index 0000000..4e428b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-grap=
hics-test_1.0.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Test applications for video and graphics interface"
> +HOMEPAGE =3D "https://git.ti.com/sitara-linux/video-graphics-test"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f19f52=
eb5"
> +
> +DEPENDS +=3D "libdrm"
> +
> +PR =3D "r0"
> +
> +BRANCH =3D "master"
> +SRCREV =3D "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
> +
> +SRC_URI =3D "git://git.ti.com/sitara-linux/video-graphics-test.git;proto=
col=3Dgit;branch=3D${BRANCH} \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit qt-provider
> +
> +export SDK_PATH_TARGET=3D'${STAGING_DIR_HOST}'
> +
> +# use the make targets already created in the Makefile.build files
> +do_install() {
> +    install -d ${D}/usr/bin
> +    install video_graphics_test ${D}/usr/bin/video-graphics-test
> +}
> +
> --=20
> 2.9.3
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

