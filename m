Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6DEC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:02:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.94665.1738605718211967653
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Feb 2025 10:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HtyvGqo2;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513I1t3A2181604
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 3 Feb 2025 12:01:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738605715;
	bh=K0s1ashBzFvmD/mhT0TQssTGXv2WKB1PZ/A0pd5aBGQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HtyvGqo2qI4b3Vq6ggf64zRA5GtSa3SwayKypA0p1UQZBA8qF56oNXsYqjJrrTYd9
	 PqFh0lBNhd+4fu+p0QfPWbbcwEgV980i+e+25duXuhWaDQXljjkwxsQgk/jLnd9dRx
	 gJbknxJG5kZR+p9gdWs6Ulak+C+igEvW1dgT4PI0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513I1too026057;
	Mon, 3 Feb 2025 12:01:55 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 12:01:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 12:01:55 -0600
Received: from [10.249.32.112] ([10.249.32.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513I1tUl061112;
	Mon, 3 Feb 2025 12:01:55 -0600
Message-ID: <859c2651-b76f-4a6a-b744-084a5c2de719@ti.com>
Date: Mon, 3 Feb 2025 12:01:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] meta-arago-*: remove all qt5
 configs
To: <rs@ti.com>, <denis@denix.org>, <afd@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250129001448.2768568-1-rs@ti.com>
 <20250129001448.2768568-2-rs@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250129001448.2768568-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Feb 2025 18:02:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15793



On 1/28/2025 6:14 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Remove all the Qt5 specific configs, recipes, and package groups to
> prepare for Qt6. Some of these package configs will still work, but they
> are unecessary.
> 
> All of the conditional logic in meta-qt6 toggles the important flags
> automatically for us right now. This behavior will only change if X11 is
> enabled, which we currently disable.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-arago-distro/README                      |   4 -
>   meta-arago-distro/conf/distro/arago.conf      |  24 --
>   meta-arago-distro/conf/layer.conf             |   2 -
>   .../images/tisdk-default-image.bb             |   1 -
>   .../meta/meta-toolchain-arago-qte.bb          |  54 ----
>   .../meta/meta-toolchain-arago-tisdk.bb        |   2 +-
>   .../packagegroups/packagegroup-arago-qte.bb   |  26 --
>   .../packagegroup-arago-tisdk-qte.bb           |  21 --
>   ...ckagegroup-arago-toolchain-tisdk-target.bb |   1 -
>   .../recipes-core/packagegroups/ti-world.bb    |   1 -
>   .../qt5/qtbase-conf/eglfs_kms_cfg.json        |   5 -
>   .../recipes-qt/qt5/qtbase-conf/qt_env.sh      |  16 -
>   .../qt5/qtbase-conf/ti33x/qt_env.sh           |  14 -
>   .../recipes-qt/qt5/qtbase-conf_1.0.bb         |  23 --
>   ...xit-button-for-non-window-environmen.patch |  62 ----
>   ...01-deform-Fix-how-controls-are-shown.patch |  35 ---
>   ...fs-Force-888-format-only-on-env-flag.patch |  44 ---
>   ...latforms-eglfs_kms-fix-compiler-erro.patch |  29 --
>   ...d-exit-button-for-non-window-environ.patch |  83 ------
>   .../0002-deform-disable-opengl-button.patch   |  73 -----
>   .../recipes-qt/qt5/qtbase/quit.png            | Bin 645 -> 0 bytes
>   .../recipes-qt/qt5/qtbase_%.bbappend          |  46 ---
>   ...touchinteraction.qml-Add-exit-button.patch |  62 ----
>   .../recipes-qt/qt5/qtdeclarative_git.bbappend |  10 -
>   ...atform.h-add-define-MESA_EGL_NO_X11_.patch |  30 --
>   ...e-to-use-GL_NoX-version-of-GraphicsS.patch |  31 --
>   .../qtwebkit/GraphicsContext3DQt.cpp.patch    |  29 --
>   .../qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch  | 273 ------------------
>   .../qt5/qtwebkit/GraphicsSurfaceToken.h.patch |  36 ---
>   .../recipes-qt/qt5/qtwebkit/WebCore.pri.patch |  20 --
>   .../qt5/qtwebkit/qttestbrowser.cpp.patch      |  27 --
>   .../recipes-qt/qt5/qtwebkit_%.bbappend        |  18 --
>   meta-arago-extras/README                      |   4 -
>   ...k-packagegroup-arago-qte-toolchain-host.bb |  12 -
>   ...packagegroup-arago-qte-toolchain-target.bb |  35 ---
>   .../cmake/extra-cmake-modules.bb              |   1 -
>   ..._QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch |  28 --
>   37 files changed, 1 insertion(+), 1181 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-qte.bb
>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
>   delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-button-for-non-window-environmen.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-deform-Fix-how-controls-are-shown.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-eglfs-Force-888-format-only-on-env-flag.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0001-qtbase-plugins-platforms-eglfs_kms-fix-compiler-erro.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-button-for-non-window-environ.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/0002-deform-disable-opengl-button.patch
>   delete mode 100755 meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative/0001-touchinteraction.qml-Add-exit-button.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-HACK-ANGLE-khrplatform.h-add-define-MESA_EGL_NO_X11_.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/0001-Target.pri-update-to-use-GL_NoX-version-of-GraphicsS.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsContext3DQt.cpp.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceGL_NoX.cpp.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/GraphicsSurfaceToken.h.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/WebCore.pri.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit/qttestbrowser.cpp.patch
>   delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
>   delete mode 100644 meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
>   delete mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
>   delete mode 100644 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules/0001-Search-within-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-for-q.patch
> 

*snip*


> diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> index 4f272a52..80e2882b 100644
> --- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> @@ -1,6 +1,6 @@
>   TOOLCHAIN_SUFFIX ?= "-tisdk"
> +LICENSE = "MIT"
>   
>   require meta-toolchain-arago-tisdk.inc
> -require recipes-core/meta/meta-toolchain-arago-qte.bb
>   
>   PR = "${INC_PR}.0"

This is causing the series to not build.  I'm getting this error:

Initialising tasks...ERROR: Task do_populate_sdk in 
/scratch/jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb 
depends upon non-existent task do_populate_sdk in 
/scratch/jenkins_builds/arago-master-wip/build/sources/meta-arago/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
ERROR: Command execution failed: 1

The issue is that you removed the require on 
meta-toolchain-arago-qte.bb, BUT that recipe had a require on 
meta-toolchain-arago.bb.

So you need to replace the above require with:

require meta-toolchain-arago.bb

I'm surprised you didn't run into this while testing...  Maybe it 
requires building ti-world to see it?


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

