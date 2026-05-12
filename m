Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE2DCD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 13:17:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75112.1778591818614121613
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 12 May 2026 06:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hRfG6+6M;
 spf=pass (domain: ti.com, ip: 52.101.46.49, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBLHcIx8v+eCvriuuz+o1NhqvQvlg+Fq6J7/8Az0CXRiFLd5CMJpov7s3ral+7FCboou+LCMoD9hqjSltb5hJhreLjjy7idNVZ7Q5ds4G46sYfxcw/cpm0gOw9LP453CzovhVIrOgEVXOUgWIiBgkWR+duVTs3MuCiI/1JQMd7UZEE5Eb2NrhGdi4zzTP1L3sj7KOhD7dLySFB4Rwclnq7S39jErKkh80XM1SnKyWspH8x5vlRJm4zzDYTaGAhK835+noHpsOo66dIwIHoyaRukidTzurlCyjmP8ETUqw75Zcf79mErv1r7LiZOk4P3uuNw7PS/FIg35+hK6iihrig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhgrwdeUicj3RZxQd/h0vEhFkIDsYo6Rrj1CcGSA29g=;
 b=DcEt08ZD9u+bx5B16aivnFSVzwlp+1yrZLDrm/EH/AARmc6CBEYIJUFyghA6LAfkd2Lgj4PH+S5bygyiO4aedNJnCmUELRQmH4KUATAQ1Vuv5k0FTUlOk77MsPJYsPAd+ITOxqQ2ZaZyyZLTHr6ztGmgnGMAvLsM4+1FrKfkPOg1MwslPIwNn3Efrj9ar5Hjz8k8lkayxA7zUOBobH3y8ccuOjH3jlTkVash3eNBnuCU93WUbT4iwhnZyiMEjWc96EY9xCq0PdLooa//+RC+xUam6fHS6jqtPhw9QQ9xh4/YsutTFcWzHskjAaJf7kPylWsUmiV8uTOuOxcu69uFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhgrwdeUicj3RZxQd/h0vEhFkIDsYo6Rrj1CcGSA29g=;
 b=hRfG6+6M+F5IczbLZ1iYuQeejiC98YQ8p+peHm8Mdmg06x11fYJiiGAPYC31BmEXW+3+i/amUzTCukNG55Is4vOYzP2gbw/fhZSvZfFGFMYKsqwKJV2tSCDMOvOIdw8EI7YCqGJvhG2nWEaTh03MdBslYaku1kxAzJ70H/p/i1I=
Received: from BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34) by
 DS0PR10MB7510.namprd10.prod.outlook.com (2603:10b6:8:166::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 13:16:51 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::7d) by BYAPR01CA0057.outlook.office365.com
 (2603:10b6:a03:94::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 13:16:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 13:16:49 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 08:16:48 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 08:16:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 08:16:47 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CDGl3k1850579;
	Tue, 12 May 2026 08:16:47 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wMmyd-00000007JT5-2tWZ;
	Tue, 12 May 2026 08:16:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] arago-wrynose-*: Update meta-virtualization to wrynose
