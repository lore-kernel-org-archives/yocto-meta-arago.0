Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2FD9952A6D
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 12:28:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ICSMTk021056
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:28:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICSLW6025278
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:28:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 07:28:21 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICSHul020803;
	Wed, 18 Mar 2015 07:28:20 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Mar 2015 17:58:15 +0530
Message-ID: <1426681695-8833-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426681695-8833-1-git-send-email-a0393906@ti.com>
References: <1426681695-8833-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [meta-arago 3/3] oprofile-example: switch protocol to http
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
X-List-Received-Date: Wed, 18 Mar 2015 12:28:23 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../oprofile-example/oprofile-example_git.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index fa203e0..6691a57 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -12,7 +12,7 @@ PR = "r3"
 BRANCH ?= "master"
 SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
 
-SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/oprofile-example/oprofile-example.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


