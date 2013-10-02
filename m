Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 93D0F52A76
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:59:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92DxAos018415
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:59:10 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DxACl006831
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:59:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 2 Oct 2013 08:59:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DxA5E012393;
	Wed, 2 Oct 2013 08:59:10 -0500
Date: Wed, 2 Oct 2013 09:59:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131002135909.GE31698@edge>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<1380650659-16536-2-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015977A7FB@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015977A7FB@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 2/3] Remove unnecessary binary from boot partition
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Oct 2013 13:59:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 02, 2013 at 01:11:24PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>

Ack.


> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, October 01, 2013 1:04 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 2/3] Remove unnecessary binary from
> >boot partition
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > lib/oesdk/package-sdks |    6 ++++++
> > 1 files changed, 6 insertions(+), 0 deletions(-)
> >
> >diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
> >index 49f1fe7..8f4e5e2 100644
> >--- a/lib/oesdk/package-sdks
> >+++ b/lib/oesdk/package-sdks
> >@@ -42,6 +42,12 @@ create_sd_card_content() {
> >         mv u-boot-$m.bin u-boot.bin
> >     fi
> >
> >+    # Remove this binary since it wouldn't be used in the boot
> >partition
> >+    if [ -e u-boot-spl.bin-$m ]
> >+    then
> >+        rm u-boot-spl.bin-$m
> >+    fi
> >+
> >     # For some devices the uImage  and dtb files are read from
> >the /boot
> >     # directory of the rootfs.  In this case do not package the
> >uImage
> >     # and device tree files into the boot partition as it will
> >cause
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

