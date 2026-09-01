Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EA5C624CE
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.974.1788231796776610710
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JmaV8htg;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Ti5lg9XB;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810xa3I2179173;
	Mon, 31 Aug 2026 22:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kUnjTvGtJ79yEF2truZ2y/+V1oTgpMJUR/Ct79J3k
	UY=; b=JmaV8htgFJ5kp82kViXyNwvk9Rgw/1y0LV4UI1JF3qYqjfZHVGfpg+ZPW
	AmSjVjMzCGIAzGrvhcPCSeS1DXirie3WH3UVaknogP+h90akG/RsOLb3D1sFIi+r
	4VpOJyUebDlViD2AnXU2nUv/ijhzEYrnf9w/PG5Qvsc7pZ2fziosuYhTBgwsyFjH
	7PUAXSwtpTCeKfXfXIeRH7sabksfhSiAD2vwu27JrmkdGD1EwQQLrK75ZXWEgN2N
	+F58t3fQWcnq4Sx3wokXtcodL5yha/i6Xqdc7YcTzPIXu9gB5OvZY7BXm7cLqGji
	VL5vcY8ih9Zs2uxdFTnJPnFI6sSRA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gdmnd0t5c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:03:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6pG+HZgVfj51EUU07/jey2A5z34HfQxBB+APUTXd2MM4rggQOkszv+MM2JNycMX7mcLRM4EMEbjqVp/Rwt40dsUGawZqS/eTVFagMA+X6hxOBai1DtRN5bxdjTfMa8PwCj9ugVqJgDZuW/xH0xfhFGtq6cMtTmsP7qQpHwMTsrP+QiHhH+/dlxG0fZyGd/x9cWXkL4Pdm0HzCFC82UK2mGrhPFa7rM7a2tZxBKfVVBq0rLUUi7w1y9H4VWSGYIP4UvTL9n803qQrszSUx2sdZWG1g78fRD4iZBRtg7jfh+ZIGYajUeCShfuq/Yh9RsET8uQJeUBLZIxSRbLukcqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUnjTvGtJ79yEF2truZ2y/+V1oTgpMJUR/Ct79J3kUY=;
 b=bUZJwWSm1t9PqKHJniQdrwQc0odl9Jk+cqIQHM4BVPTl8bYYlvAHoexQZ/ui+tEVOqtfHK6xj4kyBtKFu1dNOMH04YACcs2q2/BzJRqUkHKB96C5h0h0ex6oooCZPlLqiEANgJOvsTvOE4qw/8Bf/MWvTwAR0zfeJEWWOVeOLbU5pRtDc62vvr3wx8Eni5sHtmMCewjz6F4ox9qz6zR2v77M6FNNR93xAfwHxzWiAHGWzM/GVhQnK1EzKwsofvRGr+9c2/g+cKNSpkmWnYteshXmkSYupBfw7boaHUTmQmEMTLxojiyJgnrmWdJsW8WZxk6GkmTjfPW3ytOll1xSbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUnjTvGtJ79yEF2truZ2y/+V1oTgpMJUR/Ct79J3kUY=;
 b=Ti5lg9XBYu935Wo+/ki7HKxSjhVkGgJCt9VonY7iKUF2p3RwxReQGti5XaQOmVfHSiX5Vi9M3HC8hV9ikCY9zAYTYQTjd7YIB0+QHtrTlahPPXwCMBvk9jMgfDSJEwpOEO9PY3CxzHqnFb2laaIlVbljuuspCaCXXZBoJ6wn6sw=
