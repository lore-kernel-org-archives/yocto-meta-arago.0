Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDD9C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:56:35 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.353.1790175392607801359
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PLIvZSzL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=f2FB9KCZ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NEkWs1444319;
	Wed, 23 Sep 2026 09:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xCCBijvH/GjGrmjFCOointLMCBZ8IJUeWE2CzlNbg
	aI=; b=PLIvZSzLqdlUwYXbaCPjrWRR9KlXXUrAMm6NssfQIGSydBOGIT37asNE/
	KbqZX6CJ3w/xPTvZAbs1qm5/RnWdmGzWYhxcyLsBojRL6CaNr0H0SP5Mjl06tz5Z
	0G4qRpfNJHHn7/7QQGuQO9yS5axM2ue6tANMc8VJ6HcpwABBJW6T393HHptInjhw
	pNNkz9JIZGs2JWX0UeNWipTz9sQEzFxiTFPEf30VkwEPHUiLA3HB3oqMKqKMD8rs
	MAtGPrcZ0jBCRFOfp6dymmrOs1+Xib5Ry8/CD9fbm8akCsilgbXM9TCgHwmDzyPZ
	MibkKNAkGlg0jIQ8QnJZL9Kivxcmg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tmap2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:56:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIl6Ekh/gAx9999vHvRgjKYJQUrgvJBISmq5OIsVDcLlHLWXZrbY9AkgaBIUoR+UnKpImXwVt5pBGaDymZyb1C/IJov1l3sf3ibkTnrtBN0Q7tJnszQhGscvKfRHqqWZusOBOcGl1Xe67YpRCSGFJVFz5UtYF6Kof+5Vq0RScpbApq/45/QDFdT5IGcfmA3nCZqMKgroXoqFGfvqjQ1DUY8mpgJgFoAs6NvrCx2tUwK8votmGxfPyS8vi4wyLkdeZkmYgaqf4+H/CgmbjSXOdTjBXMz8D32kuh4Czuydp9AwD3XoDMbZZkxpkTV346jVfyv10is77Xk+Lfgxw+ec2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCCBijvH/GjGrmjFCOointLMCBZ8IJUeWE2CzlNbgaI=;
 b=yaRiPxoFoc5j0KUPkJNvKc3KIzF11wAsFYmxa4k2Sdp7Rw+EKOpfLLdT211ARlh4y8tFBZ1cd+f3BI4DaIffUAJcGWdc2XDG0xSKFQWLstXkJCpiuSL54ew6N/TyuZALFZvMZdQRuKDJZvOtcBk2HkWIucNKfqKmB/Wynu8jgDGFm4iVeJuroJUvxQQ16m/MxiuPbQE8j5EdHY994zSZJvaTHb2GvOo7qkWYM6nKBMMeseJ0kFAFalilCIueiUo+SdSqzGgNqWoMs/e7iNPj44TuWDXkuT0QNdzvM6TO044nVw3AJaCpRpuE+DUDrAGPmcDyPxSZqDqoEEqSnWghyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCCBijvH/GjGrmjFCOointLMCBZ8IJUeWE2CzlNbgaI=;
 b=f2FB9KCZ311wQkOIcdm8POGJXH9hOa91p3ClJMWEnwkulVF/k3mWbXjktmz9wMk2JWJk/Ch6bu3aTBYSOK7K0YLzxNHySyA38HcWRsBcqqyAmcLnW3uv1lhf9foGUzKUU9qcGurQzdkAYX+RrYj3pAkXV7SvduvxUt5x3EvppBI=
Received: from BL1PR13CA0105.namprd13.prod.outlook.com (2603:10b6:208:2b9::20)
 by CY8PR10MB7337.namprd10.prod.outlook.com (2603:10b6:930:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 14:56:25 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::aa) by BL1PR13CA0105.outlook.office365.com
 (2603:10b6:208:2b9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Wed,
 23 Sep 2026 14:56:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:56:24 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:06 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:56:06 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEu53X2240880;
	Wed, 23 Sep 2026 09:56:05 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v4 2/4] pipewire: Add systemd service via bbappend
