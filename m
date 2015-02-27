Return-Path: <a0850405@a0850405-off1>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BE6A352983
	for <meta-arago@arago-project.org>;
	Fri, 27 Feb 2015 20:55:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RKtdDY020041
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:39 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtbX0017516
	for <meta-arago@arago-project.org>; Fri, 27 Feb 2015 14:55:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 14:55:37 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RKtbtw006406;
	Fri, 27 Feb 2015 14:55:37 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YRRwf-00086c-9P;
	Fri, 27 Feb 2015 15:55:37 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Feb 2015 15:55:12 -0500
Message-ID: <1425070513-31101-2-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1425070513-31101-1-git-send-email-ceh@ti.com>
References: <1425070513-31101-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-arago-test: Add serialcheck
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
X-List-Received-Date: Fri, 27 Feb 2015 20:55:40 -0000
Content-Type: text/plain

Add serialcheck utility to validate serial ports.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 051f32b..d6fc0f5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -23,6 +23,7 @@ ARAGO_TEST = "\
     rng-tools \
     perf \
     v4l-utils \
+    serialcheck \
     "
 
 ARAGO_TI_TEST = "\
-- 
1.9.1


