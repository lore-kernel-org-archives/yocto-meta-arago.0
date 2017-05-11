Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B3D5C52A43
	for <meta-arago@arago-project.org>;
	Thu, 11 May 2017 22:16:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4BMGuX9010758
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 17:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494541016;
	bh=nkn+lpOXlqjRC04SwTm4yW8OxbUPOXxPXvB4eV23XTc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KOGP/OD0xr1ZS5cuUqIToT895+ai2jvemL2xDUnAVc4ihPFvNVjd+ti9LcSGViKyG
	lPguCvAtqE+Pn9oi0BFIbTnKQ0Zmjq5Was4TKA1N3a1bMNwEdC7UZKRQDiRzc2CCgh
	PJaoT+EhxGjARQNiDkT1CAbOlOPCpK6QCsBztZ4g=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4BMGuNk010842
	for <meta-arago@arago-project.org>; Thu, 11 May 2017 17:16:56 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Thu, 11 May 2017 17:16:56 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [master/morty][PATCH] recipes-multimedia :
	video-graphics-test : new demo
Thread-Index: AQHSnCu79an4JXTH8USMqnoDUAsQdaGVP9QAgAKaIACAAFe2gIBTUwcAgASLDFA=
Date: Thu, 11 May 2017 22:16:55 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EBB2071@DFLE12.ent.ti.com>
References: <20170313185755.12918-1-manisha.agrawal@ti.com>
	<20170314222734.GR578@edge>
	<3AC2660648D2B04999D9C7562469E8AF7EB84BC5@DFLE12.ent.ti.com>
	<20170316192539.GR14484@edge> <20170508195222.GV20769@edge>
In-Reply-To: <20170508195222.GV20769@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
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
X-List-Received-Date: Thu, 11 May 2017 22:16:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Jake took the changes locally. I am not sure if they plan to upstream the c=
hanges but I didn't take any further actions after our last email exchange =
on it.=20

I shall rely on Jake to upstream it for me. If he is not able to do same fo=
r any reason, then I can take it.=20

Regards,
Manisha


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, May 08, 2017 2:52 PM
To: Agrawal, Manisha
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [master/morty][PATCH] recipes-multimedia : video-=
graphics-test : new demo

Manisha,

Do you plan to follow up on this change? Did it go into PSDK release?


Jake, Vivek,

If you took it locally, do you plan to upstream it soon?

--=20
Denys


