Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7EE0E5296D
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 19:25:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GJPjYP014691
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489692345;
	bh=w17ksgY+yWtJCsCBXXpSMIGb6/K5durLzb4+XyTlCAk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SsLEgtrYoLc2+tIsj1hZLeYWnI/Nm8Qx6StYAxc/3CwQYvg59BF9pVRX+yQBXTt9R
	0aEQL77yhssbSdhUiPm4o/Pj6/OxARfY3sgHN9l5J4wPavffDZcOS+dl0+P1j+IVOh
	4+i+a6P+TEO77psjL56JnnH3OQYl2xZ5DVWXBT6U=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GJPeSe017292
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:25:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 14:25:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GJPdvI027700;
	Thu, 16 Mar 2017 14:25:39 -0500
Date: Thu, 16 Mar 2017 15:25:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>
Message-ID: <20170316192539.GR14484@edge>
References: <20170313185755.12918-1-manisha.agrawal@ti.com>
	<20170314222734.GR578@edge>
	<3AC2660648D2B04999D9C7562469E8AF7EB84BC5@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3AC2660648D2B04999D9C7562469E8AF7EB84BC5@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 16 Mar 2017 19:25:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 16, 2017 at 03:16:41PM -0400, Agrawal, Manisha wrote:
> Hi Denys,
> 
> I can make separate patches.

Thanks.


> What do you suggest for changes in meta-arago-distro/conf/distro/arago-source-ipk.conf??

That would require separate patches for krogoth vs. morty/master.


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, March 14, 2017 5:28 PM
> To: Agrawal, Manisha
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [master/morty][PATCH] recipes-multimedia : video-graphics-test : new demo
> 
> Manisha,
> 
> Thanks for the patch.
> 
> This should rather be 2 or 3 patches - adding the new recipe, adding src-ipk and then patching the tisdk-makefile.
> 
> Moreover, this won't apply to morty/master due to this change:
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=d28779a38e75bf3e096a5a7b0cf160d7520f4aca
> 
> --
> Denys
> 
> 
> On Mon, Mar 13, 2017 at 01:57:55PM -0500, Manisha Agrawal wrote:
> > Add new demo to Processor Linux SDK. This demo is package along with
> > source code in PLSDK and binary available under /usr/bin folder of the
> > filesystem. The demo is target to showcase AM57x Display Sub System
> > capabilities, 2D graphics accelerator GC320 video API usage for overlay
> > and QT drawing using 3D graphics accelerator. In this particular release
> > the demo is showing the DRM API usage for scaling and overlaying using
> > DSS and special QT QPA eglfs-kms for rendering using SGX. QT is the
> > master of the drm resource but shares the handle with application too.
> > 
> > Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> > ---
> >  .../conf/distro/arago-source-ipk.conf              |  3 +++
> >  .../ti-tisdk-makefile/Makefile_video-graphics-test | 24 +++++++++++++++++++
> >  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  1 +
> >  .../video-graphics-test/video-graphics-test_1.0.bb | 28 ++++++++++++++++++++++
> >  4 files changed, 56 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
> >  create mode 100644 meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > index 96f2db2..5941519 100644
> > --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> > @@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat = "example-applications/${PN}-${PV}"
> >  CREATE_SRCIPK_pn-dual-camera-demo = "1"
> >  SRCIPK_INSTALL_DIR_pn-dual-camera-demo = "example-applications/${PN}-${PV}"
> >  
> > +CREATE_SRCIPK_pn-video-graphics-test = "1"
> > +SRCIPK_INSTALL_DIR_pn-video-graphics-test = "example-applications/${PN}-${PV}"
> > +
> >  CREATE_SRCIPK_pn-image-gallery = "1"
> >  SRCIPK_INSTALL_DIR_pn-image-gallery = "example-applications/${PN}"
> >  
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
> > new file mode 100644
> > index 0000000..1ffc395
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_video-graphics-test
> > @@ -0,0 +1,24 @@
> > +# QT Video Graphics build targets
> > +video-graphics-test:
> > +	@echo ================================
> > +	@echo    Building Video Graphics Test
> > +	@echo ================================
> > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build
> > +
> > +video-graphics-test_clean:
> > +	@echo ================================
> > +	@echo    Building Video Graphics Test
> > +	@echo ================================
> > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build clean
> > +
> > +video-graphics-test_install:
> > +	@echo ===================================================
> > +	@echo   Installing Video Graphics Test - Release version
> > +	@echo ===================================================
> > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build install
> > +
> > +video-graphics-test_install_debug:
> > +	@echo =================================================
> > +	@echo   Installing Video Graphics Test - Debug version
> > +	@echo =================================================
> > +	@cd example-applications; cd `find . -name "*video-graphics-test*"`; make -f Makefile.build install_debug
> > diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> > index 202078c..40ba3be 100644
> > --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> > @@ -31,6 +31,7 @@ SRC_URI = "\
> >      file://Makefile_omapconf \
> >      file://Makefile_oprofile-example \
> >      file://Makefile_dual-camera-demo \
> > +    file://Makefile_video-graphics-test \
> >      file://Makefile_image-gallery \
> >      file://Makefile_cryptodev \
> >      file://Makefile_cmem-mod \
> > diff --git a/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> > new file mode 100644
> > index 0000000..4e428b2
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> > @@ -0,0 +1,28 @@
> > +DESCRIPTION = "Test applications for video and graphics interface"
> > +HOMEPAGE = "https://git.ti.com/sitara-linux/video-graphics-test"
> > +SECTION = "multimedia"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
> > +
> > +DEPENDS += "libdrm"
> > +
> > +PR = "r0"
> > +
> > +BRANCH = "master"
> > +SRCREV = "ebc7ab44d05fc726b0ddc7f4b45d71d7509313f5"
> > +
> > +SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit qt-provider
> > +
> > +export SDK_PATH_TARGET='${STAGING_DIR_HOST}'
> > +
> > +# use the make targets already created in the Makefile.build files
> > +do_install() {
> > +    install -d ${D}/usr/bin
> > +    install video_graphics_test ${D}/usr/bin/video-graphics-test
> > +}
> > +
> > -- 
> > 2.9.3
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

