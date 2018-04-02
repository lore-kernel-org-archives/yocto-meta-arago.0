Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D1EE35203A
	for <meta-arago@arago-project.org>;
	Mon,  2 Apr 2018 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F18320BB3;
	Mon,  2 Apr 2018 22:47:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id azmFYh2S_yCx; Mon,  2 Apr 2018 22:47:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5FDC32079D;
	Mon,  2 Apr 2018 22:47:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DDE431633B2;
	Mon,  2 Apr 2018 18:47:18 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  2 Apr 2018 18:47:16 -0400
Message-Id: <1522709238-24760-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522709238-24760-1-git-send-email-denys@ti.com>
References: <1522709238-24760-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/4] cmake: move help files into -doc package
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
X-List-Received-Date: Mon, 02 Apr 2018 22:47:30 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend b/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
new file mode 100644
index 0000000..042e4d7
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
@@ -0,0 +1 @@
+FILES_${PN}-doc += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}/Help/"
-- 
2.7.4


