Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42FFF9D0D2
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 13:59:53 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19539.1776175188016716900
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=P23rmE7E;
 spf=pass (domain: ti.com, ip: 40.93.194.57, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa2ZV3cm8tWkV9IVFjYPpL98SqINLI6bZMxE10hZ7yZfdg3XA159PwX7rn6headdlk/msadAfNsJCkU4VaykHYOQ0n64bnrhTQUMqqZ10zuqPxWgJ+kukhsr+YrjQEqSjXfbMScRZHok2eiKqhTSUG+KxND2uBkDL86Tb6UNSZL5+WYghwieT0Y7usHQ/Ec1k1QhHcdDbwN22hjKfOba1j9DZjevz/HFrJGK10f3HcbQERIjSbC8dKXMvZKQb9RfxjaHcogAK8E1h3fl0KPGivXj/pB4GdlB0sThMYBQsLhphYuxF69/1+SzmZXtOMJHy3OjkQLb9i6gx9JHrMoaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMeu62c2R8uXohW1HcIQaBVxQ8vqvl5UPsrOEA4p5hg=;
 b=iH8oXxyRaEbmAYg9oC2bdtFUy3gx5JOjUZT2fuptugjA75+HUasGM0e9l0KlNqfs5hko9nq97332tm/OI221Xb+jvZv2hYE7qw98iPgzO/Fj9J4yF6Pi3ppA7X3t6gD8QBN8PesH4p+fvyK7id/xYezm7Zcy/twefzq8dLrXIrf3OXoIuJbVH+ejbo5kSPTjnfPYhliNIgdKZMjJUdhluse+TIkCQaQar5EEm3t0LTvZWN3evvGsL+RWcM0NAw8uiQ140r7zFOZJAds+A3tjNXqwym10JvzF2Q+tHFgnXa1Vj9oSVr+yeRh/8CXIYBlr7gKmvkE+GLZ7lOsF4hB0JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMeu62c2R8uXohW1HcIQaBVxQ8vqvl5UPsrOEA4p5hg=;
 b=P23rmE7EziE/DpsYwavwls5i3FQ4vXebLp4gc7bgRFzooAaNOzNrym3TKXEEGuWte00OfT0MBSE2K9zrVQFkLknnv8PdLXRVpE1sRAFzSst4j7aE6EHPEXCEfUjHZlzt3/3BbDE1HM20FeNaMquWMRqQ9rI3u3Pnjk3TFnSdDv0=
Received: from DS7PR03CA0329.namprd03.prod.outlook.com (2603:10b6:8:2b::33) by
 CY5PR10MB6192.namprd10.prod.outlook.com (2603:10b6:930:30::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 13:59:44 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::bb) by DS7PR03CA0329.outlook.office365.com
 (2603:10b6:8:2b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 13:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 13:59:44 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 08:59:43 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 08:59:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Apr 2026 08:59:43 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63EDxeWs4131270;
	Tue, 14 Apr 2026 08:59:41 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <k-malarvizhi@ti.com>,
	<vishalm@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add luks config for Sitara SDK 12.00.00 Release
Date: Tue, 14 Apr 2026 19:28:25 +0530
Message-ID: <20260414135825.1225171-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CY5PR10MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a088e98-d5a9-4b17-ca32-08de9a2e151d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|13003099007|56012099003|18002099003|20052099010;
X-Microsoft-Antispam-Message-Info: 
	oA1XzXKGMiqKx6FiKnX30ZoAZ1AEZj9gVaXKreB+ihsRjhgVW69WgLPaDmYQRKN4ltagkkylEh1EX0mBnAnZZ5lwfeY0N4ZEJjwqkIH6g3l4eUN5QoZ9Rr3x/N4jwKfGkKag4uetvH/28ayKHRalmpheFX9LXg5RgYtq3yby05xP4GWbKMWkEuSZuoEWvV2jVU67VLWsdzfd67DxvpQG9i+pwdq/mCmVzaVvSkJgufRy90FgZbak/XywMnMI1c/HpgmGycLHPluFmv5+XYe/h5LBly8C0Xiuee/shsDNISCyHJVscf0uAiNIo6ryDvX9OvODxgt7sMFVNovih1sD0JiDoQSAJx2rbx12bmpAtBBiuQL+jYjTJaxuzKsRZRD7jLUz7Bzxd/SDnlqG+xoQthAQcKAnGCX6tae41LhbfwnAMGsq6aSUFVD3Cov3pEL4oKukB0wO0EkUevCgyYl0bYOPMJL140dxeyGbuFvM1dxLr7W356D++47JlBJ8ttEYPd7PNtyHMsbY9XsjhSOAYd7lPePYCqI5m5TRBOuDZ+9DDE19ZfHxLclJHeQkOL8uGdm2c0Uh7ih9fcFHe9s49a0y0UTvurPnHFsHcAFTvVqZi1Lzmjyd9/zFD4K/ySCvabqK4SdePFx6sk2IFRYoihr3Gb/TshI8McSbA5i3kd/CRi6k+pQB8QNsDsTLa4ZVCKMNKWRDviMyuuSxQDiEtA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sQxlXcAN6e+5o8ymdU1+4+1UQmt8KJkzOdb9aRxFySbZheZJSQ4DERsOc8ijJlHCb5z3NmWjYnH5dbpRGcH2kN2+7HnsGacHFSWYeMZZIBGPVt+aaQ82Be0U3mNlXq42TDxf/OI3d4NDs+LpZJMaDXHy96LqEr9M87Put7NyMtv60OMWITp01vOHsrtO+4H+6x4kHfOfJTngP24NyHR8wB/NzvOSRevLu5NuyXbpwlroSQlTHKVSyUkzmxsffrATRO9FbusHxL6Kx6Vy39BUSOojnyUyhFLvi15QP/euA5aGmuoZK+nS80Gx/Q8eO2hHYPDo2LgHOtgd8YDrfi6ZjPRkBnGCVUtnJP+kpYbjpdJn3JrniLm4Nvohls2ORq5OZ0RsAFQmTsn2ydGPmhymzqgv7UNCueUr9sl0wz6jre3PeBbTM06C+iXtUX/UckMr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:59:44.5670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a088e98-d5a9-4b17-ca32-08de9a2e151d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6192
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Apr 2026 13:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17466

Add processor-sdk-master-luks-12.00.00.07.04-config used for building
SDK with the luks disk encryption, supported for AM62x, AM62P, AM62L
and AM64x.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 ...aster-luks-12.00.00.07.04-config.conf.json | 136 ++++++++++++++++++
 ...sdk-master-luks-12.00.00.07.04-config.conf |   4 +
 ...-sdk-master-luks-12.00.00.07.04-config.txt |  21 +++
 ...-sdk-master-luks-12.00.00.07.04-config.yml |  91 ++++++++++++
 ...-sdk-master-luks-12.00.00.07.04-config.xml |  84 +++++++++++
 5 files changed, 336 insertions(+)
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
index 0000000..efed2cb
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-=
config.conf.json
@@ -0,0 +1,136 @@
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
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-security/meta-tpm","meta-qt6"=
,"meta-virtualization","meta-openembedded/meta-networking","meta-openembedd=
ed/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome",=
"meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","m=
eta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-ar=
m/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
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
index 0000000..b62f018
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config=
.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,450e=
a5b3eb5b84c58e71e956c17a23ce1f2335fd,layers=3D.:meta-flutter-apps
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,master,50803c3dd3d=
42bfe060b96a094c01d9075e37f41,layers=3D
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
index 0000000..5a3d2be
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.yml
@@ -0,0 +1,91 @@
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
index 0000000..32da111
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-co=
nfig.xml
@@ -0,0 +1,84 @@
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
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'450ea5b3eb5b84c58e71e956c17a=
23ce1f2335fd' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'50803c3dd3d42bfe060b96a094c01d9075e=
37f41' disabled=3D'true'>
+            <layers/>
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


