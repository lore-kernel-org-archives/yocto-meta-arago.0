Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0662E52A42
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1365940C12;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id H4r_g6d4iWFI; Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0232B40A58;
	Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D523E173E2C;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:14 -0400
Message-Id: <1568302717-46518-10-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 09/32] ipsec-tools: drop local bbappend, ipsec-tools is deprecated and removed
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:00 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend b/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
deleted file mode 100644
index b4cee8f..0000000
--- a/meta-arago-distro/recipes-support/ipsec-tools/ipsec-tools_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = ".arago0"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


