Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F0F2A52970
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 83FB020B98;
	Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0Y9nSv27WPoo; Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C3D4209A1;
	Tue, 28 Feb 2017 02:41:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A1FAA16238C;
	Mon, 27 Feb 2017 21:41:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 27 Feb 2017 21:41:45 -0500
Message-Id: <1488249706-52208-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] kexec-tools: update to 2.0.14
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
X-List-Received-Date: Tue, 28 Feb 2017 02:41:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../kexec/{kexec-tools_2.0.13pre.bb => kexec-tools_2.0.14.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-kernel/kexec/{kexec-tools_2.0.13pre.bb => kexec-tools_2.0.14.bb} (91%)

diff --git a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb
similarity index 91%
rename from meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb
rename to meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index 7f498c9..9cf5e94 100644
--- a/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.13pre.bb
+++ b/meta-arago-extras/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -4,10 +4,10 @@ EXTRA_OECONF = " --with-zlib=yes"
 
 S = "${WORKDIR}/git"
 
-PV = "2.0.12+2.0.13pre"
+PV = "2.0.14"
 
-BRANCH="master"
-SRCREV = "4db7f295d59651ead1f7632198fe8c113a2e8890"
+BRANCH = "master"
+SRCREV = "69291dbef14f02b5b97d44220412b02a9fa7b5eb"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;protocol=git;branch=${BRANCH}"
 
-- 
2.7.4


