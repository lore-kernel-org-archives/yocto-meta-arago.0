Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0DFAA52976
	for <meta-arago@arago-project.org>;
	Mon, 16 Nov 2015 14:47:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAGElgYE017651
	for <meta-arago@arago-project.org>; Mon, 16 Nov 2015 08:47:42 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAGElgej026997
	for <meta-arago@arago-project.org>; Mon, 16 Nov 2015 08:47:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 16 Nov 2015 08:47:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAGElfxQ030448;
	Mon, 16 Nov 2015 08:47:41 -0600
Date: Mon, 16 Nov 2015 09:47:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151116144726.GT3272@edge>
References: <1447683781-19243-1-git-send-email-denis@denix.org>
	<5649EB50.1000408@ti.com>
MIME-Version: 1.0
In-Reply-To: <5649EB50.1000408@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-*-amsdk-sdk-host: handle source packaging for RT kernel
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
X-List-Received-Date: Mon, 16 Nov 2015 14:47:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 16, 2015 at 09:42:24AM -0500, Jacob Stiffler wrote:
> 
> 
> On 11/16/2015 9:23 AM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb        | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> >index cf5e2e3..ca24d8e 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install additional scripts and applications into the SDK"
> >  LICENSE = "MIT"
> >-PR = "r26"
> >+PR = "r27"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -9,9 +9,9 @@ inherit packagegroup
> >  # Choose the kernel and u-boot recipe sources to use
> >  U-BOOT_SRC = "${PREFERRED_PROVIDER_virtual/bootloader}-src"
> >-KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src"
> >+KERNEL_SRC = "${PREFERRED_PROVIDER_virtual/kernel}-src${ARAGO_RT_SUFFIX}"
> 
> I do not think that this is correct. For RT kernel,
> PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging-rt", therefore
> you are trying to package linux-ti-staging-rt-src-rt.
> 
> This recipe simply packages to srcipk, and does not enable it. If
> you intend to enable the RT kernel srcipk, you will have to enable
> it in the arago-source-ipk.conf.

You are right, I didn't have my coffee yet, while on the multiple morning 
calls... ;)


> >-KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}"
> >+KERNEL_SHADOW_CLONE := "${PREFERRED_PROVIDER_virtual/kernel}${ARAGO_RT_SUFFIX}"
> >  KERNEL_SHADOW_CLONE_ENABLED := "${SRCIPK_SHALLOW_CLONE_pn-${KERNEL_SHADOW_CLONE}}"
> >  BOOT_MONITOR = ""
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

