Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6F5E852990
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 20:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D992720AEE;
	Thu, 14 Dec 2017 20:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BuKGCsrnAKAN; Thu, 14 Dec 2017 20:01:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6CD420567;
	Thu, 14 Dec 2017 20:00:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4C1F016276E;
	Thu, 14 Dec 2017 15:00:59 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 14 Dec 2017 15:00:57 -0500
Message-Id: <1513281658-4302-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] external-linaro-bfd-version: use sane default to not break parsing w/o distro
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
X-List-Received-Date: Thu, 14 Dec 2017 20:01:02 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
index 4813026..47911a2 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
@@ -1,3 +1,5 @@
+TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
+
 def elt_get_bfd_version(d):
 	import subprocess,os,bb
 	if os.path.exists(d.getVar('TOOLCHAIN_PATH', d, 1)+'/bin/'+d.getVar('TARGET_PREFIX', d, 1)+'as'):
-- 
2.7.4


