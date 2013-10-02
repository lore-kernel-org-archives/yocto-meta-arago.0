Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AE40452A76
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 14:00:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92E0IhF018603
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 09:00:18 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92E0I6r009355
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 09:00:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 2 Oct 2013 09:00:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92E0ItB005891;
	Wed, 2 Oct 2013 09:00:18 -0500
Date: Wed, 2 Oct 2013 10:00:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131002140018.GF31698@edge>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<1380650659-16536-3-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015977A82E@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015977A82E@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 3/3] Don't package kernel files in boot partition for AMSDK 7.0
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
X-List-Received-Date: Wed, 02 Oct 2013 14:00:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 02, 2013 at 01:11:42PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>

Ack. This is amsdk specific config though.


> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, October 01, 2013 1:04 PM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 3/3] Don't package kernel files in
> >boot partition for AMSDK 7.0
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > configs/amsdk-config-07.00.00.00.txt |    2 +-
> > 1 files changed, 1 insertions(+), 1 deletions(-)
> >
> >diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-
> >config-07.00.00.00.txt
> >index a011f83..bf409d7 100644
> >--- a/configs/amsdk-config-07.00.00.00.txt
> >+++ b/configs/amsdk-config-07.00.00.00.txt
> >@@ -241,7 +241,7 @@ SD_CARD_CONTENT="/home/jenkins/extra-
> >files/sd_content"
> > # the boot partition tarball or not.  For newer kernel and u-boot
> >combinations
> > # the uImage and dtb files are kept in the rootfs partition and
> >placing it in
> > # the boot partition will cause confusion.
> >-PACKAGE_BOOT_KERNEL_FILES="true"
> >+PACKAGE_BOOT_KERNEL_FILES="false"
> >
> > # This variable points to the directory where the webgen tool has
> >been
> > # Installed.
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

