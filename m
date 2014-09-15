Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 524BF5298D
	for <meta-arago@arago-project.org>;
	Mon, 15 Sep 2014 12:58:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8FCwhxc015595
	for <meta-arago@arago-project.org>; Mon, 15 Sep 2014 07:58:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8FCwg2U027082
	for <meta-arago@arago-project.org>; Mon, 15 Sep 2014 07:58:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 07:58:43 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8FCwguM000905;
	Mon, 15 Sep 2014 07:58:42 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1XTVre-0006lG-7S;
	Mon, 15 Sep 2014 08:58:42 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Sep 2014 08:58:39 -0400
Message-ID: <1410785920-25960-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [tisdk-build-scripts][PATCH 1/2] generate-report: Copy LOG_DIR to results directory
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
X-List-Received-Date: Mon, 15 Sep 2014 12:58:44 -0000
Content-Type: text/plain

* This change will make the logs available on the build archive server.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 lib/oesdk/generate-report |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/oesdk/generate-report b/lib/oesdk/generate-report
index 0416018..84fffb4 100644
--- a/lib/oesdk/generate-report
+++ b/lib/oesdk/generate-report
@@ -255,6 +255,9 @@ generate_report() {
 
     mkdir -p $results_dir
 
+    # Copy all of the logs to the results directory
+    cp -rv $LOG_DIR $results_dir
+
     write_results_header
 
     write_repos_table
-- 
1.7.9.5


