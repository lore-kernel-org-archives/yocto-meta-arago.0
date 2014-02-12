Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 558CC52972
	for <meta-arago@arago-project.org>;
	Wed, 12 Feb 2014 19:41:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CJfGWx006368
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 13:41:16 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CJfG3d005276
	for <meta-arago@arago-project.org>; Wed, 12 Feb 2014 13:41:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 13:41:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CJfG7u005163;
	Wed, 12 Feb 2014 13:41:16 -0600
Date: Wed, 12 Feb 2014 14:41:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140212194115.GP4346@edge>
References: <1392232442-27754-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392232442-27754-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] qt applications: Fix issue with SDK makefile.
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
X-List-Received-Date: Wed, 12 Feb 2014 19:41:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

Do you need these changes to make into our 2013.12.01 release this week? They 
should be fine for master though...


On Wed, Feb 12, 2014 at 01:13:59PM -0600, Franklin S. Cooper Jr wrote:
> * Makefiles have been updated to insure that qmake is called as part of the make
>   clean target.
> * This insures that the App-Makefile always exist and will be able to clean the
>   sources.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    4 ++--
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |    4 ++--
>  .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
>  .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 4d41b73..1e54444 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
>  
>  DEPENDS += "${QT_DEPENDS_WEBKIT}"
>  
> -PR = "r4"
> +PR = "r5"
>  
> -SRCREV = "d962b18b628f0006642491c2250ef01557591e66"
> +SRCREV = "ac2338295ccb4c6c2ffa58b5ad48659a5430"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=git;branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> index f409c1e..2696978 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -7,9 +7,9 @@ SECTION = "multimedia"
>  # Make sure that QT font libraries have been installed
>  RDEPENDS_${PN} += "qt4-embedded-fonts"
>  
> -PR = "r3"
> +PR = "r4"
>  
> -SRCREV = "e652edf9403fe9329e1bcd14b79503045a53705c"
> +SRCREV = "4dfdf85f17033f950e01f25341665f979edde6c3"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> index 4e33d9d..ba3cc57 100644
> --- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f88
>  
>  require recipes-core/matrix/matrix-gui-paths.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  BRANCH = "master"
> -SRCREV = "ee954e04b3efe160b3fabf5a8d640740ce1a7e85"
> +SRCREV = "e8412769dfe650afd528dc2eb791ddf96143771e"
>  
>  SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
>  
> diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> index 6704354..d0a9f7a 100644
> --- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> +++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> @@ -12,12 +12,12 @@ require recipes-core/matrix/matrix-gui-paths.inc
>  
>  inherit qt-provider
>  
> -PR = "r6"
> +PR = "r7"
>  
>  DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
>  
>  BRANCH ?= "master"
> -SRCREV = "e6225f9e485675e4390dcc7575810e9f63501692"
> +SRCREV = "2960431fd38239cc089c8738776f3ff9dcfe7f1c"
>  
>  SRC_URI = " \
>  	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

