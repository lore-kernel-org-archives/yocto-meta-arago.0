Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3079AE9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:57:49 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6276.1771394260559339879
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AFzpew4E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.7, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/N5ro3edffG09qqOtJgDhxKePprbzHoQEsStWzv1TX7OeeDlhnXG5KB9nY0xyoorXUAMd1J16X0ClGC62hzd6Ci4Bc32hG3wNaMf4D5t4mQ79EYLHHllONNxzHwMcGwtzhXaOn25dB77uHPhmJS/Pik5E2MfzHUf1d0hkz/o5f9WeGJiZF+jFgq5JhhfDqpsCnac65F7idDTbcgeXdvmLXzubnT6H5vFGez9d7zRR6rd/ngIL3/giTVxLJkayUL0Vw6MXQRAuFxqbYMl7u2RFPj8D7Xtiv2HuRkV84Kah866S/XfqW6RYZc2yhGWgCIMCs3jA7yXrbPkVwSVyXfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXCg7oBzq9RWiZQNOuy68EQno971Kg/Vt8Oe9czhi0g=;
 b=lmdvHteIIIlC0uN/Xd13I2CAB83+MIwfueZLGEPRNG9i1uAcWkE5BjLaixQt4vJPu0/8H0JvQgaT76sByfWGe1agYAi7wXlgCP3Q8+gKLPf8nRpxuSd34RcLAlXwEHnCeacP/gfFtkEcGygQlGJX0whajg/4Ru76lN7uWDwkbdsp+QhcWRRaodWM2A0EoA5pRv4oYDmq2w3HHgdAM9NFV3mCRinMCGP/+MWPiWoTH+C5hDg1Rl3SSB6mgBpafJaYLcx0UIW43aYdtrWiPN7qlp+xawkQ9nYmvlKSrsdMdOTsjvl12MH5Yl+zNtevpb6arFMvhT0l9txcYY6v0F03HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXCg7oBzq9RWiZQNOuy68EQno971Kg/Vt8Oe9czhi0g=;
 b=AFzpew4E6eOlsAyHqjNVxHYMZmr5Sh6ZrCqrnr4OPs6Y7SxE3jFJ5cphmGUilLqTG5ZGc+HXVaVN1U3fzFS3AXguIkvf8RhTbvHEkfm6LCZ38sD3Jo1DyH0yXHjxlOJ2BYx+mBmmuJjSt3aH1ttt79f32bBikrW7oiY81OMAaXo=
