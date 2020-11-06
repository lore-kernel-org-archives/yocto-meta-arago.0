Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A453A529BD
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2020 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A518440AFF;
	Fri,  6 Nov 2020 19:56:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mfhCASW3CqFa; Fri,  6 Nov 2020 19:56:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67D1740A89;
	Fri,  6 Nov 2020 19:56:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E23E1744E6; Fri,  6 Nov 2020 14:56:36 -0500 (EST)
Date: Fri, 6 Nov 2020 14:56:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201106195636.GK19155@denix.org>
References: <20201106175807.E7BF2529D8@arago-project.org>
	<20201106193256.GJ19155@denix.org>
	<4abef988-e8e1-08bb-e789-2e580ce2ee18@ti.com>
MIME-Version: 1.0
In-Reply-To: <4abef988-e8e1-08bb-e789-2e580ce2ee18@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [arago-commits] Dan Murphy : ti-sci-fw: Update to 2020.08b system firmware
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
X-List-Received-Date: Fri, 06 Nov 2020 19:59:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2020 at 01:35:36PM -0600, Dan Murphy wrote:
> Denys
> 
> On 11/6/20 1:32 PM, Denys Dmytriyenko wrote:
> >On Fri, Nov 06, 2020 at 05:58:07PM +0000, Arago Project git wrote:
> >>Module: meta-ti
> >>Branch: dunfell-next
> >>Commit: f8979375632b7fc75233aaca5e420bbb37b2fef9
> >>URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f8979375632b7fc75233aaca5e420bbb37b2fef9
> >>
> >>Author: Dan Murphy <dmurphy@ti.com>
> >>Date:   Fri Nov  6 09:12:33 2020 -0600
> >>
> >>ti-sci-fw: Update to 2020.08b system firmware
> >>
> >>Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>
> >>---
> >>
> >>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc    |    6 +++---
> >>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |    2 ++
> >>  2 files changed, 5 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >>index 00e6118..24de33d 100644
> >>--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >>+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> >>@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
> >>  LICENSE = "TI-TFL"
> >>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> >>-PV = "2020.08-rc3"
> >>+PV = "2020.08b"
> >>-SRCREV = "8a22979dc944f6f4f867e2ac637c51a317efaacd"
> >>+SRCREV = "f5685b5980d93709e20466ffa19145ffd83b4ca4"
> >>  BRANCH ?= "ti-linux-firmware"
> >>-SRCREV_imggen = "36fe2d183a734f65b9adbd3097e5d51a6f931521"
> >>+SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
> >>  SRCREV_FORMAT = "imggen"
> >>  SRC_URI = " \
> >>diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>index 1239b27..f9a7cf4 100644
> >>--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> >>@@ -19,6 +19,8 @@ SYSFW_SOC ?= "unknown"
> >>  SYSFW_CONFIG ?= "unknown"
> >>  SYSFW_PREFIX = "ti-sci-firmware"
> >>+SYSFW_PREFIX_j7 = "ti-fs-firmware"
> >>+SYSFW_PREFIX_j7200-evm = "ti-fs-firmware"
> >This is not needed - j7200-evm is part of j7 SOC_FAMILY, so the first line
> >would be enough...
> 
> Actually this is not even correct.  This fails to build because the
> MACHINE is for the k3r5.  Both of these still use the ti-sci prefix.
> 
> The working change actually will be
> 
> SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
> SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
> 
> I am testing this now and the builds are now passing

Ah, right, SYSFW is k3r5 specific.

-- 
Denys

