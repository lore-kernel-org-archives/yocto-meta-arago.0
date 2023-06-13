Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F2EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 23:28:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1082.1686698878010890342
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 16:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B354940C47;
	Tue, 13 Jun 2023 23:27:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8WhdCwG2xdLz; Tue, 13 Jun 2023 23:27:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 860E840ACD;
	Tue, 13 Jun 2023 23:27:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 48606163A53; Tue, 13 Jun 2023 19:27:05 -0400 (EDT)
Date: Tue, 13 Jun 2023 19:27:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: meta-arago@lists.yoctoproject.org, g-gupta@ti.com
Subject: Re: [EXTERNAL] Re: [meta-arago] [master/kirkstone 0/3] Introduce
 sysrepo based parser app
Message-ID: <20230613232705.GV9226@denix.org>
References: <20230609115557.1685-1-r-gunasekaran@ti.com>
 <20230612205917.GR9226@denix.org>
 <991b2698-1d81-140c-fdb7-bf58a5f25c4c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <991b2698-1d81-140c-fdb7-bf58a5f25c4c@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 23:28:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14604

On Tue, Jun 13, 2023 at 10:02:23AM +0530, Ravi Gunasekaran wrote:
> 
> 
> On 6/13/23 2:29 AM, Denys Dmytriyenko wrote:
> > So, what is "aragos"? :)
> 
> Sorry, my bad. I will correct it.

I believe it already got merged... :(


> > Also, meta-sysrepo doesn't seem to be listed as a proper OE layer:
> > http://layers.openembedded.org/layerindex/
> 
> [1] is the sysrepo yocto project link. 
> If meta-sysrepo is not listed as a OE layer, then does it mean, it cannot
> be included in meta-arago?
> 
> [1] - https://github.com/sartura/meta-sysrepo

Not necessarily, but usually if it's not listed in the main layer registry, 
it requires some extra precaution to use the layer, ensuring it's compatible 
and such...


> > On Fri, Jun 09, 2023 at 05:25:54PM +0530, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> >> NETCONF protocol defines a mechanism for device management,
> >> retrieving configuration information and modifying device with
> >> new configuration data.
> >>
> >> YANG is a data modelling language used to model configuration
> >> and state data manipulated by the NETCONF.
> >>
> >> NETCONF/YANG is realized through netopeer and sysrepo. A yocto project
> >> for the same exists [0].
> >>
> >> [0] is a fork of [1] with support added for Kirstone. I have sent a
> >> pull request for it and it is yet to be acknowledged.
> >>
> >> NETCONF/YANG support was added in SDK 8.6 and the changeset were added
> >> in meta-processor-sdk. But since it was concluded that it is generic
> >> networking feature, moving this to meta-arago.
> >>
> >> I plan to send two more patches once this series is accepted
> >> 1) A URL for the meta-sysrepo [0] in oe-layersetup/configs/arago-kirkstone-next-config.txt
> >> 2) Add the required package name in tisdk-default-image.bb in meta-arago
> >>
> >> [0] - https://github.com/ravig07/meta-sysrepo/tree/kirkstone
> >> [1] - https://github.com/sartura/meta-sysrepo
> >>
> >> Ravi Gunasekaran (3):
> >>   meta-aragos-extras: sysrepo: Add TSN Yang models
> >>   meta-aragos-extras: sysrepo: Add .bbappend for netopeer2
> >>   meta-aragos-extras: sysrepo: Introduce nw-configurator app
> >>
> >>  .../0001-Add-EST-Yang-Models.patch            |  17 +
> >>  .../netopeer2-server_git.bbappend             |   6 +
> >>  .../nw-configurator/files/nw-configurator.c   | 409 ++++++++++++++++++
> >>  .../nw-configurator/nw-configurator.bb        |  25 ++
> >>  .../tsn-yang-models/tsn-yang-models_git.bb    |  25 ++
> >>  5 files changed, 482 insertions(+)
> >>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/0001-Add-EST-Yang-Models.patch
> >>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bbappend
> >>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
> >>  create mode 100644 meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
> >>  create mode 100644 meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb

