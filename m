Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABA8CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 19:45:24 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6632.1757619919830252706
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 12:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=URJsw86/;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BJjIE5876467;
	Thu, 11 Sep 2025 14:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757619918;
	bh=nmOzy7UHkE6/2w8HA/M4RPGj/8uLGuIfdl18UWUjF2Y=;
	h=From:To:Subject:Date;
	b=URJsw86/GRJkL/wmwtNRwQy/ZcPNZ+56xHZICAz49lrmCYlTjr8GWwEHurgiZwluK
	 2lBegUxXfxv3jOJhs7ENpR47J2M9AZgxtaomY7PaPNfDW1/oB8LTByaskXh2pdKHAh
	 pPGvBJ7X/sx4c7cqUnMEalLpHmXUOtn2FVxvXuHE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BJjIGO1436445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 14:45:18 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 14:45:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 14:45:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BJjH7M2762905;
	Thu, 11 Sep 2025 14:45:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uwnEL-00008Z-Ib; Thu, 11 Sep 2025 14:45:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] src/Makefile: Fix bitbake-setup issue
Date: Thu, 11 Sep 2025 14:45:17 -0500
Message-ID: <20250911194517.475-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 19:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16565

I missed a make-ism that snuck in and caused the XSLT file to be included
twice creating extra stuff in the json file.  Regenerate the json configs
at the same time.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-kirkstone-chromium-config.json      | 24 -------------------
 bitbake-setup/arago-kirkstone-config.json     | 24 -------------------
 .../arago-kirkstone-next-config.json          | 24 -------------------
 bitbake-setup/arago-kirkstone-wip-config.json | 24 -------------------
 .../arago-master-chromium-config.json         | 24 -------------------
 bitbake-setup/arago-master-config.json        | 24 -------------------
 .../arago-master-flutter-config.json          | 24 -------------------
 bitbake-setup/arago-master-next-config.json   | 24 -------------------
 .../arago-master-selinux-config.json          | 24 -------------------
 bitbake-setup/arago-master-wip-config.json    | 24 -------------------
 bitbake-setup/arago-scarthgap-10x-config.json | 24 -------------------
 .../arago-scarthgap-10x-next-config.json      | 24 -------------------
 .../arago-scarthgap-chromium-config.json      | 24 -------------------
 bitbake-setup/arago-scarthgap-config.json     | 24 -------------------
 .../arago-scarthgap-flutter-config.json       | 24 -------------------
 .../arago-scarthgap-next-config.json          | 24 -------------------
 .../arago-scarthgap-selinux-config.json       | 24 -------------------
 bitbake-setup/arago-scarthgap-wip-config.json | 24 -------------------
 .../coresdk/coresdk-09.00.00.006-config.json  | 24 -------------------
 .../coresdk/coresdk-09.00.00.007-config.json  | 24 -------------------
 .../coresdk/coresdk-09.00.00.011-config.json  | 24 -------------------
 .../coresdk/coresdk-09.01.00.001-config.json  | 24 -------------------
 .../coresdk/coresdk-09.01.00.003-config.json  | 24 -------------------
 .../coresdk/coresdk-09.01.00.007-config.json  | 24 -------------------
 .../coresdk/coresdk-09.01.00.008-config.json  | 24 -------------------
 .../coresdk/coresdk-09.02.00.008-config.json  | 24 -------------------
 .../coresdk/coresdk-09.02.00.009-config.json  | 24 -------------------
 .../coresdk/coresdk-09.02.00.010-config.json  | 24 -------------------
 .../coresdk/coresdk-09.03.05-config.json      | 24 -------------------
 .../coresdk/coresdk-10.00.07-config.json      | 24 -------------------
 .../coresdk/coresdk-10.01.08-config.json      | 24 -------------------
 .../coresdk/coresdk-10.01.10-config.json      | 24 -------------------
 .../coresdk-10.01.10-selinux-config.json      | 24 -------------------
 .../coresdk/coresdk-11.00.09-config.json      | 24 -------------------
 .../coresdk/coresdk-11.00.15-config.json      | 24 -------------------
 .../coresdk/coresdk-11.01.05-config.json      | 24 -------------------
 .../coresdk/coresdk-11.01.08-config.json      | 24 -------------------
 .../distroless-kirkstone-config.json          | 24 -------------------
 bitbake-setup/distroless-master-config.json   | 24 -------------------
 .../distroless-scarthgap-config.json          | 24 -------------------
 bitbake-setup/poky-kirkstone-config.json      | 24 -------------------
 bitbake-setup/poky-master-config.json         | 24 -------------------
 bitbake-setup/poky-master-wip-config.json     | 24 -------------------
 bitbake-setup/poky-scarthgap-config.json      | 24 -------------------
 bitbake-setup/poky-scarthgap-wip-config.json  | 24 -------------------
 ...ocessor-sdk-analytics-09.00.00-config.json | 24 -------------------
 ...ocessor-sdk-analytics-09.00.01-config.json | 24 -------------------
 ...ocessor-sdk-analytics-09.01.00-config.json | 24 -------------------
 ...ocessor-sdk-analytics-09.02.00-config.json | 24 -------------------
 ...ocessor-sdk-analytics-10.00.00-config.json | 24 -------------------
 ...ocessor-sdk-analytics-10.01.00-config.json | 24 -------------------
 ...ocessor-sdk-analytics-11.00.00-config.json | 24 -------------------
 ...ssor-sdk-analytics-11.01.07.05-config.json | 24 -------------------
 ...-analytics-selinux-11.01.07.05-config.json | 24 -------------------
 .../processor-sdk-gateway-10_00.json          | 24 -------------------
 .../processor-sdk-linux-09_00_00_06.json      | 24 -------------------
 .../processor-sdk-linux-09_00_00_07.json      | 24 -------------------
 .../processor-sdk-linux-09_01_00_06.json      | 24 -------------------
 .../processor-sdk-linux-09_01_00_07.json      | 24 -------------------
 .../processor-sdk-linux-09_02_00_04.json      | 24 -------------------
 .../processor-sdk-linux-09_02_00_05.json      | 24 -------------------
 .../processor-sdk-linux-09_03_06_05.json      | 24 -------------------
 .../processor-sdk-linux-10_00_07_06.json      | 24 -------------------
 .../processor-sdk-linux-10_00_08_06.json      | 24 -------------------
 .../processor-sdk-linux-10_01_08_01.json      | 24 -------------------
 .../processor-sdk-linux-11_00_10_01.json      | 24 -------------------
 ...ocessor-sdk-09.00.00-am62xxsip-config.json | 24 -------------------
 .../processor-sdk-09.00.00-config.json        | 24 -------------------
 .../processor-sdk-09.01.00-am65xx-config.json | 24 -------------------
 .../processor-sdk-09.01.00-config.json        | 24 -------------------
 .../processor-sdk-09.01.00-legacy-config.json | 24 -------------------
 ...rocessor-sdk-09.02.00.08-am64x-config.json | 24 -------------------
 ...ocessor-sdk-09.03.05.02-legacy-config.json | 24 -------------------
 ...cessor-sdk-11.00.05.02-am62lxx-config.json | 24 -------------------
 ...cessor-sdk-11.00.15.05-am62lxx-config.json | 24 -------------------
 ...ssor-sdk-kirkstone-09.02.01.09-config.json | 24 -------------------
 ...ssor-sdk-kirkstone-09.02.01.10-config.json | 24 -------------------
 ...kirkstone-chromium-09.02.01.09-config.json | 24 -------------------
 ...kirkstone-chromium-09.02.01.10-config.json | 24 -------------------
 ...ssor-sdk-scarthgap-10.00.07.04-config.json | 24 -------------------
 ...ssor-sdk-scarthgap-10.01.10.04-config.json | 24 -------------------
 ...ssor-sdk-scarthgap-11.00.09.04-config.json | 24 -------------------
 ...ssor-sdk-scarthgap-11.01.05.03-config.json | 24 -------------------
 ...scarthgap-chromium-10.00.07.04-config.json | 24 -------------------
 ...scarthgap-chromium-10.01.10.04-config.json | 24 -------------------
 ...scarthgap-chromium-11.00.09.04-config.json | 24 -------------------
 ...scarthgap-chromium-11.01.05.03-config.json | 24 -------------------
 ...scarthgap-chromium-11.01.12.10-config.json | 24 -------------------
 ...dk-scarthgap-nonqt-11.01.05.03-config.json | 24 -------------------
 ...-scarthgap-selinux-11.00.09.04-config.json | 24 -------------------
 ...-scarthgap-selinux-11.01.05.03-config.json | 24 -------------------
 src/Makefile                                  |  5 ++--
 92 files changed, 3 insertions(+), 2186 deletions(-)

diff --git a/bitbake-setup/arago-kirkstone-chromium-config.json b/bitbake-setup/arago-kirkstone-chromium-config.json
index 3852de9..f472b92 100644
--- a/bitbake-setup/arago-kirkstone-chromium-config.json
+++ b/bitbake-setup/arago-kirkstone-chromium-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-kirkstone-config.json b/bitbake-setup/arago-kirkstone-config.json
index 4eaee6f..7739396 100644
--- a/bitbake-setup/arago-kirkstone-config.json
+++ b/bitbake-setup/arago-kirkstone-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-kirkstone-next-config.json b/bitbake-setup/arago-kirkstone-next-config.json
index 159e16d..07c27f5 100644
--- a/bitbake-setup/arago-kirkstone-next-config.json
+++ b/bitbake-setup/arago-kirkstone-next-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-kirkstone-wip-config.json b/bitbake-setup/arago-kirkstone-wip-config.json
index a3d73e8..2ad57ab 100644
--- a/bitbake-setup/arago-kirkstone-wip-config.json
+++ b/bitbake-setup/arago-kirkstone-wip-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-chromium-config.json b/bitbake-setup/arago-master-chromium-config.json
index 8dce603..32ef129 100644
--- a/bitbake-setup/arago-master-chromium-config.json
+++ b/bitbake-setup/arago-master-chromium-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-config.json b/bitbake-setup/arago-master-config.json
index d804526..b0cc299 100644
--- a/bitbake-setup/arago-master-config.json
+++ b/bitbake-setup/arago-master-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-flutter-config.json b/bitbake-setup/arago-master-flutter-config.json
index 624d8b4..54e1eba 100644
--- a/bitbake-setup/arago-master-flutter-config.json
+++ b/bitbake-setup/arago-master-flutter-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-next-config.json b/bitbake-setup/arago-master-next-config.json
index 9ddca65..b008d00 100644
--- a/bitbake-setup/arago-master-next-config.json
+++ b/bitbake-setup/arago-master-next-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-selinux-config.json b/bitbake-setup/arago-master-selinux-config.json
index 7ae5258..e2046ef 100644
--- a/bitbake-setup/arago-master-selinux-config.json
+++ b/bitbake-setup/arago-master-selinux-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-master-wip-config.json b/bitbake-setup/arago-master-wip-config.json
index 24140f5..6fae0fa 100644
--- a/bitbake-setup/arago-master-wip-config.json
+++ b/bitbake-setup/arago-master-wip-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-10x-config.json b/bitbake-setup/arago-scarthgap-10x-config.json
index 30b355d..db4cee3 100644
--- a/bitbake-setup/arago-scarthgap-10x-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-10x-next-config.json b/bitbake-setup/arago-scarthgap-10x-next-config.json
index 1415016..7e82f0c 100644
--- a/bitbake-setup/arago-scarthgap-10x-next-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-next-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
index 6ef006b..34f365e 100644
--- a/bitbake-setup/arago-scarthgap-chromium-config.json
+++ b/bitbake-setup/arago-scarthgap-chromium-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
index ec9e116..1919728 100644
--- a/bitbake-setup/arago-scarthgap-config.json
+++ b/bitbake-setup/arago-scarthgap-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-flutter-config.json b/bitbake-setup/arago-scarthgap-flutter-config.json
index d79adfc..2c08917 100644
--- a/bitbake-setup/arago-scarthgap-flutter-config.json
+++ b/bitbake-setup/arago-scarthgap-flutter-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
index 80a5d54..5ddcac4 100644
--- a/bitbake-setup/arago-scarthgap-next-config.json
+++ b/bitbake-setup/arago-scarthgap-next-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
index fc37999..105b972 100644
--- a/bitbake-setup/arago-scarthgap-selinux-config.json
+++ b/bitbake-setup/arago-scarthgap-selinux-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/arago-scarthgap-wip-config.json b/bitbake-setup/arago-scarthgap-wip-config.json
index 8c75113..ccb09a3 100644
--- a/bitbake-setup/arago-scarthgap-wip-config.json
+++ b/bitbake-setup/arago-scarthgap-wip-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
index 042ae70..dead3fd 100644
--- a/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.006-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
index 44c8e68..d1c5ad0 100644
--- a/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.007-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json b/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
index 6402a9e..34f7ae9 100644
--- a/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.00.00.011-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
index 8e78032..81f8325 100644
--- a/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.001-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
index 064138b..0d47ba7 100644
--- a/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.003-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
index 345356c..984e0d8 100644
--- a/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.007-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
index 4c0410b..72cc09b 100644
--- a/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.01.00.008-config.json
@@ -123,27 +123,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
index 7d387dd..f34bcf8 100644
--- a/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.008-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
index 244eb4e..56b0b33 100644
--- a/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.009-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json b/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
index 9731e2f..514277c 100644
--- a/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.02.00.010-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-09.03.05-config.json b/bitbake-setup/coresdk/coresdk-09.03.05-config.json
index 8c85125..61d9026 100644
--- a/bitbake-setup/coresdk/coresdk-09.03.05-config.json
+++ b/bitbake-setup/coresdk/coresdk-09.03.05-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-10.00.07-config.json b/bitbake-setup/coresdk/coresdk-10.00.07-config.json
index 9676947..a4bfdba 100644
--- a/bitbake-setup/coresdk/coresdk-10.00.07-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.00.07-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-10.01.08-config.json b/bitbake-setup/coresdk/coresdk-10.01.08-config.json
index f729913..29d604e 100644
--- a/bitbake-setup/coresdk/coresdk-10.01.08-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.08-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-10.01.10-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-config.json
index 62a140b..d7b16f0 100644
--- a/bitbake-setup/coresdk/coresdk-10.01.10-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.10-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json b/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
index b9f2db7..0ebef9e 100644
--- a/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
+++ b/bitbake-setup/coresdk/coresdk-10.01.10-selinux-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-11.00.09-config.json b/bitbake-setup/coresdk/coresdk-11.00.09-config.json
index 86d5241..b726bb4 100644
--- a/bitbake-setup/coresdk/coresdk-11.00.09-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.00.09-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-11.00.15-config.json b/bitbake-setup/coresdk/coresdk-11.00.15-config.json
index f28d86c..eca5e6a 100644
--- a/bitbake-setup/coresdk/coresdk-11.00.15-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.00.15-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-11.01.05-config.json b/bitbake-setup/coresdk/coresdk-11.01.05-config.json
index 8ca09b1..e07227f 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.05-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.05-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/coresdk/coresdk-11.01.08-config.json b/bitbake-setup/coresdk/coresdk-11.01.08-config.json
index 0efc55e..8658e2f 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.08-config.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.08-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/distroless-kirkstone-config.json b/bitbake-setup/distroless-kirkstone-config.json
index 405acf1..452f7e3 100644
--- a/bitbake-setup/distroless-kirkstone-config.json
+++ b/bitbake-setup/distroless-kirkstone-config.json
@@ -79,27 +79,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/distroless-master-config.json b/bitbake-setup/distroless-master-config.json
index c338794..4141d33 100644
--- a/bitbake-setup/distroless-master-config.json
+++ b/bitbake-setup/distroless-master-config.json
@@ -79,27 +79,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/distroless-scarthgap-config.json b/bitbake-setup/distroless-scarthgap-config.json
index ee905cf..7a939f5 100644
--- a/bitbake-setup/distroless-scarthgap-config.json
+++ b/bitbake-setup/distroless-scarthgap-config.json
@@ -79,27 +79,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/poky-kirkstone-config.json b/bitbake-setup/poky-kirkstone-config.json
index e80f519..43966ac 100644
--- a/bitbake-setup/poky-kirkstone-config.json
+++ b/bitbake-setup/poky-kirkstone-config.json
@@ -101,27 +101,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/poky-master-config.json b/bitbake-setup/poky-master-config.json
index aa63dbf..f01ca8e 100644
--- a/bitbake-setup/poky-master-config.json
+++ b/bitbake-setup/poky-master-config.json
@@ -101,27 +101,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/poky-master-wip-config.json b/bitbake-setup/poky-master-wip-config.json
index 119a7dc..53a3df3 100644
--- a/bitbake-setup/poky-master-wip-config.json
+++ b/bitbake-setup/poky-master-wip-config.json
@@ -101,27 +101,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/poky-scarthgap-config.json b/bitbake-setup/poky-scarthgap-config.json
index 1012df5..bcc03e7 100644
--- a/bitbake-setup/poky-scarthgap-config.json
+++ b/bitbake-setup/poky-scarthgap-config.json
@@ -101,27 +101,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/poky-scarthgap-wip-config.json b/bitbake-setup/poky-scarthgap-wip-config.json
index 727a4cf..c8dff37 100644
--- a/bitbake-setup/poky-scarthgap-wip-config.json
+++ b/bitbake-setup/poky-scarthgap-wip-config.json
@@ -90,27 +90,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
index 50da6c5..dffd056 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
index 80b6654..90836b8 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
index 1841a1e..c0c76ff 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
index 533c64b..0829e63 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
index f9c374f..2af6f03 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
index 239789b..2831239 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
index 9921885..c74fc52 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
index 4c49df6..3a9c5c8 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
index aad35e1..d343067 100644
--- a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.05-config.json
@@ -178,27 +178,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json b/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
index 8d733ee..1dacada 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-gateway-10_00.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
index 16db478..df1cb16 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_06.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
index 1788918..6bf881d 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_00_00_07.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
index 90c8857..fb9693c 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_06.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
index 4dc31e5..da7c173 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_01_00_07.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
index edbb9f7..8232e3f 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_04.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
index 030c1a4..7de6cd5 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_02_00_05.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
index 744c963..3be40cb 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-09_03_06_05.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
index fb638fd..7e1a195 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_07_06.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
index e9d7ab6..1632ee4 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_00_08_06.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
index a1de7e5..627656d 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-10_01_08_01.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
index e12fb5d..7d1e5f0 100644
--- a/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
+++ b/bitbake-setup/processor-sdk-linux/processor-sdk-linux-11_00_10_01.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
index 287835e..88af4f4 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
index 9ce9de5..eb65c56 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.00.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
index 8511942..4c27983 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-am65xx-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
index bb4b1d4..84c0412 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
index f92a67b..3c0d629 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.01.00-legacy-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
index d6c1a9a..5d2908b 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.02.00.08-am64x-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json b/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
index 3510a78..0b575d1 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-09.03.05.02-legacy-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
index 2d595f5..ee1c1e3 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json b/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
index 1b98f59..b78c96f 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.json
@@ -134,27 +134,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
index e66c382..879b082 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
index 135b209..597b624 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
index 5e6ea36..56041dc 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
index f7a73f8..7bd22a7 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
index 7fddac3..24179ba 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
index 74ae454..21930eb 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
index c9f0c7f..98d99f1 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
index cdcb8d1..33fceb2 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
index 22f0e9c..501a944 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
index 3610606..2eb4961 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
index cd7b89e..6dac9c4 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
index 33cf0ea..52926c1 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
index 64e1d35..4cba614 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
index 587343c..d56d8b1 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.json
@@ -145,27 +145,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
index dfd404c..3f18017 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.json
@@ -156,27 +156,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
index 60c031e..50d2f1a 100644
--- a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.json
@@ -167,27 +167,3 @@
     ]
   }
 }
-{
-  "version": "1.0",
-  "description": "",
-  "bitbake-setup": {
-    "configurations": [
-      {
-        "name": "",
-        "description": "",
-        "bb-layers": [  ],
-        "oe-fragments": [ "oe-layersetup/localconf/" ],
-        "oe-fragments-one-of": {
-          "machine": {
-            "description": "Available target machines",
-            "options": [  ]
-          },
-          "distro": {
-            "description": "Available distributions",
-            "options": [  ]
-          }
-        }
-      }
-    ]
-  }
-}
diff --git a/src/Makefile b/src/Makefile
index 27b83c4..e63bd12 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -104,17 +104,18 @@ endef
 define xslt_bitbake_setup =
 	mkdir -p $(@D); \
 	echo "  XLST bitbake-setup $*"; \
-	xsltproc --stringparam arConfigName $$loConfigName --xinclude $^ > $@; \
+	xsltproc --stringparam arConfigName $$loConfigName --xinclude xslt/bitbake-setup.xslt configs/$*.xml > $@; \
 	loCheck=`grep local-conf configs/$*.xml`; \
 	if [ "$$loCheck" != "" ]; then \
 		loDir=`dirname ../conf/fragments/localconf/configs/$*.conf`; \
 		mkdir -p $$loDir; \
+		echo "  XLST bitbake-setup-config-localconf $*"; \
 		xsltproc --stringparam arConfigName $$loConfigName --xinclude xslt/bitbake-setup-config-localconf.xslt configs/$*.xml > ../conf/fragments/localconf/configs/$*.conf; \
 	fi
 endef
 
 ../bitbake-setup/%.json: xslt/bitbake-setup.xslt configs/%.xml
-	@loConfigName="$*"; \
+	loConfigName="$*"; \
 	$(xslt_bitbake_setup)
 
 ../bitbake-setup/*.json: xslt/bitbake-setup-config-localconf.xslt
-- 
2.17.1


