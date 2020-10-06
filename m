Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9B7EB520E5
	for <meta-arago@arago-project.org>;
	Tue,  6 Oct 2020 15:41:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096FcVbU127482
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 10:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601998711;
	bh=q2hFG6h+EjJrCtw9GtaOstgOedAcwH+RX0G0FlA9LRo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=J3ncLiVDj/DPVfg7NDBaZV15acXQTf2276jv/QABSXQjKcWYpBlfzFg3w/MJKwtYp
	XGzkkW9Na30hwo5vgVO14f2PSEi/8Lk2dHlO2DyXH+RAZnj50JuQm/ZArP7A5Wh5KH
	FjDaLI9qNdDlFPPgIh6suxgH6vqpcjgianDhwjjs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096FcVDt110474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Oct 2020 10:38:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 6 Oct 2020 10:38:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 6 Oct 2020 10:38:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096FcUEY006772;
	Tue, 6 Oct 2020 10:38:31 -0500
Date: Tue, 6 Oct 2020 11:38:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20201006153830.GB7434@beryl>
References: <20201006123840.26473-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201006123840.26473-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell][PATCH] qtwayland: backport texture-sharing/custom-compositor fix
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
X-List-Received-Date: Tue, 06 Oct 2020 15:41:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Gowtham,

Great, thanks for finding the fix upstream!
Would you be willing to submit it to meta-qt5 layer?
https://github.com/meta-qt5/meta-qt5/tree/dunfell

They prefer github pull requests, but would also take a patch from meta-oe 
list. Looks like it is only needed for dunfell, as it's already fixed in new 
version.

Either way, for meta-arago change:

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


On Tue, Oct 06, 2020 at 07:38:40AM -0500, Gowtham Tammana wrote:
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  ...land-texture-sharing-custom-composit.patch | 52 +++++++++++++++++++
>  .../recipes-qt/qt5/qtwayland_git.bbappend     |  3 +-
>  2 files changed, 54 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
> new file mode 100644
> index 00000000..c209dfc4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland/0001-examples-fix-wayland-texture-sharing-custom-composit.patch
> @@ -0,0 +1,52 @@
> +From 1d18591d9e7ed9b3580e06c37be23bfde24bc30c Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Fri, 3 Apr 2020 22:40:29 +0200
> +Subject: [PATCH] examples: fix wayland/texture-sharing/custom-compositor
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  main.cpp:83:33: error: ‘GL_RGBA8’ was not declared in this scope; did you mean ‘GL_RGBA4’?
> +     83 |             *glInternalFormat = GL_RGBA8;
> +        |                                 ^~~~~~~~
> +        |                                 GL_RGBA4
> +  main.cpp:120:33: error: ‘GL_RGBA8’ was not declared in this scope; did you mean ‘GL_RGBA4’?
> +    120 |             *glInternalFormat = GL_RGBA8;
> +        |                                 ^~~~~~~~
> +        |                                 GL_RGBA4
> +
> +Task-number: QTBUG-83304
> +Change-Id: I0515f3303b08c405d162986e280e9a7bd35e28f7
> +Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
> +Reviewed-by: Eskil Abrahamsen Blomfeldt <eskil.abrahamsen-blomfeldt@qt.io>
> +
> +Upstream-Status: Backport [1d18591d9e7ed9b3580e06c37be23bfde24bc30c]
> +
> +The patch is backport from upstream commit -
> +1d18591d9e7ed9b3580e06c37be23bfde24bc30c
> +
> +Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> +---
> + examples/wayland/texture-sharing/custom-compositor/main.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/examples/wayland/texture-sharing/custom-compositor/main.cpp b/examples/wayland/texture-sharing/custom-compositor/main.cpp
> +index a39c8c38..af375024 100644
> +--- a/examples/wayland/texture-sharing/custom-compositor/main.cpp
> ++++ b/examples/wayland/texture-sharing/custom-compositor/main.cpp
> +@@ -63,6 +63,10 @@
> + 
> + #include "QtWaylandCompositor/private/qwltexturesharingextension_p.h"
> + 
> ++#ifndef GL_RGBA8
> ++#define GL_RGBA8 0x8058
> ++#endif
> ++
> + class CustomSharingExtension : public QWaylandTextureSharingExtension
> + {
> +     Q_OBJECT
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> index bd529d2e..c602813c 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwayland_git.bbappend
> @@ -1,6 +1,7 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -PR_append = ".arago1"
> +PR_append = ".arago2"
>  
>  SRC_URI += " \
>      file://0001-plugins-decorations-bradient-display-window-icon-onl.patch \
> +    file://0001-examples-fix-wayland-texture-sharing-custom-composit.patch \
>  "
> -- 
> 2.17.1
> 

