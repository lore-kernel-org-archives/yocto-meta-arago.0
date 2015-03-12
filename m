Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 16BD3529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 00:33:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C0XqNH011992
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C0Xphd020340
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 19:33:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 19:33:51 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t2C0Xo3v012293;	Wed, 11 Mar 2015 19:33:50 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t2C0Xje4024854;	Thu, 12 Mar 2015 06:03:48 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Mar 2015 19:33:42 -0500
Message-ID: <1426120423-27425-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426120423-27425-1-git-send-email-fcooper@ti.com>
References: <1426120423-27425-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] stream: Update commit used by SDK branch to include openmp version of stream
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
X-List-Received-Date: Thu, 12 Mar 2015 00:33:53 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/stream/stream_git.bbappend   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
index 9dc244b..0f93e02 100644
--- a/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
+++ b/meta-arago-distro/recipes-benchmark/stream/stream_git.bbappend
@@ -1,7 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 BRANCH = "sdk"
-SRCREV = "cfd73a33c0ceef1f8532ce6a71de3bcf9435f6a2"
+SRCREV = "96156d407d9a4e5fac4513f3d3f60a414b3355cd"
 
 do_compile_prepend() {
     #Explicitly clear some variables to insure no unexpected optimizations are being passed in.
-- 
1.7.9.5


