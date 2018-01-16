Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5BA0A52A62
	for <meta-arago@arago-project.org>;
	Tue, 16 Jan 2018 02:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D2AE20B93;
	Tue, 16 Jan 2018 02:15:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jq-oNpoZZRVW; Tue, 16 Jan 2018 02:15:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6374220B9A;
	Tue, 16 Jan 2018 02:15:23 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6DFCF163266;
	Mon, 15 Jan 2018 21:15:22 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 21:15:10 -0500
Message-Id: <1516068913-79829-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/4] bash: ptest dependency on locale should honor virtual/libc-locale
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
X-List-Received-Date: Tue, 16 Jan 2018 02:15:39 -0000

The fix was submitted upstream to oe-core - overlay locally until it gets
backported to rocko.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-extended/bash/bash_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
index 01e4c85..bbea260 100644
--- a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
+++ b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
@@ -1,3 +1,6 @@
 PR_append = ".arago0"
 
 EXTRA_OECONF += " --disable-command-timing"
+
+DEPENDS_append_libc-glibc = " virtual/libc-locale"
+DEPENDS_remove = "glibc-locale"
-- 
2.7.4


