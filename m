Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA18C27C52
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 16:08:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.52.1717517289732106064
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 09:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1547040C8E;
	Tue,  4 Jun 2024 16:08:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jLGiLvFkZSL; Tue,  4 Jun 2024 16:08:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81E7040C1C;
	Tue,  4 Jun 2024 16:08:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3FE94163F84; Tue,  4 Jun 2024 12:08:05 -0400 (EDT)
Date: Tue, 4 Jun 2024 12:08:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-qt: qt5: Add
 xkbcommon to qtbase PACKAGECONFIG
Message-ID: <20240604160805.GN21287@denix.org>
References: <20240603092255.2930095-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603092255.2930095-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 16:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15363

On Mon, Jun 03, 2024 at 02:52:55PM +0530, Chirag Shilwant via lists.yoctoproject.org wrote:
> From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> 
> - For QT apps to use physical keyboard, xkbcommon has to be added in
> PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev which at
> present is an invalid PACKAGECONFIG & hence was dropped from meta-arago [1].
> 
> - Hence, add xkbcommon to PACKAGECONFIG which will enable the use of
> physical keyboard in QT apps.
> 
> [1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=de16946741249265a38acb7bb503b39a0c2b4175
> 
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> index b1205b5a..6f94c574 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
> @@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
>  
>  PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
>  
> +PACKAGECONFIG:append:k3 = " xkbcommon"

This would make the package machine-specific - why is it only applicable to k3?


> +
>  PR:append = ".arago17"
>  
>  QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
> -- 
> 2.34.1

