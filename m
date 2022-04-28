Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B8DC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:05:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4026.1651104297912247447
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B957340C06;
	Thu, 28 Apr 2022 00:04:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3t-7B2MJUCM; Thu, 28 Apr 2022 00:04:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9476A40BEA;
	Thu, 28 Apr 2022 00:04:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C3EC91748EC; Wed, 27 Apr 2022 20:04:52 -0400 (EDT)
Date: Wed, 27 Apr 2022 20:04:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][oe-layersetup PATCH 6/6] Build Poky using
 meta-yocto instead of combined poky repo
Message-ID: <20220428000452.GL9834@denix.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-6-afd@ti.com>
 <20220426211834.GG9834@denix.org>
 <d23f31d1-94c6-9de3-89f7-c88a0809f093@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23f31d1-94c6-9de3-89f7-c88a0809f093@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13816

On Tue, Apr 26, 2022 at 04:29:53PM -0500, Andrew Davis wrote:
> On 4/26/22 4:18 PM, Denys Dmytriyenko wrote:
> >On Tue, Apr 26, 2022 at 03:02:51PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> >>The Poky repo contains meta-yocto plus extra bits needed for an
> >>all-in-one build, but since we already pull in tools with this
> >>script like bitbake and oe-core, lets use those and save some
> >>space/bandwidth.
> >
> >There are other nuances of "flattened" Poky repo (commits are different,
> >plus some other minor bits and pieces). The only overhead is to clone Bitbake
> >twice (not OE-Core), which is neglectable and allows building the true Poky,
> >instead of OE-Core + meta-yocto/meta-poky... :)
> >
> 
> 
> Could you let me know what the other "minor bits and pieces" we are concerned
> about losing here? It seems the "flattened" Poky repo is an automatic merge of
> Bitbake + OE-Core + meta-yocto/meta-poky + some random scripts we don't care about
> since we do the same thing here in oe-layersetup.
> 
> If we want "true" Poky, then we just clone flattened Poky and don't need
> oe-layersetup at all here.

Yeah, the biggest difference is all the different commit IDs between all 
those layers due to running combo-layer tool, which I don't believe runs 
automatically anyway. And, sure, combo-layer was one of the ways to do layer 
setup, vs. oe-layersetup tool. But since I wanted to do Poky builds with 
meta-ti on the same build farm with Arago, which uses tisdk-build-scripts 
and oe-layersetup, adding this config back then was the simplest approach. 
And if this is no longer used/needed, you can definitely change or remove 
it...


> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  configs/poky-master-config.txt | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> >>index b395ff8..a541501 100644
> >>--- a/configs/poky-master-config.txt
> >>+++ b/configs/poky-master-config.txt
> >>@@ -1,8 +1,10 @@
> >>  # This file takes repo entries in the format
> >>  # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> >>+
> >>  bitbake,git://git.openembedded.org/bitbake,master,HEAD
> >>-poky,git://git.yoctoproject.org/poky,master,HEAD,layers=meta:meta-poky:meta-yocto-bsp
> >>+meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
> >>  meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
> >>  meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
> >>+oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
> >>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> >>  OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
> >>-- 
> >>2.17.1

