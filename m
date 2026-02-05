Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69728E91266
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 06:10:48 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14878.1770271846190650106
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 22:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Y/x5w+NP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.36, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjvphZ0MwyHUNg7RSEsYJR/rukLT/CFIv44/RmiYKd1ELe+6+fUm7Qbj7FYGlN5I/ZosWY4H6LgHOKxGXtp10XtCGuSpM2eyuqHPSPTmY9yapMZRfzEHKbW6jS7GtRnF/ebRDLlOz8II29JNU8EtgXLRMuTi8pvDBRUOAdHB817N+Oh7PWlJlUi3GIxkq/FPK8E6DikgdpmWnhniLXKtOvXRyVtGu63FaV1Hfnhu899Lfzqarp7eybqfm7eSzgvPInzJsIJ1p9vdMLqontPNMGvGRkZL0S/BeQ9Z/jCPTYmALu5OOY2JMasdjrVAZdJaWXrU5mgXpNuRw9qXNrbXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuX2j+/HzxqyacYQIvO1OD+lt4sLhVhOXnkNP7rb0dQ=;
 b=lWlPhtWt4+i8fOhjjbStui9OBo5aPgZV1rQDbyqYM937G1ZOQ7hOPE9PVfhrB/hlZzNCFMoGB7gum1HZrgqtRP+CGxvKAL3H0A8XY/H2oI3pt2XoqkFQGHOo1l/Yv0qEmAcjqHm9blYiQGBy9k2/qHGzYdAUmpy5Z41C/gA8h1ymYb+g3rIc0ZEo5Jky03W6nhUYneNwOZeX5HNaRuy/4uaG2J18hcW5L6U94Sv62psy/WUVoGxqbv+Q6svqFzxNr1lls5ib8QCxgEjnl0AvMWDSI7RKhsPsj+TWSh/TKd+iul7CWcPFoGCVO6HYGD/8MllEa86hw2g/MwQ3oCmCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuX2j+/HzxqyacYQIvO1OD+lt4sLhVhOXnkNP7rb0dQ=;
 b=Y/x5w+NPpkhSiNNebfoyhhaApNCRhYdjKvEVhStFFASAwEor9HrePYCvo4kYwU108vej/sAuOCpyEDTSNdB3eUX2R3mArwEmJUay/PasaL4Vf9sUCdrOjtslMURFmIzGhLfD87XVKDZ4WAhTQiEBu1L5BSuM0qLU/4VVjtXQdeA=
