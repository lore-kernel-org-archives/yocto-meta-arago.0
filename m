Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C161DCCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 18:58:20 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25258.1762887490316747080
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 10:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oKYisP8f;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.31, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE7LDis35IUeLBDAMlY6e1aBlPRNucsakiEC/ZiZ8BC07tYrqduPIjeiVlRIVFt7e0An7XqhndN88fToHNgDqC1r/InD71MaR1MdaDZvXPMURkPljDwyWiHyb7CSnmlJnvp8HBJqr6waY1parqX5EiwkE2noIWbRWcnpGBIH+lvtZK+CPfdfE1FBynNILxIAeid3USMViRvAyQd0KW0kpxp0ira5q8ywCHX+leqDye7nSQgKYv8HAEkq10vhfYyDx45bU9iFin/YZFkFAIhzwBYWh1zkdYsa8F3mONWueG+NkiY3f74LoYmA+ZMG8a/8Te/D/Cxta+kU2GIlekV/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwPG42QRT9sgQ5lbmn/qfH2Cl8krioRl5z5vYlXcSrU=;
 b=rqbnOlhpgj3xpxy+9evX+t9bLvB1WOl5p5klWqu5dYL773ygeIHvNceGUw2kzDWOwT+xUrY/oWP02KvlJR0JUCosOe9Y0j5NmPav99c8/wAZXFhGnjFdorrRB6TxWy0fUW903qX8QJ9PQpIAKwGIDHEZAEI25rRSPNJ/TRBwsbhr+0yfJVf+nZo/U4r5Ix26hvOZktWNmU3oG7jt5mtM6HuzvrCwOEx0MyQLpbAIuzsveeSVUJkYTnAjEXABSDIXl0rm/iq2hKiLPdgsF8p6qxJG8OozMXOM6t3F8qPbI4SZVXppWjqfYLkcMQJZVaAg3Ep+1R6vpnKwq4osPrGS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwPG42QRT9sgQ5lbmn/qfH2Cl8krioRl5z5vYlXcSrU=;
 b=oKYisP8fK5tqbAkCx3tvro4sNvSe+N7XdNRe3k6M9i7Al0LrWMvI4EpaV41gGY0nwaMhAn7+6PvF1LOGmlAq7q7DcE0YBapU2MNn9mS7ouSSgGVUHhEK8xWIsWIvXeiB4DuLC2pL4sPmZeWeeITCcDkB8HV+a+s7NKioCZMcIXM=
Received: from BL6PEPF0001641F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:f) by PH7PR10MB5770.namprd10.prod.outlook.com
 (2603:10b6:510:126::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 18:58:08 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2a01:111:f403:f903::3) by BL6PEPF0001641F.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 18:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 18:58:07 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 12:58:03 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 12:58:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 12:58:03 -0600
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABIw3681415562;
	Tue, 11 Nov 2025 12:58:03 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] init-ifupdown: Remove legacy network scripts
