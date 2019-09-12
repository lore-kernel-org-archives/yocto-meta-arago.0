Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9EB6C52A3F
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67CD440C10;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ec64Il4XjoFo; Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 455B340BF6;
	Thu, 12 Sep 2019 15:38:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B945F173D71;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:12 -0400
Message-Id: <1568302717-46518-8-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 07/32] nativesdk-buildtools-perl-dummy: list additional modules
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
X-List-Received-Date: Thu, 12 Sep 2019 15:39:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
index 26d6ddb..b83e4e3 100644
--- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
+++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
@@ -10,10 +10,14 @@ DUMMYPROVIDES += "\
     nativesdk-perl-module-file-copy \
     nativesdk-perl-module-file-find \
     nativesdk-perl-module-file-glob \
+    nativesdk-perl-module-file-spec \
+    nativesdk-perl-module-file-spec-unix \
     nativesdk-perl-module-file-stat \
     nativesdk-perl-module-getopt-long \
     nativesdk-perl-module-io-file \
+    nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
+    nativesdk-perl-module-symbol \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
 "
-- 
2.7.4


