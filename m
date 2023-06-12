Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E838C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:56:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.64955.1686588994278575716
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5AAE240C62;
	Mon, 12 Jun 2023 16:56:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDJ-Es3jeS4W; Mon, 12 Jun 2023 16:56:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2413E40C1C;
	Mon, 12 Jun 2023 16:56:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9CB06163A0C; Mon, 12 Jun 2023 12:55:41 -0400 (EDT)
Date: Mon, 12 Jun 2023 12:55:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Brnich, Brandon" <b-brnich@ti.com>
Cc: "Etheridge, Darren" <detheridge@ti.com>,
	"meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Davis, Andrew" <afd@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH v2 0/2] gstreamer updates
Message-ID: <20230612165541.GN9226@denix.org>
References: <ae963694decc43e9906b2c4611c7d0c5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae963694decc43e9906b2c4611c7d0c5@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 16:56:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14597

On Mon, Jun 12, 2023 at 04:31:47PM +0000, Brnich, Brandon wrote:
> Hello all,
> 
> > -----Original Message-----
> > From: meta-arago@lists.yoctoproject.org <meta-
> > arago@lists.yoctoproject.org> On Behalf Of Brandon Brnich via
> > lists.yoctoproject.org
> > Sent: Thursday, June 8, 2023 1:12 PM
> > To: Etheridge, Darren <detheridge@ti.com>; meta-
> > arago@lists.yoctoproject.org
> > Cc: Davis, Andrew <afd@ti.com>; Denys Dmytriyenko <denis@denix.org>
> > Subject: [EXTERNAL] [meta-arago][master/kirkstone][PATCH v2 0/2]
> > gstreamer updates
> > 
> > Hello all,
> > 
> > This series addresses concerns in previous[0] thread.
> > 
> > Removing all of the old gstreamer patches as we are dropping support. As a
> > result, kmssink flag needs to be set in arago.conf
> > 
> 
> Any comments on this series? Pretty important to get kmssink enablement.
> 
> Please let me know if there is there anything I need to change in order to 
> get this merged.

Already in wip and next branches for testing since Friday, AFAICS.


> Best, 
> Brandon
> 
> > [0] https://lists.yoctoproject.org/g/meta-arago/topic/99070450#14497
> > 
> > Brandon Brnich (2):
> >   conf: arago: Add support for kmssink
> >   receipes-multimedia: gstreamer: Remove old gstreamer files
> > 
> >  meta-arago-distro/conf/distro/arago.conf      |    3 +
> >  ...emove-wayland-as-required-dependency.patch |   32 -
> >  ...mallocator-Add-DRM-allocator-support.patch |  469 --------  ...s-add-
> > support-for-meson-build-system.patch |  140 ---  ...sink-Add-mouse-drag-
> > and-drop-support.patch |  426 -------
> >  .../0002-parsers-bug-fixes-on-parsers.patch   |  145 ---
> >  ...drm-and-tidss-in-the-list-of-drivers.patch |  160 ---  ...dsink-Add-drm-
> > support-in-waylandsink.patch |  703 ------------  ...waylandsink-Add-input-
> > device-support.patch | 1022 -----------------
> >  .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |   37 -
> >  ...e-formats-table-to-include-YUV422-mu.patch |   61 -
> >  ...for-drm-memory-support-in-try_import.patch |   33 -
> >  ...rc-Increase-minimum-num-buffers-by-3.patch |   29 -
> >  ...Use-generic-dmabuf-import-in-v4l2src.patch |   43 -
> >  .../gstreamer1.0-plugins-good_1.18.%.bbappend |   12 -
> >  15 files changed, 3 insertions(+), 3312 deletions(-)  delete mode 100644
> > meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> > bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-
> > DRM-allocator-support.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-wayland-drm-kms-
> > add-support-for-meson-build-system.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-
> > mouse-drag-and-drop-support.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-parsers-bug-fixes-
> > on-parsers.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-kmssink-Add-
> > omapdrm-and-tidss-in-the-list-of-drivers.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Add-
> > drm-support-in-waylandsink.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-
> > input-device-support.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Update-
> > formats-table-to-include-YUV422-mu.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-
> > drm-memory-support-in-try_import.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-
> > minimum-num-buffers-by-3.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good/0002-v4l2src-Use-
> > generic-dmabuf-import-in-v4l2src.patch
> >  delete mode 100644 meta-arago-extras/recipes-
> > multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend

