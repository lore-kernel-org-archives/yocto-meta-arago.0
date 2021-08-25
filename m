Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 27E0252BBB
	for <meta-arago@arago-project.org>;
	Wed, 25 Aug 2021 19:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E68240C6C;
	Wed, 25 Aug 2021 19:04:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ctikiocrNgVq; Wed, 25 Aug 2021 19:04:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5752E40A28;
	Wed, 25 Aug 2021 19:04:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 16AC2174668;
	Wed, 25 Aug 2021 15:04:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 25 Aug 2021 15:04:40 -0400
Message-Id: <1629918280-21540-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH v2] mbedtls: remove bbappend
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
X-List-Received-Date: Wed, 25 Aug 2021 19:04:18 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This change is now upstream.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - expand commit message into 2 lines

 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
deleted file mode 100644
index 608377e..0000000
--- a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


