Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8AF3E52A02
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 17:15:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GHF5n8001652
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF4QU011887
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 12:15:04 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF4OI005528;
	Wed, 16 Sep 2015 12:15:04 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcGIS-0006Su-9N; Wed, 16 Sep 2015 13:15:04 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Sep 2015 13:14:59 -0400
Message-ID: <1442423699-24800-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
References: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] oprofile-example: Bump SRCREV
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
X-List-Received-Date: Wed, 16 Sep 2015 17:15:05 -0000
Content-Type: text/plain

* Fix Makefile to take LDFLAGS from environment.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/oprofile-example/oprofile-example_git.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index dd013c8..5c1959e 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -8,10 +8,10 @@ SECTION = "system"
 INHIBIT_PACKAGE_STRIP = "1"
 CLEANBROKEN = "1"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "master"
-SRCREV = "066ecdab2bf0788eec253bf27fd44f7436f0cd04"
+SRCREV = "df874b33b5ec2e6de5a54069b202dc13a782f52a"
 
 SRC_URI = "git://git.ti.com/apps/oprofile-example.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


