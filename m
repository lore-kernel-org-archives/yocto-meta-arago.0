Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2575C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 21:51:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5627.1741989102972305304
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 14 Mar 2025 14:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6252C40CA8;
	Fri, 14 Mar 2025 21:51:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0oO1uOfrAld; Fri, 14 Mar 2025 21:51:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38E25406B5;
	Fri, 14 Mar 2025 21:51:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EBDEE164372; Fri, 14 Mar 2025 17:51:38 -0400 (EDT)
Date: Fri, 14 Mar 2025 17:51:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com, Ryan Eatmon <reatmon@ti.com>
Cc: Andrew Davis <afd@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH]
 packagegroup-arago-tisdk-graphics : Add ti-gc320-libs-dev package
Message-ID: <20250314215138.GH23729@denix.org>
References: <20250305161648.351534-1-a-christidis@ti.com>
 <affeb199-26ac-46fb-b931-d6d129c66f78@ti.com>
 <5533c6e2-8a0a-4ab2-a1cb-9fa3ffb10a6c@ti.com>
 <3738e4d2-7bc1-41c9-a6de-4cd6ab216725@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3738e4d2-7bc1-41c9-a6de-4cd6ab216725@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 14 Mar 2025 21:51:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16052

On Wed, Mar 05, 2025 at 04:31:17PM -0600, Antonios Christidis via lists.y=
octoproject.org wrote:
> Ryan reject this patch, I'm sending a new patch that will edit the
> ti-gc320-tests recipe that will achieve the same thing.

Ryan,

I see this on master-wip, while it was requested to be rejected. Thanks.


> On 3/5/25 1:22 PM, Antonios Christidis wrote:
> >
> >On 3/5/25 12:32 PM, Andrew Davis wrote:
> >>On 3/5/25 10:16 AM, Antonios Christidis via
> >>lists.yoctoproject.org wrote:
> >>>From: Antonios Christidis <a-christidis@ti.com>
> >>>
> >>>Reformat the packagegroup, by creating the GFX_GC320 variable which =
now
> >>>includes ti-gc320-tests and the ti-gc320-libs-dev package.
> >>>This is needed as
> >>>the -dev package includes the symb link for the library.
> >>>
> >>>This patch goes hand in hand with a patch series sent to
> >>>meta-ti porting gc320
> >>>to kernel 6.12 .
> >>>
> >>>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >>>---
> >>>=A0 .../packagegroups/packagegroup-arago-tisdk-graphics.bb=A0=A0=A0 =
|
> >>>8 +++++++-
> >>>=A0 1 file changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-graphics.bb
> >>>
> >>>index a82db154..60806446 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-graphics.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-graphics.bb
> >>>@@ -16,11 +16,17 @@ GFX_UTILS:append:omap-a15=A0 =3D "\
> >>>=A0=A0=A0=A0=A0 glsdk-util-scripts \
> >>>=A0 "
> >>>=A0 +GFX_GC320 =3D "\
> >>>+=A0=A0=A0 ti-gc320-libs-dev\
> >>
> >>Do you really need this? The -dev package will be pulled into
> >>the sysroot for any package that DEPENDS on the library.
> >>
> >Good point, the only package that needs libs-dev is
> >ti-gc320-tests, I'll update that recipe RRDEPENDS instead of going
> >this route.
> >
> >>>+=A0=A0=A0 ti-gc320-tests\
> >>>+"
> >>>+
> >>>+
> >>
> >>Extra newline?
> >
> >I'll fix this.
> >
> >>
> >>>=A0 RDEPENDS:${PN} =3D "\
> >>>=A0=A0=A0=A0=A0 libegl \
> >>>=A0=A0=A0=A0=A0 glmark2 \
> >>>=A0=A0=A0=A0=A0 kmscube \
> >>>-=A0=A0=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'gc320',
> >>>'ti-gc320-tests', '', d)} \
> >>>+=A0=A0=A0 ${@bb.utils.contains('MACHINE_FEATURES', 'gc320',
> >>>"${GFX_GC320}", '', d)} \
> >>
> >>Is there some test package that depends on ti-gc320-tests, maybe
> >>ltp-ddt?
> >>If so then this should be a RDEPENDS in that package instead.
> >>
> >There's no package that depends on it.
> >>Andrew
> >>
> >>>${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> >>>"${GFX_WAYLAND}", '', d)} \
> >>>=A0=A0=A0=A0=A0 ${GFX_UTILS} \
> >>>=A0 "