Received: from MN2PR02CA0017.namprd02.prod.outlook.com (2603:10b6:208:fc::30)
 by DS0PR10MB997651.namprd10.prod.outlook.com (2603:10b6:8:313::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 05:57:38 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::20) by MN2PR02CA0017.outlook.office365.com
 (2603:10b6:208:fc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 05:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:57:37 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:36 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:57:36 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5vZmN4084090;
	Tue, 17 Feb 2026 23:57:35 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
	<y-hegde@ti.com>, <j-sahu@ti.com>, <khasim@ti.com>
Subject: [master][RFC PATCH v3 2/3] recipes-multimedia: Add wireplumber audio configuration
Date: Wed, 18 Feb 2026 11:27:14 +0530
Message-ID: <20260218055715.219075-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218055715.219075-1-p-bhagat@ti.com>
References: <20260218055715.219075-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DS0PR10MB997651:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c0a47c-d33c-4197-a72d-08de6eb29e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bwV3Md8U2MqmVumBgLmOJTubawl90NfN/SC30agh/HO7gEmElEJ/iUprt5iW?=
 =?us-ascii?Q?98ye4NngW1L6iu2HU7TZYqaOZ2y6FzYwzO60WiJsspSvttRWGBqdE/vRf4Qy?=
 =?us-ascii?Q?rvL7+prHsjtt6FQaAbsgOE6OsDNLAcCOUHGspeFGPzfgt9QxJKxcRk5qnSy7?=
 =?us-ascii?Q?HV6Nkm1NYDOuaDtDGtSWUnOu6sm7FNa/7WWjgH3ZjO1QAJKjtZbX9pUEgbLz?=
 =?us-ascii?Q?kUezKlIDT9HXBjL0ew0zewCrf9afJ2jrxVMSkIqfcyWgW3ZWARdfkdSwQtB7?=
 =?us-ascii?Q?9Vv4uaf7Ht2WA8GgVsgfA26p0fhuDPmH709JzqPhGGq1X3M+EB5PCIf1NNza?=
 =?us-ascii?Q?nMzdrJnfrQ/rMhXvW3ItKHKsAIcU88FLckcixcRyPP0N6FeYX1AiYaDlAsro?=
 =?us-ascii?Q?H11dEICoOMUzsiq51dk0xINJPEDqPSb0Yp6lJDiRwW6PWmEFSZ+VNBTqfaWI?=
 =?us-ascii?Q?PdWnm6JL63ff2/Z8R8jt/0ZbNQwm4KHzKBi9UidhQh7EWQKTIuppUh/Iyq5C?=
 =?us-ascii?Q?/ehmbUbiBuZyWTOF2ElCk4tb2Bi3sn7iRAjpk2hOQI3DvuK4i2KIpM4Mp0iZ?=
 =?us-ascii?Q?B4uvRH4PkP0XJIwL8A5OqUNWb1sedHfP03VkiUYcmgK5GnMYHyRfynXlNNX9?=
 =?us-ascii?Q?j+OIH/DotBX4rd9N5OWoG5p8d8AVAOKoKNpJIWRLm0tZWKEZ/inFn9VLRcXW?=
 =?us-ascii?Q?uqvOiwt3qDbartgHLg2peIq8rFt0c2Pi3t6EyJKX9+3ad/6ivD075CYY3Dfj?=
 =?us-ascii?Q?BlNRAspfpjYWrGkRqGWqyPYn4kk0QpTBeSNSLhEE3sbkBg5O68/CkUaxPbdf?=
 =?us-ascii?Q?i9zahqjwW6Q4aCQnTcxzJISycbYX4njsNh1P54itHhlI+WFv858a0kbxjLge?=
 =?us-ascii?Q?4sZtiEenPHaKrh3XKawtUwAoAiA2e8By1cUhRpvAr842agTzSXjOTpsbNl+n?=
 =?us-ascii?Q?mTTx+eEIWAd9IVY6NB8DtwoRF3rEvV+v4LcZAO6PdAYyjWXh3lt/zU7s48Ce?=
 =?us-ascii?Q?8+N2IAszi9/j3yDtA9nGcewQO73uUEt83l7Htl9FZSRl3MKA6ZzqTXE41m8x?=
 =?us-ascii?Q?JcPeLQQQoQ1YVml/fdrVPQzNKUxOQCHRhQQgMV1cI6KscqQQbt7zYMdXDPkm?=
 =?us-ascii?Q?k1Wsy7WdHCWunCQjydbjFyVk1pk47aTU3ndooDTpzdg2d448fm681j8MVsI9?=
 =?us-ascii?Q?LbFKPteW53JLylMgwX0zUMu+HrCLhcYRQWD2GzALw5TGTYIFn0ctO/jaoABk?=
 =?us-ascii?Q?UEtS31sruA6g8oyZRqPRQivn8hKiV1XQ+INDRzNQCsz0vGJKPn5W8HnwrsXY?=
 =?us-ascii?Q?4dyPJ466sSyQP5nEJVGW2rIK5zxKhilmXDkvz8+F5F32bGNWLReKGx9aCewY?=
 =?us-ascii?Q?oz1PWyz4nXKWE4lAuYeIZrKbqNnyuyMY61eKabeLxk4UoZ6Flyad6m930Hk9?=
 =?us-ascii?Q?cC9xx1YPHcm2abqN7lDc0IV/XGqbqRQqN9omo0LCMTjhNkJhkspewADf13uH?=
 =?us-ascii?Q?zjtEJjkTuVrt8OWJAe4se3BQyv6tGeX0L8cdlUCavOGZAnO14LXVGhJQjsxm?=
 =?us-ascii?Q?+sRKki70i6XHTgFjsuybndlGA91J3wfQ9FndqKqc1twILQzuDRmjEv56i+EM?=
 =?us-ascii?Q?I/otvKgCDYXyWk7xTNsmWCiAkagQJLL1MVU/zTkHr2liJwRh34NzyR7frSA9?=
 =?us-ascii?Q?x1JdLA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eUQUwvoq1HMvqWDXIXPystwOe+heyrRRyF0rQ2FUskHRT1ETc4JELmOtaEFLBxCGwgEsfD1n/0T/LcUw8LdhZwQECImqYZ5xTKSuYmjmIEJwPjsNshMHIa/vGrCRUCwGPvhbDFItwnlYxwLBkrNI2nYob+OC9uIKFL0TTJLcmB96z2VDnyBNUwMKc3/kU6FJvgiK/0Dmh2qx1r2B+25n62SsgQZNQW3jyKVlga4/8SzRXSmI9orEDuClfkDKOakf8O/pgI03owbWnCAosnstCj7ng2bprLVVzMUlQ7D5OCSZJJ9nbdGAEs+lskcn1OynnlRKmXRKlhwEDny6XSE6nSZcQpClfHAgNTGGn0gKGYvGkP9K2qrQvxthDdUoaKcUqTG8d/49gYwF1xf+dvhxAtI78evhiw/DBVgX9wNYcpuRuAsdF4OMjMrxRstH8niT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:57:37.1082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c0a47c-d33c-4197-a72d-08de6eb29e4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997651
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17117

- Add set-audio-defaults.sh script for audio setup
- Add set-audio-defaults.service systemd service
- Add wireplumber_%.bbappend recipe extension

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/wireplumber-arago.inc         | 28 ++++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 14 ++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 4 files changed, 78 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-a=
rago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-ara=
go.inc
new file mode 100644
index 00000000..ac995e35
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.in=
c
@@ -0,0 +1,28 @@
+PR:append =3D ".arago1"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/wireplumber:"
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
+    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    # Install the systemd service file
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_=
system_unitdir}/
+}
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "set-audio-defaults.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
+
+FILES:${PN} +=3D " \
+    ${bindir} \
+"
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
index 00000000..49be177e
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audi=
o-defaults.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# Wait for WirePlumber to be ready
+i=3D1
+while [ "$i" -le 30 ]; do
+    wpctl status >/dev/null 2>&1 && break
+    sleep 1
+    i=3D$((i + 1))
+done
+
+# Additional delay for nodes to appear
+sleep 2
+
+# Find audio sink ID
+SINK_ID=3D$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{pr=
int $2}')
+if [ -n "$SINK_ID" ]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
+else
+    echo "Could not find alsa_audio_sink"
+fi
+
+# Find audio source ID
+SOURCE_ID=3D$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk =
'{print $2}')
+if [ -n "$SOURCE_ID" ]; then
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
index 00000000..541b2963
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappe=
nd
@@ -0,0 +1,4 @@
+WIREPLUMBER_ARAGO =3D ""
+WIREPLUMBER_ARAGO:arago =3D "wireplumber-arago.inc"
+
+require ${WIREPLUMBER_ARAGO}
--=20
2.34.1


