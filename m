Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4DB7C52A29
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2020 23:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E126640C33;
	Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WuFQPy75LfMt; Thu, 23 Apr 2020 23:57:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BA6BD40C18;
	Thu, 23 Apr 2020 23:57:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 73DF1172A05;
	Thu, 23 Apr 2020 19:57:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 23 Apr 2020 19:57:16 -0400
Message-Id: <1587686239-6605-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587686239-6605-1-git-send-email-denis@denix.org>
References: <1587686239-6605-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/5] bash: revert previous overlayed fix for ptest
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
X-List-Received-Date: Thu, 23 Apr 2020 23:59:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Reverts 742186ca7ac250aebdcb916bd850300626f08f3f

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-extended/bash/bash_%.bbappend | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
index bbea260..01e4c85 100644
--- a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
+++ b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
@@ -1,6 +1,3 @@
 PR_append = ".arago0"
 
 EXTRA_OECONF += " --disable-command-timing"
-
-DEPENDS_append_libc-glibc = " virtual/libc-locale"
-DEPENDS_remove = "glibc-locale"
-- 
2.7.4


