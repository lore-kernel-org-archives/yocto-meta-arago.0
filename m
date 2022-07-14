Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB3CC43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 16:54:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.10115.1657817637615428939
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 14 Jul 2022 09:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C2F2F40C5F;
	Thu, 14 Jul 2022 16:53:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2pjHjILS4F2; Thu, 14 Jul 2022 16:53:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99CAF40C16;
	Thu, 14 Jul 2022 16:53:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7B4AB1749A4; Thu, 14 Jul 2022 12:53:52 -0400 (EDT)
Date: Thu, 14 Jul 2022 12:53:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [oe-layersetup][master][RFC] oe-layersetup: Add
 config option for dunfell/kirkstone
Message-ID: <20220714165352.GO18692@denix.org>
References: <16FF8DBB7909D3F6.549@lists.yoctoproject.org>
 <e92a2e56-2b4d-d4f3-bed3-08a7cb954f15@ti.com>
 <48a57e56-590b-64fb-2afd-ae8bebecbe9a@ti.com>
 <5a210eab-c490-abb5-59e2-531fcec0f8d0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a210eab-c490-abb5-59e2-531fcec0f8d0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Jul 2022 16:54:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13950

On Thu, Jul 07, 2022 at 12:07:19PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> 
> On 7/7/2022 11:19, Andrew Davis wrote:
> >On 7/7/22 8:05 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Andrew, Denys,
> >>
> >>What are your thoughts on this approach to fixing the variable
> >>name change issue?
> >>
> >>
> >
> >How do we feel about just using BB_PRESERVE_ENV?
> >
> >Andrew
> 
> That has some potential issues with someone's environment having
> something set that impacts the recipes and builds.  It could make it
> harder to debug issues.  Right now the environment is tightly
> controlled, with only variables in the list getting though, but this
> just throws open the flood gates...

Ryan is correct - instructing bitbake to pass the entire environment to the 
build "as is" and unsanitized is quite dangerous and is not recommended. The 
whole point of sanitized environment is to have controlled and reproducible 
builds.

-- 
Denys

