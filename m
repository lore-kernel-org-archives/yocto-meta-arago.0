Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B44A1529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 00:33:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C0XnXV011986
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:49 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0Xm7r020293
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:48 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 19:33:48 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C0Xl4W000505;	Wed, 11 Mar 2015 19:33:48 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t2C0Xje2024854;	Thu, 12 Mar 2015 06:03:46 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 19:33:40 -0500
Message-ID: <1426120423-27425-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] stream: Update license name
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
X-List-Received-Date: Thu, 12 Mar 2015 00:33:51 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Stream license is not a standard license so change the license from BSD.
* Since the license name is multiple words use underscores instead of spaces
  because it then assumes that each word is a difference license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/stream/stream_git.bb         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
index 41ba5ad..75955da 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Stream Benchmark"
 HOMEPAGE = "http://www.cs.virginia.edu/stream/"
-LICENSE = "BSD"
+LICENSE = "Stream_Benchmark_License"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
 SECTION = "system"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
 SRCREV = "bd474633b7b0352211b48d84065bf7b7e166e4c2"
-- 
1.7.9.5


