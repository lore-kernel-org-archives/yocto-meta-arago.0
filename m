Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE436EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 19:46:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1600.1687808778671073515
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 26 Jun 2023 12:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6D52C40C24;
	Mon, 26 Jun 2023 19:46:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kd1xPGwZiI88; Mon, 26 Jun 2023 19:46:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 240C0408CD;
	Mon, 26 Jun 2023 19:46:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 30E11163B59; Mon, 26 Jun 2023 15:46:10 -0400 (EDT)
Date: Mon, 26 Jun 2023 15:46:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-ravikumar@ti.com
Cc: meta-arago@lists.yoctoproject.org, devarsht@ti.com, j-luthra@ti.com,
	a-limaye@ti.com, Ryan Eatmon <reatmon@ti.com>, denys@ti.com
Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: gstreamer1.0-plugins-good: Add patches for raw10/12/16 bit and
 IR support
Message-ID: <20230626194610.GR1518@denix.org>
References: <20230626190800.5604-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626190800.5604-1-r-ravikumar@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 26 Jun 2023 19:46:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14689

> receipes-multimedia: gstreamer: gstreamer1.0-plugins-good: Add patches for raw10/12/16 bit and IR support

^^^ please drop first 2 parts in there - "receipes-multimedia: gstreamer:"
And try to keep short log line under 70 characters...


On Tue, Jun 27, 2023 at 12:38:00AM +0530, Rahul T R via lists.yoctoproject.org wrote:
> Add patches to support 10/12/16 bayer formats and bayer formats with IR
> components. This are required to support capture from imx390 and ov2312
> cameras using gstreamer v4l2src
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

