Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E7FF44856
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:41:32 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155125.1775824882696269127
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=h7XDALeQ;
 spf=pass (domain: ti.com, ip: 40.93.201.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgl5+PfFu8JEtmpx4k2Elq1u8Ag7Ouz2Io5zleHvxpcd/Q5ZrS9WigszTCMvtKY7HQqCYGrgGQNEakw4odg9ZbmkS+98yVdfnHW5La83qDXCpYUYDZQEUIf13FvyO9LsD1JZ/DnkXUiKiyNs7CY0LMFFEZAoSXScFQ+RxE5BaFXrNyFwBeWU1RRZp3X3eB+HNiIpt9sBDkJkaAATFJH1lgDumoeJXuJsD2Z6p6POsnZtbfpWsXC8lhwJGL98T/yqbj6MVhOSxrEwj7CTJLub4MW+cjp30QWEdPdsQX0qy63TQ+QOiVBosIE+0bSD1+Rkf87dC0heXNqW1CEkl8llbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Im8XaFAODa4Jn5XohxHgbEEpP9jLLDbkBE/rxX+Vm9o=;
 b=XQDi3v12DyTDQMQ39Bw1ybrILPF40pIfqwkYm26BG9PeTQzS531ZdTenUHtCrKmya8wTCwXynkrbEDAjukuZ5r8aPKx989vtFvP3w4xENZ8dKdeioz83U/OG9mDIO5bmUMBt/fXxpKEdAnGkrx6Q3Hl3lILaTDQp5KiHjcLaFn4flHPaz9H/xat8i9vxWZ7z2yo0UQGkE1Nq7n8bUchMWnWUGSvTaSe0tUDn4XZdjZAL9MHcbVksA1cwbaFdLtl2BDairMl7ZfdeNBau9PXps6H4WMCeQ3zJJEBI3bNY11vT7lyri+ARzkYs5psQMBMoamW3FlzsPeRpXrwpnkCycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Im8XaFAODa4Jn5XohxHgbEEpP9jLLDbkBE/rxX+Vm9o=;
 b=h7XDALeQq588hCqNgE53LPg5OHOdUU8hD3lXFMazuFkldMohUxbM0SwjMvXxFv0oXK4fOyiw9S5QVHxDiJsaItWuDHWjHzfXOhesVFy75rkPQbFDcwQTJk6JpTK407yP6DBiYwKKvU1/gTfIGdIfDXG7ZcqWHl2U/LHaQkB6S7Y=
Received: from SJ0PR13CA0191.namprd13.prod.outlook.com (2603:10b6:a03:2c3::16)
 by PH3PPF0A8D5CDB5.namprd10.prod.outlook.com (2603:10b6:518:1::788) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Fri, 10 Apr
 2026 12:41:18 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::d) by SJ0PR13CA0191.outlook.office365.com
 (2603:10b6:a03:2c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 12:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 12:41:18 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 07:41:17 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 07:41:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 07:41:17 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63ACfHlx1395517;
	Fri, 10 Apr 2026 07:41:17 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wBBAj-00000007kin-1mVp;
	Fri, 10 Apr 2026 07:41:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Upgrade from 1.26 to 1.28
Date: Fri, 10 Apr 2026 07:41:17 -0500
Message-ID: <20260410124117.1847885-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH3PPF0A8D5CDB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a826cd-16a8-4720-dcee-08de96fe7660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	LmHVkLJ0YEhE+s2Vd0bHzD92J3xqTyA1Npyt7QiBMZXRvS6BoTT6WF15qoCKYgZZ6Sf1GFOX68WLHU3uohTWT8UTlx/HZymeUIzZk1fMMSsceYV5+4GBz5bzdjAwq9xY4ootXcsnofpRRjJ48CU7OJhVODhEMQvHE6a4pfcaM5heIn1CZwfjAtzezkYIO/AihcAD/hvU1yBf2USoAopR3YTRU98tKQQqsTs2x6sjcbBbfWq8HJ6xDGph3aLTzsqs+Yc1PbmQqz57tGAubPKwgLkBGYFqvD/s94aRBclwyulaggplGXZ75ioyafCRDWip55upXt6F4Cp9sN6L/h7F4ZFmrvmvnaVO0q9wswD6Ie+hvANvYAUcEJ8wI4ZgHGGaLZvrkaZfm5efaLc/wusL0GGcIljpEFmc2qDft2UxzF+LhrbVeCX3vzUUL1r1agX2AknlLLCdk+8T12iIklgzqBz4It7JOxr6eWSbmtleMPnJ2u0E6NY/8aQmJ10H1zZJs+dvGv5qVJH1Mg6rzlqeyheBKb7Bk2sJswAfse9de5kpbAo1XzDhoB8eAO1Sf/0mMbwgtmZFpm748etQjHuTguxNuxb4AbECkuk3EtwmKITv+y0OxKJ2hg4tLOxvJ1BOzUiL4IkCZF6+F42vRBfBHK8oFptpravu28b8tG/sPZJaa9FtOd6c825xmkAkNv4M+Ukl1EeqLDDVcED+q8fkyqrjarlxQqYrJl3ULd91dnLwZVT7xd7Nv++28/5OSkDRhyCDexoUDpSoicG4H7L6lw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ENl721yzyuJWYvQfyp/a1dGKr0FfqIwTDozKYEo8C9Vj5vWi4nvnsIAbpIzMDA0jzZjmYpuZtPhM3aBOkZuD6VDiXvClLW+cplJes/m+xYQIovg87pV6lmcBt4ZhvVxdJ48D/k9Rvp0sthNV0R+/28f/VzpwROTN5lgQ//pKuF9itBdNwqrmYCyesehHzmU91drTZBqUw2CNcI3FWOZU4AxZy5+y9/9k38eTCtItFfMPbG6i9OhfFxIGJBlz4hcq8dG42+twwyFr2xqYi8EZs4KsODkfOtQgXBlY32eXJ55XRKzQOjRdQFja/nHOxi8ApVBwtwX4ZMCQUCQMYUlSS1VpLLMmf3pD/DU6dzVFPZfa55Sfv9O+uuP6Gmp0NVCl0nPQpdgENkDDOiGhH6y9a4fkoFoMnj8KraiSmvHkvYB7BheJjDORLW8+EJOL9QlB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:41:18.3827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a826cd-16a8-4720-dcee-08de96fe7660
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A8D5CDB5
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:41:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17461

oe-core has updated to a new version of gstreamer1.0-plugins-good [1],
so we need to adjust our bbappends to match.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D85f5c49d5fb=
233aeb20383012c7629d5575548ba

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} | 0
 .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend       | 4 ----
 ....26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} | 0
 .../gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend       | 4 ++++
 6 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend
 rename meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstre=
amer/{gstreamer1.0-plugins-good_1.26-arago.inc =3D> gstreamer1.0-plugins-go=
od_1.28-arago.inc} (100%)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good_1.26.%.bbappend
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugin=
s-good_1.26-arago.inc =3D> gstreamer1.0-plugins-good_1.28-arago.inc} (100%)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good_1.28.%.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26.%.bbappend
deleted file mode 100644
index 0ceb558c..00000000
--- a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.26-arago.inc"
-
-require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/dyna=
mic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.28-arago.inc
similarity index 100%
rename from meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/g=
streamer/gstreamer1.0-plugins-good_1.26-arago.inc
rename to meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-good_1.28-arago.inc
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.28.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.28.%.bbappend
new file mode 100644
index 00000000..e8392833
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.28.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.28-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.26.%.bbappend
deleted file mode 100644
index 0ceb558c..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26.%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
-GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.26-arago.inc"
-
-require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.28-arago.inc
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-good_1.26-arago.inc
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.28-arago.inc
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.28.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-good_1.28.%.bbappend
new file mode 100644
index 00000000..e8392833
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.28.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.28-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p28_ARAGO}
--=20
2.43.0


