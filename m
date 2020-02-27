Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 61B3F52994
	for <meta-arago@arago-project.org>;
	Thu, 27 Feb 2020 01:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A85240BFD;
	Thu, 27 Feb 2020 01:47:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4crByRdzuMSx; Thu, 27 Feb 2020 01:47:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7612C40A13;
	Thu, 27 Feb 2020 01:47:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 315B0172FDE;
	Wed, 26 Feb 2020 20:47:57 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 26 Feb 2020 20:47:57 -0500
Message-Id: <1582768077-22658-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] perf: drop deprecated bbappend
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
X-List-Received-Date: Thu, 27 Feb 2020 01:49:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-kernel/perf/perf.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/perf/perf.bbappend

diff --git a/meta-arago-distro/recipes-kernel/perf/perf.bbappend b/meta-arago-distro/recipes-kernel/perf/perf.bbappend
deleted file mode 100644
index 73ef203..0000000
--- a/meta-arago-distro/recipes-kernel/perf/perf.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-DEPENDS += "bison-native flex-native"
-- 
2.7.4


