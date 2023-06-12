Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68649C7EE43
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 21:00:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.71612.1686603610806124671
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 14:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A4D840C62;
	Mon, 12 Jun 2023 21:00:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lg9acc65shya; Mon, 12 Jun 2023 21:00:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D3C340C16;
	Mon, 12 Jun 2023 21:00:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D1632163A4B; Mon, 12 Jun 2023 16:59:17 -0400 (EDT)
Date: Mon, 12 Jun 2023 16:59:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-gunasekaran@ti.com
Cc: meta-arago@lists.yoctoproject.org, g-gupta@ti.com
Subject: Re: [meta-arago] [master/kirkstone 0/3] Introduce sysrepo based
 parser app
Message-ID: <20230612205917.GR9226@denix.org>
References: <20230609115557.1685-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609115557.1685-1-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 21:00:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14601

So, what is "aragos"? :)

Also, meta-sysrepo doesn't seem to be listed as a proper OE layer:
http://layers.openembedded.org/layerindex/


On Fri, Jun 09, 2023 at 05:25:54PM +0530, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> NETCONF protocol defines a mechanism for device management,
> retrieving configuration information and modifying device with
> new configuration data.
> 
> YANG is a data modelling language used to model configuration
> and state data manipulated by the NETCONF.
> 
> NETCONF/YANG is realized through netopeer and sysrepo. A yocto project
> for the same exists [0].
> 
> [0] is a fork of [1] with support added for Kirstone. I have sent a
> pull request for it and it is yet to be acknowledged.
> 
> NETCONF/YANG support was added in SDK 8.6 and the changeset were added
> in meta-processor-sdk. But since it was concluded that it is generic
> networking feature, moving this to meta-arago.
> 
> I plan to send two more patches once this series is accepted
> 1) A URL for the meta-sysrepo [0] in oe-layersetup/configs/arago-kirkstone-next-config.txt
> 2) Add the required package name in tisdk-default-image.bb in meta-arago
> 
> [0] - https://github.com/ravig07/meta-sysrepo/tree/kirkstone
> [1] - https://github.com/sartura/meta-sysrepo
> 
> Ravi Gunasekaran (3):
>   meta-aragos-extras: sysrepo: Add TSN Yang models
>   meta-aragos-extras: sysrepo: Add .bbappend for netopeer2
>   meta-aragos-extras: sysrepo: Introduce nw-configurator app
> 
>  .../0001-Add-EST-Yang-Models.patch            |  17 +
>  .../netopeer2-server_git.bbappend             |   6 +
>  .../nw-configurator/files/nw-configurator.c   | 409 ++++++++++++++++++
>  .../nw-configurator/nw-configurator.bb        |  25 ++
>  .../tsn-yang-models/tsn-yang-models_git.bb    |  25 ++
>  5 files changed, 482 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>  create mode 100644 meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb

