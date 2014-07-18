Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9A72B529D5
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 19:17:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6IJH5rr024454
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:17:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJH5wX007312
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:17:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 14:17:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IJH54M002271	for
	<meta-arago@arago-project.org>; Fri, 18 Jul 2014 14:17:05 -0500
Date: Fri, 18 Jul 2014 15:17:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140718191704.GO15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-9-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1405709522-404-9-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 09/11] refresh-screen: fix up Windows newlines in patches
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
X-List-Received-Date: Fri, 18 Jul 2014 19:17:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, the newlines were supposed to be fixed in my previous patch to 
refresh-screen. But they get lost everytime the patch goes over email (like 
this one as well). So, I'd have to push it directly this time around...


On Fri, Jul 18, 2014 at 02:52:00PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...sh-screen.pro-add-widgets-module-to-the-project.patch | 16 ++++++++--------
>  ...002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch | 16 ++++++++--------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> index c379b5c..b9a1f80 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0001-refresh-screen.pro-add-widgets-module-to-the-project.patch
> @@ -13,14 +13,14 @@ index afe5c25..a79abd0 100644
>  --- a/refresh_screen.pro
>  +++ b/refresh_screen.pro
>  @@ -4,7 +4,7 @@
> - #
> - #-------------------------------------------------
> - 
> --QT       += core gui
> -+QT       += core gui widgets
> - 
> - TARGET = refresh_screen
> - TEMPLATE = app
> + #
> + #-------------------------------------------------
> + 
> +-QT       += core gui
> ++QT       += core gui widgets
> + 
> + TARGET = refresh_screen
> + TEMPLATE = app
>  -- 
>  1.9.2
>  
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> index 4966238..66c002d 100644
> --- a/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen/0002-Replace-QtGui-header-with-QtWidgets-for-Qt5.patch
> @@ -13,14 +13,14 @@ index c5744d8..5a61904 100644
>  --- a/main.cpp
>  +++ b/main.cpp
>  @@ -36,7 +36,7 @@
> -  *
> - */
> - 
> --#include <QtGui/QApplication>
> -+#include <QtWidgets/QApplication>
> - #include "mainwindow.h"
> - 
> - int main(int argc, char *argv[])
> +  *
> + */
> + 
> +-#include <QtGui/QApplication>
> ++#include <QtWidgets/QApplication>
> + #include "mainwindow.h"
> + 
> + int main(int argc, char *argv[])
>  -- 
>  1.9.2
>  
> -- 
> 2.0.0
> 

