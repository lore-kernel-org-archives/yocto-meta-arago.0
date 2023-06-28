Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C9DEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:58:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.20658.1687967900073151542
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Jun 2023 08:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0DC140A20;
	Wed, 28 Jun 2023 15:58:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYmVBRNZY4jf; Wed, 28 Jun 2023 15:58:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5A00408CD;
	Wed, 28 Jun 2023 15:58:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 73721163B7B; Wed, 28 Jun 2023 11:58:14 -0400 (EDT)
Date: Wed, 28 Jun 2023 11:58:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] misc: Add missing Upstream-Status
 to various patches
Message-ID: <20230628155814.GT1518@denix.org>
References: <20230628145402.11529-1-reatmon@ti.com>
 <de2c558f-9f92-b674-9561-d52d1e45b0be@ti.com>
 <5e9fa5f5-8d34-2e1c-f267-671f8ecd3828@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5e9fa5f5-8d34-2e1c-f267-671f8ecd3828@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Jun 2023 15:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14727

On Wed, Jun 28, 2023 at 10:39:20AM -0500, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
> >>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-R=
evert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/rec=
ipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-c=
ommit.patch
> >>index 13ab5e98..0c0d9089 100644
> >>--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-r=
equire-GL_EXT_unpack_subimage-commit.patch
> >>+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-r=
equire-GL_EXT_unpack_subimage-commit.patch
> >>@@ -9,6 +9,8 @@ That commit removed support for GPU drivers
> >>without GL_EXT_unpack_subimage
> >>=A0 which SGX does not support. Add back support for GPUs without thi=
s
> >>=A0 extension.
> >>+Upstream-Status: Pending
> >>+
> >>=A0 Signed-off-by: Andrew Davis <afd@ti.com>
> >>=A0 ---
> >>=A0=A0 libweston/renderer-gl/gl-renderer-internal.h |=A0 2 ++
> >>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-b=
ackend-drm-Select-plane-based-on-current-attached-C.patch b/meta-arago-di=
stro/recipes-graphics/wayland/weston/0001-backend-drm-Select-plane-based-=
on-current-attached-C.patch
> >>index d9444641..f4dce134 100644
> >>--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-=
drm-Select-plane-based-on-current-attached-C.patch
> >>+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-=
drm-Select-plane-based-on-current-attached-C.patch
> >>@@ -10,6 +10,8 @@ the corresponding CRTC.
> >>=A0 This prevents changing a CRTC's primary plane when it is active
> >>=A0 which is not allowed by the DRM framework.
> >>+Upstream-Status: Pending
> >
> >I got this one in upstream now, just not in this version of Weston.
> >
> >https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/393
>=20
> Should I change the status then?  Or leave it as Pending and wait
> for us to remove the patch completely?

There are also "Submitted" and "Accepted" statuses:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

