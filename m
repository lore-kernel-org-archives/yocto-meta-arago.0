Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7AE8552093
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50B9E2043F;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sbH7oH7DsD39; Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 36E7820AD5;
	Thu, 12 Oct 2017 21:28:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C70C71626EC;
	Thu, 12 Oct 2017 17:28:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Oct 2017 17:28:06 -0400
Message-Id: <1507843693-2615-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507843693-2615-1-git-send-email-denis@denix.org>
References: <1507843693-2615-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/9] big-data-ipc-demo: explicitly depend on ti-cgt6x-native
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
X-List-Received-Date: Thu, 12 Oct 2017 21:28:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Since cgt-c6x is being called during the build, should depend on
ti-cgt6x-native for deterministic builds and avoid breaking with
Recipe-Specific-Sysroot (RSS).

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
index 0734177..8f7820b 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo-linux_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "ti-ipc \
            ti-sysbios \
            ti-ipc-rtos \
            cmem \
+           ti-cgt6x-native \
 "
 
 EXTRA_OEMAKE = "\
-- 
2.7.4