Received: from BL1P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::31)
 by SJ0PR10MB6430.namprd10.prod.outlook.com (2603:10b6:a03:486::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 06:10:42 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f4) by BL1P222CA0026.outlook.office365.com
 (2603:10b6:208:2c7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 06:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 06:10:41 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 00:10:36 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 00:10:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 00:10:35 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6156AYHC2476128;
	Thu, 5 Feb 2026 00:10:35 -0600
Date: Thu, 5 Feb 2026 11:40:34 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd
 service for system-wide audio daemon
Message-ID: <20260205061034.oq53pehysfd2ylpi@yogi-work-pc>
References: <20260204160813.2393421-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260204160813.2393421-1-j-sahu@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ0PR10MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b9e7b5-2375-4da3-6805-08de647d4a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o2oMdLVxhXE0LMVU6xrS0E+l9QxeFwoIPX7FKGxZ543pDsa7spiHW2fEjqzJ?=
 =?us-ascii?Q?DyjhVkjdUWIG5W9V3TtTEK3pFNCnt0U46NXaXEZhsFeanPogr5+l8lJFwK7N?=
 =?us-ascii?Q?jXd8P+3Wp0DyUfyh3hAUX0W0qs8x0YvHAOXeSId6XbzdPWt2Gt2OOCXOY08W?=
 =?us-ascii?Q?8SaFLL45MSksg6tRfZ1geAl5GOfc8nWrdwRw330HeceeEl/fQg3JE4tq9/hT?=
 =?us-ascii?Q?VUCQEBn4QaEpjr8EFRM9dgJyhLBFBISGVwIfUzDZW0feoi/BCoSX8+2SpGuf?=
 =?us-ascii?Q?L1Gct6j3PPm9+RurpIUL2mmN3O9S8MebtdyH9xU4PBqdpWU8g5z1U2mRJMWy?=
 =?us-ascii?Q?eM10k1TnHShHM1MnokHpoAyqG99g1Zu4Q25cBxpl1rmcuINlxBJGfITU2EgE?=
 =?us-ascii?Q?enK9O4lK+RFJn4BJM2sqWReHR5Vfi5x3AV6hXZErUSSKIISk4RVmkdLEzFT0?=
 =?us-ascii?Q?pu6Xb6CMcNhM9jm7SmwzJ9rTDQUWt7fL8JBig2lasJE4R6cxVy5hsKFV+svX?=
 =?us-ascii?Q?DRWA0LtoeoXm/ZucoALz3qhkPREc0O0eiq9B4cZewemC/L03hEQBbJg72k0c?=
 =?us-ascii?Q?i+2FTqx4sugBx5W5Y+LjP76jT3S6/uW04oYGjkwDejeS27DFQ0zIGo62Mley?=
 =?us-ascii?Q?tVWsbVbIeozzHswNlwMBRnYCnUsJwELI4u6hD7EjqDospQDGPSGdzMeza/zH?=
 =?us-ascii?Q?M5+lliX2TeSmsQ9DikFw9ejvmgVkSK+uFpGzXgPOZiV620xl/pM68co5tKf2?=
 =?us-ascii?Q?4ZuE8kDFg745n6AY+zxQDJ151AtTkcLnZ9ZCMI9RQzA09T38US0alzZuVIs1?=
 =?us-ascii?Q?IADP8A0Al+5rXoFYBpJ3g8xuaHzxX4T9s/5W3aee6AyR5JR6KMh5xsoi9Ijt?=
 =?us-ascii?Q?7bdqKf5jlwYqiYVz92S+gDlJNkU0KyZdrtjzTDe2qzw2Tz/LG6OCk62jXUNV?=
 =?us-ascii?Q?h1ofrBE4NLTqshdHTWWfDvwTigJH5S3piP86Sm3+FqGFS44wuDfaa1XbOisa?=
 =?us-ascii?Q?o0XYXJOwIvLO1jE4reZa7qP6y1zlskaPuOPUnTZw1rwJUI5ea5pFZRWxdchF?=
 =?us-ascii?Q?VTBFp999oq7e1SsoWBg1PdEjWHuooQ44v2y/AFgpt4RsE1gTAG15szKikOfl?=
 =?us-ascii?Q?dybpZw4DRPhSdL8FvkGcCO9ee0RO5HMmQMKhAWiRxt8ehwKfspfbbj+js5We?=
 =?us-ascii?Q?77VmvfO0kw8PBpjIgf0UdKuaDcRe4LPd7EyiLEq0+wCla3vmxChrFN8iIpiV?=
 =?us-ascii?Q?tUrXMLO99XasHxJMnGtKEK7x0lJzEVTBb1GZThn9mV4lt8epVWt31ovV8kff?=
 =?us-ascii?Q?yaFUX4U92b5tWGDrjzCqu+UgWtL58+mqdB7Cka29urOmNlYlG8AlU6gtp2wY?=
 =?us-ascii?Q?MXkIwVRdQw/AD+5TcdgxsadmKDc7se7dak3nvxPUKXDXamQtKZUCCFAZdMh8?=
 =?us-ascii?Q?0ff6HH0fTsIv1rjXvdP2/uAvbJ8dMoqKLbHbw4gL++VlwyLBxZDmoKEmQx1i?=
 =?us-ascii?Q?HB4KXPDt/OV3uLwx5TxUo9V4pT43cbDJoFFfW4Fym2rQfQmZbMg9rIBCOI7S?=
 =?us-ascii?Q?D1bqVnbsiH6WjlW+nBpQBi8BjzDK9GZ6sdL5DPa+RDwiog71mxHuZfhh4pHl?=
 =?us-ascii?Q?tA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eA9av+TIPBJPp9TqVbCnBchNJ2waetvWS6RtfkTXKA89YaPEVkYes2xjQ8e5j+MNv74oOLWfggPNhDIFxz3Y54x/n+0Wzj4iJ6ERkGnX3ec6l3fVL9o4HhLWrFAt9NTGqCcblU3XC+W1kEoCv437vyCuFfG8PbWUkZMjSBPq/aU18xK9ypynNqRtEepX/2UzlFE3N2HX6U4DD+geMz8/JPIHHOfWBFYaob53unDdn38fRnhW0Ve6ZDsqsMbBIy6KpxoUDFKwf79YG49ucwH953FdLTB9mctTEZP/F6bpqJvi+1osDNjh6rd0r9ZUnXyS4e4djXgK1ox8NbYP4mELsTb3CvbEiazxB4u/fIIgAoM1o6vprQ2yXVYmFV4y/qOtqrLVCGKaKxFR75D5LrQbXbZE5G8h5KYkzqjBrapklH6YyOKfTgtWQRuQDv6y1sBP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 06:10:41.0161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b9e7b5-2375-4da3-6805-08de647d4a2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6430
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 06:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17085

Hi Jeevan, 

Thanks for the patch!

On 21:38-20260204, Jeevan via lists.yoctoproject.org wrote:
> Add a systemd service to run PulseAudio in system mode where multiple
> applications need audio access without user sessions. Depends on
> pulseaudio-server to ensure audio/pulse groups exist.
> 
> Enable this service by default to provide system-wide audio for all
> applications.
> 
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
> Changes in v2: Add SUMMARY, PV and PR.
> 
>  .../pulseaudio/files/pulseaudio.service       | 11 ++++++
>  .../pulseaudio/pulseaudio-service.bb          | 39 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
>  create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
> new file mode 100644
> index 00000000..1d3ac435
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=PulseAudio Sound System
> +After=alsa-restore.service

I suggest adding Wants=alsa-restore.service to ensure that this service fails if
alsa-restore fails or is missing.

> +
> +[Service]
> +BusName=org.pulseaudio.Server
> +ExecStart=/usr/bin/pulseaudio --system
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> new file mode 100644
> index 00000000..5ce849fc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "PulseAudio systemd service for system-wide audio"
> +DESCRIPTION = "Systemd service to run PulseAudio in system mode for embedded systems"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
> +inherit useradd
> +
> +DEPENDS = "pulseaudio"
> +
> +# Ensure pulseaudio-server is installed to create audio group
> +RDEPENDS:${PN} = "pulseaudio-server"
> +
> +SRC_URI = "\
> +    file://pulseaudio.service \
> +"
> +
> +S = "${UNPACKDIR}"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE:${PN} = "pulseaudio.service"
> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"

Commit message says "enable the service by default", while it is disabled
here.

> +
> +FILES:${PN} = " \
> +    ${systemd_system_unitdir}/pulseaudio.service \
> +"

inherit systemd should take care of the packaging the service file [0].
Best to drop the lines.

> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPMEMS_PARAM:${PN} = "--add root --group audio"

Adding root to audio group seems redundant. Best to drop the lines. 

> +
> +do_install() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${S}/pulseaudio.service ${D}${systemd_system_unitdir}/
> +    fi
> +}

inherit systemd should also take care of installing the service file [0].
Best to drop the lines. 

[0]: https://docs.yoctoproject.org/ref-manual/classes.html#systemd

Regards
Yogesh

