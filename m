Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 7497B52A63
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 20:22:09 +0000 (UTC)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9A009XRLW0U610@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jun 2016 15:21:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=h2TpYsvnISjjBNbPeboA:9
Received: by 100.15.86.14 with SMTP id 7feb1adb; Fri, 24 Jun 2016 20:21:51 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4338C162085;	Fri,
	24 Jun 2016 16:21:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Jun 2016 16:21:33 -0400
Message-id: <20160624202133.19795-2-denis@denix.org>
X-Mailer: git-send-email 2.9.0
In-reply-to: <20160624202133.19795-1-denis@denix.org>
References: <20160624202133.19795-1-denis@denix.org>
Subject: [PATCH 2/2] arago.conf: libinput is the default now, drop PACKAGECONFIG
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
X-List-Received-Date: Fri, 24 Jun 2016 20:22:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 25a1954..c8caeb1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,7 +45,7 @@ VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 QT_PROVIDER ?= "qt5"
 
 # Distro-specific package configuration
-PACKAGECONFIG_pn-weston = "egl kms launch libinput"
+PACKAGECONFIG_pn-weston = "egl kms launch"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-- 
2.9.0


