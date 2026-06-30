Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269CDC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:31:53 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21089.1782826310019122177
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 06:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OsT7Ki66;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=D8G+cppv;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-gupta5@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UBCcH2401358
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=urpgsSJYF7638
	Kq6DtA5j2ylRqZ7wbEYwpB8rwSq5I4=; b=OsT7Ki66rfqOq1Rgw+dUR31057TXS
	Cv4iHQdG6oft5RAPMyR02Gqt6dtC66KHyue3XmSiD9RwQ5qPc2UDXGUCM0Oe5KB5
	HMSzuiMBMYLFCxsS5enCuAZ+JkBDvkakSy2AM5wdZ/IaeL9Y0UatQPuI6b2LBA7L
	ed6osd0QkW0j3PoViFB8Rqe7KWTeSfDd2af4YfwD15Z1jNKPVlym4cEiG2lRrprb
	xcgWRZcqzSChvW0MnknaL20lGvYwj/gobmKdx8HdSi0b4nKpPB0tVV7ix6VkUrm/
	mrPD1N3bCs2jpODN00sl8MGALiO5Uedt/x49f5KC01hEd56Crc3+YvkYQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj8rw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:31:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI/nftmENw7+cy+4l46XFq3KiNiepfp9DPqoMR6xl8xCATPGjbRtDme76CN8MmElEO5+beMVJ1uPVi64/qmZ2tIYENpxQuQjvz465HjHIizveUsYushQEQo/YaIrfHFiNk1mTBtbeKa/RrllbR8iLNbBgWFgMu1vJJA5oLWSYrZ9GJVYdxuH55HIvM7pKgp497jlnhl5/Y4Yk440+vvbQ+sk7yuIlnhoI1DeCO7mDZw2YrCx9RPdHGR9QQtElaqncApvHbRW9Csy9odp4zlvD1tNRNsMZIDwpG0zSNHXTndMTur+lNYCjPJ2eDZd80ock/A1vH1iJsBy/9eIWuMZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urpgsSJYF7638Kq6DtA5j2ylRqZ7wbEYwpB8rwSq5I4=;
 b=c0F2jPQDNfStrNQ5LbaOtw5HuRgeuJpA2hF+/0UahjmPcS+19kNOs4pVAXU7bEWEX0JuVN4sp8GlADchiMN9lPn8jt0JiDARUZDZN23C8xQ2jaJMYEffEWCIgx3e5egv8BnWurlEG9KFU8MTU2ZWPtEIBMI9G8V10qi/UXfQe5cmhhXTJNuDJTdK9lSc1OoOXkWrapBNR3wxS7u3FaSMtfp4vWa6Aun5uii7lofqkk10ltZFVP7xbDk4OXOFdB6VOllkGSYpEoonGff/+3rpqW8RwBrbZM0cLzr7sm8VtHEHuyhDAoRbiOQuPDO/GmENQM/Nei5bwLkQh3TJSwpLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urpgsSJYF7638Kq6DtA5j2ylRqZ7wbEYwpB8rwSq5I4=;
 b=D8G+cppvKKxlG4S3D+mb2Bz+bs1+QeIIw1SRpunIiOWRiIN0z3FI6URjNWJKBFrhvJ9Kp0glO2+6Q84b/yg9S+ov5s2EFIKE7r55skyIVwZdxRFnx/TzcRquRE6z28koYVUJCtl1APJfGjNf/pCw/ioibRdoTbuXcIdi+Y4YoOQ=
