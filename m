Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BC18F52974
	for <meta-arago@arago-project.org>;
	Mon, 28 Apr 2014 16:10:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3SGASKn029672
	for <meta-arago@arago-project.org>; Mon, 28 Apr 2014 11:10:28 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3SGASxg020067
	for <meta-arago@arago-project.org>; Mon, 28 Apr 2014 11:10:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Apr 2014 11:10:28 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s3SGARvv001038;	Mon, 28 Apr 2014 11:10:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 28 Apr 2014 12:10:26 -0400
Message-ID: <1398701426-4553-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] configs: mcsdk 3.0.4 update configuration
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
X-List-Received-Date: Mon, 28 Apr 2014 16:10:30 -0000
Content-Type: text/plain

- Update final release commit

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 configs/mcsdk/mcsdk-03.00.04.18-config.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mcsdk/mcsdk-03.00.04.18-config.txt b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
index 2f69ebb..7ff5e60 100644
--- a/configs/mcsdk/mcsdk-03.00.04.18-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
+meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,78d08be08c55440133b12d1db4843fcf72b583b6,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,608fd3be257002256d13422daf0b593b55463d4d,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,1fa7f364f682e5cfaa9d6e565b7ae6b8ec2a90ff,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-- 
1.7.9.5


