Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D6B6C529E5
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02DE440B6D;
	Wed, 29 Apr 2020 15:14:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7S_VoEIcOaAE; Wed, 29 Apr 2020 15:14:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7C71140951;
	Wed, 29 Apr 2020 15:14:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 45B08172AD6;
	Wed, 29 Apr 2020 11:14:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 29 Apr 2020 11:14:40 -0400
Message-Id: <1588173280-37815-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ltp-ddt: set prefix back to /opt/ltp instead of /opt/${PN}
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
X-List-Received-Date: Wed, 29 Apr 2020 15:17:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

As using /opt/${PN} from upstream ltp recipe would result in /opt/ltp-ddt
in case of ltp-ddt recipe. Set it back to /opt/ltp explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 17d22b5..b403a71 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -19,6 +19,9 @@ BRANCH ?= "master"
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
 SRC_URI_prepend = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} "
 
+export prefix = "/opt/ltp"
+export exec_prefix = "/opt/ltp"
+
 EXTRA_OEMAKE_append = " \
     KERNEL_USR_INC=${STAGING_INCDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
-- 
2.7.4


