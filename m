Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A86AD6CFBD
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:04:55 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62453.1769148278215987327
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 22:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JIr4rngN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.45, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzsA7QlEit2Alp0a/gem5KW5dwvGOnbgQbbULgNGy5DnJf2k3Iu7CSgdHUlTA6XTh1UcysgMlGhYJOrG77ySuAwVG11QWvaBAajyRHula9rCn4ny8/oTn57wV7rzlk0P3iJ6ElD8qaEYFFYnu75guzOSanBVQg5eCtgBNphopk5RA2t4c7bq8OYfuFEX0PI5yBnUw+c9MQMU/BJ5rcR42Qxmw5SQY+XpPMqHkO10REvrIdvhEbws5wbsfe7zUoxccl2uDfmXY05Vkpdr0TPZzBSN+SygJQjyJaozlIGE20p9WNFq3A42+pf7K+3KIxTrKVyrwphhO+OSqXrGQXEPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1k3ymn+UKkaSO9eOiBeyRXXhRNWMAcDoyZPgJ4GN3I=;
 b=F74qkD/ulNsCo4I5DB+Mcq1AbmG68KT2LrwI9o04JW6lN8+FcQeNc+E8s2TgFBKc64d9QAMSTaAnJH4xQp7Rd7mZ4Mfv7BaXGW2wQYomre6HDNKcuYUDVDPkLaEft2k4Y7TlAg/gl34ltLdLPMnlu8JU7bOCNCfeBFDXcvnpL0gTu7DNQHdveuy1jaNwsCdqbgiTaX8aNIB5h0jHD4awOZ5nFd6k/BOacPaJYzw/XhD1UcgHZQBg7KZLgX5Axb9MTK0ZPxnekjRrmUOI/9x7kcxEiuRR/w4IRxysdQvg2TD967bd2Kin4nbiZZmEaqymtEowmR9JxsRpps64xb5D9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1k3ymn+UKkaSO9eOiBeyRXXhRNWMAcDoyZPgJ4GN3I=;
 b=JIr4rngNQzXOaWwr5jLzprHJnfaNFVvH8RDqdHAARQhmWriQZZEVskr7gy7t7Oy9QmLGl0iOSA6hrl8yp8kzC+W3puAcA5wT1i/j8Jlem/0kLoqpuggu9DsU+oracRfS+atISqhJb0IfmbMqC3hw+6SbOvQCCaWwpMRlhC0hwPw=
