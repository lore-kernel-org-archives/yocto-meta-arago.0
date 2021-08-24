Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D11D452B5B
	for <meta-arago@arago-project.org>;
	Tue, 24 Aug 2021 19:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E8DD40C1D;
	Tue, 24 Aug 2021 19:27:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QKdDWrQoGZ1s; Tue, 24 Aug 2021 19:27:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 62DE740BA8;
	Tue, 24 Aug 2021 19:27:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9DCC5174665;
	Tue, 24 Aug 2021 15:27:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 24 Aug 2021 15:27:04 -0400
Message-Id: <1629833224-27240-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] mbedtls: remove bbappend, change is upstream
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
X-List-Received-Date: Tue, 24 Aug 2021 19:26:42 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
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