Received: from BL1PR13CA0185.namprd13.prod.outlook.com (2603:10b6:208:2be::10)
 by SA1PR10MB5735.namprd10.prod.outlook.com (2603:10b6:806:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:31:46 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::7f) by BL1PR13CA0185.outlook.office365.com
 (2603:10b6:208:2be::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:31:44 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:30:59 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:30:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 08:30:59 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UDUv8V2595081;
	Tue, 30 Jun 2026 08:30:58 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-gateway: Add 11.02.01 release config
Date: Tue, 30 Jun 2026 19:00:56 +0530
Message-ID: <20260630133056.1844921-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SA1PR10MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a73265-c92a-4c46-904d-08ded6abedb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|18002099003|6133799003|3023799007|20052099010|13003099007;
X-Microsoft-Antispam-Message-Info: 
	lEfp6fvdOG346KM/AVH/oyRYNdPTyWPX4XCg8+IZw9KrPjy+6kUlj2Y8QarNJPKRpqeuLzdbYZjdGKgi9T0p4ZZYCWaQaBdHGiyz5aYjXRbVhC9jGEhxXJib933N6Q68jDlCqJAygivxiRd4qk0ETCbCFBlAbWO11Sf4T1lxskyeMmRTdwR5zFbSRIo5Sfx/Wu2wwJEMWZQwdUSQ7tK8+mFl/OxoUin0C2R85m7PN7+6C0dGUtnOjbz2/4GZWAIKbT9NRyDqowz/o6WkqGqNaFu3hy6D1/vovvv1FEa5IPk3+DI6tFZiyxXFJw4thcnEGA0IDjgCQab+6ZmI7wedK0zcLu9bGlC2rolXgexa6wgTh5SZPN2dgpUmd/PXpxps6pl/naYqKhN+W1qQoT6F/qxGzn0Z+lBSjchy5ag92wXH1iZTJi8w37kQJjA74Nsj0iXYEcEkZwIAnlswFxaSTtjhojfO0XeLTKVvmqjh3d5CWJDjnp+JD/Mj8xAq+yO1sQvuzV9TcEraC/Q3H0kxVIetSEcIhSGtfgv8JuBACd3dT0eqI6EWOkCR/enJmWxJ8iOG+JGMkk3QBFDCi8C9tdgNv8xHWBvS1O6p8SkV1yufQUJFP4gHTwQlwNYwwc8FOt29uQbH2SrP2Rmz9Fnozw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(18002099003)(6133799003)(3023799007)(20052099010)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	J9nidn5FBlaL+KWh3K1mNS224OUqNSnYU9CbXj0tnjM9IgmbsVKJEgSgdv+SuLeba2mtkS8aoWkJL+jnLz0w+lhuNWZoyANjMGUurE2iyAkXXbOZGyQsv4vmxcJUSgk0KFZ5Nvpb7/bnnadue4V735hNVn/Dt3hP/vCs64cYnHq1Gv74luRPnL27t1I/ozP0+MKjkqwoNLe5aqOGskkfeuezTG5FwN/sdMJcP9V2/cGb8gvjWRT36J1KgTEv6e7y1/ZcCWQOe4sm6JTLDilX02Vo//6Yk7bHI80xXjnrDHz1ufCABQ8Uq3MIW9luMiinAR5O1bb8wd6K3u+8aoynEQL4A93/yh7RgeiHf2BA+Pse7QR8Lr4e9tezMV2pM94y7zNVPNZ9Nff8XIVYcY6MiTcOiB3iZbbrtQc+dblMuzLX+GoLI48aorsD5RwhQkZy
X-Exchange-RoutingPolicyChecked: 
	rG8/AEoqitbV3ZEnQDfUgexbV6wiBv3XGcApHchl26fMfc/+LCnNFCZf4esN1bWGIctJyEzFW+ch5WovmYOeD3SiuykcgvzsrB/nRajuuLyEPhVkid582m3EtMTEAXKu0Lh87QbNrHVx6gPGPEIo09b1VO89f2JZz25aZ2Jn1o725hwV2SAMO2DcffHeI7fGlWNZHLnG8NzH0YQRGFAooeWBF91kMuA7mAXmKrYcnLal7cVNINA4kH7cuiC0UTav+o7eVEsOM2Y6wz6zN63Z5nTkEYUca8jUniO/1TeuBzp3U3ALZJWGBBsjUZdYxVfhTAaABQYJ4UyRfNYtC81+9A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:31:44.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a73265-c92a-4c46-904d-08ded6abedb0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5735
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyNiBTYWx0ZWRfX61Ed/rbwX3cv
 MocgJXfcYs2YTTjaGhkflTs8iRPPRRzwkqC6ZeDjXFudjvOjqUsTfYGpxgy2lSUSbTQRZdiEV4y
 CvpWubl6khcmNym06YvrS4nWYFm/RdlB6x46NiFWAbciasGkbhSK6GOuU5v9xYEQZN0nOSbG6LQ
 N+QQZ9mkWAMptll7IgaU9CD/4vTuJ9mZNNWLtCvacYfosBC4FWCUKA+8ZVj4p7QQTopb0ywaDs7
 MhZMdazhxf0DbqZ+yid2mijefp7Txb8gmcPd2Wh+c6ULzfuG9ZuGyFCd+OOS+f2z8vYycazzKDu
 hQa+floWYIBEP5CRxPR+lcvGKB+FUg4IrFc9P3gReNXDKMM/vETyXrhh1FU21xt2/OPZUhSPFrz
 eoQ7RxL6Q3E2GZPDAGpFWS5c2o3O8cOwrjBKiqKaiqJ3lzlUN6i7DMo5MkRsgasiNAk2z+se77r
 v9LaLGQ9ob8POqL9VTQ==
X-Proofpoint-GUID: _41uS5bhf4R-5zNIZWiUcUsDDQopzNFF
X-Proofpoint-ORIG-GUID: _41uS5bhf4R-5zNIZWiUcUsDDQopzNFF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyNiBTYWx0ZWRfXz2yM7eozlnIR
 9JuyjF2r3JAWxaVRjBmxYvt7Pm9tYYddbhuwvWISNlneTCHsLo99YCyZvCsCXMg5aKJYpe/X0sF
 abKrIKkb1PKyGoF3yakee6TNxn7Nufg=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43c545 cx=c_pps
 a=26rO91Bbw6QoawbNyte6AQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=WNDY76dxAAAA:8
 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=LJPH6ROh-ywWrxKlJU8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300126
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Jun 2026 13:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17578

Signed-ff-by: Puyush Gupta <p-gupta5@ti.com>
---
 ...ssor-sdk-gateway-11.02.01-config.conf.json | 158 ++++++++++++++++++
 .../processor-sdk-gateway-11.02.01-config.txt |  21 +++
 .../processor-sdk-gateway-11.02.01-config.yml |  99 +++++++++++
 .../processor-sdk-gateway-11.02.01-config.xml |  86 ++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.conf.json
 create mode 100644 configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.txt
 create mode 100644 kas/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.yml
 create mode 100644 src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.xml

diff --git a/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.conf.json b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.conf.json
new file mode 100644
index 0000000..71165d2
--- /dev/null
+++ b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.txt b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.txt
new file mode 100644
index 0000000..709ce7d
--- /dev/null
+++ b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,a4daa14312d659333984aa1ae58ddfe0c96392f1
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,d8cc4e44001c7257273d290ce8c4496e93d32841,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,9859d582984a87b42db107127e829c976f315ee3,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5bce7e26a38a58bb52242494e54ab2af40009574,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,e2864ea1ac022e43af92badc701fa1e2a9571f46,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,4298b217a5049718241a0ad523b00c4390e62bfb,layers=meta-ti-foundational
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.yml b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.yml
new file mode 100644
index 0000000..fdc037b
--- /dev/null
+++ b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.yml
@@ -0,0 +1,99 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "a4daa14312d659333984aa1ae58ddfe0c96392f1"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "d8cc4e44001c7257273d290ce8c4496e93d32841"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "9859d582984a87b42db107127e829c976f315ee3"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "5bce7e26a38a58bb52242494e54ab2af40009574"
+    path: "sources/meta-clang"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "e2864ea1ac022e43af92badc701fa1e2a9571f46"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "4298b217a5049718241a0ad523b00c4390e62bfb"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
diff --git a/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.xml b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.xml
new file mode 100644
index 0000000..8ae39fb
--- /dev/null
+++ b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.01-config.xml
@@ -0,0 +1,86 @@
+<?xml version='1.0'?>
+<config>
+    <description></description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='a4daa14312d659333984aa1ae58ddfe0c96392f1'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='f6dc5e4817c6551ea5250ab1beed6ffc6fc235f2'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='d8cc4e44001c7257273d290ce8c4496e93d32841'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='9859d582984a87b42db107127e829c976f315ee3'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='c4fd56386ee30f8b46f8e4eb1220edaf510d2ac0'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='5bce7e26a38a58bb52242494e54ab2af40009574'>
+            <layers/>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='e2864ea1ac022e43af92badc701fa1e2a9571f46'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='4298b217a5049718241a0ad523b00c4390e62bfb'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


