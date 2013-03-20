Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D1CD452A24
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:06:02 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K260RD023841
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:06:01 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K260AH023014
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:36:00 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:36:00 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epQ026167;
	Wed, 20 Mar 2013 07:35:59 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:34 -0500
Message-ID: <1363745138-10288-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/17] ti-wifi-utils: Add runtime dependency on wilink-calibrate
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
X-List-Received-Date: Wed, 20 Mar 2013 02:06:03 -0000
Content-Type: text/plain

* Install the wilink calibrate script to insure that the wilink module is using
  a unique MAC address.
* By default this script only works for the wilink module that comes with
  the am335x evms.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb       |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
index e9f5a3c..6f46910 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.sp3.05.bb
@@ -3,6 +3,8 @@ require ti-wifi-utils.inc
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 
-PR_append ="a+gitr${SRCPV}"
+PR_append ="b+gitr${SRCPV}"
 
 SRCREV = "ol_R5.SP3.05"
+
+RDEPENDS_${PN}_am335x-evm_append = " wilink-calibrate"
-- 
1.7.0.4


