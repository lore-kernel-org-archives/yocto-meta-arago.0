Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 56010529EC
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A87020B15;
	Thu, 15 Feb 2018 17:13:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vEGPuVvMtiid; Thu, 15 Feb 2018 17:13:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ADB8C20B48;
	Thu, 15 Feb 2018 17:13:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 129161632A7;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:23 -0500
Message-Id: <1518714813-23100-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518714813-23100-1-git-send-email-denys@ti.com>
References: <1518714813-23100-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 02/12] ndisc6: fix got accepted upstream, drop locally
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend

diff --git a/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend b/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend
deleted file mode 100644
index 7e2cfd2..0000000
--- a/meta-arago-distro/recipes-support/ndisc6/ndisc6_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-USE_NLS = "yes"
-- 
2.7.4


