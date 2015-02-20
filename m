Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 756785297F
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 02:30:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1K2UwSd031211
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:30:58 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2UvQe017041
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:30:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Feb 2015 20:30:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2UuW4015125;
	Thu, 19 Feb 2015 20:30:56 -0600
Date: Thu, 19 Feb 2015 21:30:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150220023056.GB31287@edge>
References: <1424076782-23655-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424076782-23655-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago 1/1] wayland/weston: Deprecate 1.3.0
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
X-List-Received-Date: Fri, 20 Feb 2015 02:31:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please send a patch that can be applied? Thanks.


On Mon, Feb 16, 2015 at 02:23:02PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../wayland/wayland/just-scanner.patch             |   36 --------
>  .../recipes-graphics/wayland/wayland_1.3.0.bb      |   40 ---------
>  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ------
>  ...e-Include-option-to-search-in-include-drm.patch |   47 ----------
>  ...urce-prevent-input-disable-during-repaint.patch |   34 --------
>  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 -------
>  .../0006-weston-drm-Enable-multiple-displays.patch |   43 ----------
>  .../recipes-graphics/wayland/weston_1.3.0.bb       |   90 --------------------
>  8 files changed, 349 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
>  delete mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
> deleted file mode 100644
> index 234a9c5..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.3.0.bb
> deleted file mode 100644
> index ae68dac..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> deleted file mode 100644
> index cd0581a..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0002-Makefile-Include-option-to-search-in-include-drm.patch
> deleted file mode 100644
> index 557373d..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0003-input-source-prevent-input-disable-during-repaint.patch
> deleted file mode 100644
> index 74e82fb..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0005-temp-hack-to-enable-weston-1.3.patch
> deleted file mode 100644
> index 0c860b3..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/wayland/weston/0006-weston-drm-Enable-multiple-displays.patch
> deleted file mode 100644
> index abc4295..0000000
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> deleted file mode 100644
> index cf81a33..0000000
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

