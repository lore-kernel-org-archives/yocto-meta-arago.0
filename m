Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3123F52A21
	for <meta-arago@arago-project.org>;
	Thu, 28 May 2015 14:26:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4SEQZa4014502
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 09:26:35 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SEQZ1K005312
	for <meta-arago@arago-project.org>; Thu, 28 May 2015 09:26:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 09:26:35 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4SEQZTZ026973;	Thu, 28 May 2015 09:26:35 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YxylX-0001dj-1M;
	Thu, 28 May 2015 10:26:35 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 28 May 2015 10:26:32 -0400
Message-ID: <1432823192-6273-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] processor-sdk-daisy-config: Bump bitbake to 1.26, point meta-arago to daisy branch.
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
X-List-Received-Date: Thu, 28 May 2015 14:26:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-daisy-config.txt   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
index ffd8e0f..63a5e27 100644
--- a/configs/processor-sdk/processor-sdk-daisy-config.txt
+++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
-- 
1.7.9.5


