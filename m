Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15644C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 16:05:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14316.1740672293846713706
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 08:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C8E5040C37;
	Thu, 27 Feb 2025 16:04:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6Vf2laKj4PZ; Thu, 27 Feb 2025 16:04:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A78B407E5;
	Thu, 27 Feb 2025 16:04:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C69D21642B4; Thu, 27 Feb 2025 11:04:44 -0500 (EST)
Date: Thu, 27 Feb 2025 11:04:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, devarsht@ti.com,
	vaishnav.a@ti.com, u-kumar1@ti.com, r-donadkar@ti.com,
	a-limaye@ti.com
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
Message-ID: <20250227160444.GI1879@denix.org>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
 <20250211205111.GU21608@denix.org>
 <f5658e67-238d-4532-ac69-d99755808300@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5658e67-238d-4532-ac69-d99755808300@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Feb 2025 16:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15928

On Wed, Feb 12, 2025 at 01:46:48PM +0530, Yemike Abhilash Chandra wrote:
> 
> 
> On 12/02/25 02:21, Denys Dmytriyenko wrote:
> >On Tue, Feb 11, 2025 at 01:28:13PM +0530, Yemike Abhilash Chandra via lists.yoctoproject.org wrote:
> >>An older recipe of v4l-utils (v1.26.1) is present in the meta-oe layer
> >>for scarthgap.
> >>
> >>TI's 6.12 based kernel has backported multistream routing APIs from
> >>upstream kernel, which requires v4l-utils to be the latest released
> >>version (v1.28.1).
> >>
> >>Thus we override the recipe in this layer to the latest release of
> >>v4l-utils.
> >
> >There are few issues with this...
> >
> >Do you really need to override the entire recipe? The old .bbappend was
> >applying a patch already - can you add a new patch to that and bump SRCREV?
> >
> 
> We are not only updating the SRCREV, but also moving to a newer branch
> (stable-1.28), which is why we considered overriding the entire recipe.
> This approach aligns with how we have handled previously, including
> 6.1 timeline, where we followed a similar process.[1]

No, that's not the same - the previous change you linked in [1] also 
switched from git to a tarball release. Sure, that one could have been 
a .bbappend as well.

You can also change the branch in SRC_URI with a Python .replace() function 
inside your .bbappend.


> Given that the original recipe package still references an older version,
> do you suggest that we update the branch in the existing .bbappend,
> even though the base recipe remains on an older version?
> 
> Please let me know if you want me to do that way.
> 
> [1]: https://lore.kernel.org/all/20230525104036.2050245-1-j-luthra@ti.com/
> 
> Thanks,
> Yemike Abhilash Chandra
> 
> >If you do need to override the entire recipe, then you first need to clearly
> >articulate your reason in the commit log - wanting a newer commit isn't such
> >a reason
> >
> >Then you need to do it in 2 steps/patches - first you copy over the existing
> >recipe verbatim w/o any modifications, and in a separate step make your
> >modifications
> >
> >Also, having own copy of an upstream recipe requires special attention to not
> >violate the Yocto Project Compatible guidelines. I've explained this recently
> >in another thread here on the list
> >

