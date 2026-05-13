Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A2CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 22:48:20 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.252.1778712495675920458
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 May 2026 15:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ri0qTvbJ;
 spf=pass (domain: ti.com, ip: 40.107.208.50, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lluo8Ew08idaYT0ut4F1bLaOKWvgtexJlLx7EUZ9c+KANRDhGDQBMeOipzgXWNy50n2Gy7LLXd7Ad6hBVhe/0kNT1PkoFcaJSI5CaAHT6FP1KAuTx0qb4oEKZv305sh9UVXYjlDlzMCsxEOVHFX0cm1n+up+S66vhhX0zNGg/XXgtqhZu/4Zzheqpk3zl+ZhdLh+j56ouQgJFVqbmeE0XzaneYp12pzhIL/vYf5b467IWrMoj9hDoLIU6ofSma5BbZWN3nmyVYToXMcAYdyA7bahPUkRMV/fbbWUZ5/0fC9s7PLng1iJQpe7nMUs0+aOgbd7VhOyT75/R4jSMnG5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTpIN+oIVcSUIdL4Wkmd4n5ne3tJoFEmrH0JWFSGVAk=;
 b=eXtMpboM6xBuDbKPk5/qJP/qOjpnnLZGZISYY4SahjS+lSmBxia1nLhcU38s9W/ZxU2Vuc6Ct4T2OS7eHs1clGt8Lym6LL6iqmcFefvyePUAT3o5u2HirigCxDd3wj7Iu6ija2ZHkFUT3JI4WZl9ylCd9+pAbI6UZ09WtVNRay9OPDEmQfk0fGix/HT7q8FfVht7sJX7t4aPTnR/t9wOzMI10uLx5l5MFhSrP3pjG+6vfmA1qFCFTNeVt1ktbeNEWpswMvihXE8BWER5RbVvdUyBGEqfqV+yE6UfhuFnNS/NvX0KCIpZA2cD5yy7dF+fuGxOZXhudcyFMZFyodLABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTpIN+oIVcSUIdL4Wkmd4n5ne3tJoFEmrH0JWFSGVAk=;
 b=ri0qTvbJfTJwxNks1uzO/9r9AjBe4s7Z+YuWnf0xwAmHfU/LWXdpq8MKuGNrhDwwOAwPfQM4Zmh8uEnl3Z6338rNpHjr84x0ExB5YXSBBqnUQH8j0B+5hFP8f651lyJoYooun99EIw8lYi3rTY0GChCYm57JcgjXrghjuj4MZ2M=
Received: from CH2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:610:20::14)
 by PH3PPFAF33AAF2A.namprd10.prod.outlook.com (2603:10b6:518:1::7c0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 22:48:13 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::dc) by CH2PR07CA0001.outlook.office365.com
 (2603:10b6:610:20::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 22:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 22:48:09 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 17:48:08 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 17:48:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 17:48:08 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DMm8Pt437267;
	Wed, 13 May 2026 17:48:08 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] open62541: Update for v1.5.4
Date: Wed, 13 May 2026 17:47:59 -0500
Message-ID: <20260513224759.358257-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|PH3PPFAF33AAF2A:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3a7ef4-77c4-434b-0404-08deb141b481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CUNWSddNWCUQFc0zVrSteG9dAoGTonBSJi6gIVUcuP3to5nIFB8zYDRXcN1D/Qt6h+Stpfq1uehntrt3VE4/zytpLtXH2YiAEepaqhIRWnnR1xfphC0WbRnp7R+UdGwIMkppDQx9oHCvyHnix0F4dLeqo7xa2IqBIAJof6xrIv22NpfcBobBjjca5P4GGHKDXBOXKLn37AL/8fNPvbkV8q0sxwC1RfjLASB4Owfo4gKXGTna0NdI5UpAwmZ5Nfe1MKuJVbasDtldNpoSv/+978L0lolz9vFa0vT2PX6V18ox2vRHXPvZNaV+FtsmWrWt9AWz56YiR5HlH+QqtSedUwjinGCAnHNNbWYxRPBB502HraJl1AvUSDn1yMoU1hFrvwfGoSlCbWaDjIFb8N4Mz+tweOA+dMKC6GeGTiM1526duwMMA63xxsXmI4gojgBQMTSWh/hIQmYkJgijHbBJ+iFMbJgxvlSypaAXXrwErQgBGjvAX809T3lbIB40CYi6QJFvhfj/5sl+mT6mLvsRhUCe+0GVdiqQnDNFHYHwQw7cV/22dGzA745k9wkTSrI68fpXjoG1MflHpfiklT8K/6b38Flwpv+iJln44VE5hTyOghk83gXlo859WrF8vUtxZ3fh49Sr8tWutnffxbOTK0c/650GS4eYvk3mi3FeNCpDD955aq1e78/8oLSWhrgf64vOIjTC25M2COyM6OygfBWskJH/X68nn1/4fGs20EE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	95Lvx3YOGAb3LD/Db0/V01M4NANwgj730nkvl+X6LuG8mEFY5ZCHGisCvUKylN0p/CeLJq7IVoFnz7PzZka8/aWpIqy/5QZlPXyjEFgpCpbmPqwohOvUKWwCxWab+iOU4XuJH626sB7qBXD0opfO1CzPRiAqDcz6xKWxjswg8U2XHaHS5YQynTUOBigqwx4DIP2e3He0NFg+BoemboVw7D/Ivou32xJao/4JIyGcHACR/Q4akQOHjzN17ZCyfxAOIlQo2paX9boBoJ5KT/yt1sr35Q+NZ6rKmL9/FjBwL5yt6AAHxJUfV+5AUZIz3iZWB+4vH1o17dfvxObYoJplN0f9sPaPl9fQ17NC7b70/ck9JKlYEPwz4YmUP6q0GgcNfMIo7Osyz/e70kpTuEYIBSJe9vJN2x5b4psBPNph9wl+7f7hWKUN6VdkSImVVZx7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:48:09.1543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3a7ef4-77c4-434b-0404-08deb141b481
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAF33AAF2A
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 May 2026 22:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17518

meta-openembedded bumped the version to 1.5.4 [1].

Add a new patch to fix a compile issue related to missing the pthread.h
file in an include and port the example client patch.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3D63130ebd083=
0923e7c6feee9fef7bca9f02d994c

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../open62541/open62541-arago.inc             |  1 +
 ...les-client-allow-configurable-server.patch | 43 +++++++++----------
 ...fix-missing-pthread.h-include-in-RT-.patch | 30 +++++++++++++
 ...41_%.bbappend =3D> open62541_1.5.4.bbappend} |  0
 4 files changed, 52 insertions(+), 22 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62=
541/0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch
 rename meta-arago-extras/recipes-connectivity/open62541/{open62541_%.bbapp=
end =3D> open62541_1.5.4.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541-ara=
go.inc b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.i=
nc
index cd8ceb00..ed0f00df 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541-arago.inc
@@ -2,6 +2,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/open62541:"
=20
 SRC_URI:append =3D " \
     file://0001-examples-client-allow-configurable-server.patch \
+    file://0002-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch=
 \
 "
=20
 EXTRA_OECMAKE =3D "-DUA_BUILD_EXAMPLES=3D1"
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
1-examples-client-allow-configurable-server.patch b/meta-arago-extras/recip=
es-connectivity/open62541/open62541/0001-examples-client-allow-configurable=
-server.patch
index 742d56ac..f6a1b724 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-client-allow-configurable-server.patch
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examp=
les-client-allow-configurable-server.patch
@@ -6,18 +6,19 @@ Subject: [PATCH] examples: client: allow configurable ser=
ver
 * Enable a remote server URL to be provided as an argument.
 * Default to localhost if no arguments are provided.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/80=
45]
=20
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
 ---
- examples/client.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
+ examples/client.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
=20
 diff --git a/examples/client.c b/examples/client.c
-index f04bed9..dfc56f5 100644
+index bc54d8504..42290dd0c 100644
 --- a/examples/client.c
 +++ b/examples/client.c
-@@ -29,13 +29,18 @@ nodeIter(UA_NodeId childId, UA_Boolean isInverse, UA_N=
odeId referenceTypeId, voi
+@@ -31,6 +31,11 @@ nodeIter(UA_NodeId childId, UA_Boolean isInverse,
  }
 =20
  int main(int argc, char *argv[]) {
@@ -29,27 +30,25 @@ index f04bed9..dfc56f5 100644
      UA_Client *client =3D UA_Client_new();
      UA_ClientConfig_setDefault(UA_Client_getConfig(client));
 =20
-     /* Listing endpoints */
+@@ -38,7 +43,7 @@ int main(int argc, char *argv[]) {
      UA_EndpointDescription* endpointArray =3D NULL;
      size_t endpointArraySize =3D 0;
--    UA_StatusCode retval =3D UA_Client_getEndpoints(client, "opc.tcp://lo=
calhost:4840",
-+    UA_StatusCode retval =3D UA_Client_getEndpoints(client, ua_server,
-                                                   &endpointArraySize, &en=
dpointArray);
+     UA_StatusCode retval =3D
+-        UA_Client_getEndpoints(client, "opc.tcp://localhost:4840",
++        UA_Client_getEndpoints(client, "ua_server",
+                                &endpointArraySize, &endpointArray);
      if(retval !=3D UA_STATUSCODE_GOOD) {
          printf("Could not get the endpoints\n");
-         UA_Array_delete(endpointArray, endpointArraySize, &UA_TYPES[UA_TY=
PES_ENDPOINTDESCRIPTION]);
-@@ -52,8 +57,8 @@ int main(int argc, char *argv[]) {
-     UA_Array_delete(endpointArray,endpointArraySize, &UA_TYPES[UA_TYPES_E=
NDPOINTDESCRIPTION]);
-=20
-     /* Connect to a server */
--    /* anonymous connect would be: retval =3D UA_Client_connect(client, "=
opc.tcp://localhost:4840"); */
--    retval =3D UA_Client_connect_username(client, "opc.tcp://localhost:48=
40", "user1", "password");
-+    /* anonymous connect would be: retval =3D UA_Client_connect(client, u=
a_server); */
-+    retval =3D UA_Client_connect_username(client, ua_server, "user1", "pa=
ssword");
+@@ -58,8 +63,8 @@ int main(int argc, char *argv[]) {
+     /* Create a client and connect */
+     client =3D UA_Client_new();
+     UA_ClientConfig_setDefault(UA_Client_getConfig(client));
+-    /* Anonymous connect: UA_Client_connect(client, "opc.tcp://localhost:=
4840"); */
+-    retval =3D UA_Client_connectUsername(client, "opc.tcp://localhost:484=
0",
++    /* Anonymous connect: UA_Client_connect(client, "ua_server"); */
++    retval =3D UA_Client_connectUsername(client, "ua_server",
+                                        "user1", "password");
      if(retval !=3D UA_STATUSCODE_GOOD) {
          printf("Could not connect\n");
-         UA_Client_delete(client);
-         return EXIT_FAILURE;
 --=20
-2.7.4
-
+2.34.1
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/000=
2-examples-pubsub-fix-missing-pthread.h-include-in-RT-.patch b/meta-arago-e=
xtras/recipes-connectivity/open62541/open62541/0002-examples-pubsub-fix-mis=
sing-pthread.h-include-in-RT-.patch
new file mode 100644
index 00000000..57e6ee8d
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0002-examp=
les-pubsub-fix-missing-pthread.h-include-in-RT-.patch
@@ -0,0 +1,30 @@
+From 3c3fbc17c9d649d20ea5c86e5581b6a4409447f3 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Wed, 13 May 2026 14:54:39 -0500
+Subject: [PATCH] examples: pubsub: fix missing pthread.h include in RT
+ state machine example
+
+Include header file, to fix error of implicit declaration of
+pthread_create.
+
+Upstream-Status: Submitted [https://github.com/open62541/open62541/pull/80=
44]
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ .../pubsub_realtime/server_pubsub_subscribe_rt_state_machine.c   | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/pubsub_realtime/server_pubsub_subscribe_rt_state_mac=
hine.c b/examples/pubsub_realtime/server_pubsub_subscribe_rt_state_machine.=
c
+index 0fb4243ae..f41d718ec 100644
+--- a/examples/pubsub_realtime/server_pubsub_subscribe_rt_state_machine.c
++++ b/examples/pubsub_realtime/server_pubsub_subscribe_rt_state_machine.c
+@@ -19,6 +19,7 @@
+ #include <poll.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <pthread.h>
+
+ #define PUBSUB_CONFIG_FIELD_COUNT 10
+
+--
+2.34.1
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.b=
bappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.4.=
bbappend
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/open62541/open62541_%.bb=
append
rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.4.=
bbappend
--=20
2.34.1


