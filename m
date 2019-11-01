Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 705C452986
	for <meta-arago@arago-project.org>;
	Fri,  1 Nov 2019 16:09:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA1G85p4031822
	for <meta-arago@arago-project.org>; Fri, 1 Nov 2019 11:08:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572624485;
	bh=CfyPcOEHKYnTM6WhzxVqfQd4l2ACoftYHj7iq4sF1uY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QJmkDJpbmRASo/QAXRNbN1b0oHb/qOZg3SCuFMnexOlKmklw98ofkoJ5JlEhP+y/i
	dmmXjHNLKXkmOzhz1IG0y0VCa0tNv62UcNpKB0uF/VWyw2GyhS/pWHVJcitQCxvRQ+
	7qlzBsdHn/cdKwgTuKuovE3j2w6i6ocVDgl2n23U=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA1G85YC019807
	for <meta-arago@arago-project.org>; Fri, 1 Nov 2019 11:08:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 1 Nov 2019 11:07:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 1 Nov 2019 11:08:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA1G84Ae027434;
	Fri, 1 Nov 2019 11:08:04 -0500
Date: Fri, 1 Nov 2019 12:08:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20191101160804.GC7264@beryl>
References: <20191030195550.17767-1-e-ruei1@ti.com>
	<20191101031525.GY32214@beryl>
	<09b4e82861bc494d9885f78281f07f35@ti.com>
MIME-Version: 1.0
In-Reply-To: <09b4e82861bc494d9885f78281f07f35@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES
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
X-List-Received-Date: Fri, 01 Nov 2019 16:09:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Nov 01, 2019 at 08:05:02AM -0400, Ruei, Eric wrote:
> Hi, Denys:
> 
> Is the meta-ti patch as in?

Yes.


> What is the target? 

All of them - AM3/4/5.
AM6 uses qtwebkit.


> I have only tried AM5/6.
> 
> Best regards,
> 
> Eric
> 
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, October 31, 2019 11:15 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud/master][PATCH v2 0/7] Mesa-based EGL/GLES
> 
> qtwebengine fails with this:
> cannot find -lIMGegl
> 
> 
> On Wed, Oct 30, 2019 at 03:55:43PM -0400, Eric Ruei wrote:
> > These are the corresponding patches with Mesa-based EGL/GLES including
> > - re-enable qtwebengine for AM3/4/5
> > - several hacks to resolve compiling issues triggered by  mesa-based EGL
> >   header files
> > - Add DRM(GBM)-based 3D demos
> > - Makefile cleanup per Mesa-based EGL library names 
> > 
> > V2 changes:
> > - Add Upstream-Status to Weston and qtWebkit patches
> > 
> > Eric Ruei (7):
> >   packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for
> >     AM3/4/5
> >   qtbase-conf: set the default EGLFS mode to kms
> >   HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
> >   HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
> >   img-pvr-sdk: Add DRM(GBM)-based GPU demos
> >   omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
> >   HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer
> > 
> >  .../packagegroups/packagegroup-arago-qte.bb   |  9 +--
> >  .../packagegroup-arago-tisdk-qte.bb           |  7 +-
> >  ...rm-undef-HAVE_GBM_MODIFIERS-explicit.patch | 31 ++++++++
> >  .../wayland/weston_5.0.0.bbappend             |  3 +-
> >  .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
> >  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
> >  ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ++++++++
> >  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
> >  .../matrix-gui-machinevision-demos_2.0.bb     |  6 +-
> >  ...packagegroup-arago-qte-toolchain-target.bb | 12 ++--
> >  .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
> >  ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++
> >  .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
> >  13 files changed, 161 insertions(+), 50 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
> >  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
> > 
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

