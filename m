Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53348EA813C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:55 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22759.1770738772367262215
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 07:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=w5y5QlB1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.43, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+S/bOTVIgO2ro9WrQMCIQD2qi4i/oxy2pge10hr3wm6JEciSzjS+hk4lTdy4WW/yoybhei4TG3emvykGeDOhsebUNT3zznQ6z0pi1ZbWt367fikjw2gCAtQyXZIEkavFwyEH6OGm4G32enwIdt9Y6F9h+yPK/48BR+a96Bv1z9OVG3AaDP8SUGJxS0DSs8bzCTovZQsrFS03Y9HWB/wgSMPFZv8tW9AfC9Yg3PoBm642TMD/QnN/+BWXXZDSoj2vVMK7irhmFNkfh9wrGdtyFqTb7pCOkmowmLwQRP+SUI5MZDZGLiGFPMDGtXAleU413ob5j8OYBKD8G+DidmsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaFsct8jPH042plM42eZ5fZzU4tiT7epd/BUJrv0YQQ=;
 b=NErLjVNAesdZAv5K9Okk9I5bvtBZwOHsxC/VpLJ+1BYD+uJ+XvrP+MLBpDxp2IHXF/vM8OlcB2f7UZCKj0t+JIJAO3HLmhILAKmU5HpUUR13Acuue9CqZNcM5l40TiiBcGbKFUnlJukcjbCbrR4LlsKK1T6ADi/CCQrU07UNl+ymfN/oSBgakH0WyAZfo5Bj3g+s/6zxmKu5AIRRrPmC+bKygffgJyGOP5pOZF782NaH/ox/5FxVNHSa4crrukskvP5J5eotNWNcVL6TTO+bwVpOLgRsEwDG3LitADJT1RrJORcYsYOWuto1CRhudzXEgEc4T+gJfirt2aBN9/gTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaFsct8jPH042plM42eZ5fZzU4tiT7epd/BUJrv0YQQ=;
 b=w5y5QlB1R1IEUgP/Wdj8OZJt0cL5bkXngERSk5YwBjDqLI8GGQN75/4/wOE+/hRYHZOf8SUi5V6/YwzE4X/t5V+Fy87UT8vD+gByfQVofvb+LN9EaldJotyiSxDEjZnQlz6cwotGSMk17KiuwqBGPJQ1q0Z1xFnMAAhK3swfd+E=
Received: from CH2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:610:50::37)
 by SA2PR10MB4588.namprd10.prod.outlook.com (2603:10b6:806:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:52:50 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::d1) by CH2PR16CA0027.outlook.office365.com
 (2603:10b6:610:50::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 15:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 15:52:48 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:31 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 09:52:31 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AFqUxr033357;
	Tue, 10 Feb 2026 09:52:31 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master][RFC PATCH v2 2/3] recipes-multimedia: Add wireplumber audio configuration