Received: from BN0PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:143::21)
 by DM4PR10MB6016.namprd10.prod.outlook.com (2603:10b6:8:ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:04:35 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::f9) by BN0PR10CA0026.outlook.office365.com
 (2603:10b6:408:143::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 06:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 06:04:34 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:05 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 00:04:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 00:04:05 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N644w61827185;
	Fri, 23 Jan 2026 00:04:04 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <afd@ti.com>,
	<devarsht@ti.com>
Subject: [scarthgap][RFC PATCH 2/3] recipes-multimedia: Add wireplumber audio configuration
Date: Fri, 23 Jan 2026 11:33:47 +0530
Message-ID: <20260123060348.2493115-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123060348.2493115-1-p-bhagat@ti.com>
References: <20260123060348.2493115-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|DM4PR10MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b763e0a-6142-4b8b-2301-08de5a454844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jBaG11g7GSppKiAroIue/JK7RanCfKRYzOYKgzjupIUOULbfjPkYNWXx6hRN?=
 =?us-ascii?Q?TBLo/SfPRIb166q9WxP433CVH501BX007Ezv48XRYPMsU27K6P0KinBB2axz?=
 =?us-ascii?Q?9ujfTHwn3iOL25axqybgJqdo6S2KcWsrOfMEq3+02805d6l0jlT9XnvkVlSf?=
 =?us-ascii?Q?SA3P2UH6gak3BD+bSAPlN5tllTsVLY7YM/UQ0M1Qwl0hZ37ktTPmSxc19SQm?=
 =?us-ascii?Q?dRRebJbiVbyfo3l7AtpjYP1NLTtyJthFaImVUfX9LFhaxCsmvR0esMSOVlZD?=
 =?us-ascii?Q?S/4rq86kC6ZkYIxVIb5KxTnztIneBBOsFPS/T0QXKh73RkZoLbJgNqYFsm5v?=
 =?us-ascii?Q?pTKydxk1k0QWSbRV0SMBqMmhzBRKXiX14or+1jILcNjhOok6sf52P+m2uwix?=
 =?us-ascii?Q?ejGnzW2OWD2DWFW4NEdfDOUlVdj8X/cWkrPNTolXtzSDhQLMDnunchn3VDLZ?=
 =?us-ascii?Q?pudfVOv3RB5lfAgDTRvpqff6rT8iNkjsOdi0q30gGkscQVtJw6Qdw1F+we6V?=
 =?us-ascii?Q?RlTnSswfUWqTz4nE+9bHcreQdLmGWVdQ9MuI6Jw00/phUi+VjpCKQqRZjtwc?=
 =?us-ascii?Q?oZ76BXKFUgbYY8XDPb+n8o8l8YTUO1OuOwnI/GzPPLEaUKH3Yy++oPvPdEwf?=
 =?us-ascii?Q?jPdbusJd4Ez01pSJaRgky7NA0ni9H6E2VWNx+QtYr++DBKm7Be8YMJ5qu9ps?=
 =?us-ascii?Q?vb3RYqM/SnHpd0JAqEYXZSMZxxe8Tt1F1yzNuCY0A7M7pe1nmVHKrJtXH/KP?=
 =?us-ascii?Q?mBz8S0X965/G32nkNWcTpkRTCLa0m5LZ5sjIyDlUR1KyGoD0uhjXR7QgQE5B?=
 =?us-ascii?Q?L83RmyLbw/Lcq26GF56BC5lkU33mq+e/S4GCCqmZDIG/6pX7VnNy5sSggzGc?=
 =?us-ascii?Q?ova6lE5XvFxOhuvyUL3gWavJo0h5vhPa7+7IWN44UAzchbY4jMYqFStxDujn?=
 =?us-ascii?Q?9DHSmhMTVQL3V400rcKFo8SCbXhpX8VykXykDOQ6f+c+3U8y0LuztFIv2wZR?=
 =?us-ascii?Q?2+fCkPGg8BDkRveDDKiVwEL7Kz1VZGzSAaJhAxdEQ5sgSBs73LTa9opMs3+D?=
 =?us-ascii?Q?FIjSaG1PaOOJkc/yw43NZQ/vX0lpEnf4vS5Afkxq/8VDFgaswNcg92ulUoQ6?=
 =?us-ascii?Q?qqc4MN/75VfdjeCjZwChWMh0uhzsntRh0nc/XQeAPxy4434JM1SpcKYDr4Sh?=
 =?us-ascii?Q?3HblHIQ4sAaiZkDHwEveHa5HbXXiognidudDp93valmnMymFRBVZVTlesM4c?=
 =?us-ascii?Q?YhVUDpg5b1dec2B9kl4KQ4Px/lBViy1dYuULfIPVjvNZlAVWUfbAqdbkdM70?=
 =?us-ascii?Q?/YJoPENfhxLgXyM7nXw6oYOq6YVRa0GjbM4wplA/aVgJpjAm216f/RQUGfGA?=
 =?us-ascii?Q?4fteYaLfnWTkEVde/iAxY+NPrTy6XcjFH5vErzMOfi+FsI4TIGM+vBMuS4XU?=
 =?us-ascii?Q?sJrgRHrS5tJIYiB5usp/T9aEvSFct1gBhzHDTwpWSz7LFnqW3MqC5vPVPSEV?=
 =?us-ascii?Q?cuPvlTCBEOgdLuostc2Kxwi2ksSprasYdoBe879D0ERqyURwp/DrARz1tnwG?=
 =?us-ascii?Q?VNrWuEHH4p4KCjtUyMC73Q+okAK5Zg7AsGO54x+B70ddN0yLvGLJm8BOY4Tq?=
 =?us-ascii?Q?k8EHm2tMtnkCQkNMGGCRfHTgakPkr6pe5JrcTRc744cjDKop+a7twe/1CgwT?=
 =?us-ascii?Q?s7wNnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:04:34.3677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b763e0a-6142-4b8b-2301-08de5a454844
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6016
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 06:04:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17024

- Add set-audio-defaults.sh script for audio setup
- Add set-audio-defaults.service systemd service
- Add wireplumber_0.5.1.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/set-audio-defaults.service    | 14 +++++++++
 .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
 .../wireplumber/wireplumber_0.5.1.bbappend    | 25 ++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_0.5.1.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/s=
et-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumbe=
r/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..18881553
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audi=
o-defaults.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=3DSet PipeWire Default Audio Devices
+After=3Dwireplumber.service
+Wants=3Dwireplumber.service
+
+[Service]
+Type=3Doneshot
+ExecStart=3D/usr/bin/set-audio-defaults.sh
+StandardOutput=3Dappend:/var/log/set-audio-defaults-output.log
+StandardError=3Dappend:/var/log/set-audio-defaults-error.log
+RemainAfterExit=3Dyes
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/s=
et-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wir=
eplumber/set-audio-defaults.sh
new file mode 100755
index 00000000..cd193d02
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audi=
o-defaults.sh
@@ -0,0 +1,30 @@
+#!/bin/bash
+
+# Wait for WirePlumber to be ready
+for i in {1..30}; do
+    wpctl status &>/dev/null && break
+    sleep 1
+done
+
+# Additional delay for nodes to appear
+sleep 2
+
+# Find McASP sink ID
+SINK_ID=3D$(pw-cli info alsa_multidac_8ch 2>/dev/null | head -n 1 | awk '{=
print $2}')
+if [[ -n "$SINK_ID" ]]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_multidac_8ch)"
+else
+    echo "Could not find alsa_multidac_8ch sink"
+fi
+
+# Find PCM source ID
+SOURCE_ID=3D$(pw-cli info alsa_multidac_4ch_capture 2>/dev/null | head -n =
1 | awk '{print $2}')
+if [[ -n "$SOURCE_ID" ]]; then
+    wpctl set-default "$SOURCE_ID"
+    echo "Set default source to ID: $SOURCE_ID (alsa_multidac_4ch_capture)=
"
+else
+    echo "Could not find alsa_multidac_4ch_capture"
+fi
+
+echo "Done"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0=
.5.1.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumbe=
r_0.5.1.bbappend
new file mode 100644
index 00000000..f6e5ff91
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_0.5.1.bb=
append
@@ -0,0 +1,25 @@
+SRC_URI +=3D " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+do_install:append() {
+    # Install the script
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    # Install the systemd service
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/set-audio-defaults.service ${D}${systemd_sy=
stem_unitdir}/
+}
+
+inherit systemd
+
+RDEPENDS:${PN} +=3D "bash"
+SYSTEMD_SERVICE:${PN} =3D "set-audio-defaults.service"
+
+FILES:${PN} +=3D " \
+    ${bindir} \
+"
--=20
2.34.1


