Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE46DC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 20:30:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7318.1738096228199806627
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 12:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6052D40CBA;
	Tue, 28 Jan 2025 20:30:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-j-xpnZeVEf; Tue, 28 Jan 2025 20:30:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3052F40BD4;
	Tue, 28 Jan 2025 20:30:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 956C21641AD; Tue, 28 Jan 2025 15:30:23 -0500 (EST)
Date: Tue, 28 Jan 2025 15:30:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Etheridge, Darren" <detheridge@ti.com>
Cc: rs@ti.com, meta-arago@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
Message-ID: <20250128203023.GH21836@denix.org>
References: <20250123201215.2812931-1-detheridge@ti.com>
 <20250123212031.GZ21836@denix.org>
 <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <681ab15c-d59b-4d9d-9443-ab81dd521090@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 20:30:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15768

On Fri, Jan 24, 2025 at 01:58:08PM -0600, Etheridge, Darren wrote:
> On 1/23/2025 3:20 PM, Denys Dmytriyenko wrote:
> >A more generic question:
> >
> >There are now multiple configs with meta-browser and meta-selinux listed:
> >
> >* arago-scarthgap: both meta-browser and meta-selinux are disabled
> >* arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is disabled
> >* arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is enabled
> >
> >Since there are now separate configs, should they be cleaned up and layers
> >that are disabled or unused removed from them? That way when you need to bump
> >say meta-browser, you just need to update one config, not all 3.
> >
> 
> This whole thing was a compromise because we didn't want to take the
> hit of building Chromium for every config.  But we did want to give
> the ability to enable Chromium easily in every config.  So we just
> comment it out and leave it up to the end user to uncomment it if
> they want Chromium to get built and burn several hours.  Maybe there
> is a nicer way to do it, but at the time this is what we came up
> with that worked for everybody involved.

Yes, back in Dunfell days this was exactly the case - there was a single main 
config file with meta-browser being commented out (as it also depended on 
deprecated Python2). Before that I kept it at an old commit that still allowed 
Chromium to be built with gcc and didn't require clang (and very long builds).

Anyway, with Kirkstone and Scarthgap, you now have separate configs for builds 
with meta-browser/Chromium enabled, as well as meta-selinux enabled. My point 
being, since there are separate configus for such builds, why still keep 
commented out references in the main config?

I.e. people can use arago-scarthgap-chromium config directly to get a build 
with Chromium enabled, instead of manually modifying the main arago-scarthgap 
config in order to enable Chromium...


> >Moreover, why only scarthgap is being updated? Are there any changes to the
> >master configs?
> 
> Master points to HEAD of the meta-browser layer,  as such the
> recipes don't make any sense for master, as they really attempt to
> enable GPU support on a specific version of Chromium.   If you build
> master you get whatever the latest Chromium is on the meta-browser
> layer without any of these tweaks applied.

Ah, yeah, missed the fact that master configs also have meta-browser pointing 
to the HEAD. Thanks for clarifying this.

-- 
Denys

