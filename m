Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB35C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:36:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4043.1741984587239150926
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 13:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 585E440CA8;
	Fri, 14 Mar 2025 20:36:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znK9rVkZOMCV; Fri, 14 Mar 2025 20:36:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27447406B5;
	Fri, 14 Mar 2025 20:36:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 58DAA16434D; Fri, 14 Mar 2025 16:36:21 -0400 (EDT)
Date: Fri, 14 Mar 2025 16:36:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com, denys@konsulko.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-gtk: set PACKAGE_ARCH
Message-ID: <20250314203621.GE23729@denix.org>
References: <20250311003556.3131699-2-rs@ti.com>
 <5be8e47e-5753-4893-b22f-371524842c47@ti.com>
 <D8DOBH1Z0W3X.37ICDKG8VDW9H@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8DOBH1Z0W3X.37ICDKG8VDW9H@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Mar 2025 20:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16051

On Tue, Mar 11, 2025 at 02:11:42PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> On Tue Mar 11, 2025 at 8:22 AM CDT, Andrew Davis wrote:
> > On 3/10/25 7:35 PM, rs@ti.com wrote:
> >> From: Randolph Sapp <rs@ti.com>
> >> 
> >> This packagegroup pulls a package that is automatically renamed with
> >> DEBIAN_NAMES. This is not allowed due to a sanity check that was added
> >> to prevent issues with packagegroups being aggressively cached and
> >> DEBIAN_NAMES potentially breaking this cache. See [YOCTO #7298] or
> >> 5bf3e447d2f in openembedded-core [1].
> >> 
> >> [1] https://git.openembedded.org/openembedded-core/commit/?id=5bf3e447d2f5064495d83a8fad30229bcf1ecc9b
> >> 
> >> Fixes: 731fd376 (packagegroups: Do not set package arch when unneeded, 2025-03-03)
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >> 
> >
> > Should we just drop this package group? Only has 2 packages, one is just a demo,
> > and the other (gtk+3) should be installed by DEPENDS only for packages that depend
> > on it, not unconditionally as done here.
> >
> > Andrew
> 
> Well, we could drop the gtk+3 package from the group and keep the demos so we
> know gtk+3 is still implicitly pulled. Gets weird considering this layer at one
> point came with default applications and libraries we thought were useful.
> 
> I don't know. Ryan, Denys, do you guys think we've weaned enough customers off
> of using the example SDK directly to move to a more pragmatic packaging list?
> (Just the stuff required to test things and maybe some debug tools.)

Sorry, missed this question earlier. I don't have a preference here, whether 
toolkits like gtk+ should be explicitly listed in packagegroups any longer.

That said, we used to have matching packagegroups for specific areas - one for 
the default/demo rootfs (e.g. the one in this patch is packagegroup-*-gtk.bb) 
and corresponding lists for the target side of the SDK (*-gtk-sdk-target.bb) 
and somethimes even the host side of the SDK (*-sd-host.bb). That way the 
rootfs can have a demo, which pulls gtk+3 toolkit, while SDK doesn't need a 
demo, but pull in the development package of the toolkit gtk+3-dev. As back 
then SDKs were not built from a corresponding rootfs recipe, but instead from 
own set of packagegroups.


> >> Tagged scarthgap/master as the origional patch was, but I don't think the
> >> original patch has made it to master yet.
> >> 
> >>   .../packagegroups/packagegroup-arago-tisdk-gtk.bb             | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> >> index cd6dd895..e0a90a31 100644
> >> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> >> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
> >> @@ -2,6 +2,10 @@ DESCRIPTION = "Task to add Gtk embedded related packages"
> >>   LICENSE = "MIT"
> >>   PR = "r2"
> >>   
> >> +# Required for packages that are renamed using DEBIAN_NAMES
> >> +# [YOCTO #7298]
> >> +PACKAGE_ARCH = "${TUNE_PKGARCH}"
> >> +
> >>   inherit packagegroup
> >>   
> >>   RDEPENDS:${PN} = "\