On Thu, Mar 16, 2017 at 03:25:39PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 16, 2017 at 03:16:41PM -0400, Agrawal, Manisha wrote:
> > Hi Denys,
> >=20
> > I can make separate patches.
>=20
> Thanks.
>=20
>=20
> > What do you suggest for changes in meta-arago-distro/conf/distro/arago-=
source-ipk.conf??
>=20
> That would require separate patches for krogoth vs. morty/master.
>=20
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys=20
> > Sent: Tuesday, March 14, 2017 5:28 PM
> > To: Agrawal, Manisha
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [master/morty][PATCH] recipes-multimedia : vi=
deo-graphics-test : new demo
> >=20
> > Manisha,
> >=20
> > Thanks for the patch.
> >=20
> > This should rather be 2 or 3 patches - adding the new recipe, adding sr=
c-ipk and then patching the tisdk-makefile.
> >=20
> > Moreover, this won't apply to morty/master due to this change:
> > http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommitdiff;h=3Dd28=
779a38e75bf3e096a5a7b0cf160d7520f4aca
> >=20
> > --
> > Denys
> >=20
> >=20
> > On Mon, Mar 13, 2017 at 01:57:55PM -0500, Manisha Agrawal wrote:
> > > Add new demo to Processor Linux SDK. This demo is package along with
> > > source code in PLSDK and binary available under /usr/bin folder of th=
e
> > > filesystem. The demo is target to showcase AM57x Display Sub System
> > > capabilities, 2D graphics accelerator GC320 video API usage for overl=
ay
> > > and QT drawing using 3D graphics accelerator. In this particular rele=
ase
> > > the demo is showing the DRM API usage for scaling and overlaying usin=
g
> > > DSS and special QT QPA eglfs-kms for rendering using SGX. QT is the
> > > master of the drm resource but shares the handle with application too=
.
> > >=20
> > > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > > ---
> > >  .../conf/distro/arago-source-ipk.conf              |  3 +++
> > >  .../ti-tisdk-makefile/Makefile_video-graphics-test | 24 ++++++++++++=
+++++++
> > >  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  1 +
> > >  .../video-graphics-test/video-graphics-test_1.0.bb | 28 ++++++++++++=
++++++++++
> > >  4 files changed, 56 insertions(+)
> > >  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile=
/ti-tisdk-makefile/Makefile_video-graphics-test
> > >  create mode 100644 meta-arago-extras/recipes-multimedia/video-graphi=
cs-test/video-graphics-test_1.0.bb
> > >=20
> > > diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/me=
ta-arago-distro/conf/distro/arago-source-ipk.conf
> > > index 96f2db2..5941519 100644
> > > --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > > +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > > @@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-applica=
tions/${PN}-${PV}"
> > >  CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
> > >  SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-applications/${P=
N}-${PV}"
> > > =20
> > > +CREATE_SRCIPK_pn-video-graphics-test =3D "1"
> > > +SRCIPK_INSTALL_DIR_pn-video-graphics-test =3D "example-applications/=
${PN}-${PV}"
> > > +
> > >  CREATE_SRCIPK_pn-image-gallery =3D "1"
> > >  SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-applications/${PN}"
> > > =20
> > > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile/Makefile_video-graphics-test b/meta-arago-distro/recipes-tisdk/=
ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
> > > new file mode 100644
> > > index 0000000..1ffc395
> > > --- /dev/null
> > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
file/Makefile_video-graphics-test
> > > @@ -0,0 +1,24 @@
> > > +# QT Video Graphics build targets
> > > +video-graphics-test:
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +	@echo    Building Video Graphics Test
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`=
; make -f Makefile.build
> > > +
> > > +video-graphics-test_clean:
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +	@echo    Building Video Graphics Test
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`=
; make -f Makefile.build clean
> > > +
> > > +video-graphics-test_install:
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > +	@echo   Installing Video Graphics Test - Release version
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`=
; make -f Makefile.build install
> > > +
> > > +video-graphics-test_install_debug:
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +	@echo   Installing Video Graphics Test - Debug version
> > > +	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`=
; make -f Makefile.build install_debug
> > > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-t=
isdk-makefile_1.0.bb
> > > index 202078c..40ba3be 100644
> > > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
file_1.0.bb
> > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-make=
file_1.0.bb
> > > @@ -31,6 +31,7 @@ SRC_URI =3D "\
> > >      file://Makefile_omapconf \
> > >      file://Makefile_oprofile-example \
> > >      file://Makefile_dual-camera-demo \
> > > +    file://Makefile_video-graphics-test \
> > >      file://Makefile_image-gallery \
> > >      file://Makefile_cryptodev \
> > >      file://Makefile_cmem-mod \
> > > diff --git a/meta-arago-extras/recipes-multimedia/video-graphics-test=
/video-graphics-test_1.0.bb b/meta-arago-extras/recipes-multimedia/video-gr=
aphics-test/video-graphics-test_1.0.bb
> > > new file mode 100644
> > > index 0000000..4e428b2
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-=
graphics-test_1.0.bb
> > > @@ -0,0 +1,28 @@
> > > +DESCRIPTION =3D "Test applications for video and graphics interface"
> > > +HOMEPAGE =3D "https://git.ti.com/sitara-linux/video-graphics-test"
> > > +SECTION =3D "multimedia"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc7ca707704d3354a64feeb4f1=
9f52eb5"
> > > +
> > > +DEPENDS +=3D "libdrm"
> > > +
> > > +PR =3D "r0"
> > > +
> > > +BRANCH =3D "master"
> > > +SRCREV =3D "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
> > > +
> > > +SRC_URI =3D "git://git.ti.com/sitara-linux/video-graphics-test.git;p=
rotocol=3Dgit;branch=3D${BRANCH} \
> > > +"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit qt-provider
> > > +
> > > +export SDK_PATH_TARGET=3D'${STAGING_DIR_HOST}'
> > > +
> > > +# use the make targets already created in the Makefile.build files
> > > +do_install() {
> > > +    install -d ${D}/usr/bin
> > > +    install video_graphics_test ${D}/usr/bin/video-graphics-test
> > > +}
> > > +
> > > --=20
> > > 2.9.3
> > >=20
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

