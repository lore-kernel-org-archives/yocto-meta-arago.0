Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 4A4E352A2D
	for <meta-arago@arago-project.org>;
	Tue, 28 Apr 2020 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7376C40C13;
	Tue, 28 Apr 2020 18:54:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UIyzWZqnHnXf; Tue, 28 Apr 2020 18:54:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F66940AB5;
	Tue, 28 Apr 2020 18:54:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3415416E905;
	Tue, 28 Apr 2020 14:54:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 28 Apr 2020 14:54:24 -0400
Message-Id: <1588100065-32645-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] openssl: fix to RDEPEND on cryptodev-module was upstreamed, remove locally
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
X-List-Received-Date: Tue, 28 Apr 2020 18:56:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend
deleted file mode 100644
index 61289b6..0000000
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
-- 
2.7.4


