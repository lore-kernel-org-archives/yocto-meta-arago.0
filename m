Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 65E5C52A14
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 20:04:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27K4uAp014536
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:04:56 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27K4usm002466
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:04:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 14:04:56 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s27K4uIQ014452;	Fri, 7 Mar 2014 14:04:56 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Mar 2014 15:04:55 -0500
Message-ID: <1394222695-22077-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] mcsdk-dylan-config: Update mcsdk-config to use java layer
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
X-List-Received-Date: Fri, 07 Mar 2014 20:04:57 -0000
Content-Type: text/plain

- Needed to support openjdk in filesystem for XDC tools native compilation

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 configs/mcsdk/mcsdk-dylan-config.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mcsdk/mcsdk-dylan-config.txt b/configs/mcsdk/mcsdk-dylan-config.txt
index 9925642..1489b7b 100644
--- a/configs/mcsdk/mcsdk-dylan-config.txt
+++ b/configs/mcsdk/mcsdk-dylan-config.txt
@@ -8,6 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
+meta-java,git://github.com/woglinde/meta-java,master,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