Date: Tue, 11 Nov 2025 12:58:02 -0600
Message-ID: <20251111185802.2351715-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|PH7PR10MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0a9432-dafb-412e-93c2-08de2154407d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gBhwDa3BCqMZSR0Pf1xOw0HmYtErXO25nCiDtY1+MCHvyLYM244O1TSKhV6E?=
 =?us-ascii?Q?wKiL07VaCN+4TViE6DvoQpqevsrIKQ5sFgRdQZFDDTM93ZgTfaeqlpQdAyX9?=
 =?us-ascii?Q?MDIYn4q0Os9XoDz2vSXrBpvgXgevIs2euuj6chvvSRRt5FuIkButtnT9djDR?=
 =?us-ascii?Q?mORxiR6uI+XNTHkF8BIv3CNL7FYFBCZhOKk3nIClKlJsbJhwuwv2oUDI0Oym?=
 =?us-ascii?Q?ItLHBmjt394AjEZKkH/taWfN4nxd1RKbOgOgAzDXn+LFO+YqhJp+w43mowMg?=
 =?us-ascii?Q?sAUED5GvcOqgGfDo1K2cLG8vdX6iS/vOyjgRZU2ZF5uYfEaMd8PNFR91VDYJ?=
 =?us-ascii?Q?oI37ey+AG35ZNuZFQMnx9ggE3pax5EWiCDTXH5SVNc3sAJgchKlpHbEM2I0P?=
 =?us-ascii?Q?cybuGMx3aTsoPXVHlcw0EpSqbFiozp6jsa0GrR3M83gPsnGowjfeZoq+/NxW?=
 =?us-ascii?Q?mrHqsKGvcs1kd7e52mzx3k/3Km6xTShOsuap1m5sWBFEoqM2Y8O3W09xsEeA?=
 =?us-ascii?Q?Z1yUIqLcRsPdVBwpwEPSLaed8t45v6Grafochb22ZUPKqVDu/kMg3XR8EJ9f?=
 =?us-ascii?Q?sOL60zHbGTAgtPRpfV4q/9wvH0xWty85UIPO2Zy5BK+vyHQTLwdEoK1nIA07?=
 =?us-ascii?Q?ZWo+gy33gvuHvJtySWrSJMr9a0FCTUjoaGg6yF8kiD/4EB5JfVVUUss3Ebst?=
 =?us-ascii?Q?+R8wt7q/WE3c3vBO4WPvVKr4EVF6xLLZMzeuGNvnhT7Yt5PHBC591+bBkNjw?=
 =?us-ascii?Q?Sq2dnpN9WRHcq0iFa4PIj9HWpb0I91IA4AFyasVf4PwhHVRJbY+tvljj1MsT?=
 =?us-ascii?Q?yg1jU+uMyaoysJ5Mhg6iVNsVgBrLASPbCeeJoDb84aMsAAWWLf6L9eoH4k2o?=
 =?us-ascii?Q?vEUi8hBzhCmxci8Vw0mNJKRP0ouCky595JN06qjI2Zhxr96bj0I5+5Zw8DcB?=
 =?us-ascii?Q?c8G2FjL+ogKkF0+03blZm61oCDPRqzCL6KOYOC7Da8LVjmRdbmyTso/UvG09?=
 =?us-ascii?Q?TKqDL0AcmG1eqtvmh38N6WXa6367keooGcSpiSmmMc1kkbiWroulMjxBAnYc?=
 =?us-ascii?Q?7AeaB+vGJL5uMUbSz5wZ+LTHxY37XOlk2o0bexAqZO0Oddw8vucCY1QdmIgr?=
 =?us-ascii?Q?YaGBukffmmutTTpq8lHwfEOkFSLU/6ECfkUWWO6iORdprlmawGXFrek3TM0D?=
 =?us-ascii?Q?U+V9IrizOcMHcPQagAfnNr8S1aP6HA0iIiQp7TPapmLHYTIl7SVdcVIb3Euj?=
 =?us-ascii?Q?OS1jstvaPN+ag5OL+M6ZwZYI3SNCs71TaFzx7wvzAydGvMB9nd/3XQSnec6V?=
 =?us-ascii?Q?GfOLchkqTQqLkvqL/woLzixk286uZuW8A6Drg1gM3LfyRP6JBeiiIhQnsN7C?=
 =?us-ascii?Q?bfssn0UfMe3kd0D3I4C9pOhyn9pBWIz4t38796Aw+ucT5zlZnOi/AHH2jn0n?=
 =?us-ascii?Q?eWYLfQHK0wGLrGHBp/d0o6YWFV5GBCJmTPwchBhNcoHFiG/CVsyeqMFSYzcl?=
 =?us-ascii?Q?y05VlLpRtkB3KLVfefR5CkMEEvfdbnlGmjDDSZXoEQlJZ7BnIdIuBcapTThC?=
 =?us-ascii?Q?xsJk6tcDVR7ScnWuvdo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 18:58:07.5517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0a9432-dafb-412e-93c2-08de2154407d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5770
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Nov 2025 18:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16743

These were added back in 2012 to work around an issue with the versions
in oe-core relating to our test farm, those issues have since been
resolved in oe-core. Plus our tested images use systemd so these are
no longer used anyway, remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../init-ifupdown/init-ifupdown-arago.inc     |  4 --
 .../init-ifupdown/init-ifupdown/init          | 63 -------------------
 .../init-ifupdown/init-ifupdown/interfaces    | 36 -----------
 .../init-ifupdown/init-ifupdown_%.bbappend    |  4 --
 4 files changed, 107 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/init-ifupdown/init-ifupd=
