Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BC84F52CBB
	for <meta-arago@arago-project.org>;
	Thu,  1 Apr 2021 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F5ED40C92;
	Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Dsx790cJEYw0; Thu,  1 Apr 2021 21:24:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ED8E740C7F;
	Thu,  1 Apr 2021 21:24:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 41290174568;
	Thu,  1 Apr 2021 17:24:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Apr 2021 17:23:31 -0400
Message-Id: <1617312217-14991-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617312217-14991-1-git-send-email-denis@denix.org>
References: <1617312217-14991-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH 1/7] make-mod-scripts: pass CROSS_COMPILE to configure and build
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
X-List-Received-Date: Thu, 01 Apr 2021 21:23:56 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

The fix is submitted upstream to oe-core/master.
For now also do it locally in a bbappend, so it also fixed for dunfell.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend        | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend

diff --git a/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
new file mode 100644
index 0000000..b76af9f
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bbappend
@@ -0,0 +1 @@
+EXTRA_OEMAKE += "CROSS_COMPILE=${TARGET_PREFIX}"
-- 
2.7.4


