Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41520C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 21:40:15 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.823.1738705210344568162
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 13:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PlV4w9u2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514Le8T73227933
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 15:40:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738705208;
	bh=PQ92W7gy5Y4HabeEhCmzTd7NE1gLB411Kne9FKMH3F4=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=PlV4w9u2onQIlSPGNoodeAV7WlBJE52Jn9k/MM45z9AGOYDtrA9yaUN5BehqF5RAc
	 i+oLBP3y3OW4/aWnxDz0BT99yapN6BoPfvN3dtnzBYJw491AsTsCdqUBiyjZuymLsY
	 05lWY5pJaPFOESiOeqcpwe2f/3+8m2Lw8l5XIDkY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514Le8dm030025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 15:40:08 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 15:40:07 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 15:40:07 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514Le7AR056403;
	Tue, 4 Feb 2025 15:40:07 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 4 Feb 2025 15:40:07 -0600
Message-ID: <D7JZK1K9X5V7.4O4S2NLV1RSH@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] meta-arago-*: remove all qt5
 configs
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>,
        <c-shilwant@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250129001448.2768568-1-rs@ti.com>
 <20250129001448.2768568-2-rs@ti.com>
 <859c2651-b76f-4a6a-b744-084a5c2de719@ti.com>
In-Reply-To: <859c2651-b76f-4a6a-b744-084a5c2de719@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Feb 2025 21:40:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15803

On Mon Feb 3, 2025 at 12:01 PM CST, Ryan Eatmon wrote:
> On 1/28/2025 6:14 PM, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > Remove all the Qt5 specific configs, recipes, and package groups to
> > prepare for Qt6. Some of these package configs will still work, but the=
y
> > are unecessary.
> >=20
> > All of the conditional logic in meta-qt6 toggles the important flags
> > automatically for us right now. This behavior will only change if X11 i=
s
> > enabled, which we currently disable.
> >=20
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >   meta-arago-distro/README                      |   4 -
> >   meta-arago-distro/conf/distro/arago.conf      |  24 --
> >   meta-arago-distro/conf/layer.conf             |   2 -
> >   .../images/tisdk-default-image.bb             |   1 -
> >   .../meta/meta-toolchain-arago-qte.bb          |  54 ----
> >   .../meta/meta-toolchain-arago-tisdk.bb        |   2 +-
> >   .../packagegroups/packagegroup-arago-qte.bb   |  26 --
> >   .../packagegroup-arago-tisdk-qte.bb           |  21 --
> >   ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
> >   .../recipes-core/packagegroups/ti-world.bb    |   1 -
> >   .../qt5/qtbase-conf/eglfs_kms_cfg.json        |   5 -
> >   .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  16 -
> >   .../qt5/qtbase-conf/ti33x/qt_env.sh           |  14 -
> >   .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  23 --
> >   ...xit-button-for-non-window-environmen.patch |  62 ----
> >   ...01-deform-Fix-how-controls-are-shown.patch |  35 ---
> >   ...fs-Force-888-format-only-on-env-flag.patch |  44 ---
> >   ...latforms-eglfs_kms-fix-compiler-erro.patch |  29 --
> >   ...d-exit-button-for-non-window-environ.patch |  83 ------
> >   .../0002-deform-disable-opengl-button.patch   |  73 -----
> >   .../recipes-qt/qt5/qtbase/quit.png            | Bin 645 -> 0 bytes
> >   .../recipes-qt/qt5/qtbase_%.bbappend          |  46 ---
> >   ...touchinteraction.qml-Add-exit-button.patch |  62 ----
> >   .../recipes-qt/qt5/qtdeclarative_git.bbappend |  10 -
> >   ...atform.h-add-define-MESA_EGL_NO_X11_.patch |  30 --
> >   ...e-to-use-GL_NoX-version-of-GraphicsS.patch |  31 --
> >   .../qtwebkit/GraphicsContext3DQt.cpp.patch    |  29 --
> >   .../qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch  | 273 -----------------=
-
> >   .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch |  36 ---
> >   .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch |  20 --
> >   .../qt5/qtwebkit/qttestbrowser.cpp.patch      |  27 --
> >   .../recipes-qt/qt5/qtwebkit_%.bbappend        |  18 --
> >   meta-arago-extras/README                      |   4 -
> >   ...k-packagegroup-arago-qte-toolchain-host.bb |  12 -
> >   ...packagegroup-arago-qte-toolchain-target.bb |  35 ---
> >   .../cmake/extra-cmake-modules.bb              |   1 -
> >   ..._QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch |  28 --
> >   37 files changed, 1 insertion(+), 1181 deletions(-)
> >   delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain=
-arago-qte.bb
> >   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-qte.bb
> >   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packa=
gegroup-arago-tisdk-qte.bb
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs=
_kms_cfg.json
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_en=
v.sh
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x=
/qt_env.sh
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.b=
b
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-calcu=
lator-Add-exit-button-for-non-window-environmen.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-defor=
m-Fix-how-controls-are-shown.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs=
-Force-888-format-only-on-env-flag.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbas=
e-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-anima=
tedtiles-Add-exit-button-for-non-window-environ.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-defor=
m-disable-opengl-button.patch
> >   delete mode 100755 meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/000=
1-touchinteraction.qml-Add-exit-button.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git=
.bbappend
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HAC=
K-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Tar=
get.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Graphics=
Context3DQt.cpp.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Graphics=
SurfaceGL_NoX.cpp.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/Graphics=
SurfaceToken.h.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.=
pri.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbr=
owser.cpp.patch
> >   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappe=
nd
> >   delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativ=
esdk-packagegroup-arago-qte-toolchain-host.bb
> >   delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packa=
gegroup-arago-qte-toolchain-target.bb
> >   delete mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cma=
ke-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
> >=20
>
> *snip*
>
>
> > diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-t=
isdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> > index 4f272a52..80e2882b 100644
> > --- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> > +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> > @@ -1,6 +1,6 @@
> >   TOOLCHAIN_SUFFIX ?=3D "-tisdk"
> > +LICENSE =3D "MIT"
> >  =20
> >   require meta-toolchain-arago-tisdk.inc
> > -require recipes-core/meta/meta-toolchain-arago-qte.bb
> >  =20
> >   PR =3D "${INC_PR}.0"
>
> This is causing the series to not build.  I'm getting this error:
>
> Initialising tasks...ERROR: Task do_populate_sdk in=20
> /scratch/jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-ar=
ago-distro/recipes-core/images/tisdk-core-bundle.bb=20
> depends upon non-existent task do_populate_sdk in=20
> /scratch/jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-ar=
ago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> ERROR: Command execution failed: 1
>
> The issue is that you removed the require on=20
> meta-toolchain-arago-qte.bb, BUT that recipe had a require on=20
> meta-toolchain-arago.bb.
>
> So you need to replace the above require with:
>
> require meta-toolchain-arago.bb
>
> I'm surprised you didn't run into this while testing...  Maybe it=20
> requires building ti-world to see it?

I ran a build of ti-world with MACHINE=3Dam62xx-evm and MACHINE=3Dam335x-ev=
m before
submitting this series. Just ran another build on am62 once you said this. =
I'm
not sure why I'm not able to reproduce the issue locally...

