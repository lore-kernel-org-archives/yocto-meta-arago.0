Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6419C52A83
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 18:32:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58IWNgE003750
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:32:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58IWN2M008562
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:32:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 13:32:23 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t58IWN5d012874;	Mon, 8 Jun 2015 13:32:23 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Z21qQ-00019l-TZ;
	Mon, 08 Jun 2015 14:32:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jun 2015 14:32:20 -0400
Message-ID: <1433788340-3674-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] processor-sdk-daisy-config: Freeze meta-qt5 layer to stay at QT 5.4.1
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
X-List-Received-Date: Mon, 08 Jun 2015 18:32:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-daisy-config.txt   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
index 63a5e27..61c8a59 100644
--- a/configs/processor-sdk/processor-sdk-daisy-config.txt
+++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,5ebbfedbc72452d2de18ce1557a36f3ba8b1175f,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
-- 
1.7.9.5


