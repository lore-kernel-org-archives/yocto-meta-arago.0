Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693FAE9D408
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:08:48 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24083.1770221312658757959
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 08:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MrVC2qOX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.8, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vS/yZRtdsZM8BOcI3cL8TxYw+bxKeHuSbYG1mBiVo4sEUH1y28qmIYoXoNzkpfGSuuHP8XFkRamcYGBBis9hN6EA/nfR5XRCbIvLRuJKYmJuuiEU+sFcZA/A3gzYBUQjMORBdeDk09QCuwDgZQjxiJvlNb1sx7wlaeOnEiWQH9vIS/j/GjUNBKygR6cjcZyPdo5PoehfE6wtRiWaHMvvC/U0ZAHdSxYizqdxp88dMunqHLMLaTWiuq1+dFHR8KBC7cAwVsAscxQ4dOcl/2Ei4lQVKV/0OxGpLxXuXinzFDuU3+phKxC72EDk2fZk6pwEe0vXrcLQYHiWBq2iix9RWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18EMib/6iLE7AC8RmTZ0PPUMXh4diMZLkI6ttP/7oDw=;
 b=JZD5niaU7VDc/NaXddPmzdr7cd4mirMNo2bYUNCfClI5EwsNs4XX44E6C+bmLM5y9dfyQuNsnKG7icooT/6b8TGyuOogndfLi2Et8qC35ivQD4goDftoy5f170KmMkTduXu5NH4Y0QeurmgbK0KOpkwuhXCf0aR5EwarQU5VX/0GWq0v488C4VZOlZ06J/lY4mL9XwaxQrWM1G9tHANhWTKwa8Vjjd12akzcnpCk97b08B37836zqVTEbi/Iz3mz+vaiNeFiXUMcStKSQEzMrNFzxMbGzIkZ8LfH7IFZ9FLyEL+MAdEo3HCAleVbIpG/7fVrveQRh3m0W5wQdcqWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18EMib/6iLE7AC8RmTZ0PPUMXh4diMZLkI6ttP/7oDw=;
 b=MrVC2qOXfO+bDCQw0LCRxzWkpQYBjKiCk6mpPGJM041RcATowHnN222Y+JoXWlV80nYA6fRGUi8BrQcnqe7376RupiID5gzQLJxwuhcj9qaDdM1FOjUELCNz80QoNq1grftr/QjbhBtGNr8do8hZ7CKMJitHVfdodsXKQAZjKzs=
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by SJ1PR10MB5953.namprd10.prod.outlook.com (2603:10b6:a03:48c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:08:24 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a4) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 16:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 16:08:22 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:08:18 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 10:08:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 10:08:18 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614G8GGH1393315;
	Wed, 4 Feb 2026 10:08:17 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd service for system-wide audio daemon
