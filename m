Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F3CC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 19:44:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.11016.1659469471000281445
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 12:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 196C440CE0;
	Tue,  2 Aug 2022 19:44:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-zVQPipMlKQ; Tue,  2 Aug 2022 19:44:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F321340CB0;
	Tue,  2 Aug 2022 19:44:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9E4441749C5; Tue,  2 Aug 2022 15:44:26 -0400 (EDT)
Date: Tue, 2 Aug 2022 15:44:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell/kirkstone/master][PATCH] qtwebengine:
 bison-native dependency is upstream now remove this bbappend
Message-ID: <20220802194426.GE18692@denix.org>
References: <20220801225405.29609-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801225405.29609-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Aug 2022 19:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13974

On Mon, Aug 01, 2022 at 05:54:05PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The dependency on bison-native was fixed in a patch by Denys and is now
> in Dunfell/kirkstone/Master, remove this and the now empty bbappend.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend | 4 ----
>  1 file changed, 4 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> deleted file mode 100644
> index 6459bbf7..00000000
> --- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -PR_append = ".arago1"
> -
> -DEPENDS += "bison-native"
> -- 
> 2.36.1

