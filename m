Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id 4CC0E52AC7
	for <meta-arago@arago-project.org>;
	Mon, 22 Feb 2016 22:02:54 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.151])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2Y00NHRYKE1720@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 22 Feb 2016 16:02:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=EpQ_lWvM58tWKUpmDaQA:9
	a=7fcD0KJh-3DhZqc5:21 a=fx78o1aO6aNdaBfS:21
Received: by 100.15.86.14 with SMTP id 4a8ea8f4; Mon, 22 Feb 2016 22:02:38 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9229E161EB5;	Mon,
	22 Feb 2016 17:02:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 22 Feb 2016 17:02:37 -0500
Message-id: <1456178557-6945-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] oe-layertool-setup: pass TI_SECURE_DEV_PKG_AM4 and TI_SECURE_DEV_PKG_DRA7 env vars
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
X-List-Received-Date: Mon, 22 Feb 2016 22:02:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 oe-layertool-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 7cd0389..a90e86f 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -805,7 +805,7 @@ unset BITBAKEDIR
 unset SCRIPTS
 export PATH
 export BUILDDIR=${builddir}
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX"
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_AM4 TI_SECURE_DEV_PKG_DRA7"
 EOM
 }
 
-- 
2.2.0


