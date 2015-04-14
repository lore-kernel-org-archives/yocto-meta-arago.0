Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D57EB529D2
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2015 11:30:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3EBU6Rc004597
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 06:30:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EBU3xP028696
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2015 06:30:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 06:30:02 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3EBU2j3022441;
	Tue, 14 Apr 2015 06:30:02 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Yhz2X-0003Qi-Uw;
	Tue, 14 Apr 2015 07:30:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Apr 2015 07:30:00 -0400
Message-ID: <1429011000-13149-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] boost: Extend with nativesdk class.
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
X-List-Received-Date: Tue, 14 Apr 2015 11:30:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-support/boost/boost_1.55.0.bbappend    |    1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-extras/recipes-support/boost/boost_1.55.0.bbappend

diff --git a/meta-arago-extras/recipes-support/boost/boost_1.55.0.bbappend b/meta-arago-extras/recipes-support/boost/boost_1.55.0.bbappend
new file mode 100644
index 0000000..c9eeb4e
--- /dev/null
+++ b/meta-arago-extras/recipes-support/boost/boost_1.55.0.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND += " nativesdk"
-- 
1.7.9.5


