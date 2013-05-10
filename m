Return-Path: <a0862859@udb0862859>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1301952A79
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 10:52:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4AAqeUD015554
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 05:52:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4AAqZLg001720
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 05:52:40 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 10 May 2013 05:46:38 -0500
Received: from udb0862859 (udb0862859.am.dhcp.ti.com [10.218.112.220])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4AAkcIo019017;
	Fri, 10 May 2013 05:46:38 -0500
Received: from a0862859 by udb0862859 with local (Exim 4.76)	(envelope-from
	<a0862859@udb0862859>)	id 1UakqU-0002D7-E6;
	Fri, 10 May 2013 06:46:38 -0400
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2013 06:46:34 -0400
Message-ID: <1368182794-8463-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/3] Add pciutils to the console package
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
X-List-Received-Date: Fri, 10 May 2013 10:52:42 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 5a80064..930049a 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -25,6 +25,7 @@ ARAGO_UTILS = "\
     i2c-tools \
     iproute2 \
     strace \
+    pciutils \
     "
 
 ARAGO_SDK_PREREQ = "\
-- 
1.7.9.5


