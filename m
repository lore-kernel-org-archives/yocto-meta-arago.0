Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3F5B752A7B
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2381F40CA2;
	Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4UKldUuhvA8g; Sat,  3 Apr 2021 00:11:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1300440C9B;
	Sat,  3 Apr 2021 00:11:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5CF77174593;
	Fri,  2 Apr 2021 20:11:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:42 -0400
Message-Id: <1617408644-2675-28-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 27/29] FIXME: packagegroup-connectivity: disable net-snmp, IEC-62439-3 doesn't build with gcc10
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:55 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Locally added IEC-62439-3 support causes gcc10 build errors and need resolving.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 1eb0e07..913795a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -53,14 +53,14 @@ DEMO_APPS = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'wpa-gui-e', d)} \
 "
 
+#    net-snmp
+#    net-snmp-server-snmpd
 CONNECTIVITY_RDEPENDS = " \
     htop \
     iptables \
     iproute2 \
     iproute2-tc \
     iproute2-devlink \
-    net-snmp \
-    net-snmp-server-snmpd \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
-- 
2.7.4


