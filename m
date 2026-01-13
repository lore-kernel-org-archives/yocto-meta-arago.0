Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CABBD2F35A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:37:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66585.1768329427769194966
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 10:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B7A5740CB9;
	Tue, 13 Jan 2026 18:37:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_gG5H-4TzsQ; Tue, 13 Jan 2026 18:37:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 40E83406B9;
	Tue, 13 Jan 2026 18:37:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8F7351775E9; Tue, 13 Jan 2026 13:37:00 -0500 (EST)
Date: Tue, 13 Jan 2026 13:37:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Anurag Dutta <a-dutta@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
	gehariprasath@ti.com, a-limaye@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH v2] meta-arago-test: recipes-core:
 Add udev rules for MCAN to meta-arago-test
Message-ID: <20260113183700.GO11121@denix.org>
References: <20260107052154.1598698-1-a-dutta@ti.com>
 <fd8cf075-46d6-4654-94f8-61040bd19c76@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd8cf075-46d6-4654-94f8-61040bd19c76@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Jan 2026 18:37:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16953

On Wed, Jan 07, 2026 at 06:33:47AM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> 
> On 1/6/2026 11:21 PM, Anurag Dutta wrote:
> >Move udev rules from meta-arago-distro to meta-arago-test so that MCAN tests
> >run successfully with other distros such as "poky" as well.
> 
> If these rules should be available for other distros, then I feel
> like this should move to meta-ti.  Well, everything except for the
> arago rules which seem like they are distro specific and not
> hardware specific.  You might be able to use the
> MACHINE_EXTRA_RDEPENDS variable in each of the impacted platforms to
> ensure that new recipe in meta-ti is included in all images.
> 
> Denys, thoughts?

Had to do some digging to untangle many changes over the years...

First of all, 50-arago.rules is a simple SD card automount back from when 
there were none. These days systemd does that automatically, I believe - 
I wonder if we still need to keep it in Arago for sysvinit use case?

As of the CAN rules - those rules are for persistent naming of corresponding 
device nodes, so seem useful even outside of testing. Hence I agree with Ryan 
those rules may be moved to meta-ti-bsp.

MACHINE_ESSENTIAL_EXTRA_RDEPENDS and MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS are 
the 2 variables that can be used to automatically pull in packages to images. 
The first is a list of REQUIRED packages to boot the platform, usually kernel 
images, device trees, etc. The second lists RECOMMENDED packages to get full 
functionality from the platform, but not necessarily required to just boot it. 
Things like firmware images, etc. Which is a better fit for this.

That said, these are udev rules and will only work when dev-manager is udev 
(either systemd or sysvinit), but not mdev, I believe. So, if anyone is using 
meta-ti in that configuration, the functionality won't change, they'll just 
get unused rules...

-- 
Denys


> >Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> >---
> >
> >Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti.com/
> >
> >Changelog: v2:
> >1. moved all the rules from meta-arago-distro to meta-arago-test
> >2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >
> >  .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 --
> >  meta-arago-test/recipes-core/packagegroups/ti-test.bb           | 1 +
> >  .../recipes-core/udev/udev-aragoconf/37-can-am62.rules          | 0
> >  .../recipes-core/udev/udev-aragoconf/37-can-dra7.rules          | 0
> >  .../recipes-core/udev/udev-aragoconf/37-can-j7.rules            | 0
> >  .../recipes-core/udev/udev-aragoconf/37-can-ti33x.rules         | 0
> >  .../recipes-core/udev/udev-aragoconf/50-arago.rules             | 0
> >  .../recipes-core/udev/udev-aragoconf_1.bb                       | 0
> >  8 files changed, 1 insertion(+), 2 deletions(-)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-am62.rules (100%)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-dra7.rules (100%)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-j7.rules (100%)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules (100%)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf/50-arago.rules (100%)
> >  rename {meta-arago-distro => meta-arago-test}/recipes-core/udev/udev-aragoconf_1.bb (100%)
> >
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >index b80697e5..6df03e60 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> >@@ -21,8 +21,6 @@ ARAGO_BASE = "\
> >      ethtool \
> >      bash \
> >      opkg-bash-completion \
> >-    udev-extraconf \
> >-    udev-aragoconf \
> >      libgpiod \
> >      libgpiod-tools \
> >  "
> >diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >index dad5571c..47f8fcac 100644
> >--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >@@ -104,6 +104,7 @@ TI_TEST_TI_TOOLS = " \
> >      input-utils \
> >      ltp-ddt \
> >      openssl-perf \
> >+    udev-aragoconf \
> >      uvc-gadget \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf/50-arago.rules
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
> >diff --git a/meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb b/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
> >similarity index 100%
> >rename from meta-arago-distro/recipes-core/udev/udev-aragoconf_1.bb
> >rename to meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb

