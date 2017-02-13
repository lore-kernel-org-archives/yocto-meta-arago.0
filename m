Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2D4D752A90
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02954208B1;
	Mon, 13 Feb 2017 23:04:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SlrJ8iz9MxCP; Mon, 13 Feb 2017 23:04:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCABB20B53;
	Mon, 13 Feb 2017 23:04:25 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 22A34162374;
	Mon, 13 Feb 2017 18:04:25 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:04:08 -0500
Message-Id: <1487027048-101336-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487027048-101336-1-git-send-email-denys@ti.com>
References: <1487027048-101336-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 4/4] arago.conf: make "linaro" default sane toolchain option
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
X-List-Received-Date: Mon, 13 Feb 2017 23:04:30 -0000

Since old gcc-4.5 based Arago toolchain has been deprecated for some time now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b434509..3fb48ab 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -104,12 +104,9 @@ ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES_remove = "${@['','ubi'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
 
-# ARM9 is not supported by the Linaro toolchain so default back to the Arago
-# toolchain for ARM9 based SOCs.
-TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
-
 # Toolchain should be selected by setting TOOLCHAIN_BRAND in local.conf
 # Set some sane defaults, in case someone forgets to set them in local.conf
+TC_SANE_DEFAULT ?= "linaro"
 TOOLCHAIN_TYPE ?= "external"
 TOOLCHAIN_BRAND ?= "${@[d.getVar('TC_SANE_DEFAULT', True),'gcc'][d.getVar('TOOLCHAIN_TYPE', True) == 'internal']}"
 
-- 
2.7.4


