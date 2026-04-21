Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C9AF327C5
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 08:35:27 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17153.1776760527266942526
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 01:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ocdGyE05;
 spf=pass (domain: ti.com, ip: 40.93.194.6, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCYmmSehdGOsxnYmPz+96aFHW9nqI3B87a/ePv2Wdlp62a9xirq1fgEZmjK2UpKZgZJV+rAPnrmCuY+/rb0fzEuromIPMp5tTg3KVr6teWuRNzE7FmOcxXV1dwQKHbJOrbO6EXtkkBDvtBdXlOrl3I8yQ3j3ri5jU4M4SBZZB69E83kICgxifFXV3c7WEWI8B+IvQiDIrAkcbaO2Rd3clHPKE+/YtYX8IDqHYCT2cGVuy/yJqw37EkStSB++zHPJGTFL3IS+foU6yu4GDZIdowljcTLQoRlakhZjD07JTAo5xnf/d6ILdYxNrZz5elDEMjP0ZgcgwRvU+orjCOYVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEbRBfAtvsjcg1OUzvlOG4wqhnfbPXLhRCilgrSDLrI=;
 b=TzgCcJOxggzOG/APjb7l6acDybEXsfyUKLebbS3++juqRmNgSiJuPNKxxcJ4WmMVUEN1buuviPsk9iZezboEmD468sJXGVoHsGwsRH78xT3FmRNiN7jpiaYiLbbJqPmkwKyfqs9BvGMAgAQqRrWgms13PfHMM2F+pgTKVk3c4tApVShBj1g9vARxm/K8Jl86Y/pKSS/+19o9GHcRYG7E6kVPcaQwPErwJ+nVkvX7RjxwlIE/abofbAtgSZJPqZrGbxOz8hkn3G/UNsww93xG7iRyQ7djSG+laIgE9WALx7Xalu2Lt6281VeLbXolQdrdv5/bSX7ZxJXY2boB3kEM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEbRBfAtvsjcg1OUzvlOG4wqhnfbPXLhRCilgrSDLrI=;
 b=ocdGyE05pH2V0IqBxFfG6KMJAvpt02y/dvQ2vDANm6mSRxX0kINO2tuuOv9YMRcnw9ikimTj1MBVxHu3/Z5CdQV1di6tZYn+tQ7JljFvbJF80qYpnnPqQC1AaPcZRziS9bqeFS/rPSlzTEEzap3XtqxIoH0mmhsZ0CqhEcMeZyk=
Received: from DS7PR03CA0192.namprd03.prod.outlook.com (2603:10b6:5:3b6::17)
 by DS0PR10MB7068.namprd10.prod.outlook.com (2603:10b6:8:144::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 08:35:24 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::e9) by DS7PR03CA0192.outlook.office365.com
 (2603:10b6:5:3b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 08:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 08:35:24 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 03:35:23 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 03:35:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 03:35:23 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63L8ZKVQ4161974;
	Tue, 21 Apr 2026 03:35:21 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <k-malarvizhi@ti.com>,
	<vishalm@ti.com>, <j-sahu@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH v2] processor-sdk: Add luks config for Sitara SDK 12.00.00 Release
Date: Tue, 21 Apr 2026 14:04:47 +0530
Message-ID: <20260421083447.1555153-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DS0PR10MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f7d80d-4afc-41dc-9167-08de9f80eea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|20052099010|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WFlukY0m0VhxDsegE305RlM3WD1dRmbeQY2RxG6woZiONobqGImDrlH1wfvF9cpZE3fgdiPTPTsCigbWyWtrmy5lY05HVEhpURdpCtxHXXO2ittK0QnUmqyvZroVY8GDReghBeqQ4gG5iRE/onDo36L0lnov3jLJ+cRaEI1KRHSH/hb5Be/QbsjQnzNDvdrAi6kGJIL1tqp+Kf49URar3KYeaU0J9aM+ZqAzQ204iSpLsqRlxOc2961bs5bA3NZ4OUn4mDj/NZD+Jg261uz/N3d5UAJOmGvDj36te3yqoq8gLVOma/YbfYZO01zPKnGSGoePRNCnZvKFEnoDXUcTNbFBvL7yfGe5BWVsheh2vATWuAprPVv4KZ/xFZgXqS799qXJIm5z/b2CNY0l2vfX3v03hZhCnTATnBqnhByanAuf57n0Zd2Gfl/IB3fJgKWheyEHM27ctq3JiGxMux4iO9p8D1MCo25r1v6ui2DYJ8fIwvOCe7c9YyEt7qZm4ZRXmYIug3C7As49uP8f1kLNbFwzkKY9CAQSamqiyK2uUMdpjyqc279sHntgv1gUcRz3TrtZQzfMreh1LkiCbbrPHesl9OG1f2IKtunzFznLhIGOy3ATcarXGhTNEVxIm46sfvbXSb4F+KWi7i0npY5hMogQJoonZsK+tol0PM0QOFwrPZ2uwgONcskBw0Ozao6+dJlkin6o0zJlqiYzQbBELn4b88bgGdoCOz99pwJYP7Q=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(20052099010)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P3lpjXpX4gJL/Ow6PzxG0MV8h8EFCAH5ag7o0gfckvy3G9i1rRE6wR+rlgnrQm0JdK2C4FKtCLYwMF+MMfKh6o4yzxUwmvwfOaFDvqmUbdw6HK4Vj3Asjpv7mt4lWluen0Ry+hjZjE1R9noJRBe3CDhzdYLpgbNG6qyo6AeEyaQ/JfexwFZ1qgUf8wqKmNUMR0saTxf8oScu7CH407zS0+zLTvKstMrOYt8pdmb8d+jl/8Ad2atNrvTbtzQeS5cYdzEmavnQWT8EMGKs+1CDpx0KfCeTzixGAL6f/dGpUBKS320n7Mh2TVAc+Ef7Wd49g+/1W8em1w+4Sc534xPL7+IeHjBeo4VZi88TIy2ZtsRbyom4zXv2VVbvOaJ8T1nu0yXy1qLqT3i6YvFz1IATyZBtBS/728xj4puMmZEIKMEyb7D1e+N2WHxFEF4kl9ZX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:35:24.0756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7d80d-4afc-41dc-9167-08de9f80eea6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7068
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Apr 2026 08:35:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17478

Add processor-sdk-master-luks-12.00.00.07.04-config used for building
SDK with the luks disk encryption, supported for AM62x, AM62P, AM62L
and AM64x.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
Changes in v2:
- added meta-tisdk layer as suggested by Jeevan
- removed disabled layers meta-flutter, meta-selinux present in v1
- Link to v1: https://lore.kernel.org/all/20260414135825.1225171-1-s-tripat=
hi1@ti.com/

---
 ...aster-luks-12.00.00.07.04-config.conf.json | 147 ++++++++++++++++++
 ...sdk-master-luks-12.00.00.07.04-config.conf |   4 +
 ...-sdk-master-luks-12.00.00.07.04-config.txt |  19 +++
 ...-sdk-master-luks-12.00.00.07.04-config.yml | 100 ++++++++++++
 ...-sdk-master-luks-12.00.00.07.04-config.xml |  76 +++++++++
 5 files changed, 346 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-master-luks-1=
2.00.00.07.04-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processo=
r-sdk-master-luks-12.00.00.07.04-config.conf
 create mode 100644 configs/processor-sdk/processor-sdk-master-luks-12.00.0=
0.07.04-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-master-luks-12.00.00.07=
.04-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-master-luks-12.=
00.00.07.04-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00=
.07.04-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-master-=
luks-12.00.00.07.04-config.conf.json
new file mode 100644
index 0000000..3619c1e
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-=
config.conf.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vmaster-luks-12.00.00.07.04",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
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
+        "rev": "master"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-arago"
+    },
+    "meta-security": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-security"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-security"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "dev"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-=
ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-=
arago/meta-arago-test","meta-security/meta-tpm","meta-qt6","meta-virtualiza=
tion","meta-openembedded/meta-networking","meta-openembedded/meta-python","=
meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedde=
d/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-ex=
tras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta=
-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/processor-sdk/processor-sdk-master-luks-12.00.=
00.07.04-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
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
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-m=
aster-luks-12.00.00.07.04-config.conf b/conf/fragments/localconf/configs/pr=
ocessor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.conf
new file mode 100644
index 0000000..21aae5d
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-master-l=
uks-12.00.00.07.04-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for processor-sdk/=
processor-sdk-master-luks-12.00.00.07.04-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for processor-=
sdk/processor-sdk-master-luks-12.00.00.07.04-config"
+
+DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04=
-config.txt b/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.0=
4-config.txt
new file mode 100644
index 0000000..4e76cf2
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config=
.txt
@@ -0,0 +1,19 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,master,12.00=
.00.07.04,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-security,https://git.yoctoproject.org/meta-security,master,8028c573db=
6923525c2918724f2bd36d4a420e0b,layers=3Dmeta-tpm
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,f7961b2828fe5eba250d396=
8bf1d135a2d28dcf8,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,b5=
bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-python=
:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b1326=
cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d732=
71d08bf4193c2509a34ad12385b6,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
+
+LOCALCONF:DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-con=
fig.yml b/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config=
.yml
new file mode 100644
index 0000000..b8bc26f
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.yml
@@ -0,0 +1,100 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "master"
+    commit: "12.00.00.07.04"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-security:
+    url: "https://git.yoctoproject.org/meta-security"
+    branch: "master"
+    commit: "8028c573db6923525c2918724f2bd36d4a420e0b"
+    path: "sources/meta-security"
+    layers:
+      meta-tpm:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
+    commit: "f7961b2828fe5eba250d3968bf1d135a2d28dcf8"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.0=
7.04-config.xml b/src/configs/processor-sdk/processor-sdk-master-luks-12.00=
.00.07.04-config.xml
new file mode 100644
index 0000000..ecf49c4
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-co=
nfig.xml
@@ -0,0 +1,76 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vmaster-luks-12.00.00.07.04</description=
>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'master' commit=3D'12.00.00.07.04'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-security' url=3D'https://git.yoctoproject.org/m=
eta-security' branch=3D'master' commit=3D'8028c573db6923525c2918724f2bd36d4=
a420e0b'>
+            <layers>
+                <layer>meta-tpm</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'b8968685998a052e5bed0=
f68a546be800c6849ed'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'b5bb24b356d8200e2f4b088bc=
052eb668502ce33'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'ec113301d73271d08bf4193c2509a34ad12=
385b6'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append =3D " tpm luks"</line>
+    </local-conf>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
--=20
2.34.1