Date: Tue, 12 May 2026 08:16:47 -0500
Message-ID: <20260512131647.1743124-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS0PR10MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4d0d3d-fc8e-4977-cfce-08deb028b9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|3023799003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	7D00kwGUifNKmBK2jvuUkfpybks7ghH9v/lVs9oAYdB4pLRmOwhbd9SagvvF2WdAHKexcPC1Etgxa6IuGKnlsg6f3wxnrwIwEiLaPC55AntAPJD/bAiVlbnMDfc4kNNakWIVN4mcwZW31YoRuY3ASU5T5Hfrd4Qh0VknZHwBBCjWsDOgmXDBoCmlVUwVka6d7jCJYjU2cYYj5tbxbhO9rFazNXYhKYRAkm+nY4inv7baD+1LrTyEewmhbJBP91Jj4fF3U9IuFKNnF2EYG5ZLtq/TsIEUnVM+AzxBiYVGXxDvvnt8ipUmNnFRUYvrmQXhkdx5OXwEwCDSHe9endVgQ5LyG/RLbNwqV/KJmF6YN7EGolBRg3DxAnzd2SO1pwkLNBc1x72k57pQVUv/jrDNKvbr7rjA5UahX84vEtnItHyTLZ/Zmq+t5eiw+f2qpG7HwbWHsBw0UqhHG3MgdBYu/cP8wXTF3QUI51e29BGtdi6qp932l8aYJYAbu0t6ZDmY34JNPQEnPgc65N0JIpWuN5plsqnRuKK0Gx3bf1PVyvwjvYJWnsH1kVS7qa/SXaRiNytlkvpgU/6ZOND18GnLEOpfXRmLsGfax7Nn/G4gQQChFlFIG0peioLTo3EgfEB5B2LbaoI+LXsovvWTkxlcSA33pgkyNUERMcTdZ0gqqf1lNabVg+VRapr6ZJYAiokP
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(3023799003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vhSUOu0OC7r1STwDLo9PZoZCICZyWF8oTGcj7kEF89piVl9SwdICuV2uooH0qDHIN2pOH3Q62irXMN8AwjaVQe5o5+nKhkGg2hAdVOQlIsuAJsu0fJDP175H9BYJwiwO9jHDN73pPyf4NT3h4vnghCuw3Jf7CztPiev3sMusSWmn1vWVLdvrdEP18pqys90TU1T9kKh4PvBEhEtTRYr1wvYy9Ru2ZRDVo/rD+On2TdycCg8zvJtp7aBgMMucyUPvmli9vYk3+Ra0Sk/vYJX8AUsLuX5Wm4BzPE9weoNidyu70i2r4rnsa6gI3O5L9H8KaYuDI9WZ4jGH79mGWr7dHyw+GjL3XTE4DJw0FgUSVBVFg0tbVnozYRTPEaZGA5ql06VFyFEIV8+gf7EeqHyziyezuz7nwtpNa+6Xxz9SZV0QP49qwuB0S7AUTtJntUZv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:16:49.3795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4d0d3d-fc8e-4977-cfce-08deb028b9cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7510
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 May 2026 13:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17517

Now that meta-virtualization has created their wrynose branch we can
update the last required layer to wrynose.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-wrynose-chromium-config.conf.json | 2 +-
 bitbake-setup/arago-wrynose-config.conf.json          | 2 +-
 bitbake-setup/arago-wrynose-flutter-config.conf.json  | 2 +-
 bitbake-setup/arago-wrynose-luks-config.conf.json     | 2 +-
 bitbake-setup/arago-wrynose-next-config.conf.json     | 2 +-
 bitbake-setup/arago-wrynose-selinux-config.conf.json  | 2 +-
 bitbake-setup/arago-wrynose-wip-config.conf.json      | 2 +-
 configs/arago-wrynose-chromium-config.txt             | 2 +-
 configs/arago-wrynose-config.txt                      | 2 +-
 configs/arago-wrynose-flutter-config.txt              | 2 +-
 configs/arago-wrynose-luks-config.txt                 | 2 +-
 configs/arago-wrynose-next-config.txt                 | 2 +-
 configs/arago-wrynose-selinux-config.txt              | 2 +-
 configs/arago-wrynose-wip-config.txt                  | 2 +-
 kas/arago-wrynose-chromium-config.yml                 | 2 +-
 kas/arago-wrynose-config.yml                          | 2 +-
 kas/arago-wrynose-flutter-config.yml                  | 2 +-
 kas/arago-wrynose-luks-config.yml                     | 2 +-
 kas/arago-wrynose-next-config.yml                     | 2 +-
 kas/arago-wrynose-selinux-config.yml                  | 2 +-
 kas/arago-wrynose-wip-config.yml                      | 2 +-
 src/configs/arago-wrynose-chromium-config.xml         | 2 +-
 src/configs/arago-wrynose-config.xml                  | 2 +-
 src/configs/arago-wrynose-flutter-config.xml          | 2 +-
 src/configs/arago-wrynose-luks-config.xml             | 2 +-
 src/configs/arago-wrynose-next-config.xml             | 2 +-
 src/configs/arago-wrynose-selinux-config.xml          | 2 +-
 src/configs/arago-wrynose-wip-config.xml              | 2 +-
 28 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/bitbake-setup/arago-wrynose-chromium-config.conf.json b/bitbak=
e-setup/arago-wrynose-chromium-config.conf.json
index 1a70861..db4804e 100644
--- a/bitbake-setup/arago-wrynose-chromium-config.conf.json
+++ b/bitbake-setup/arago-wrynose-chromium-config.conf.json
@@ -64,7 +64,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-config.conf.json b/bitbake-setup/a=
rago-wrynose-config.conf.json
index 1f371fe..a401cb3 100644
--- a/bitbake-setup/arago-wrynose-config.conf.json
+++ b/bitbake-setup/arago-wrynose-config.conf.json
@@ -53,7 +53,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-flutter-config.conf.json b/bitbake=
-setup/arago-wrynose-flutter-config.conf.json
index 529225b..cecbec1 100644
--- a/bitbake-setup/arago-wrynose-flutter-config.conf.json
+++ b/bitbake-setup/arago-wrynose-flutter-config.conf.json
@@ -64,7 +64,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-luks-config.conf.json b/bitbake-se=
tup/arago-wrynose-luks-config.conf.json
index 77a814a..b253394 100644
--- a/bitbake-setup/arago-wrynose-luks-config.conf.json
+++ b/bitbake-setup/arago-wrynose-luks-config.conf.json
@@ -64,7 +64,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-next-config.conf.json b/bitbake-se=
tup/arago-wrynose-next-config.conf.json
index 7ead35f..79161f1 100644
--- a/bitbake-setup/arago-wrynose-next-config.conf.json
+++ b/bitbake-setup/arago-wrynose-next-config.conf.json
@@ -53,7 +53,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-selinux-config.conf.json b/bitbake=
-setup/arago-wrynose-selinux-config.conf.json
index cb36a62..f21e273 100644
--- a/bitbake-setup/arago-wrynose-selinux-config.conf.json
+++ b/bitbake-setup/arago-wrynose-selinux-config.conf.json
@@ -64,7 +64,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/bitbake-setup/arago-wrynose-wip-config.conf.json b/bitbake-set=
up/arago-wrynose-wip-config.conf.json
index 3ad20b9..0b4207a 100644
--- a/bitbake-setup/arago-wrynose-wip-config.conf.json
+++ b/bitbake-setup/arago-wrynose-wip-config.conf.json
@@ -53,7 +53,7 @@
             "uri": "https://git.yoctoproject.org/meta-virtualization"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-virtualization"
     },
diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wryn=
ose-chromium-config.txt
index 696baf0..6982789 100644
--- a/configs/arago-wrynose-chromium-config.txt
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,=
HEAD,layers=3Dmeta-arag
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-confi=
g.txt
index ab77e34..8e107e4 100644
--- a/configs/arago-wrynose-config.txt
+++ b/configs/arago-wrynose-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,=
HEAD,layers=3Dmeta-arag
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-flutter-config.txt b/configs/arago-wryno=
se-flutter-config.txt
index c60c672..f25f2d3 100644
--- a/configs/arago-wrynose-flutter-config.txt
+++ b/configs/arago-wrynose-flutter-config.txt
@@ -6,7 +6,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,=
HEAD,layers=3Dmeta-arag
 meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,=
layers=3D.:meta-flutter-apps
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-=
luks-config.txt
index 6fa45e4..b455a1e 100644
--- a/configs/arago-wrynose-luks-config.txt
+++ b/configs/arago-wrynose-luks-config.txt
@@ -8,7 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,=
HEAD,layers=3Dmeta-arag
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,laye=
rs=3Dmeta-tpm
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-=
next-config.txt
index c9714fd..a7af660 100644
--- a/configs/arago-wrynose-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -15,7 +15,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynos=
e-next,HEAD,layers=3Dmeta
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-next,HEAD,layers=3Dme=
ta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wryno=
se-selinux-config.txt
index b20c1ea..26b76f4 100644
--- a/configs/arago-wrynose-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,=
HEAD,layers=3Dmeta-arag
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-w=
ip-config.txt
index de24279..8b06c8d 100644
--- a/configs/arago-wrynose-wip-config.txt
+++ b/configs/arago-wrynose-wip-config.txt
@@ -7,7 +7,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-=
wip,HEAD,layers=3Dmeta-
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-wip,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/arago-wrynose-chro=
mium-config.yml
index 3a395ce..9bd5d2c 100644
--- a/kas/arago-wrynose-chromium-config.yml
+++ b/kas/arago-wrynose-chromium-config.yml
@@ -38,7 +38,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-config.yml b/kas/arago-wrynose-config.yml
index 66d986a..77b0170 100644
--- a/kas/arago-wrynose-config.yml
+++ b/kas/arago-wrynose-config.yml
@@ -30,7 +30,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-flutter-config.yml b/kas/arago-wrynose-flutt=
er-config.yml
index 6b93a77..c2fe2d9 100644
--- a/kas/arago-wrynose-flutter-config.yml
+++ b/kas/arago-wrynose-flutter-config.yml
@@ -38,7 +38,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-luks-config.yml b/kas/arago-wrynose-luks-con=
fig.yml
index 6ac3463..f9c298c 100644
--- a/kas/arago-wrynose-luks-config.yml
+++ b/kas/arago-wrynose-luks-config.yml
@@ -37,7 +37,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-next-config.yml b/kas/arago-wrynose-next-con=
fig.yml
index 6513be1..835d631 100644
--- a/kas/arago-wrynose-next-config.yml
+++ b/kas/arago-wrynose-next-config.yml
@@ -30,7 +30,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-selinux-config.yml b/kas/arago-wrynose-selin=
ux-config.yml
index c9e2756..c7bc213 100644
--- a/kas/arago-wrynose-selinux-config.yml
+++ b/kas/arago-wrynose-selinux-config.yml
@@ -35,7 +35,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/kas/arago-wrynose-wip-config.yml b/kas/arago-wrynose-wip-confi=
g.yml
index f736ad1..29ccdca 100644
--- a/kas/arago-wrynose-wip-config.yml
+++ b/kas/arago-wrynose-wip-config.yml
@@ -30,7 +30,7 @@ repos:
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/ar=
ago-wrynose-chromium-config.xml
index ef13904..0ce3f0f 100644
--- a/src/configs/arago-wrynose-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -33,7 +33,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wryno=
se-config.xml
index b924056..e47ffd0 100644
--- a/src/configs/arago-wrynose-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -33,7 +33,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-flutter-config.xml b/src/configs/ara=
go-wrynose-flutter-config.xml
index 5b4245a..4e536be 100644
--- a/src/configs/arago-wrynose-flutter-config.xml
+++ b/src/configs/arago-wrynose-flutter-config.xml
@@ -28,7 +28,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-=
wrynose-luks-config.xml
index ed23b42..cc078b5 100644
--- a/src/configs/arago-wrynose-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -38,7 +38,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-=
wrynose-next-config.xml
index d816f1b..6e20699 100644
--- a/src/configs/arago-wrynose-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -34,7 +34,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/ara=
go-wrynose-selinux-config.xml
index 032803a..d594aec 100644
--- a/src/configs/arago-wrynose-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -33,7 +33,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-w=
rynose-wip-config.xml
index 9feec4a..36c4abd 100644
--- a/src/configs/arago-wrynose-wip-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -33,7 +33,7 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
--=20
2.43.0