Received: from SA9PR13CA0047.namprd13.prod.outlook.com (2603:10b6:806:22::22)
 by IA0PR10MB7578.namprd10.prod.outlook.com (2603:10b6:208:491::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:03:10 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::9e) by SA9PR13CA0047.outlook.office365.com
 (2603:10b6:806:22::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 03:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:03:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:04 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:03:04 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6813330P938756;
	Mon, 31 Aug 2026 22:03:04 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: [master/wrynose][PATCH 3/4] recipes-multimedia: Add wireplumber audio configuration
Date: Tue, 1 Sep 2026 08:32:32 +0530
Message-ID: <20260901030233.686017-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901030233.686017-1-p-bhagat@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|IA0PR10MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: 394092c0-cbf2-4797-0d8c-08df07d58d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	D+jZhKwa53iQWT9eWkU75iy6KCEiIfEsYiUKMrKNubD57n8NItOmQnPx6Znb+CiVTDyFC3Z5Kh8irbkM+CX4pt/Rm5h7rl9Yon3bBs4Z0SDQvRBp/r7wsjZvUVZNkSsedetV4vkHKGUMtQxSdZQySRf2rDIIvY5y+BA7iVa8gdOJhXnD/c6XvDYhYLxFtJlvN9RJ8PuArzk40moYxEmAcQpbcBiUh9zbZL0oXC8B7n2sV/UwJnOlX6HpjjQeVNWrsHZ1Xg0yXVpp8qIYKak3bapWSjxRYN78Y6VPe8ZWV1o4v+B6NZmNSUeYnucjxiHd/6jvrn36Adb/qwSJrkDsN0giOqRVHXhlU9c4+zu/bMJMHUplYg0BlR6vU9l/F7dtZiRPzXqdoqgwQrIX74WHKcv1+xQQeRg3896VNX3z1VzV7HcNHR+riN5vxuQH41n4riDjAOJwmtSOFx9HCFsWfrdsfJMUrqCtyK6Tn+nC8MPVs3pR7VUBeaJJ4HExFs5nFItQ2wqlIzgARWbyj/PQjs30wYtGrr/P1aWezeA85bu+truXwpUTDEft5sMqetGcZI1ypIhgc0P44Yk3P/EAy9q+94hUpgPb75GhGtRRredRHOmbNc6KJFHaUuABlOG+daNOZGvteaZifbnSufm2tck3jkKfQUWok/flWRzJ0cUKK01SY2/EjEQ/bUcSwvSoVq5cFm1ktaVZI/tPQS8qsQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/U6hh7PdwqVmQDelGa0uZAuB4dXQg1WYhKRAZw2P4/RfOV1yJDZy2Xg3hqRaJ1YpXipVMu8urV6eF2+riVW0IfrpGTrRkBRD7WSV1Gk4JJXDpR1vnVOcUe+XUSpLpk+sEivE7IHejOYZEKHrZ6Vf9hr4/EMq8Gdy8LKji18wrWeR4JfzF/XFJp2U39AWcqRPtGpJrBnGNyDYQiRCNb8P0hogUOl96S02dHc/2XCEGjHE5GU8HVaO1IQ4IPr/3XSZi2ZTz0jjsowUxXc9A4nK1vDh3IsW/rbiFGO/OyBJdzkC/x+rxre4XJP5TPMXemaKDAE1ZTy1lXIw96xGiD9T2pRk9nczO+nAFFqF38Ui4lUp962gffxg1HcncV/R2n9DaZ6a12GY+M5SpkkgZOmk/MbepvJ6GZ/fTnIZtEnvbvVng891gWlX+eO6kdHzxkHI
X-Exchange-RoutingPolicyChecked: 
	UYiZm2fkmpkwb02a9o1PzTU2k6GPxJnHaNb4MlZWCI5/RvsphezNt/2X5lF4INTsmoc3U7fS9WREhUHlLOD2niSAGMGJkS3lxG4BK9kSE+/3Hd83wDDHwbqNq8ExIbYB7Flbnajrmweg9LVEEfWesoY4+fvpk3TDxqLeAn8bO3V6vwqB0HF9KUt7QXT42/kIUXPn0EdaqT6vD2L7/7OoGUzOHj9+vHshLG3c5ojDlzQ9zzG++7gIHYX1Jus7stkzFE1Rl6u1e7rPyybiAL1g7b4yBdNWVq2LW7xxEMQ1WXmJCUiitDi9yUFiCTWp3HvDoBSsKHXmr2Mk823dJ4Sieg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:03:08.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394092c0-cbf2-4797-0d8c-08df07d58d15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7578
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfXw+GBatRSXDjd
 Jr+4+xH2/U6cSJKH8FbuVjHorAXRupCV5Aq096Gi+BQzCCZACL3TggPARznagLu/7HjkJkSVreH
 t8gVyYoPKfHyib8/omdn8b65mFQDdX8=
X-Proofpoint-GUID: 3CnVh85-uhKmeP7LHsJrwS2Ruo_mPvt7
X-Authority-Analysis: v=2.4 cv=D+R37PRj c=1 sm=1 tr=0 ts=6a964072 cx=c_pps
 a=7hCjIaGjES2TrnZcIlaVSg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZsI1D44bINRuIHTABBAA:9
X-Proofpoint-ORIG-GUID: 3CnVh85-uhKmeP7LHsJrwS2Ruo_mPvt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX6eVngSIaVoa/
 w4upqy/xfLa1uZFBQh64z8eIISoWGfPRZ+cDVRgF3qNFdKZlCJgKt/reRh//tiPDKtufxOF2LCJ
 8xJuVW+S6E7wJ2ZBdngZj6b2dXeIm6oIxwWgQd9HzOiWtwN9uQQ+N0gRulQKhZbhOkD6u02hCek
 Aj3aArMALaHl46h1MsycchkZNoeQfts/ARAFctOT7wEauECjfpNglKyprx5CYMt7sSYcOl0C+fK
 1n/+9m5cGxAddZBM16n1Xz4O3ct5Cq+jC+2nmxFfxZxNIqM0OCGkzP6LQB0Awe0lXwpdDMMnkki
 ccZW5W1aLmOKCwVbAofPJCrIpN3gB4kS2L/zKvqCrIO3dSm8SqqpjvHf2Ik5Q55aPLRnkudxaYE
 k4cUG0lRy7jW36fmh57xr/7MNQEXnUDNMWdINwde42YOg54s6S2eGio4Ohepg3dnfySTirQmAHJ
 Wt3/Q5Cvkr1uAk26clg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010024
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17638

Extend the wireplumber recipe to enable the session manager on all
plaorms and provide AM62D2 EVM specific audio initialization.
A set-audio-defaults.sh script is packaged to configure default audio
sinks and sources at runtime, managed by a dedicated systemd service
that runs after wireplumber starts.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/wireplumber-arago.inc         | 33 +++++++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 ++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 4 files changed, 90 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
new file mode 100644
index 00000000..6325d26c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
@@ -0,0 +1,33 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/wireplumber:"
+
+SRC_URI:append:am62dxx-evm = " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+inherit systemd
+
+# Enable wireplumber for all platforms
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE:${PN} = "wireplumber.service"
+SYSTEMD_AUTO_ENABLE:${PN} = "enable"
+
+do_install:append:am62dxx-evm() {
+    # Install the script
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    # Install the systemd service file
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
+}
+
+SYSTEMD_PACKAGES:am62dxx-evm = "${PN}"
+SYSTEMD_SERVICE:${PN}:am62dxx-evm = "wireplumber.service set-audio-defaults.service"
+SYSTEMD_AUTO_ENABLE:${PN}:am62dxx-evm = "enable"
+
+FILES:${PN} += " \
+    ${bindir} \
+"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..191b89f5
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Set PipeWire Default Audio Devices
+# Wait for pipewire and wireplumber services to be started
+After=pipewire.service wireplumber.service
+# Ensure udev has settled so audio devices are available
+After=systemd-udev-settle.service
+Wants=pipewire.service wireplumber.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/set-audio-defaults.sh
+StandardOutput=append:/var/log/set-audio-defaults-output.log
+StandardError=append:/var/log/set-audio-defaults-error.log
+RemainAfterExit=yes
+TimeoutStartSec=90
+# Restart on failure with delay
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
new file mode 100755
index 00000000..49be177e
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# Wait for WirePlumber to be ready
+i=1
+while [ "$i" -le 30 ]; do
+    wpctl status >/dev/null 2>&1 && break
+    sleep 1
+    i=$((i + 1))
+done
+
+# Additional delay for nodes to appear
+sleep 2
+
+# Find audio sink ID
+SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SINK_ID" ]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
+else
+    echo "Could not find alsa_audio_sink"
+fi
+
+# Find audio source ID
+SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SOURCE_ID" ]; then
+    wpctl set-default "$SOURCE_ID"
+    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
+else
+    echo "Could not find alsa_audio_source"
+fi
+
+echo "Done"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
new file mode 100644
index 00000000..541b2963
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
@@ -0,0 +1,4 @@
+WIREPLUMBER_ARAGO = ""
+WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
+
+require ${WIREPLUMBER_ARAGO}
-- 
2.34.1


