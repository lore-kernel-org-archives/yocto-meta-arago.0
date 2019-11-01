Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 44B2F52A00
	for <meta-arago@arago-project.org>;
	Fri,  1 Nov 2019 03:16:47 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA13FQle025810
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 22:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572578126;
	bh=tCh14sfcgVaNuPOuIZtadJKjUrL9HOKYyiG1niwsTLA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lp8VCBcR02OqxWSsfH27jPcJudrDxiqoDs7twRBpjr1es5xVjCTXrpdCM3dnBjLLB
	b4VqpBtQrmuw4Au1Qe23NzGBuiS8jGTbBNiqllmvzpgt7IoY0FdxAm9pRQadRWQPtH
	N4Nd4bQyN63hn1Do9qDa/7FQGyHdjyRRZsBUpcUU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA13FQNg022246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 31 Oct 2019 22:15:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 31 Oct 2019 22:15:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 31 Oct 2019 22:15:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA13FPHr119078;
	Thu, 31 Oct 2019 22:15:26 -0500
Date: Thu, 31 Oct 2019 23:15:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20191101031525.GY32214@beryl>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Fri, 01 Nov 2019 03:16:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

qtwebengine fails with this:
cannot find -lIMGegl


On Wed, Oct 30, 2019 at 03:55:43PM -0400, Eric Ruei wrote:
> These are the corresponding patches with Mesa-based EGL/GLES including
> - re-enable qtwebengine for AM3/4/5
> - several hacks to resolve compiling issues triggered by  mesa-based EGL
>   header files
> - Add DRM(GBM)-based 3D demos
> - Makefile cleanup per Mesa-based EGL library names 
> 
> V2 changes:
> - Add Upstream-Status to Weston and qtWebkit patches
> 
> Eric Ruei (7):
>   packagegroup-arago-xxx-qte-xxx: re-enable qtwebengine per EGL 1.5 for
>     AM3/4/5
>   qtbase-conf: set the default EGLFS mode to kms
>   HACK: weston: undefine HAVE_GBM_MODIFIERS explicitly
>   HACK: qtwebkit: define MESA_EGL_NO_X11_HEADERS at ANGLE/khrplatform.h
>   img-pvr-sdk: Add DRM(GBM)-based GPU demos
>   omapdrmtest: Update LDFLAGS at util/Makefile.am per Mesa-based EGL
>   HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer
> 
>  .../packagegroups/packagegroup-arago-qte.bb   |  9 +--
>  .../packagegroup-arago-tisdk-qte.bb           |  7 +-
>  ...rm-undef-HAVE_GBM_MODIFIERS-explicit.patch | 31 ++++++++
>  .../wayland/weston_5.0.0.bbappend             |  3 +-
>  .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  2 +-
>  .../qt5/qtbase-conf/ti33x/qt_env.sh           |  2 +-
>  ...atform.h-add-define-MESA_EGL_NO_X11_.patch | 30 ++++++++
>  .../recipes-qt/qt5/qtwebkit_%.bbappend        |  3 +-
>  .../matrix-gui-machinevision-demos_2.0.bb     |  6 +-
>  ...packagegroup-arago-qte-toolchain-target.bb | 12 ++--
>  .../img-pvr-sdk/img-pvr-sdk_3.3.2.bb          | 71 ++++++++++---------
>  ...am-update-LDFLAGS-for-Mesa-based-EGL.patch | 32 +++++++++
>  .../omapdrmtest/omapdrmtest_1.0.0.bb          |  3 +-
>  13 files changed, 161 insertions(+), 50 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS-explicit.patch
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-util-Makefile.am-update-LDFLAGS-for-Mesa-based-EGL.patch
> 
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