Date: Wed, 23 Sep 2026 20:25:41 +0530
Message-ID: <20260923145543.2140007-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923145543.2140007-1-p-bhagat@ti.com>
References: <20260923145543.2140007-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|CY8PR10MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4cad11-41cd-46ce-def9-08df1982d67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	cQlGufoZEko3tugahYZxfdDbHuMrfyjTZLPAux2xn2fa4Q4I4pbt/vkSfu8i0dvyqB1wbQp2HU+6HsiJ3bX4b7slltq0JjVYhrsJQsZiIqe7LAtQK2cAMFhGhUf0S8XiYs6CR6bw7jH9BWqDLlXho+rEzmdGwOvwZb/4jx3qyB9BpsdV5+GVL4yhnjjc5u4YAaeZBabOwMVxvpJCeL+auLiZtGKUCusmFIKGJr4dDbBwXknFp/B6CnCBhlHr3A50PE80snD61uZTQz9Y61qyUnBslH4b0pC2lx84LM+/46mklaz8MemN8yqe4yH4jf6RvBAAuAnR0Lr2YcdI5TSdhNSajXMVGUWFkPNcGHHBFa1Ci8J2504ySuQzEOOayz/2AJQ6uKNJVW7MsxDBfBUIN6yvB+Fl/GkDIWeb1x01zjriz3ArJUmtytsf7WZzxF9xElDl2VR8iTybaJUUSHQf+wntgQhwA9CXsVX5qMWdrPMvGtSlIUYtxzyU/OwbElWQHrAwHJCEzM+jfp9Q6+Dl1nd112CtXSU4XOfmIdQdjQPkViZsfCaGMr83KXA6mPj72IXO0N4DA/flV4nU85vnQz5Fkg/htp9IZ8iy9i4L3ScxRBOiVhiI39RJLbPMsdQy01+tFTFbMoovNdYvQgtm6WwyJ7e2VgqbXOiRzolBKfC/t/Npn46hyydZxuU78opcCb7R7n1XJBFBecnD29nZZQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+EvJgdmmnSho7mhlU+Y2lB/ofP0GO/0gv9zoJDQcEtKlzbgF3i8is1FnDvs3cnvW86RX1aP8enrXi2gv9tuWZkfLuwPV8zgaVaTClKTaZKTV43OnLUImSVOLxvk6hZfzn04gJuFytbQvUuYR8ZPlzLmN7xjMi94ugLQPF9t5NuSlHyEEx5tHd++r5igWNXCMZL/3S18RXXTs3X1BkPBFcxrAYglqHWfmkiupU6ONnms/UiUxfi2euFYJ/au8BFJSVlEUOQ2zqwOUiJSkFcl6zvirhdM5O0M9k4khAHL74woCOMO2akIt80Y7IZ4QciqBAJVfh9zKdX6xhUvyn4EP6ECaa/CIdrzduqKFqpJxmBXdBkaYBgwRTStTWLGbv/XmBzJmO75XtozgQaeXQtR0Um4G2sjMgqSObcn2hP8dZGcIdpxMAc4kzEC5H1WPzedm
X-Exchange-RoutingPolicyChecked: 
	iYIy2d/+jbkGZPGOSJ4DpYQ+eZSStLdUFM1ku31n1epW95qs+Igd5lMaI5w1KVrV9VX3jA11jZfq+k59W78YKPM5IprI5wqHl3bDaZDYmNxoCZwQOQ7vxaDLxltKw5u25gfQVs9Myiw+51nt9J45J+cYP1QFBNUgh5aYwi06p7DzvPI6eOEQ5huUkBue6vK7CqsVHnNI7tJ/JygV14cz1pr/TziZC2HsSEnWtVxHn1qlUYjLwqHfXukDFNkLThF3cmUpAsOqwhK9xVuY9zI4JCr5T1Sci2hlx374ERud0Q3uU9GmsaQf+EJYbDlGdkyxv3r7jEcM8ezJT4CK5Ak40Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:56:24.3856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4cad11-41cd-46ce-def9-08df1982d67f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7337
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX0HaW7lucd1Tx
 vEsJvD4ztBnQPV/pvYccz1raWOu1fgwF25hMuhiRM5Tj1eV48PYIgd+/sxe2ec6uHQVrd+4Y+cw
 W+d/U1h4iklDGwTalu4TqNrB62zdNgs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXwMUlX9pmO7BD
 veZGJ/i/tbZaC5y2+dY/Typhg8GtDbjtz+DH70WelYL3Qu6ubwB1xWEejF3LID7tWRLQsZlF3EI
 tePwSEWRkQCiERR6yt8U8gQs+cFOtmDuwaU1uRyVWkWsuAkXIu4KP36MhawH0X6MRaP9CVJzYa7
 9HtzU2ratoPMUDaEY3IXKBwhxdupkQHanWMyhPYyPDCzUee0vGaQ8Al2sVu2z9PqvzjG55/l8Mo
 ut5sqJzviGd3e2f20Gzzku8hp5I7mW5xsaG6JCG5q0XqNPpwdXQZIjUUYe3VgZHdJy7LOwGQCNY
 8zUmIFLogVwM84xlpPFm4pjwy1Hy3bb86Fax/J9l2OR597K0CrO2v3zF59cN8K7nD+knVTYYwfK
 cUK5fuwVLj6+uNEOu7s8qV/sAlQtBM1A9PR9XnRQqqiZlb+OGJAn/x+Av7jx14FbDxi71sGswH7
 eSKsQ821kvvZXpct7Ew==
