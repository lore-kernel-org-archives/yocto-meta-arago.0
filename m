Return-Path: <localcontrol@dntsab06real.emea.dhcp.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4835152A8E
	for <meta-arago@arago-project.org>;
	Wed,  9 Oct 2013 23:57:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99NvOHO003002
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99NvOjt014608
	for <meta-arago@arago-project.org>; Wed, 9 Oct 2013 18:57:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 18:57:24 -0500
Received: from dntsab06real.emea.dhcp.ti.com (dntsab06real.emea.dhcp.ti.com
	[137.167.84.131])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	r99NvNet000879	for <meta-arago@arago-project.org>;
	Wed, 9 Oct 2013 18:57:23 -0500
Received: from dntsab06real.emea.dhcp.ti.com (localhost [127.0.0.1])	by
	dntsab06real.emea.dhcp.ti.com (8.14.4/8.14.4/Debian-2ubuntu2) with
	ESMTP id r9A0u6Wt013618	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 01:56:06 +0100
Received: (from localcontrol@localhost)	by dntsab06real.emea.dhcp.ti.com
	(8.14.4/8.14.4/Submit) id r9A0u6k8013617	for
	meta-arago@arago-project.org; Thu, 10 Oct 2013 01:56:06 +0100
From: Roger Monk <r-monk@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 10 Oct 2013 01:55:57 +0100
Message-ID: <1381366559-13586-1-git-send-email-r-monk@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] meta-arago-extras - Fix-up wilink8 r8.a6.01
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
X-List-Received-Date: Wed, 09 Oct 2013 23:57:27 -0000
Content-Type: text/plain

These patches fixup broken wilink8 recipes for release r8.a6.01.
This version is old and soon to be replaced, but fix-up rebased
commit-id and recipe parse issues first.

Roger Monk (2):
  ti-connectivity/wlconf_r8.a6.01: Fix missing line continuation in
    install method
  ti-connectivity/compat_wl18xx_r8.a6.01: Update SRC_URI

 .../ti-compat-wireless-wl18xx_r8.a6.01.bb          |    2 +-
 .../recipes-connectivity/wlconf/wlconf_r8.a6.01.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


