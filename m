Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1E6C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:06:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6492.1684796765986729876
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 16:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3B3D840C37;
	Mon, 22 May 2023 23:06:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2U9dcecSyzOm; Mon, 22 May 2023 23:06:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EE7940429;
	Mon, 22 May 2023 23:06:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52F911638FB; Mon, 22 May 2023 19:05:17 -0400 (EDT)
Date: Mon, 22 May 2023 19:05:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-brnich@ti.com
Cc: Darren Etheridge <detheridge@ti.com>, meta-arago@lists.yoctoproject.org,
	Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: Add kmssink support
Message-ID: <20230522230517.GZ9226@denix.org>
References: <20230522175821.510236-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522175821.510236-1-b-brnich@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 23:06:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14441

1. Please use -C/-M to produce a meaningful diff for review instead of 
separate remove/add sequences like these:
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.%.bbappend

2. If you are removing everything and the only remaining change in bbappends 
is to adjust PACKAGECONFIGs, please move them to distro config in arago.conf:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/arago.conf#n70


On Mon, May 22, 2023 at 12:58:21PM -0500, Brandon Brnich via lists.yoctoproject.org wrote:
> Remove the old bbapend files that dealt with old gstreamer version. These files
> applied patches to hack gstreamer to work with our devices. We are no longer carrying
> these patches into kirkstone. Our devices should work with the kirkstone packaged
> gstreamer.
> 
> Also need to enable kmssink element in plugins-bad. Added that to the package config
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>