X-Proofpoint-ORIG-GUID: -jNjuLZAxOCG8kZKrD-UNDsAyKRMFR5S
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3e89f cx=c_pps
 a=UGDxSQ6JIm3CXF+tY3HRSA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=2YTg0G2jCm4xzRVDYEEA:9
X-Proofpoint-GUID: -jNjuLZAxOCG8kZKrD-UNDsAyKRMFR5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:56:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17695

Extend the PipeWire recipe to add service file to start PipeWire as a
system service with proper socket dependency.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Removed platform specific changes.

 .../pipewire/pipewire-arago.inc               | 14 ++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 3 files changed, 44 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
new file mode 100644
index 00000000..7d7fc91b
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
@@ -0,0 +1,14 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+SRC_URI:append = " file://pipewire.service"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
+    fi
+}
+
+PACKAGECONFIG:append = " pipewire-jack"
+PACKAGECONFIG:remove = "jack"
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
new file mode 100644
index 00000000..d204b15c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
@@ -0,0 +1,26 @@
+[Unit]
+Description=PipeWire Multimedia Service
+# Ensure kernel modules are loaded and sound-card is ready
+After=systemd-modules-load.service sys-devices-platform-sound-sound-card0-controlC0.device
+
+Requires=pipewire.socket
+
+[Service]
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NoNewPrivileges=yes
+SystemCallArchitectures=native
+SystemCallFilter=@system-service
+Type=simple
+AmbientCapabilities=CAP_SYS_NICE
+ExecStart=/usr/bin/pipewire
+Restart=on-failure
+RestartSec=2
+RuntimeDirectory=pipewire
+RuntimeDirectoryPreserve=yes
+User=pipewire
+Environment=PIPEWIRE_RUNTIME_DIR=%t/pipewire
+
+[Install]
+Also=pipewire.socket pipewire-manager.socket
+WantedBy=default.target
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
new file mode 100644
index 00000000..dc32422b
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,4 @@
+PIPEWIRE_ARAGO = ""
+PIPEWIRE_ARAGO:arago = "pipewire-arago.inc"
+
+require ${PIPEWIRE_ARAGO}
-- 
2.34.1


