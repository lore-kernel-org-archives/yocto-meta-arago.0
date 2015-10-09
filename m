Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B553E52961
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:42:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99Bg6j9003791
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:42:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bg6rA000660
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 06:42:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 06:42:06 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99Bg5iP015004;
	Fri, 9 Oct 2015 06:42:05 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkW3p-0000fd-KU; Fri, 09 Oct 2015 07:42:05 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 07:42:03 -0400
Message-ID: <1444390923-2538-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444390923-2538-1-git-send-email-j-stiffler@ti.com>
References: <1444390923-2538-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] configs: Add processor-sdk-02.00.00.00-config
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
X-List-Received-Date: Fri, 09 Oct 2015 11:42:06 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-02.00.00.00-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-02.00.00.00-config.txt

diff --git a/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
new file mode 100644
index 0000000..f43a511
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