Date: Tue, 10 Feb 2026 21:22:00 +0530
Message-ID: <20260210155201.3029549-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210155201.3029549-1-p-bhagat@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA2PR10MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 90fcca8b-acdf-4aad-dd9a-08de68bc7067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ANwqolB+6XQ7QshlDa9pONDpAB1Vcpg9A+eR318rk8vK65TKyko9owzmVN54?=
 =?us-ascii?Q?KuZ09RZKXiK/yaeyNIalNV2ixyik7fc1zBV0K1fyU+aXYALo9mGkjHemww2v?=
 =?us-ascii?Q?TO5D2xtOmzuLS5fFNFCbecShHqCC+WK4yfmXAeVCDop0/N8167Ya3d6ageuJ?=
 =?us-ascii?Q?aYkparc3FJGhuQyGExT4Rxf0w7IXnu2lcLVxipGYwrbH1S0vnpuY4jJ+ILgh?=
 =?us-ascii?Q?5mVluQQhp05x8CZsGifKxPo42mKChLe8qYmYDDnkYsOze1qZw/z877U0/+jP?=
 =?us-ascii?Q?u+IxMWz5T96h4s189HzD/a/30hKwVsp+UyZ02Jo5ShZueA2xWYPFtLqc34A4?=
 =?us-ascii?Q?7Cpn5RihAlsogg5AC/eoi0zcBXnI2uoM+B1rRfVkHFUu9WAURAmnsZ+L4Ih0?=
 =?us-ascii?Q?YSi12Bw+L5+MtDOL+6TIQl9umKERDngiVIIzQuJZenDpGLUm25TXs1E2sdpD?=
 =?us-ascii?Q?froILKfuBw4P0MTXyj5ioWqXRA2pj0kaZArEgqjADOfPbzorHUabsFGj6G0S?=
 =?us-ascii?Q?2CXhulOVmZiJ7764/cPHcr58XLlPY6hHtm3t4oH9c4G/QZdJREdtHEPG4lsh?=
 =?us-ascii?Q?xniHEnB4HjdsLV2uqYk6jdso5xC11wd6oTOwUU9ZultEm3wpfRc1NA9rJySW?=
 =?us-ascii?Q?LpVKaySrYduLZbwUVHsEYU9rn7TsXHrAQ9tlf4JdsYTH8xkPecKUKrT374Ho?=
 =?us-ascii?Q?eIjtq2r9tWm2q2qoEZuCPFbiYSBEo4arRkofX5YTT04D58bXfcZGv9dh57dY?=
 =?us-ascii?Q?u3AZiDq6XemWw0zXDCpjrLLuUipFcvbsJC1V7+7Oms9Ui11Vb3/8x07dWFme?=
 =?us-ascii?Q?9Cp1XfU06LQt5eefjzTL4ESh8O1JZObFy9lrVqCvGjMP4TUy5HJC/zxgYaps?=
 =?us-ascii?Q?Pq8nQzUL178VmITwAYMnJ/X6af+jO2h5IUOYt0CBlYC0rPGPECkP+nu/jQhG?=
 =?us-ascii?Q?C2WN1pmLJeyizHEMF/0hJUzaLPOLBTCkDlewEtzKtySQWHKg+PkvCCz7XGru?=
 =?us-ascii?Q?i0WTTFBraY7CcvnH2CuDWMAlDIA5G36olkP6hkZF2eihkahXGD9qHkOWZBdR?=
 =?us-ascii?Q?wYGzi8ywjPyMohTHILKQOBAnNv0DcfRYh/znpIWBaCdOo+ctsdR2LznOrrw8?=
 =?us-ascii?Q?HJH6ByGg/SPtGr1bE2w/Q1lZURgg4lLHV/jAPf4lI8izy/KuuixDpcWu8hB9?=
 =?us-ascii?Q?rcD01pzggWc/CHfkamtAJ57ZzWLAQxLlgsnNAd+NLhcelOGhA59h1eenf8WW?=
 =?us-ascii?Q?6gParPY/LRLvrs23CLit2oqFKPbuecJgtWEVw6wq6uIfh/bCellPbcWB8EpL?=
 =?us-ascii?Q?iGRc/csJwoHD3sWEDXWAp/+0u8jSo2YYfJzf2I6AIPg789Ts6jdEmTWCbYm0?=
 =?us-ascii?Q?vj/F3OOJHSt+2TbjvE060wf1cTw75k5YLyp72c/8dGktsrDqH6Wo454MVsHQ?=
 =?us-ascii?Q?bRqKrAKI1Mw1dQXLRxaSKtZQp8Cn0VaxQSNUSvT9AVDuqfcIVAf306XLErKC?=
 =?us-ascii?Q?Zt5U9xnxD9DvDvzIjwwWGAp/vE6IVFPCfP+uUaAQIdkx10fimXKy9vDRi75+?=
 =?us-ascii?Q?p4XDLxlvsKDgt9xVpuCa/vo1x2427wjg+cidWgefx8jBzZB/XrRZkHYDYBN5?=
 =?us-ascii?Q?jC5sZszvF8cykUeKzZBvPwoo+wxsFqNrgV1jFr95+VQvVO3BOPJEj/EXFC+K?=
 =?us-ascii?Q?+gEv3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CauzgVmml8IcwSvCQmFa9/+chhTwJMe/csmtZpDpU57PHHrLM2zfRatTxVMUPnkJ/CtQS3MReVxqvr+9EjIZ+MF60ehzZpAR4tGtyWV9ZMQIOD+EjmE3IoqCiI3aKBiMcMlacXJs3v9UK9f6q6oWu4FAagIMypPeEDn4bm+JpxFdEXm4++dIR3pl/03PAZZAqX16tSgMz8X+JAbQ0I39Ur1Ms7mVFUuPEvzyO9TV8KfA6QHvs5j24iKMpDKVSQvXWc31z7WDDMKbmlQpDTZEvF5XTGmQecfWC2snWamPDDqFbQIM6XTRXNrnzChp0DgeVkA+uMf11TicypemWSDmhYIYm/EvlkzE1ibqux0UtiY248L3bH3kYxQJ17DH6l6XvHZu4mApSvMM8EzmvwQGYjopBxuFmUcVtWGWKEyUcVLQJTL3EbcERWPUEyf0MidL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:52:48.1201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fcca8b-acdf-4aad-dd9a-08de68bc7067
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4588
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 15:52:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17098

- Add set-audio-defaults.sh script for audio setup
- Add set-audio-defaults.service systemd service
- Add wireplumber_%.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/set-audio-defaults.service    | 14 +++++++++
 .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        | 27 +++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/s=
et-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumbe=
r/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..b3874542
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audi=
o-defaults.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=3DSet PipeWire Default Audio Devices
+After=3Dwireplumber.service
+Requires=3Dwireplumber.service
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
index 00000000..83b89225
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
+# Find audio sink ID
+SINK_ID=3D$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{pr=
int $2}')
+if [[ -n "$SINK_ID" ]]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
+else
+    echo "Could not find alsa_audio_sink"
+fi
+
+# Find audio source ID
+SOURCE_ID=3D$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk =
'{print $2}')
+if [[ -n "$SOURCE_ID" ]]; then
+    wpctl set-default "$SOURCE_ID"
+    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
+else
+    echo "Could not find alsa_audio_source"
+fi
+
+echo "Done"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%=
.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.=
bbappend
new file mode 100644
index 00000000..9a697aa1
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappe=
nd
@@ -0,0 +1,27 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+SRC_URI +=3D " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+inherit systemd
+
+do_install:append() {
+    # Install the script
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/sources/set-audio-defaults.sh ${D}${bindir}=
/
+
+    # Install the systemd service file
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/sources/set-audio-defaults.service ${D}${sy=
stemd_system_unitdir}/
+}
+
+RDEPENDS:${PN} +=3D "bash"
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "set-audio-defaults.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
+
+FILES:${PN} +=3D " \
+    ${bindir} \
+"
--=20
2.34.1