own-arago.inc
 delete mode 100644 meta-arago-distro/recipes-core/init-ifupdown/init-ifupd=
own/init
 delete mode 100644 meta-arago-distro/recipes-core/init-ifupdown/init-ifupd=
own/interfaces
 delete mode 100644 meta-arago-distro/recipes-core/init-ifupdown/init-ifupd=
own_%.bbappend

diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-ara=
go.inc b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-arago.i=
nc
deleted file mode 100644
index 0c1689c0..00000000
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown-arago.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/init-ifupdown:"
-
-PR:append =3D ".arago1"
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/ini=
t b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
deleted file mode 100644
index 86aff881..00000000
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides:          networking
-# Required-Start:    $local_fs mountvirtfs
-# Required-Stop:     $local_fs
-# Default-Start:     S
-# Default-Stop:      0 6
-# Short-Description: Raise network interfaces and configure them
-### END INIT INFO
-
-PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-
-if ! [ -x /sbin/ifup ]; then
-    exit 0
-fi
-
-case "$1" in
-    start)
-        if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts =
|=20
-          grep -q "^/ nfs$"; then
-            echo "NOT configuring network interfaces: / is an NFS mount"
-        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mount=
s | =20
-          grep -q "^/ smbfs$"; then
-            echo "NOT configuring network interfaces: / is an SMB mount"
-	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |=20
-          grep -qE '^(nfs|smbfs|ncp|coda)$'; then
-            echo "NOT configuring network interfaces: network shares still=
 mounted."
-        else
-            echo -n "Configuring network interfaces... "
-            ifup -a
-	    echo "done."
-      fi
-	;;
-    stop)
-        if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts =
|=20
-          grep -q "^/ nfs$"; then
-            echo "NOT deconfiguring network interfaces: / is an NFS mount"
-        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mount=
s | =20
-          grep -q "^/ smbfs$"; then
-            echo "NOT deconfiguring network interfaces: / is an SMB mount"
-	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |=20
-          grep -qE '^(nfs|smbfs|ncp|coda)$'; then
-            echo "NOT deconfiguring network interfaces: network shares sti=
ll mounted."
-        else
-            echo -n "Deconfiguring network interfaces... "
-            ifdown -a
-	    echo "done."
-        fi
-	;;
-    force-reload|restart)
-        echo -n "Reconfiguring network interfaces... "
-        ifdown -a
-        ifup -a
-	echo "done."
-	;;
-    *)
-	echo "Usage: /etc/init.d/networking {start|stop|restart|force-reload}"
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/int=
erfaces b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interf=
aces
deleted file mode 100644
index 15460a45..00000000
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/interfaces
+++ /dev/null
@@ -1,36 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
-=20
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Wireless interfaces
-iface wlan0 inet dhcp
-	wireless_mode managed
-	wireless_essid any
-	wpa-driver wext
-	wpa-conf /etc/wpa_supplicant.conf
-
-iface tiwlan0 inet dhcp
-	wireless_mode managed
-	wireless_essid any
-
-iface atml0 inet dhcp
-
-# Wired or wireless interfaces
-auto eth0
-iface eth0 inet dhcp
-        pre-up /bin/grep -v -e "ip=3D[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /=
proc/cmdline > /dev/null
-        udhcpc_opts -R -b
-
-iface eth1 inet dhcp
-iface eth2 inet dhcp
-iface eth3 inet dhcp
-iface eth4 inet dhcp
-
-# Ethernet/RNDIS gadget (g_ether)
-# ... or on host side, usbnet and random hwaddr
-iface usb0 inet dhcp
-
-# Bluetooth networking
-iface bnep0 inet dhcp
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.b=
bappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbap=
pend
deleted file mode 100644
index 875b33de..00000000
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-INIT_IFUPDOWN_ARAGO =3D ""
-INIT_IFUPDOWN_ARAGO:arago =3D "init-ifupdown-arago.inc"
-
-require ${INIT_IFUPDOWN_ARAGO}
--=20
2.39.2


