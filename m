Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DA6D152A6D
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 18:34:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3AIYIhN019218
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:34:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIYGpY026686
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 13:34:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 13:34:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3AIYGCJ013368;
	Fri, 10 Apr 2015 13:34:16 -0500
Date: Fri, 10 Apr 2015 14:34:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150410183415.GB9147@edge>
References: <1428690056-22471-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1428690056-22471-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui-browser: Update SRCREV to fix compilation warnings.
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
X-List-Received-Date: Fri, 10 Apr 2015 18:34:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 10, 2015 at 02:20:56PM -0400, Jacob Stiffler wrote:
> * Changes also includes removal of DOS line endings in sources.

Finally! \o/ :)
But, there's a small problem now - DOS newlines do not survive patching 
process, so the below patch won't apply... I'll need to do it manually in git. 
Is it just dos2unix qt5-gui-widgets-move.patch?


> * Thus update source file patch and license checksum.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../matrix-gui-browser/qt5-gui-widgets-move.patch  |   23 ++++++++++----------
>  .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    6 ++---
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
> index e725004..20a98d9 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser/qt5-gui-widgets-move.patch
> @@ -1,12 +1,13 @@
> -diff -uNr git-orig/main.cpp git/main.cpp
> ---- git-orig/main.cpp	2013-09-29 20:06:36.000000000 -0400
> -+++ git/main.cpp	2013-09-29 20:11:52.762449142 -0400
> +diff --git a/main.cpp b/main.cpp
> +index fe27aab..51f9550 100644
> +--- a/main.cpp
> ++++ b/main.cpp
>  @@ -36,7 +36,7 @@
> -  *
> - */
> - 
> --#include <QtGui>
> -+#include <QtWidgets>
> - #include <QWebView>
> - #include <QGraphicsWebView>
> - #include <iostream> 
> +  *
> + */
> + 
> +-#include <QtGui>
> ++#include <QtWidgets>
> + #include <QWebView>
> + #include <QGraphicsWebView>
> + #include <iostream> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> index 775b7ce..33387ea 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Simple Qt web display using webkit"
>  HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix_browser"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=75a9adc782a6df0d3a5419743e9a9f18"
>  SECTION = "multimedia"
>  
>  inherit qt-provider
> @@ -11,9 +11,9 @@ RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
>  
>  DEPENDS += "${QT_DEPENDS_WEBKIT}"
>  
> -PR = "r9"
> +PR = "r10"
>  
> -SRCREV = "7f5dccfb5b1b68a3f9162f6ee072eef0e0ba06fe"
> +SRCREV = "f68ab545a60ca446635f9db00d64569cef9c9091"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix_browser.git;protocol=http;branch=${BRANCH}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

