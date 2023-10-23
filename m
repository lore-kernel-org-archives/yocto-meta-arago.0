Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85E7C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 18:10:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.128236.1698084598507750712
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 11:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42B1440CCC;
	Mon, 23 Oct 2023 18:09:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uHytEzdjG6I; Mon, 23 Oct 2023 18:09:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7645140CCB;
	Mon, 23 Oct 2023 18:09:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6A63A163D10; Mon, 23 Oct 2023 14:09:47 -0400 (EDT)
Date: Mon, 23 Oct 2023 14:09:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: meta-arago@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, a-limaye@ti.com, g-gupta@ti.com, khasim@ti.com,
	p-bhagat@ti.com
Subject: Re: [meta-arago][kirkstone][PATCH] matrix-gui: move script from
 /etc/init.d to data dir.
Message-ID: <20231023180947.GU2408@denix.org>
References: <20231022130905.3962948-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022130905.3962948-1-s-adivi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Oct 2023 18:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14967

On Sun, Oct 22, 2023 at 06:39:05PM +0530, Sai Sree Kartheek Adivi wrote:
> since sysvinit is deprecated, avoid installing scripts in sysvinit.
> Use data dir to install scripts which need to be called by the systemd services.

Well, sysvinit is not deprecated - it's still an option. With this change 
nobody would be able to use Matrix with sysvinit-enabled distro anymore?

A better approach would be to have a dedicated and independent systemd unit 
file that doesn't call the sysvinit counterpart. And then make the install 
steps below conditional on INIT_MANAGER variable or corresponding flag in the 
DISTRO_FEATURES lsit...


> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service      | 2 +-
>  meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb         | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> index 40a8f0f9..84e9195b 100644
> --- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> @@ -12,7 +12,7 @@ IgnoreSIGPIPE=no
>  KillMode=process
>  GuessMainPID=no
>  RemainAfterExit=yes
> -ExecStart=/etc/init.d/matrix-gui-2.0 start
> +ExecStart=/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
>  
>  [Install]
>  WantedBy=multi-user.target
> diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> index 9299a929..18ccc0c9 100644
> --- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -50,8 +50,7 @@ do_install(){
>  	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
>  
>  	# Install the script
> -	install -d ${D}${sysconfdir}/init.d
> -	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
> +	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
>  
>  	# Install the systemd unit file
>  	install -d ${D}${systemd_system_unitdir}
> -- 
> 2.34.1
> 