Date: Wed, 4 Feb 2026 21:38:13 +0530
Message-ID: <20260204160813.2393421-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SJ1PR10MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f06bd9-f041-4397-8d0c-08de64079edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gh3UlVDgx2H0PZ00vEDKewxfKUndu8LVMf8smq7bMOfzMiOWRzop7VYEnJTe?=
 =?us-ascii?Q?/7opatVvCs0OJsAnjpSsKMm3PEZPf+LCE9GLsRdhZBCSleXR7y+dR8HXDmja?=
 =?us-ascii?Q?LVE486/ndvj6gyapsWhFOVVXPxn7pqfbtrsnN5OUnmKe3s4YT6osLwMT4DtV?=
 =?us-ascii?Q?/iaB8OXvc39Wb9r1tPEB9dUKRccaHl/D0IP5zXoV0VFwDrdyG2t0ThnRwNS7?=
 =?us-ascii?Q?8+lXBE+afXZHoMRfYv06QVjIYWM9dC4TN+osY9fbfpaXdWbWLT6fr5qOUidg?=
 =?us-ascii?Q?uqM/4tnWyorflNqoB9qgMA4lszu3izMTVsnWKTRye3dW+GtqIYKxnSEtu5jN?=
 =?us-ascii?Q?YpMm2EXnUo3L0ye5PPtf/TOCGzpHehupi5DGhITmV68rq6QaPz28uiNNYDwu?=
 =?us-ascii?Q?X5zh+XygGQTDKrKKPx78D5sjZKecbqhvK5E+ffH3JYRQXgBIgwA3yBtmNBAh?=
 =?us-ascii?Q?BVGUmf2aQhM+UvAg1G7NFvOcWxuVm1ywsPpWipxoiKegXWrHWY5ifv70Km/l?=
 =?us-ascii?Q?Yv3s/Aw1A+UHyDAbx+cPJNo1in40jJiiGgIf7EC0ZxX9FAtH5pmlbRIp9JL+?=
 =?us-ascii?Q?ynZsjQPP6cstb5lko2NM9buNas5pL1JYbesjuI0Ws8oDj294azp+uzNPFhUS?=
 =?us-ascii?Q?5utUsZbsIFIdYE2seuH66LBl+VCJSz7SbzJEtEoiPAOVh9epD9Uaegyw/XJS?=
 =?us-ascii?Q?RU13pFv99SxoGcw3gPxmCl9Lps9e4yZtXPyRgDiHSNf58iB4TvKO4lOjDFcH?=
 =?us-ascii?Q?gTlyhkOxsC42po3veNXdO+clz+QXAoPnb+ie9QK9NzfdKbDpNmxVX3CVu67X?=
 =?us-ascii?Q?1KkYQdG5GlV7z35oK9XY10cCYHf7rsxZPjNkJSJCbHx0T4M8Ui1dM18sBLM0?=
 =?us-ascii?Q?FvdAvT0VuOPpp/63l7Wlb4JQkb7OmEVgurg/wPVx1KkqL8AVK5ql+lX8g8De?=
 =?us-ascii?Q?GxWc0YzyMmSVizgQ7x0yTLdk4C5j8rmNKc3pVbvD9MeaiAnEotmMZVIyBVLI?=
 =?us-ascii?Q?QNbQrgHwY6lznxO3nHrJ7l5nP1g+qjj606KKV3Cj03AGUThisC/VCbPJE/m4?=
 =?us-ascii?Q?EAbtF/SLMHN3bH2i07+iW+MTGh1gJ+5kO1nuS17JEw4iDPNMPwsENMNPBHHa?=
 =?us-ascii?Q?Hij/pbeoXLvyXSc5j9E3HQMSClTgUjuXnATxfal4i6oYWxp2d0vXC+VDTBIW?=
 =?us-ascii?Q?dB0qZvEB1iUKTsiUtqXjLOradj+ivVDKPyeYllThk4Yfn6ftpyEeXxswHkCL?=
 =?us-ascii?Q?i6JwYezeEapLpa8zrirTq8yPZv2i8AUEPT7od8w1dnHQi7anqxPJNfp03M9Q?=
 =?us-ascii?Q?qrrCG1lay7OZUrXne21zKFxkD6+gWPqJKwKjm3TkUIW9tNAlBQRMuylULYpY?=
 =?us-ascii?Q?h4CZRzJs2SOut26hJqe4fzwaza0kI2gMk9zIVwm+0V/JgMR1ilYquu8iaoPA?=
 =?us-ascii?Q?P98DkJ1fgmz7pzDbwnnWzn09pez7EBBBheD829z3JfOgD+u12UWjKS44sLYU?=
 =?us-ascii?Q?j+/x8qxp6NM2vLfMKejCnlrM9JC3lQfIoDD3gFJ63f0AhqaLQEGrEtEYtGDo?=
 =?us-ascii?Q?6L3NyoiLJAhS+VcwgXYimOLTamQh2vuYUfiYrwQzFXHFgjDv40AeVkHcKfZX?=
 =?us-ascii?Q?HUMzHKXC2EXMdMXE5TbWpACeJLZdRhdo1g7mXPnej3/azEHKyNIdvdJusroQ?=
 =?us-ascii?Q?R4D26A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6kktCe/YwQ+lpvgsSzhY/32J7BQNGtdMZyvmsV8rRMuXkuJlzEW1SQ9CUXIOfLPO81Np+4eJ5ul16L9s8MJ+YEImZTlhUyuigKuYzJp4bqNZB0ASHRkQvl5IgimbnBho/VpJ5BybkjjuBelcN7QJ9HOPVbkkgmTR/yyK3aYpDYRjukObvNSCYCinvDM5D9df3fbgrAOZrCn7OywpDTAOOrXQkxKubTQk9ax02S02+udipaU8pw7ZgHPVfL9M/HxSN94iypQsmgDt9bqN55nENCE7P6Smp2VvvotkLwsWggr9/ZhIUzcXiqR1yK/wO2GZA6guZ3yvbIl8qP7Zzlw0089PIGtRjHg2+B1fogO2EobFJb0VOFqp8qo49341cEZbO/lMEprNzj4soBEYBHn5IA9Nc2GI7sp4vlH1rd8/gJ8V6679m8+s7UqCPcE2IvaK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:08:22.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f06bd9-f041-4397-8d0c-08de64079edf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5953
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 16:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17079

Add a systemd service to run PulseAudio in system mode where multiple
applications need audio access without user sessions. Depends on
pulseaudio-server to ensure audio/pulse groups exist.

Enable this service by default to provide system-wide audio for all
applications.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
Changes in v2: Add SUMMARY, PV and PR.

 .../pulseaudio/files/pulseaudio.service       | 11 ++++++
 .../pulseaudio/pulseaudio-service.bb          | 39 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/files/p=
ulseaudio.service
 create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/pulseau=
dio-service.bb

diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaud=
io.service b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaud=
io.service
new file mode 100644
index 00000000..1d3ac435
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.serv=
ice
@@ -0,0 +1,11 @@
+[Unit]
+Description=3DPulseAudio Sound System
+After=3Dalsa-restore.service
+
+[Service]
+BusName=3Dorg.pulseaudio.Server
+ExecStart=3D/usr/bin/pulseaudio --system
+Restart=3Dalways
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-ser=
vice.bb b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-servic=
e.bb
new file mode 100644
index 00000000..5ce849fc
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
@@ -0,0 +1,39 @@
+SUMMARY =3D "PulseAudio systemd service for system-wide audio"
+DESCRIPTION =3D "Systemd service to run PulseAudio in system mode for embe=
dded systems"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+
+PV =3D "1.0"
+PR =3D "r0"
+
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', =
d)}
+inherit useradd
+
+DEPENDS =3D "pulseaudio"
+
+# Ensure pulseaudio-server is installed to create audio group
+RDEPENDS:${PN} =3D "pulseaudio-server"
+
+SRC_URI =3D "\
+    file://pulseaudio.service \
+"
+
+S =3D "${UNPACKDIR}"
+
+SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_SERVICE:${PN} =3D "pulseaudio.service"
+SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
+
+FILES:${PN} =3D " \
+    ${systemd_system_unitdir}/pulseaudio.service \
+"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPMEMS_PARAM:${PN} =3D "--add root --group audio"
+
+do_install() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/pulseaudio.service ${D}${systemd_system_unitd=
ir}/
+    fi
+}
--=20
2.34.1


